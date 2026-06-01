#ifndef ASSETS_H
#define ASSETS_H

#include <gb/gb.h>
#include <stdint.h>

// Structure defining a game level's data and metadata
typedef struct {
    const char    *name;
    const uint8_t *tiles;        // VRAM tile data
    const uint8_t *map;          // Metatile map data
    uint16_t       tile_count;   // Total tiles in tileset
    uint16_t       map_width;    // Width in metatiles
    uint16_t       map_height;   // Height in metatiles
    uint8_t        tiles_are_compressed;
    uint8_t        map_is_compressed;
    uint8_t        map_bank;     // ROM bank where the map resides
} Level;

extern const Level * const game_levels[];
BANKREF_EXTERN(game_levels)

extern const uint8_t MAX_LEVELS;

#endif
