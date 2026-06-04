#ifndef PLAYER_H
#define PLAYER_H

#include <gb/gb.h>
#include <stdint.h>
#include "collision.h"

#define PLAYER_SCREEN_X   32
#define PLAYER_SIZE       15    // Box size for wall/floor collision
#define PLAYER_HBOX       4     // Inset for spike/hazard collision

// Physics constants using 4.4 fixed-point (16 units = 1 pixel)
#define GRAVITY           10
#define JUMP_FORCE       -93
#define MAX_FALL_SPEED    95

typedef struct {
    uint16_t world_x;
    int16_t  world_y;
    int16_t  vel_y;
    uint8_t  on_ground;
    uint8_t  dead;
} Player;

extern uint8_t player_noclip;

// Reset player state to starting position
static inline void player_init(Player *p, uint16_t start_x, int16_t start_y) {
    p->world_x   = start_x;
    p->world_y   = start_y;
    p->vel_y     = 0;
    p->on_ground = 0;
    p->dead      = 0;
}

// Wrapper for checking collision at a specific pixel point
static inline uint8_t col_point(
    uint16_t px, int16_t py,
    const uint8_t *map, uint16_t map_w, uint16_t map_h
) {
    return col_at(px, py, map, map_w, map_h);
}

uint8_t player_update(
    Player *p,
    uint8_t joy,
    const uint8_t *map,
    uint16_t map_w,
    uint16_t map_h
) NONBANKED;

// Returns player's Y position relative to the camera
static inline int16_t player_screen_y(const Player *p, uint16_t cam_py) {
    return p->world_y - (int16_t)cam_py;
}

#endif // PLAYER_H
