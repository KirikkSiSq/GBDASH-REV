#ifndef ASSETS_H
#define ASSETS_H

#include <gb/gb.h>
#include <stdint.h>

typedef struct {
    const char    *name;
    const uint8_t *tiles;        // tileset data (always uncompressed)
    const uint8_t *map;          // map data (may be zx0 compressed)
    uint16_t       tile_count;   // number of tiles in tileset
    uint16_t       map_width;    // map width  in metatile columns
    uint16_t       map_height;   // map height in metatile rows
    uint8_t        tiles_are_compressed;
    uint8_t        map_is_compressed;
} Level;

extern const Level * const game_levels[];
extern const uint8_t MAX_LEVELS;

#endif
