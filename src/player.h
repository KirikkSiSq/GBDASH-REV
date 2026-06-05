#ifndef PLAYER_H
#define PLAYER_H

#include <gb/gb.h>
#include <stdint.h>

#define PLAYER_SIZE   16
#define PLAYER_HBOX    4 // inset from each side for the hitbox
#define PLAYER_SCREEN_X 40

#define GRAVITY     18   // 1.125 << 4  (8.8 fixed)
#define JUMP_FORCE -96   // -6.0  << 4
#define MAX_FALL    192  // 12.0  << 4

typedef struct {
    int16_t world_x;
    int16_t world_y;
    int16_t vel_y;
    uint8_t on_ground;
    uint8_t dead;
} Player;

void player_init(Player *p, int16_t x, int16_t y);
uint8_t player_update(Player *p, uint8_t joy,
                      const uint8_t *map,
                      uint16_t map_w, uint16_t map_h);

#endif
