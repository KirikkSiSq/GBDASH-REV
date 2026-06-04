;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _hUGE_dosound
	.globl _hUGE_init
	.globl _play_level
	.globl b_draw_menu
	.globl _draw_menu
	.globl _setup_menu_font
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _waitpadup
	.globl _joypad
	.globl _add_TIM
	.globl _selected
	.globl _redraw
	.globl _music_ready
	.globl _play_music_safe
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
_music_ready::
	.ds 1
_redraw::
	.ds 1
_selected::
	.ds 1
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
;src/main.c:13: void play_music_safe(void) {
;	---------------------------------
; Function play_music_safe
; ---------------------------------
_play_music_safe::
;src/main.c:14: if (music_ready) hUGE_dosound();
	ld	a, (#_music_ready)
	or	a, a
	jp	NZ, _hUGE_dosound
;src/main.c:15: }
	ret
;src/main.c:17: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
;src/main.c:18: music_ready = 0;
	xor	a, a
	ld	(#_music_ready),a
;src/main.c:21: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;src/main.c:22: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;src/main.c:23: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;src/main.c:25: hUGE_init(&song_stereoma);
	ld	de, #_song_stereoma
	call	_hUGE_init
;src/main.c:26: music_ready = 1;
	ld	hl, #_music_ready
	ld	(hl), #0x01
;src/main.c:29: TMA_REG = 224;
	ld	a, #0xe0
	ldh	(_TMA_REG + 0), a
;src/main.c:30: TAC_REG = 0x04;
	ld	a, #0x04
	ldh	(_TAC_REG + 0), a
;src/main.c:31: add_TIM(play_music_safe);
	ld	de, #_play_music_safe
	call	_add_TIM
;src/main.c:32: set_interrupts(VBL_IFLAG | TIM_IFLAG);
	ld	a, #0x05
	call	_set_interrupts
;c:\gbdk\include\gb\gb.h:795: __asm__("ei");
	ei
;src/main.c:35: setup_menu_font();
	call	_setup_menu_font
;src/main.c:37: while (1) {
00116$:
;src/main.c:38: if (redraw) draw_menu();
	ld	a, (#_redraw)
	or	a, a
	jr	Z, 00102$
	ld	e, #b_draw_menu
	ld	hl, #_draw_menu
	call	___sdcc_bcall_ehl
00102$:
;src/main.c:40: uint8_t joy = joypad();
	call	_joypad
	ldhl	sp,	#0
	ld	(hl), a
;src/main.c:43: if (joy & J_UP) {
	push	hl
	bit	2, (hl)
	pop	hl
	jr	Z, 00113$
;src/main.c:44: if (selected > 0) { selected--; redraw = 1; }
	ld	hl, #_selected
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
	dec	(hl)
	ld	hl, #_redraw
	ld	(hl), #0x01
00104$:
;src/main.c:45: waitpadup();
	call	_waitpadup
	jr	00114$
00113$:
;src/main.c:46: } else if (joy & J_DOWN) {
	push	hl
	ldhl	sp,	#2
	bit	3, (hl)
	pop	hl
	jr	Z, 00110$
;src/main.c:47: if (selected < MAX_LEVELS - 1) { selected++; redraw = 1; }
	ld	a, (_MAX_LEVELS)
	ld	b, #0x00
	ld	c, a
	dec	bc
	ld	a, (_selected)
	ld	l, a
	ld	h, #0x00
	ld	e, b
	ld	d, h
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	bit	7, e
	jr	Z, 00174$
	bit	7, d
	jr	NZ, 00175$
	cp	a, a
	jr	00175$
00174$:
	bit	7, d
	jr	Z, 00175$
	scf
00175$:
	jr	NC, 00106$
	ld	hl, #_selected
	inc	(hl)
	ld	hl, #_redraw
	ld	(hl), #0x01
00106$:
;src/main.c:48: waitpadup();
	call	_waitpadup
	jr	00114$
00110$:
;src/main.c:49: } else if (joy & J_A) {
	push	hl
	ldhl	sp,	#2
	bit	4, (hl)
	pop	hl
	jr	Z, 00114$
;c:\gbdk\include\gb\gb.h:811: __asm__("di");
	di
;src/main.c:51: play_level(selected);
	ld	a, (_selected)
	call	_play_level
;c:\gbdk\include\gb\gb.h:795: __asm__("ei");
	ei
;src/main.c:52: enable_interrupts();
00114$:
;src/main.c:55: wait_vbl_done();
	call	_wait_vbl_done
	jr	00116$
;src/main.c:57: }
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__music_ready:
	.db #0x00	; 0
__xinit__redraw:
	.db #0x01	; 1
__xinit__selected:
	.db #0x00	; 0
	.area _CABS (ABS)
