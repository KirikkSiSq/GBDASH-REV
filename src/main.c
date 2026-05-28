#include <gb/gb.h>
#include <gbdk/font.h>
#include <gbdk/console.h>
#include <gbdk/zx0decompress.h>
#include <stdio.h>

#include "assets.h"
#include "hUGEDriver.h"
#include "famidash_metatiles.c"

// Buffer only for decompressing tiles/maps (max compressed tileset ~1200 bytes uncompressed)
// Reduced from 4096 to 2048 to save precious RAM
static uint8_t buffer[2048];

uint8_t music_ready = 0;
uint8_t selected    = 0;
uint8_t redraw      = 1;

extern const hUGESong_t song_stereoma;

void play_music_safe(void) {
    if (music_ready) hUGE_dosound();
}

void setup_menu_font(void) {
    font_init();
    font_set(font_load(font_min));
}

// -------------------------------------------------------
// Tileset loader
// -------------------------------------------------------
void load_bkg_tileset(const uint8_t *tiles, uint16_t tile_count) {
    if (tile_count == 256u) {
        set_bkg_data(0,   128, tiles);
        set_bkg_data(128, 128, tiles + (128u * 16u));
    } else {
        set_bkg_data(0, (uint8_t)tile_count, tiles);
    }
}

// -------------------------------------------------------
// Static full-screen metatile draw (small fixed levels)
// -------------------------------------------------------
void draw_metatile_map(uint16_t map_w, uint8_t cols, uint8_t rows,
                       const uint8_t *map) {
    for (uint8_t y = 0; y < rows; y++) {
        for (uint8_t x = 0; x < cols; x++) {
            uint8_t mt = map[(uint16_t)y * map_w + x];
            set_bkg_tiles(x << 1, y << 1,       2, 1, &metatiles[mt][0]);
            set_bkg_tiles(x << 1, (y << 1) + 1, 2, 1, &metatiles[mt][2]);
        }
    }
}

// -------------------------------------------------------
// Ring-buffer column draw for the scrolling loader.
//
// The GB background plane is 32 tiles = 16 metatile columns wide.
// We treat it as a ring buffer: bkg_col = map_col % 16.
// SCX is set to cam_x * 16 pixels to shift the viewport.
// Only one column (9 metatiles) is drawn per scroll step.
// -------------------------------------------------------
#define BKG_MT_W  16   // background width in metatiles (32 tiles / 2)
#define VIEW_MT_W 10   // visible metatile columns on screen
#define VIEW_MT_H  9   // visible metatile rows on screen

void draw_mt_column(uint8_t bkg_col, uint16_t map_col,
                    const uint8_t *map, uint16_t map_w) {
    uint8_t bx = bkg_col << 1;  // tile x in background (wraps naturally)
    for (uint8_t y = 0; y < VIEW_MT_H; y++) {
        uint8_t mt = map[(uint16_t)y * map_w + map_col];
        uint8_t by = y << 1;
        set_bkg_tiles(bx, by,     2, 1, &metatiles[mt][0]);
        set_bkg_tiles(bx, by + 1, 2, 1, &metatiles[mt][2]);
    }
}

// Fill the entire background ring on first entry
void fill_scroll_bg(const uint8_t *map, uint16_t map_w) {
    uint16_t cols = (map_w < BKG_MT_W) ? map_w : BKG_MT_W;
    for (uint16_t c = 0; c < cols; c++) {
        draw_mt_column((uint8_t)(c % BKG_MT_W), c, map, map_w);
    }
}

// -------------------------------------------------------
// Menu
// -------------------------------------------------------
void draw_menu(void) {
    fill_bkg_rect(0, 0, 20, 18, 0x00);
    gotoxy(0, 0);
    printf("GBDREV PREBUILD 01 \n\n");
    for (uint8_t i = 0; i < MAX_LEVELS; i++) {
        gotoxy(1, 2 + i);
        if (i == selected) printf("0 %s", game_levels[i]->name);
        else               printf("  %s", game_levels[i]->name);
    }
    SHOW_BKG;
    redraw = 0;
}

