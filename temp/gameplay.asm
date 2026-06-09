;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module gameplay
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_player_screen_y
	.globl _player_screen_y
	.globl b_player_update
	.globl _player_update
	.globl b_player_init
	.globl _player_init
	.globl _init_music_banked
	.globl _fill_scroll_bg
	.globl _draw_mt_column
	.globl _load_bkg_tileset
	.globl _puts
	.globl _printf
	.globl _gotoxy
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _fill_bkg_rect
	.globl _set_sprite_data
	.globl _display_off
	.globl _wait_vbl_done
	.globl _waitpadup
	.globl _joypad
	.globl b_setup_menu_font
	.globl _setup_menu_font
	.globl b_draw_menu
	.globl _draw_menu
	.globl b_play_level
	.globl _play_level
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
;src/gameplay.c:27: void setup_menu_font(void) BANKED {
;	---------------------------------
; Function setup_menu_font
; ---------------------------------
	b_setup_menu_font	= 1
_setup_menu_font::
;src/gameplay.c:28: font_init();
	call	_font_init
;src/gameplay.c:29: font_set(font_load(font_min));
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
	push	de
	call	_font_set
	pop	hl
;src/gameplay.c:30: }
	ret
;src/gameplay.c:32: void draw_menu(void) BANKED {
;	---------------------------------
; Function draw_menu
; ---------------------------------
	b_draw_menu	= 1
_draw_menu::
;src/gameplay.c:33: fill_bkg_rect(0, 0, 20, 18, 0x00);
	xor	a, a
	ld	h, a
	ld	l, #0x12
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_fill_bkg_rect
	add	sp, #5
;src/gameplay.c:34: gotoxy(0, 0);
	xor	a, a
	rrca
	push	af
	call	_gotoxy
	pop	hl
;src/gameplay.c:35: printf("GBDASH BETA 01\n\n");
	ld	de, #___str_1
	call	_puts
;src/gameplay.c:36: for (uint8_t i = 0; i < MAX_LEVELS; i++) {
	ld	c, #0x00
00106$:
	ld	a, (_MAX_LEVELS)
	ld	b, a
;src/gameplay.c:37: gotoxy(1, 2 + i);
	ld	a,c
	cp	a,b
	jr	NC, 00104$
	add	a, #0x02
	push	bc
	ld	h, a
	ld	l, #0x01
	push	hl
	call	_gotoxy
	pop	hl
	pop	bc
;src/gameplay.c:38: if (i == selected) printf("0 %s", game_levels[i]->name);
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	ld	b, l
	ld	e, h
	ld	a, (#_selected)
	sub	a, c
	jr	NZ, 00102$
	ld	l, b
	ld	h, e
	ld	de, #_game_levels
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	ld	de, #___str_2
	push	de
	call	_printf
	add	sp, #4
	pop	bc
	jr	00107$
00102$:
;src/gameplay.c:39: else printf(" %s", game_levels[i]->name);
	ld	a, #<(_game_levels)
	add	a, b
	ld	l, a
	ld	a, #>(_game_levels)
	adc	a, e
	ld	h, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	ld	de, #___str_3
	push	de
	call	_printf
	add	sp, #4
	pop	bc
00107$:
;src/gameplay.c:36: for (uint8_t i = 0; i < MAX_LEVELS; i++) {
	inc	c
	jr	00106$
00104$:
;src/gameplay.c:41: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/gameplay.c:42: redraw = 0;
	xor	a, a
	ld	(#_redraw),a
;src/gameplay.c:43: }
	ret
___str_1:
	.ascii "GBDASH BETA 01"
	.db 0x0a
	.db 0x00
___str_2:
	.ascii "0 %s"
	.db 0x00
___str_3:
	.ascii " %s"
	.db 0x00
;src/gameplay.c:45: void play_level(uint8_t idx) BANKED {
;	---------------------------------
; Function play_level
; ---------------------------------
	b_play_level	= 1
_play_level::
	add	sp, #-40
;src/gameplay.c:56: l = game_levels[idx];
	ld	bc, #_game_levels+0
	ldhl	sp,	#46
	ld	e, (hl)
	xor	a, a
	sla	e
	adc	a, a
	ldhl	sp,	#38
	ld	(hl), e
	inc	hl
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#36
	ld	(hl+), a
	inc	de
	ld	a, (de)
;src/gameplay.c:57: level_tiles = l->tiles;
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#31
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/gameplay.c:58: level_map = l->map;
	ldhl	sp,#36
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#15
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/gameplay.c:59: level_tile_count = l->tile_count;
	ldhl	sp,#36
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#33
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/gameplay.c:60: level_map_w = l->map_width;
	ldhl	sp,#36
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#17
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/gameplay.c:61: level_map_h = l->map_height;
	ldhl	sp,#36
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#19
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/gameplay.c:62: level_tiles_bank = BANK(chr_gb);
	ldhl	sp,	#35
;src/gameplay.c:63: level_map_bank = l->map_bank;
	ld	a, #<(___bank_chr_gb)
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000e
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#21
	ld	(hl), a
;src/gameplay.c:66: if (level_songs[idx]) {
	ld	de, #_level_songs
	ldhl	sp,	#38
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#24
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#23
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	or	a, c
	jr	Z, 00102$
;src/gameplay.c:67: init_music_banked(level_songs[idx], song_bank[idx], l->timer_divider);
	ldhl	sp,#36
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#39
	ld	(hl), a
	ld	de, #_song_bank+0
	ldhl	sp,	#46
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#39
	ld	h, (hl)
	push	hl
	inc	sp
	ld	e, c
	ld	d, b
	call	_init_music_banked
00102$:
;src/gameplay.c:70: uint16_t cam_px = 0;
	xor	a, a
	ldhl	sp,	#38
	ld	(hl+), a
	ld	(hl), a
;src/gameplay.c:71: uint16_t cam_py = 112;
	ldhl	sp,	#24
	ld	a, #0x70
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/gameplay.c:72: uint16_t cam_py_max = (level_map_h << 4);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, (hl)
	add	a, a
	rl	c
	add	a, a
	rl	c
	add	a, a
	rl	c
	add	a, a
	rl	c
;src/gameplay.c:73: if (cam_py_max > 144u) cam_py_max -= 144u;
	ldhl	sp,	#29
	ld	(hl+), a
	ld	a, c
	ld	(hl-), a
	ld	a, #0x90
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00104$
	ldhl	sp,#29
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0090
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	c, e
	ldhl	sp,	#26
	ld	(hl), c
	inc	hl
	ld	(hl), a
	jr	00105$
00104$:
;src/gameplay.c:74: else cam_py_max = 0;
	xor	a, a
	ldhl	sp,	#26
	ld	(hl+), a
	ld	(hl), a
00105$:
;src/gameplay.c:75: uint16_t loaded_r = BKG_MT_W - 1;
	ldhl	sp,	#28
	ld	a, #0x0f
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/gameplay.c:81: player_init(&player, 0, 240);
	ld	hl, #3
	add	hl, sp
	ld	de, #0x00f0
	push	de
	ld	de, #0x0000
	push	de
	push	hl
	ld	e, #b_player_init
	ld	hl, #_player_init
	call	___sdcc_bcall_ehl
	add	sp, #6
;c:\gbdk\include\gb\gb.h:811: __asm__("di");
	di
;src/gameplay.c:85: DISPLAY_OFF;
	call	_display_off
;src/gameplay.c:86: load_bkg_tileset(level_tiles, level_tile_count, level_tiles_bank);
	ldhl	sp,	#35
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#32
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_load_bkg_tileset
;src/gameplay.c:88: set_sprite_data(0, 8, icon1_tiles);
	ld	de, #_icon1_tiles
	push	de
	ld	hl, #0x800
	push	hl
	call	_set_sprite_data
	add	sp, #4
;c:\gbdk\include\gb\gb.h:1461: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	ld	a, #0x70
	ldh	(_SCY_REG + 0), a
;src/gameplay.c:91: fill_scroll_bg(level_map, level_map_w, level_map_h, level_map_bank);
	ldhl	sp,	#21
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_fill_scroll_bg
;src/gameplay.c:93: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;src/gameplay.c:94: OBP0_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
;src/gameplay.c:95: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;src/gameplay.c:97: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/gameplay.c:98: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/gameplay.c:99: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;c:\gbdk\include\gb\gb.h:795: __asm__("ei");
	ei
;src/gameplay.c:102: waitpadup();
	call	_waitpadup
;src/gameplay.c:104: uint16_t scroll_acc = 0;
	ldhl	sp,	#30
;src/gameplay.c:105: uint8_t prev_joy = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/gameplay.c:106: while (1) {
	ldhl	sp,#36
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#34
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#33
	ld	(hl), a
	ld	de, #_song_bank
	ldhl	sp,	#46
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#36
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#35
	ld	(hl), a
00140$:
;src/gameplay.c:107: wait_vbl_done();
	call	_wait_vbl_done
;src/gameplay.c:108: uint8_t joy = joypad();
	call	_joypad
	ld	c, a
;src/gameplay.c:109: if (joy & J_START) break;
	bit	7, c
	jp	NZ, 00141$
;src/gameplay.c:112: if ((joy & J_B) && !(prev_joy & J_B)) {
	bit	5, c
	jr	Z, 00109$
	push	hl
	ldhl	sp,	#33
	bit	5, (hl)
	pop	hl
	jr	NZ, 00109$
;src/gameplay.c:113: player_noclip = !player_noclip;
	ld	hl, #_player_noclip
	ld	a, (hl)
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	(hl), a
00109$:
;src/gameplay.c:115: prev_joy = joy;
	ldhl	sp,	#31
	ld	(hl), c
;src/gameplay.c:118: if (cam_px < ((level_map_w - VIEW_MT_W) << 4)) {
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0xf6
	ld	l, a
	ld	a, b
	adc	a, #0xff
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	b, l
	ld	e, h
	ldhl	sp,	#38
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, b
	ld	a, (hl)
	sbc	a, e
	jp	NC, 00117$
;src/gameplay.c:119: uint16_t px_prev = cam_px >> 4;
	inc	hl
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
;src/gameplay.c:120: scroll_acc += SCROLL_SPEED_FP;
	ldhl	sp,	#30
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #0x035c
	add	hl, de
	ld	e, l
	ld	d, h
;src/gameplay.c:121: cam_px += scroll_acc >> 8;
	ldhl	sp,	#1
	ld	a, d
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	push	de
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#40
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	pop	de
	push	hl
	ld	a, l
	ldhl	sp,	#40
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#39
	ld	(hl), a
;src/gameplay.c:122: scroll_acc &= 0xFF;
	ldhl	sp,	#30
	ld	(hl), e
;src/gameplay.c:123: uint16_t px_curr = cam_px >> 4;
	ldhl	sp,#38
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
;src/gameplay.c:124: if (px_curr != px_prev) {
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00332$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	Z, 00117$
00332$:
;src/gameplay.c:125: uint16_t need = px_curr + VIEW_MT_W;
	ld	hl, #0x000a
	add	hl, de
	ld	e, l
	ld	d, h
;src/gameplay.c:126: if (need > loaded_r && need < level_map_w) {
	ldhl	sp,	#28
	ld	a, (hl+)
	sub	a, e
	ld	a, (hl)
	sbc	a, d
	jr	NC, 00117$
	ldhl	sp,	#17
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	NC, 00117$
;src/gameplay.c:127: loaded_r = need;
	ldhl	sp,	#28
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/gameplay.c:128: draw_mt_column((uint8_t)(need % BKG_MT_W), need, level_map, level_map_w, level_map_h, level_map_bank);
	ld	a, e
	and	a, #0x0f
	ld	b, a
	push	bc
	ldhl	sp,	#23
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	push	hl
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	a, b
	call	_draw_mt_column
	pop	bc
00117$:
;src/gameplay.c:133: player.world_x = cam_px;
	ldhl	sp,	#38
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
;src/gameplay.c:81: player_init(&player, 0, 240);
;src/gameplay.c:135: died = player_update(&player, joy, level_map, level_map_w, level_map_h, level_map_bank);
	ldhl	sp,	#21
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	a, c
	push	af
	inc	sp
	ld	hl, #11
	add	hl, sp
	ld	e, l
	ld	d, h
	push	de
	ld	e, #b_player_update
	ld	hl, #_player_update
	call	___sdcc_bcall_ehl
	add	sp, #10
	ldhl	sp,	#0
	ld	(hl), a
;src/gameplay.c:138: py = player_screen_y(&player, cam_py);
	ldhl	sp,	#24
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	hl, #5
	add	hl, sp
	ld	e, l
	ld	d, h
	push	de
	ld	e, #b_player_screen_y
	ld	hl, #_player_screen_y
	call	___sdcc_bcall_ehl
	add	sp, #4
;src/gameplay.c:139: if (py < CAM_Y_TOP_ZONE) {
	ldhl	sp,	#36
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/gameplay.c:142: if ((uint16_t)target_cam_py > cam_py_max) target_cam_py = (int16_t)cam_py_max;
	ldhl	sp,	#26
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#27
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;src/gameplay.c:139: if (py < CAM_Y_TOP_ZONE) {
	ldhl	sp,	#36
	ld	a, (hl+)
	sub	a, #0x14
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00333$
	bit	7, d
	jr	NZ, 00334$
	cp	a, a
	jr	00334$
00333$:
	bit	7, d
	jr	Z, 00334$
	scf
00334$:
	jr	NC, 00129$
;src/gameplay.c:140: int16_t target_cam_py = player.world_y - CAM_Y_TOP_ZONE;
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#37
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#24
	ld	(hl), a
	ldhl	sp,	#37
	ld	a, (hl)
	ldhl	sp,	#25
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0014
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#37
	ld	(hl-), a
	ld	(hl), e
;src/gameplay.c:141: if (target_cam_py < 0) target_cam_py = 0;
	ld	a, (hl)
	ldhl	sp,	#24
	ld	(hl), a
	ldhl	sp,	#37
	ld	a, (hl)
	ldhl	sp,	#25
	ld	(hl), a
	bit	7, (hl)
	jr	Z, 00119$
	xor	a, a
	ldhl	sp,	#36
	ld	(hl+), a
	ld	(hl), a
00119$:
;src/gameplay.c:142: if ((uint16_t)target_cam_py > cam_py_max) target_cam_py = (int16_t)cam_py_max;
	ldhl	sp,	#36
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#26
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jr	NC, 00121$
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#37
	ld	(hl), a
00121$:
;src/gameplay.c:143: cam_py = (uint16_t)target_cam_py;
	ldhl	sp,	#36
	ld	a, (hl)
	ldhl	sp,	#24
	ld	(hl), a
	ldhl	sp,	#37
	ld	a, (hl)
	ldhl	sp,	#25
	ld	(hl), a
	jr	00130$
00129$:
;src/gameplay.c:144: } else if (py > CAM_Y_BOTTOM_ZONE) {
	ldhl	sp,	#36
	ld	a, #0x64
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00130$
;src/gameplay.c:145: int16_t target_cam_py = player.world_y - CAM_Y_BOTTOM_ZONE;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0x9c
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ldhl	sp,	#36
	ld	(hl), c
	inc	hl
;src/gameplay.c:146: if (target_cam_py < 0) target_cam_py = 0;
	ld	(hl-), a
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00123$
	dec	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00123$:
;src/gameplay.c:147: if ((uint16_t)target_cam_py > cam_py_max) target_cam_py = (int16_t)cam_py_max;
	ldhl	sp,	#36
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#26
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jr	NC, 00125$
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#37
	ld	(hl), a
00125$:
;src/gameplay.c:148: cam_py = (uint16_t)target_cam_py;
	ldhl	sp,	#36
	ld	a, (hl)
	ldhl	sp,	#24
	ld	(hl), a
	ldhl	sp,	#37
	ld	a, (hl)
	ldhl	sp,	#25
	ld	(hl), a
00130$:
;src/gameplay.c:151: if (died) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jp	Z, 00135$
;src/gameplay.c:152: TAC_REG = 0x00;   // Stop music timer immediately
	xor	a, a
	ldh	(_TAC_REG + 0), a
;src/gameplay.c:154: NR52_REG = 0x00; // Silence
	xor	a, a
	ldh	(_NR52_REG + 0), a
;src/gameplay.c:155: for (uint8_t i = 0; i < 4; i++) wait_vbl_done();
	ld	c, #0x00
00155$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00131$
	call	_wait_vbl_done
	inc	c
	jr	00155$
00131$:
;src/gameplay.c:156: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;src/gameplay.c:157: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;src/gameplay.c:158: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;src/gameplay.c:160: if (level_songs[idx]) {
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	or	a, c
	jr	Z, 00133$
;src/gameplay.c:161: init_music_banked(level_songs[idx], song_bank[idx], l->timer_divider);
	ldhl	sp,#32
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	inc	sp
	ld	e, c
	ld	d, b
	call	_init_music_banked
00133$:
;c:\gbdk\include\gb\gb.h:811: __asm__("di");
	di
;src/gameplay.c:165: cam_px = 0;
	xor	a, a
	ldhl	sp,	#38
	ld	(hl+), a
	ld	(hl), a
;src/gameplay.c:166: cam_py = 112;
	ldhl	sp,	#24
	ld	a, #0x70
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/gameplay.c:167: scroll_acc = 0;
	ldhl	sp,	#30
;src/gameplay.c:168: loaded_r = BKG_MT_W - 1;
	xor	a, a
	ld	(hl-), a
	dec	hl
	ld	a, #0x0f
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/gameplay.c:169: player_init(&player, 0, 240);
	ld	de, #0x00f0
	push	de
	ld	de, #0x0000
	push	de
	ld	hl, #7
	add	hl, sp
	ld	e, l
	ld	d, h
	push	de
	ld	e, #b_player_init
	ld	hl, #_player_init
	call	___sdcc_bcall_ehl
	add	sp, #6
;c:\gbdk\include\gb\gb.h:1461: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	ld	a, #0x70
	ldh	(_SCY_REG + 0), a
;src/gameplay.c:171: fill_scroll_bg(level_map, level_map_w, level_map_h, level_map_bank);
	ldhl	sp,	#21
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_fill_scroll_bg
;src/gameplay.c:173: TAC_REG = 0x04;
	ld	a, #0x04
	ldh	(_TAC_REG + 0), a
;src/gameplay.c:174: music_ready = 1;
	ld	hl, #_music_ready
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:795: __asm__("ei");
	ei
;src/gameplay.c:176: waitpadup();
	call	_waitpadup
00135$:
;src/gameplay.c:179: uint16_t scroll_px = (cam_px > PLAYER_SCREEN_X) ? (cam_px - PLAYER_SCREEN_X) : 0;
	ldhl	sp,	#38
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, #0x20
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00159$
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0020
	ld	a, e
	sub	a, l
	ld	c, a
	jr	00160$
00159$:
	ld	c, #0x00
00160$:
	ldhl	sp,	#36
	ld	(hl), c
;src/gameplay.c:180: uint8_t sprite_x = (cam_px < PLAYER_SCREEN_X) ? (uint8_t)cam_px : PLAYER_SCREEN_X;
	ldhl	sp,	#1
	ld	a, (hl+)
	sub	a, #0x20
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00161$
	ldhl	sp,	#38
	ld	a, (hl-)
	ld	(hl), a
	ld	b, (hl)
	jr	00162$
00161$:
	ld	b, #0x20
00162$:
;src/gameplay.c:182: py = player_screen_y(&player, cam_py);
	push	bc
	ldhl	sp,	#26
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	hl, #7
	add	hl, sp
	ld	e, l
	ld	d, h
	push	de
	ld	e, #b_player_screen_y
	ld	hl, #_player_screen_y
	call	___sdcc_bcall_ehl
	add	sp, #4
	ldhl	sp,	#3
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	pop	bc
;src/gameplay.c:183: if (player.gravity_flipped) {
	ldhl	sp,	#11
	ld	c, (hl)
;src/gameplay.c:184: move_metasprite_vflip(icon1_metasprites[player.anim_frame], 0, 0, sprite_x + 8, py + 16);
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	e, b
	add	a, #0x10
	ld	(hl), a
	ld	a, e
	add	a, #0x08
	ldhl	sp,	#37
	ld	(hl), a
;src/gameplay.c:183: if (player.gravity_flipped) {
	ld	a, c
	or	a, a
	jr	Z, 00137$
;src/gameplay.c:184: move_metasprite_vflip(icon1_metasprites[player.anim_frame], 0, 0, sprite_x + 8, py + 16);
	ldhl	sp,	#2
	ld	b, (hl)
	ldhl	sp,	#37
	ld	c, (hl)
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_icon1_metasprites
	add	hl, de
	ld	a, (hl+)
	ld	l, (hl)
;c:\gbdk\include\gb\metasprites.h:209: __current_metasprite = metasprite;
	ld	e, a
	ld	d, l
	ld	hl, #___current_metasprite
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;c:\gbdk\include\gb\metasprites.h:210: __current_base_tile = base_tile;
;c:\gbdk\include\gb\metasprites.h:211: __current_base_prop = 0;
	xor	a, a
	ld	(#___current_base_tile), a
	ld	(#___current_base_prop),a
;c:\gbdk\include\gb\metasprites.h:212: return __move_metasprite_vflip(base_sprite, (y << 8) | (uint8_t)(x - 8u));
	ld	d, b
	ld	a, c
	add	a, #0xf8
	ld	e, a
	xor	a, a
	call	___move_metasprite_vflip
;src/gameplay.c:184: move_metasprite_vflip(icon1_metasprites[player.anim_frame], 0, 0, sprite_x + 8, py + 16);
	jr	00138$
00137$:
;src/gameplay.c:186: move_metasprite(icon1_metasprites[player.anim_frame], 0, 0, sprite_x + 8, py + 16);
	ldhl	sp,	#2
	ld	c, (hl)
	ldhl	sp,	#12
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_icon1_metasprites
	add	hl, de
	ld	a, (hl+)
	ld	b, (hl)
;c:\gbdk\include\gb\metasprites.h:169: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl+), a
	ld	(hl), b
;c:\gbdk\include\gb\metasprites.h:170: __current_base_tile = base_tile;
;c:\gbdk\include\gb\metasprites.h:171: __current_base_prop = 0;
	xor	a, a
	ld	(#___current_base_tile), a
	ld	(#___current_base_prop),a
;c:\gbdk\include\gb\metasprites.h:172: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	b, c
	ldhl	sp,	#37
	ld	e, (hl)
	ld	d, b
	xor	a, a
	call	___move_metasprite
;src/gameplay.c:186: move_metasprite(icon1_metasprites[player.anim_frame], 0, 0, sprite_x + 8, py + 16);
00138$:
;src/gameplay.c:188: move_bkg((uint8_t)scroll_px, (uint8_t)cam_py);
	ldhl	sp,	#24
	ld	c, (hl)
	ldhl	sp,	#36
	ld	a, (hl)
	ldh	(_SCX_REG + 0), a
;c:\gbdk\include\gb\gb.h:1461: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
;src/gameplay.c:188: move_bkg((uint8_t)scroll_px, (uint8_t)cam_py);
	jp	00140$
00141$:
;src/gameplay.c:191: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;c:\gbdk\include\gb\gb.h:1461: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;src/gameplay.c:193: waitpadup();
	call	_waitpadup
;c:\gbdk\include\gb\gb.h:811: __asm__("di");
	di
;src/gameplay.c:195: setup_menu_font();
	ld	e, #b_setup_menu_font
	ld	hl, #_setup_menu_font
	call	___sdcc_bcall_ehl
;c:\gbdk\include\gb\gb.h:795: __asm__("ei");
	ei
;src/gameplay.c:197: redraw = 1;
	ld	hl, #_redraw
	ld	(hl), #0x01
;src/gameplay.c:198: }
	add	sp, #40
	ret
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
