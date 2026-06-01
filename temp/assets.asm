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
	.globl _level_du
	.globl _level_pg
	.globl _level_bot
	.globl _level_sm
	.globl b___func_famidash_chr_tiles
	.globl ___func_famidash_chr_tiles
	.globl b___func_famidash_chr
	.globl ___func_famidash_chr
	.globl b___func_game_levels
	.globl ___func_game_levels
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
	.area _CODE_1
;src/assets.c:5: BANKREF(game_levels)
;	---------------------------------
; Function __func_game_levels
; ---------------------------------
	b___func_game_levels	= 1
___func_game_levels::
	.local b___func_game_levels 
	___bank_game_levels = b___func_game_levels 
	.globl ___bank_game_levels 
;src/assets.c:6: BANKREF(famidash_chr)
;	---------------------------------
; Function __func_famidash_chr
; ---------------------------------
	b___func_famidash_chr	= 1
___func_famidash_chr::
	.local b___func_famidash_chr 
	___bank_famidash_chr = b___func_famidash_chr 
	.globl ___bank_famidash_chr 
;src/assets.c:9: INCBIN(famidash_chr_tiles, "levels/famidash/famidash_chr_tiles.bin")
;	---------------------------------
; Function __func_famidash_chr_tiles
; ---------------------------------
	b___func_famidash_chr_tiles	= 1
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
	.area _CODE_1
_level_sm:
	.dw __str_0
	.dw _famidash_chr_tiles
	.dw _stereomadness_map
	.dw #0x0100
	.dw #0x037e
	.dw #0x0010
	.db #0x00	; 0
	.db #0x00	; 0
	.byte ___bank_stereomadness_map
_level_bot:
	.dw __str_1
	.dw _famidash_chr_tiles
	.dw _backontrack_map
	.dw #0x0100
	.dw #0x034e
	.dw #0x0010
	.db #0x00	; 0
	.db #0x00	; 0
	.byte ___bank_backontrack_map
_level_pg:
	.dw __str_2
	.dw _famidash_chr_tiles
	.dw _polargeist_map
	.dw #0x0100
	.dw #0x03a6
	.dw #0x0010
	.db #0x00	; 0
	.db #0x00	; 0
	.byte ___bank_polargeist_map
_level_du:
	.dw __str_3
	.dw _famidash_chr_tiles
	.dw _dryout_map
	.dw #0x0100
	.dw #0x034a
	.dw #0x0010
	.db #0x00	; 0
	.db #0x00	; 0
	.byte ___bank_dryout_map
_game_levels:
	.dw _level_sm
	.dw _level_bot
	.dw _level_pg
	.dw _level_du
_MAX_LEVELS:
	.db #0x04	; 4
__str_0:
	.ascii "STEREO MADNESS"
	.db 0x00
__str_1:
	.ascii "BACK ON TRACK"
	.db 0x00
__str_2:
	.ascii "POLARGEIST"
	.db 0x00
__str_3:
	.ascii "DRY OUT"
	.db 0x00
	.area _INITIALIZER
	.area _CABS (ABS)
