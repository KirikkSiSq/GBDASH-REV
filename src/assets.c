#include <gbdk/incbin.h>
#include "assets.h"

// Tileset is FamiDash 256 tile graphics, GB 2bpp format (8KB, uncompressed)
// Imma compress maybe in future
INCBIN(famidash_chr_tiles, "levels/famidash/famidash_chr_tiles.bin")
INCBIN_EXTERN(famidash_chr_tiles)


INCBIN(stereomadness_map, "levels/level_data/stereomadness_16high.bin")
INCBIN_EXTERN(stereomadness_map)

// name, tiles, map, tile_count, map_w  map_h, tiles_c, map_c
const Level level_sm = { "STEREO MAD", famidash_chr_tiles, stereomadness_map, 256, 894, 16, 0, 0 };

const Level * const game_levels[] = { &level_sm };
const uint8_t MAX_LEVELS = sizeof(game_levels) / sizeof(game_levels[0]);
