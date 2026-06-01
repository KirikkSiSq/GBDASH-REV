#ifndef GAMEPLAY_H
#define GAMEPLAY_H

#include <gb/gb.h>
#include "assets.h"

extern uint8_t music_ready;
extern uint8_t redraw;
extern uint8_t selected;

void play_music_safe(void);
void setup_menu_font(void) NONBANKED;
void load_bkg_tileset(const uint8_t* tiles, uint16_t tile_count) NONBANKED;
void draw_mt_column(uint8_t ring_col, uint16_t map_col,
    const uint8_t* map, uint16_t map_w, uint16_t map_h,
    uint8_t map_bank) NONBANKED;
void fill_scroll_bg(const uint8_t* map, uint16_t map_w, uint16_t map_h, uint8_t map_bank) NONBANKED;
void draw_menu(void) BANKED;
void play_level(uint8_t idx) NONBANKED;

#endif
