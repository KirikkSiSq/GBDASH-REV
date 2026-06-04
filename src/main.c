#include <gb/gb.h>
#include "assets.h"
#include "gameplay.h"
#include "hUGEDriver.h"

uint8_t music_ready = 0;
uint8_t redraw = 1;
uint8_t selected = 0;

extern const hUGESong_t song_stereoma;

// Called by the timer interrupt to update music
void play_music_safe(void) {
    if (music_ready) hUGE_dosound();
}

void main(void) {
    music_ready = 0;

    // Enable sound hardware
    NR52_REG = 0x80;
    NR51_REG = 0xFF;
    NR50_REG = 0x77;

    hUGE_init(&song_stereoma);
    music_ready = 1;

    // Set up timer at ~128 Hz for music playback
    TMA_REG = 224;
    TAC_REG = 0x04;
    add_TIM(play_music_safe);
    set_interrupts(VBL_IFLAG | TIM_IFLAG);
    enable_interrupts();

    setup_menu_font();

    while (1) {
        if (redraw) draw_menu();

        uint8_t joy = joypad();

        // Level selection handling
        if (joy & J_UP) {
            if (selected > 0) { selected--; redraw = 1; }
            waitpadup();
        } else if (joy & J_DOWN) {
            if (selected < MAX_LEVELS - 1) { selected++; redraw = 1; }
            waitpadup();
        } else if (joy & J_A) {
            disable_interrupts();
            play_level(selected);
            enable_interrupts();
        }

        wait_vbl_done();
    }
}
