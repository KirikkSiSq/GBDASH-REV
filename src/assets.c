#pragma bank 1
#include <gbdk/incbin.h>
#include "assets.h"

//Bank 1
INCBIN(famidash_chr_tiles, "levels/famidash/famidash_chr_tiles.bin")
INCBIN_EXTERN(famidash_chr_tiles)

//level1.c
BANKREF_EXTERN(stereomadness_map)
extern const uint8_t stereomadness_map[];

//level2.c
BANKREF_EXTERN(backontrack_map)
extern const uint8_t backontrack_map[];

const Level level_sm = {
    "STEREO MADNESS",
    famidash_chr_tiles,
    stereomadness_map,
    256,
    894,
    16,
    0, 0,
    BANK(stereomadness_map) // This will now correctly return '2'
};

const Level level_bot = {
    "BACK ON TRACK",
    famidash_chr_tiles,
    backontrack_map,
    256,
    846,
    16,
    0, 0,
    BANK(backontrack_map) // This will now correctly return '2'
};


const Level* const game_levels[] = { &level_sm, &level_bot };
const uint8_t MAX_LEVELS = 2;