// -------------------------------------------------------
// Static level loader (levels 0-3, fixed 10x9 screens)
// -------------------------------------------------------
void load_level(uint8_t idx) {
    const Level *l = game_levels[idx];
    const uint8_t *tile_data;
    const uint8_t *map_data;

    DISPLAY_OFF;

    if (l->tiles_are_compressed) {
        zx0_decompress(l->tiles, buffer);
        tile_data = buffer;
    } else {
        tile_data = l->tiles;
    }
    load_bkg_tileset(tile_data, l->tile_count);

    if (l->map_is_compressed) {
        zx0_decompress(l->map, buffer);
        map_data = buffer;
    } else {
        map_data = l->map;
    }

    uint8_t cols = (l->map_width  > VIEW_MT_W) ? VIEW_MT_W : (uint8_t)l->map_width;
    uint8_t rows = (l->map_height > VIEW_MT_H) ? VIEW_MT_H : (uint8_t)l->map_height;

    fill_bkg_rect(0, 0, 20, 18, 0);
    draw_metatile_map(l->map_width, cols, rows, map_data);

    SHOW_BKG;
    DISPLAY_ON;

    waitpadup();
    while (!(joypad() & J_START)) wait_vbl_done();

    waitpadup();
    setup_menu_font();
    redraw = 1;
}

// -------------------------------------------------------
// Scrolling level loader (level 4 — SM SCROLL)
//
// Uses ring-buffer column updates + SCX hardware scroll.
// Map must be uncompressed (ROM-resident).
// Left/Right D-Pad scrolls. Start returns to menu.
// -------------------------------------------------------
void play_level_scroll(uint8_t idx) {
    const Level *l     = game_levels[idx];
    const uint8_t *map = l->map;
    uint16_t map_w     = l->map_width;

    // cam_px: camera position in pixels (1 metatile = 16px)
    uint16_t cam_px    = 0;
    uint16_t max_px    = (map_w - VIEW_MT_W) << 4;  // (map_w - 10) * 16

    // Track which metatile column is the rightmost loaded in the ring
    uint16_t loaded_right = BKG_MT_W - 1;  // we pre-fill columns 0..15

    DISPLAY_OFF;

    load_bkg_tileset(l->tiles, l->tile_count);
    move_bkg(0, 0);
    fill_scroll_bg(map, map_w);

    SHOW_BKG;
    DISPLAY_ON;

    waitpadup();

    while (1) {
        wait_vbl_done();

        uint8_t joy = joypad();
        if (joy & J_START) break;

        // Scroll speed: 2 pixels per frame while held
#define SCROLL_SPEED 2

        if (joy & J_RIGHT) {
            if (cam_px < max_px) {
                uint16_t prev_col = cam_px >> 4;       // metatile col before move
                cam_px += SCROLL_SPEED;
                if (cam_px > max_px) cam_px = max_px;
                uint16_t curr_col = cam_px >> 4;       // metatile col after move

                // Did we cross into a new metatile column? Load the one just
                // off the right edge of the viewport before it appears.
                if (curr_col != prev_col) {
                    uint16_t need_col = curr_col + VIEW_MT_W;
                    if (need_col > loaded_right && need_col < map_w) {
                        loaded_right = need_col;
                        draw_mt_column((uint8_t)(need_col % BKG_MT_W),
                                       need_col, map, map_w);
                    }
                }

                move_bkg((uint8_t)cam_px, 0);
            }
        } else if (joy & J_LEFT) {
            if (cam_px > 0) {
                if (cam_px < SCROLL_SPEED) cam_px = 0;
                else cam_px -= SCROLL_SPEED;

                // No ring-buffer work needed scrolling left —
                // those columns were already drawn on the way right.
                move_bkg((uint8_t)cam_px, 0);
            }
        }
    }

    // Reset hardware scroll before returning to menu
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
        } else if (joy & J_DOWN) {
            if (selected < MAX_LEVELS - 1) { selected++; redraw = 1; }
            waitpadup();
        } else if (joy & J_A) {
            if (selected == 4) play_level_scroll(selected);
            else               load_level(selected);
        }

        wait_vbl_done();
    }
}