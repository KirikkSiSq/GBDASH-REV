#ifndef COLLISION_H
#define COLLISION_H

#include <stdint.h>

// Collision types mapping to famidash metatiles
#define COL_NONE         0x00  // Air/No collision
#define COL_DEATH_RIGHT  0x01  // Right-facing spike
#define COL_DEATH_LEFT   0x02  // Left-facing spike
#define COL_DEATH_TOP    0x03  // Up-facing spike
#define COL_DEATH_BOTTOM 0x04  // Down-facing spike
#define COL_TOP          0x05  // Solid from top only (platform)
#define COL_BOTTOM       0x06  // Solid from bottom only
#define COL_ALL          0x07  // Full solid block
#define COL_DEATH        0x08  // Hazard (orb/saw)
#define COL_FLOOR_CEIL   0x09  // Solid top and bottom
#define COL_ORB          0x0A  // Yellow Orb
#define COL_PAD          0x0B  // Yellow Pad
#define COL_ORB_BLUE     0x0C  // Blue Orb (Gravity Flip)
#define COL_ORB_MAGENTA  0x0D  // Magenta Orb (Small Jump)
#define COL_PAD_BLUE     0x0E  // Blue Pad (Gravity Flip)

#define IS_SOLID(col)  ((col) == COL_ALL || (col) == COL_FLOOR_CEIL || \
                        (col) == COL_TOP || (col) == COL_BOTTOM)

#define IS_HAZARD(col) ((col) == COL_DEATH      || \
                        (col) == COL_DEATH_TOP   || \
                        (col) == COL_DEATH_BOTTOM|| \
                        (col) == COL_DEATH_LEFT  || \
                        (col) == COL_DEATH_RIGHT)

#define IS_ORB(col)    ((col) == COL_ORB || (col) == COL_ORB_BLUE || (col) == COL_ORB_MAGENTA)
#define IS_PAD(col)    ((col) == COL_PAD || (col) == COL_PAD_BLUE)

#define IS_PASSTHROUGH(col) ((col) == COL_NONE)

extern const uint8_t famidash_metatile_collision[256];

static inline uint8_t col_of(uint8_t tile_id) {
    return famidash_metatile_collision[tile_id];
}

// Checks collision at a world coordinate
static inline uint8_t col_at(
    uint16_t world_px,
    int16_t  world_py,
    const uint8_t *map,
    uint16_t map_w,
    uint16_t map_h
) {
    if (world_py < 0) return COL_NONE;
    uint16_t mx = world_px >> 4;
    uint16_t my = (uint16_t)world_py >> 4;

    if (mx >= map_w || my >= map_h) return COL_ALL;
    return col_of(map[(uint16_t)my * map_w + mx]);
}

#endif // COLLISION_H
