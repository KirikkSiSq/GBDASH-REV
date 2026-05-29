;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module assets
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _MAX_LEVELS
	.globl _game_levels
	.globl _level_sm
	.globl b___func_stereomadness_map
	.globl ___func_stereomadness_map
	.globl b___func_famidash_chr_tiles
	.globl ___func_famidash_chr_tiles
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/assets.c:6: INCBIN(famidash_chr_tiles, "levels/famidash/famidash_chr_tiles.bin")
;	---------------------------------
; Function __func_famidash_chr_tiles
; ---------------------------------
	b___func_famidash_chr_tiles	= 0
___func_famidash_chr_tiles::
_famidash_chr_tiles::
1$:
	.incbin "levels/famidash/famidash_chr_tiles.bin" 
2$:
	___size_famidash_chr_tiles = (2$-1$) 
	.globl ___size_famidash_chr_tiles 
	.local b___func_famidash_chr_tiles 
	___bank_famidash_chr_tiles = b___func_famidash_chr_tiles 
	.globl ___bank_famidash_chr_tiles 
;src/assets.c:10: INCBIN(stereomadness_map, "levels/level_data/stereomadness_16high.bin")
;	---------------------------------
; Function __func_stereomadness_map
; ---------------------------------
	b___func_stereomadness_map	= 0
___func_stereomadness_map::
_stereomadness_map::
1$:
	.incbin "levels/level_data/stereomadness_16high.bin" 
2$:
	___size_stereomadness_map = (2$-1$) 
	.globl ___size_stereomadness_map 
	.local b___func_stereomadness_map 
	___bank_stereomadness_map = b___func_stereomadness_map 
	.globl ___bank_stereomadness_map 
	.area _CODE
_level_sm:
	.dw __str_0
	.dw _famidash_chr_tiles
	.dw _stereomadness_map
	.dw #0x0100
	.dw #0x037e
	.dw #0x0010
	.db #0x00	; 0
	.db #0x00	; 0
_game_levels:
	.dw _level_sm
_MAX_LEVELS:
	.db #0x01	; 1
__str_0:
	.ascii "STEREO MAD"
	.db 0x00
	.area _INITIALIZER
	.area _CABS (ABS)
