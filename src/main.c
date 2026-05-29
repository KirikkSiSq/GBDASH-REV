#include <gb/gb.h>
#include <gbdk/font.h>
#include <gbdk/console.h>
#include <stdio.h>

#include "assets.h"
#include "hUGEDriver.h"
#include "famidash_metatiles.c"  // metatiles[] + famidash_metatile_collision[]

uint8_t music_ready = 0;
uint8_t redraw = 1;
uint8_t selected = 0;

extern const hUGESong_t song_stereoma;

void play_music_safe(void) {
    if (music_ready) hUGE_dosound();
}

void setup_menu_font(void) {
    font_init();
    font_set(font_load(font_min));
}

void load_bkg_tileset(const uint8_t* tiles, uint16_t tile_count) {
    if (tile_count == 256u) {
        set_bkg_data(0, 128, tiles);
        set_bkg_data(128, 128, tiles + (128u * 16u));
    }
    else {
        set_bkg_data(0, (uint8_t)tile_count, tiles);
    }
}

// -------------------------------------------------------
// Ring-buffer background
// GB background = 32x32 tiles = 16x16 metatiles (ring)
// Only new columns are drawn as the camera moves right.
// -------------------------------------------------------
#define BKG_MT_W  16
#define BKG_MT_H  16
#define VIEW_MT_W 10
#define VIEW_MT_H  9
#define SCROLL_SPEED 2

void draw_mt_column(uint8_t ring_col, uint16_t map_col,
    const uint8_t* map, uint16_t map_w, uint16_t map_h) {
    uint8_t bx = ring_col << 1;
    for (uint8_t r = 0; r < map_h && r < BKG_MT_H; r++) {
        uint8_t mt = map[(uint16_t)r * map_w + map_col];
        uint8_t by = (r & (BKG_MT_H - 1)) << 1;
        set_bkg_tiles(bx, by, 2, 1, &metatiles[mt][0]);
        set_bkg_tiles(bx, by + 1, 2, 1, &metatiles[mt][2]);
    }
}

void fill_scroll_bg(const uint8_t* map, uint16_t map_w, uint16_t map_h) {
    uint16_t cols = (map_w < BKG_MT_W) ? map_w : BKG_MT_W;
    for (uint16_t c = 0; c < cols; c++) {
        draw_mt_column((uint8_t)(c % BKG_MT_W), c, map, map_w, map_h);
    }
}

// -------------------------------------------------------
// Menu
// -------------------------------------------------------
void draw_menu(void) {
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

// -------------------------------------------------------
// Level player
// Map is ROM-resident — read directly, no RAM copy needed.
// -------------------------------------------------------
void play_level(uint8_t idx) {
    const Level* l = game_levels[idx];
    const uint8_t* map = l->map;        // ROM pointer, no decompression
    uint16_t map_w = l->map_width;   // 894
    uint16_t map_h = l->map_height;  // 16

    uint16_t cam_px = 0;
    uint16_t cam_py = 0;
    uint16_t max_px = (map_w - VIEW_MT_W) << 4;
    uint16_t max_py = (map_h - VIEW_MT_H) << 4;
    uint16_t loaded_r = BKG_MT_W - 1;

    DISPLAY_OFF;
    load_bkg_tileset(l->tiles, l->tile_count);
    move_bkg(0, 0);
    fill_scroll_bg(map, map_w, map_h);
    SHOW_BKG;
    DISPLAY_ON;

    waitpadup();

    while (1) {
        wait_vbl_done();
        uint8_t joy = joypad();
        if (joy & J_START) break;

        // Horizontal
        if (joy & J_RIGHT) {
            if (cam_px < max_px) {
                uint16_t prev = cam_px >> 4;
                cam_px += SCROLL_SPEED;
                if (cam_px > max_px) cam_px = max_px;
                uint16_t curr = cam_px >> 4;
                if (curr != prev) {
                    uint16_t need = curr + VIEW_MT_W;
                    if (need > loaded_r && need < map_w) {
                        loaded_r = need;
                        draw_mt_column((uint8_t)(need % BKG_MT_W),
                            need, map, map_w, map_h);
                    }
                }
            }
        }
        else if (joy & J_LEFT) {
            if (cam_px >= SCROLL_SPEED) cam_px -= SCROLL_SPEED;
            else cam_px = 0;
        }

        // Vertical (free — all rows in ring already)
        if (joy & J_DOWN) {
            if (cam_py < max_py) {
                cam_py += SCROLL_SPEED;
                if (cam_py > max_py) cam_py = max_py;
            }
        }
        else if (joy & J_UP) {
            if (cam_py >= SCROLL_SPEED) cam_py -= SCROLL_SPEED;
            else cam_py = 0;
        }

        move_bkg((uint8_t)cam_px, (uint8_t)cam_py);
    }

    move_bkg(0, 0);
    waitpadup();
    setup_menu_font();
    redraw = 1;
}

// -------------------------------------------------------
// Main
// -------------------------------------------------------
void main(void) {
    music_ready = 0;
    NR52_REG = 0x80;
    NR51_REG = 0xFF;
    NR50_REG = 0x77;

    hUGE_init(&song_stereoma);
    music_ready = 1;

    TMA_REG = 224;
    TAC_REG = 0x04;
    add_TIM(play_music_safe);
    set_interrupts(VBL_IFLAG | TIM_IFLAG);
    enable_interrupts();

    setup_menu_font();

    while (1) {
        if (redraw) draw_menu();
        uint8_t joy = joypad();

        if (joy & J_UP) {
            if (selected > 0) { selected--; redraw = 1; }
            waitpadup();
        }
        else if (joy & J_DOWN) {
            if (selected < MAX_LEVELS - 1) { selected++; redraw = 1; }
            waitpadup();
        }
        else if (joy & J_A) {
            play_level(selected);
        }

        wait_vbl_done();
    }
}
