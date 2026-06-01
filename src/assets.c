#pragma bank 1
#include <gbdk/incbin.h>
#include "assets.h"

BANKREF(game_levels)
BANKREF(famidash_chr)

// Main tileset for the game levels
INCBIN(famidash_chr_tiles, "levels/famidash/famidash_chr_tiles.bin")
INCBIN_EXTERN(famidash_chr_tiles)

// External map data definitions from level files
BANKREF_EXTERN(stereomadness_map)
extern const uint8_t stereomadness_map[];

BANKREF_EXTERN(backontrack_map)
extern const uint8_t backontrack_map[];

BANKREF_EXTERN(polargeist_map)
extern const uint8_t polargeist_map[];

// Level definitions with dimensions and bank info
const Level level_sm = {
    "STEREO MADNESS",
    famidash_chr_tiles,
    stereomadness_map,
    256,
    894,
    16,
    0, 0,
    BANK(stereomadness_map) 
};

const Level level_bot = {
    "BACK ON TRACK",
    famidash_chr_tiles,
    backontrack_map,
    256,
    846,
    16,
    0, 0,
    BANK(backontrack_map) 
};

const Level level_pg = {
    "POLARGEIST",
    famidash_chr_tiles,
    polargeist_map,
    256,
    934,
    16,
    0, 0,
    BANK(polargeist_map)
};

// Global level list used by the menu and gameplay systems
const Level* const game_levels[] = { &level_sm, &level_bot, &level_pg };
const uint8_t MAX_LEVELS = 3;
