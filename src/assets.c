#pragma bank 1
#include <gbdk/incbin.h>
#include "assets.h"

// Tileset stays in Bank 1
INCBIN(famidash_chr_tiles, "levels/famidash/famidash_chr_tiles.bin")
INCBIN_EXTERN(famidash_chr_tiles)

// Refer to the map that is now in level1.c
BANKREF_EXTERN(stereomadness_map)
extern const uint8_t stereomadness_map[];

const Level level_sm = {
    "STEREO MAD",
    famidash_chr_tiles,
    stereomadness_map,
    256,
    894,
    16,
    0, 0,
    BANK(stereomadness_map) // This will now correctly return '2'
};

const Level* const game_levels[] = { &level_sm };
const uint8_t MAX_LEVELS = 1;