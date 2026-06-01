;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module level4
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b___func_dryout_map
	.globl ___func_dryout_map
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
	.area _CODE_5
;src/level4.c:4: INCBIN(dryout_map, "levels/level_data/dryout_16high.bin")
;	---------------------------------
; Function __func_dryout_map
; ---------------------------------
	b___func_dryout_map	= 5
___func_dryout_map::
_dryout_map::
1$:
	.incbin "levels/level_data/dryout_16high.bin" 
2$:
	___size_dryout_map = (2$-1$) 
	.globl ___size_dryout_map 
	.local b___func_dryout_map 
	___bank_dryout_map = b___func_dryout_map 
	.globl ___bank_dryout_map 
	.area _CODE_5
	.area _INITIALIZER
	.area _CABS (ABS)
