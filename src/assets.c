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

// Music songs
extern const hUGESong_t stereomadness;
extern const hUGESong_t dryout;
extern const hUGESong_t polargeist;

// Per-level songs: NULL = no music for that level
const hUGESong_t * const level_songs[] = {
  &stereomadness, // level_sm
  NULL, // level_bot
  &polargeist, // level_pg
  &dryout // level_du
};

// Per-level song banks: matches level_songs[]; 0 = silent
// Values must match the #pragma bank N in each song's .c file.
const uint8_t song_bank[] = {
  6u, // level_sm — stereomadness.c
  0u, // level_bot — no song
  8u, // level_pg — polargeist.c
  7u, // level_du — dryout.c
};

// Level definitions with dimensions and bank info
const Level level_sm = {
  "STEREO MADNESS",
  famidash_chr_tiles,
  stereomadness_map,
  256, 894, 16, 0, 0,
  BANK(stereomadness_map),
  192
};

const Level level_bot = {
  "BACK ON TRACK",
  famidash_chr_tiles,
  backontrack_map,
  256, 846, 16, 0, 0,
  BANK(backontrack_map),
  187
};

const Level level_pg = {
  "POLARGEIST",
  famidash_chr_tiles,
  polargeist_map,
  256, 934, 16, 0, 0,
  BANK(polargeist_map),
  193 // 162.54 BPM @ Tempo 6 (Confirmed Perfect)
};

const Level level_du = {
  "DRY OUT",
  famidash_chr_tiles,
  dryout_map,
  256, 842, 16, 0, 0,
  BANK(dryout_map),
  45 // Matches hUGETracker "Tempo (timer divider)"
};

// Global level list used by the menu and gameplay systems
const Level* const game_levels[] = { &level_sm, &level_bot, &level_pg, &level_du };
const uint8_t MAX_LEVELS = sizeof(game_levels) / sizeof(game_levels[0]);
