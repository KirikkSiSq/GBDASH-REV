#pragma bank 1

#include <gb/gb.h>
#include <gbdk/font.h>
#include <gbdk/console.h>
#include <stdio.h>

#include "gameplay.h"
#include "player.h"
#include "../levels/famidash/famidash_chr.h"
#include "famidash_metatiles.h"
#include "hUGEDriver.h"

// 2x2 sprite for the player cube
const uint8_t cube_tiles[] = {
        0xFF,0xFF,0xC0,0xC0,0x90,0xD0,0x90,0x90,0x88,0x88,0x84,0x84,0x80,0x80,0x80,0x80,
        0xFF,0xFF,0x03,0x03,0x09,0x0B,0x09,0x09,0x11,0x11,0x21,0x21,0x01,0x01,0x01,0x01,
        0x80,0x80,0x80,0x80,0x84,0x84,0x88,0x88,0x90,0x90,0x90,0xD0,0xC0,0xC0,0xFF,0xFF,
        0x01,0x01,0x01,0x01,0x21,0x21,0x11,0x11,0x09,0x09,0x09,0x0B,0x03,0x03,0xFF,0xFF,
};

#define BKG_MT_W  16
#define BKG_MT_H  16
#define VIEW_MT_W 10
#define VIEW_MT_H  9
#define SCROLL_SPEED 3
#define CAM_Y_TOP_ZONE 20
#define CAM_Y_BOTTOM_ZONE 100

void setup_menu_font(void) NONBANKED {
    font_init();
    font_set(font_load(font_min));
}

// Loads tileset into VRAM. Handles splitting if tiles > 128.
void load_bkg_tileset(const uint8_t* tiles, uint16_t tile_count) NONBANKED {
    if (tile_count == 256u) {
        set_bkg_data(0, 128, tiles);
        set_bkg_data(128, 128, tiles + (128u * 16u));
    } else {
        set_bkg_data(0, (uint8_t)tile_count, tiles);
    }
}

// Draws a vertical column of metatiles to the background map
void draw_mt_column(uint8_t ring_col, uint16_t map_col,
    const uint8_t* map, uint16_t map_w, uint16_t map_h,
    uint8_t map_bank) NONBANKED {

    uint8_t bx = ring_col << 1;

    uint8_t _prev = _current_bank;
    SWITCH_ROM(map_bank);

    for (uint8_t r = 0; r < map_h && r < BKG_MT_H; r++) {
        uint8_t mt = map[(uint16_t)r * map_w + map_col];
        uint8_t by = (r & (BKG_MT_H - 1)) << 1;
        set_bkg_tiles(bx, by, 2, 1, &metatiles[mt][0]);
        set_bkg_tiles(bx, by + 1, 2, 1, &metatiles[mt][2]);
    }

    SWITCH_ROM(_prev);
}

// Initial fill of the background scroll area
void fill_scroll_bg(const uint8_t* map, uint16_t map_w, uint16_t map_h, uint8_t map_bank) NONBANKED {
    uint16_t cols = (map_w < BKG_MT_W) ? map_w : BKG_MT_W;
    for (uint16_t c = 0; c < cols; c++) {
        draw_mt_column((uint8_t)(c % BKG_MT_W), c, map, map_w, map_h, map_bank);
    }
}

void draw_menu(void) BANKED {
    fill_bkg_rect(0, 0, 20, 18, 0x00);
    gotoxy(0, 0);
    printf("GBDASH\n\n");
    for (uint8_t i = 0; i < MAX_LEVELS; i++) {
        gotoxy(1, 2 + i);
        if (i == selected) printf("> %s", game_levels[i]->name);
        else               printf("  %s", game_levels[i]->name);
    }
    SHOW_BKG;
    redraw = 0;
}

