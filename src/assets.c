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

BANKREF_EXTERN(dryout_map)
extern const uint8_t dryout_map[];



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

const Level level_du = {
    "DRY OUT",
    famidash_chr_tiles,
    dryout_map,
    256,
    842,
    16,
    0, 0,
    BANK(dryout_map)
};

// Global level list used by the menu and gameplay systems
const Level* const game_levels[] = { &level_sm, &level_bot, &level_pg, &level_du };
const uint8_t MAX_LEVELS = sizeof(game_levels) / sizeof(game_levels[0]);