void play_level(uint8_t idx) NONBANKED {
    uint8_t prev_game_bank = _current_bank;
    const Level *l;
    const char *level_name;
    const uint8_t *level_tiles;
    const uint8_t *level_map;
    uint16_t level_tile_count;
    uint16_t level_map_w;
    uint16_t level_map_h;
    uint8_t level_tiles_bank;
    uint8_t level_map_bank;
    uint8_t level_tiles_are_compressed;
    uint8_t level_map_is_compressed;

    SWITCH_ROM(BANK(game_levels));
    l = game_levels[idx];
    level_name = l->name;
    level_tiles = l->tiles;
    level_map = l->map;
    level_tile_count = l->tile_count;
    level_map_w = l->map_width;
    level_map_h = l->map_height;
    level_tiles_bank = BANK(famidash_chr);
    level_tiles_are_compressed = l->tiles_are_compressed;
    level_map_is_compressed = l->map_is_compressed;
    level_map_bank = l->map_bank;
    SWITCH_ROM(prev_game_bank);

    (void)level_name;
    (void)level_tiles_are_compressed;
    (void)level_map_is_compressed;

    uint16_t cam_px = 0;
    uint16_t cam_py = 112;
    uint16_t cam_py_max = (level_map_h << 4);
    if (cam_py_max > 144u) cam_py_max -= 144u;
    else cam_py_max = 0;
    uint16_t loaded_r = BKG_MT_W - 1;

    uint8_t _prev;
    uint8_t died;
    int16_t py;

    Player player;

    player_init(&player, 32, 160);

    // Setup GBDK graphics state
    disable_interrupts();
    DISPLAY_OFF;
    _prev = _current_bank;
    SWITCH_ROM(level_tiles_bank);
    load_bkg_tileset(level_tiles, level_tile_count);
    SWITCH_ROM(_prev);

    set_sprite_data(0, 4, cube_tiles);
    set_sprite_tile(0, 0); set_sprite_tile(1, 1);
    set_sprite_tile(2, 2); set_sprite_tile(3, 3);

    move_bkg(0, (uint8_t)cam_py);
    fill_scroll_bg(level_map, level_map_w, level_map_h, level_map_bank);

    BGP_REG = 0xE4;
    OBP0_REG = 0xE4;
    SPRITES_8x8;

    SHOW_BKG;
    SHOW_SPRITES;
    DISPLAY_ON;
    enable_interrupts();

    waitpadup();

    while (1) {
        wait_vbl_done();
        play_music_safe();
        uint8_t joy = joypad();
        if (joy & J_START) break;

        // X-axis Scrolling logic
        if (cam_px < ((level_map_w - VIEW_MT_W) << 4)) {
            uint16_t prev = cam_px >> 4;
            cam_px += SCROLL_SPEED;
            uint16_t curr = cam_px >> 4;
            // Load next column if we crossed a metatile boundary
            if (curr != prev) {
                uint16_t need = curr + VIEW_MT_W;
                if (need > loaded_r && need < level_map_w) {
                    loaded_r = need;
                    draw_mt_column((uint8_t)(need % BKG_MT_W), need, level_map, level_map_w, level_map_h, level_map_bank);
                }
            }
        }

        player.world_x = cam_px + PLAYER_SCREEN_X;

        _prev = _current_bank;
        SWITCH_ROM(level_map_bank);
        died = player_update(&player, joy, level_map, level_map_w, level_map_h);
        SWITCH_ROM(_prev);

        // Simple camera Y following
        py = player_screen_y(&player, cam_py);
        if (py < CAM_Y_TOP_ZONE) {
            int16_t target_cam_py = player.world_y - CAM_Y_TOP_ZONE;
            if (target_cam_py < 0) target_cam_py = 0;
            if ((uint16_t)target_cam_py > cam_py_max) target_cam_py = (int16_t)cam_py_max;
            cam_py = (uint16_t)target_cam_py;
        } else if (py > CAM_Y_BOTTOM_ZONE) {
            int16_t target_cam_py = player.world_y - CAM_Y_BOTTOM_ZONE;
            if (target_cam_py < 0) target_cam_py = 0;
            if ((uint16_t)target_cam_py > cam_py_max) target_cam_py = (int16_t)cam_py_max;
            cam_py = (uint16_t)target_cam_py;
        }

        if (died) {
            // Restart level on death
            disable_interrupts();
            cam_px = 0;
            cam_py = 112;
            loaded_r = BKG_MT_W - 1;
            player_init(&player, 32, 160);
            move_bkg(0, (uint8_t)cam_py);
            fill_scroll_bg(level_map, level_map_w, level_map_h, level_map_bank);
            enable_interrupts();
        }

        py = player_screen_y(&player, cam_py);

        // Update sprite positions
        move_sprite(0, PLAYER_SCREEN_X + 8,     py + 16);
        move_sprite(1, PLAYER_SCREEN_X + 8 + 8, py + 16);
        move_sprite(2, PLAYER_SCREEN_X + 8,     py + 16 + 8);
        move_sprite(3, PLAYER_SCREEN_X + 8 + 8, py + 16 + 8);

        move_bkg((uint8_t)cam_px, (uint8_t)cam_py);
    }

    HIDE_SPRITES;
    move_bkg(0, 0);
    waitpadup();
    disable_interrupts();
    setup_menu_font();
    enable_interrupts();
    redraw = 1;
}
