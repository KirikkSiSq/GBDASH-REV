;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module gameplay
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _player_update
	.globl _hUGE_init
	.globl _puts
	.globl _printf
	.globl _gotoxy
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _fill_bkg_rect
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _display_off
	.globl _wait_vbl_done
	.globl _waitpadup
	.globl _joypad
	.globl _setup_menu_font
	.globl _load_bkg_tileset
	.globl _draw_mt_column
	.globl _fill_scroll_bg
	.globl b_draw_menu
	.globl _draw_menu
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
;src/gameplay.c:27: void setup_menu_font(void) NONBANKED {
;	---------------------------------
; Function setup_menu_font
; ---------------------------------
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
;src/gameplay.c:33: void load_bkg_tileset(const uint8_t* tiles, uint16_t tile_count) NONBANKED {
;	---------------------------------
; Function load_bkg_tileset
; ---------------------------------
_load_bkg_tileset::
;src/gameplay.c:34: if (tile_count == 256u) {
	ld	l, c
	ld	h, b
	ld	a, l
	or	a, a
	jr	NZ, 00102$
	dec	h
	jr	NZ, 00102$
;src/gameplay.c:35: set_bkg_data(0, 128, tiles);
	push	de
	push	de
	ld	hl, #0x8000
	push	hl
	call	_set_bkg_data
	add	sp, #4
	pop	de
;src/gameplay.c:36: set_bkg_data(128, 128, tiles + (128u * 16u));
	ld	hl, #0x0800
	add	hl, de
	push	hl
	ld	hl, #0x8080
	push	hl
	call	_set_bkg_data
	add	sp, #4
	ret
00102$:
;src/gameplay.c:38: set_bkg_data(0, (uint8_t)tile_count, tiles);
	ld	a, c
	push	de
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/gameplay.c:40: }
	ret
;src/gameplay.c:43: void draw_mt_column(uint8_t ring_col, uint16_t map_col,
;	---------------------------------
; Function draw_mt_column
; ---------------------------------
_draw_mt_column::
	add	sp, #-10
	ldhl	sp,	#7
	ld	(hl), e
	inc	hl
	ld	(hl), d
;src/gameplay.c:47: uint8_t bx = ring_col << 1;
	add	a, a
	ldhl	sp,	#2
;src/gameplay.c:49: uint8_t _prev = _current_bank;
	ld	(hl+), a
	ldh	a, (__current_bank + 0)
	ld	(hl), a
;src/gameplay.c:50: SWITCH_ROM(map_bank);
	ldhl	sp,	#18
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;src/gameplay.c:52: for (uint8_t r = 0; r < map_h && r < BKG_MT_H; r++) {
	ldhl	sp,	#9
	ld	(hl), #0x00
00104$:
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#5
	ld	e, l
	ld	d, h
	ldhl	sp,	#16
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jp	NC, 00101$
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, #0x10
	jp	NC, 00101$
;src/gameplay.c:53: uint8_t mt = map[(uint16_t)r * map_w + map_col];
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#5
	ld	e, (hl)
	ld	d, #0x00
	call	__mulint
	pop	hl
	push	bc
	pop	de
	push	de
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#12
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl), a
;src/gameplay.c:54: uint8_t by = (r & (BKG_MT_H - 1)) << 1;
	ldhl	sp,	#9
	ld	a, (hl)
	and	a, #0x0f
	ldhl	sp,	#6
	ld	(hl), a
	sla	(hl)
;src/gameplay.c:55: set_bkg_tiles(bx, by, 2, 1, &metatiles[mt][0]);
	dec	hl
	ld	a, (hl-)
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00130$:
	ldhl	sp,	#4
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00130$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_metatiles
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	push	de
	ld	de, #0x102
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/gameplay.c:56: set_bkg_tiles(bx, by + 1, 2, 1, &metatiles[mt][2]);
	pop	de
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl+), a
	ld	a, (hl-)
	dec	hl
	inc	a
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x02
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/gameplay.c:52: for (uint8_t r = 0; r < map_h && r < BKG_MT_H; r++) {
	ldhl	sp,	#9
	inc	(hl)
	jp	00104$
00101$:
;src/gameplay.c:59: SWITCH_ROM(_prev);
	ldhl	sp,	#3
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;src/gameplay.c:60: }
	add	sp, #10
	pop	hl
	add	sp, #7
	jp	(hl)
;src/gameplay.c:63: void fill_scroll_bg(const uint8_t* map, uint16_t map_w, uint16_t map_h, uint8_t map_bank) NONBANKED {
;	---------------------------------
; Function fill_scroll_bg
; ---------------------------------
_fill_scroll_bg::
	add	sp, #-4
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/gameplay.c:64: uint16_t cols = (map_w < BKG_MT_W) ? map_w : BKG_MT_W;
	ld	e, c
	ld	d, b
	ld	a, e
	sub	a, #0x10
	ld	a, d
	sbc	a, #0x00
	jr	C, 00108$
	ld	e, #0x10
00108$:
	ldhl	sp,	#0
	ld	a, e
	ld	(hl+), a
;src/gameplay.c:65: for (uint16_t c = 0; c < cols; c++) {
	ld	de, #0x0000
	ld	(hl), e
00103$:
	ldhl	sp,	#0
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	NC, 00105$
;src/gameplay.c:66: draw_mt_column((uint8_t)(c % BKG_MT_W), c, map, map_w, map_h, map_bank);
	ld	a, e
	and	a, #0x0f
	push	bc
	push	de
	ldhl	sp,	#12
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	push	hl
	push	bc
	push	af
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	push	hl
	call	_draw_mt_column
	pop	de
	pop	bc
;src/gameplay.c:65: for (uint16_t c = 0; c < cols; c++) {
	inc	de
	jr	00103$
00105$:
;src/gameplay.c:68: }
	add	sp, #4
	pop	hl
	add	sp, #3
	jp	(hl)
;src/gameplay.c:83: void play_level(uint8_t idx) NONBANKED {
;	---------------------------------
; Function play_level
; ---------------------------------
_play_level::
	add	sp, #-43
	ldhl	sp,	#40
	ld	(hl), a
;src/gameplay.c:84: uint8_t prev_game_bank = _current_bank;
	ldh	a, (__current_bank + 0)
	ldhl	sp,	#32
	ld	(hl), a
;src/gameplay.c:94: SWITCH_ROM(BANK(game_levels));
	ld	a, #<(___bank_game_levels)
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;src/gameplay.c:95: l = game_levels[idx];
	ld	bc, #_game_levels+0
	ldhl	sp,	#40
	ld	a, (hl+)
	ld	e, a
	ld	d, #0x00
	sla	e
	rl	d
	ld	a, e
	ld	(hl+), a
	ld	a, d
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
	ldhl	sp,	#38
	ld	(hl+), a
	inc	de
	ld	a, (de)
;src/gameplay.c:96: level_tiles = l->tiles;
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#33
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/gameplay.c:97: level_map = l->map;
	ldhl	sp,#38
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
	ldhl	sp,	#12
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/gameplay.c:98: level_tile_count = l->tile_count;
	ldhl	sp,#38
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
	ldhl	sp,	#35
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/gameplay.c:99: level_map_w = l->map_width;
	ldhl	sp,#38
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
	ldhl	sp,	#14
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/gameplay.c:100: level_map_h = l->map_height;
	ldhl	sp,#38
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
	ldhl	sp,	#16
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/gameplay.c:101: level_tiles_bank = BANK(famidash_chr);
	ldhl	sp,	#37
;src/gameplay.c:102: level_map_bank = l->map_bank;
	ld	a, #<(___bank_famidash_chr)
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000e
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#18
	ld	(hl), a
;src/gameplay.c:105: if (level_songs[idx]) {
	ld	de, #_level_songs
	ldhl	sp,	#41
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
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
;src/gameplay.c:106: const hUGESong_t * song = level_songs[idx];
	ldhl	sp,	#41
	ld	a, c
	ld	(hl+), a
;src/gameplay.c:107: uint8_t song_b = song_bank[idx];
	ld	a, b
	ld	(hl-), a
	dec	hl
	ld	bc, #_song_bank+0
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	b, a
;src/gameplay.c:108: uint8_t divider = l->timer_divider;
	ldhl	sp,#38
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	c, a
;src/gameplay.c:109: music_ready = 0;
	xor	a, a
	ld	(#_music_ready),a
;src/gameplay.c:110: current_song_bank = song_b;
	ld	hl, #_current_song_bank
	ld	(hl), b
;src/gameplay.c:111: SWITCH_ROM(song_b);
	ld	a, b
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), b
;c:\gbdk\include\gb\gb.h:811: __asm__("di");
	di
;src/gameplay.c:113: hUGE_init(song);
	push	bc
	ldhl	sp,	#43
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_hUGE_init
	pop	bc
;src/gameplay.c:114: TMA_REG = divider;
	ld	a, c
	ldh	(_TMA_REG + 0), a
;c:\gbdk\include\gb\gb.h:795: __asm__("ei");
	ei
;src/gameplay.c:116: music_ready = 1;
	ld	hl, #_music_ready
	ld	(hl), #0x01
00102$:
;src/gameplay.c:119: SWITCH_ROM(prev_game_bank);
	ldhl	sp,	#32
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;src/gameplay.c:121: uint16_t cam_px = 0; // Represents player's world X position
	xor	a, a
	ldhl	sp,	#41
	ld	(hl+), a
	ld	(hl), a
;src/gameplay.c:122: uint16_t cam_py = 112;
	ldhl	sp,	#21
	ld	a, #0x70
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/gameplay.c:123: uint16_t cam_py_max = (level_map_h << 4);
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	b, (hl)
	add	a, a
	rl	b
	add	a, a
	rl	b
	add	a, a
	rl	b
	add	a, a
	rl	b
;src/gameplay.c:124: if (cam_py_max > 144u) cam_py_max -= 144u;
	ld	c, a
	ld	a, #0x90
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00104$
	ld	a, c
	add	a, #0x70
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ldhl	sp,	#23
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00105$
00104$:
;src/gameplay.c:125: else cam_py_max = 0;
	xor	a, a
	ldhl	sp,	#23
	ld	(hl+), a
	ld	(hl), a
00105$:
;src/gameplay.c:126: uint16_t loaded_r = BKG_MT_W - 1;
	ldhl	sp,	#25
	ld	a, #0x0f
	ld	(hl+), a
;src/gameplay.c:133: player_init(&player, 0, 240); // Player starts at map pixel 0
;include/player.h:34: p->world_x   = start_x;
	xor	a, a
	ld	(hl), a
	ldhl	sp,	#0
	ld	(hl+), a
;include/player.h:35: p->world_y   = start_y;
	ld	(hl+), a
	ld	a, #0xf0
	ld	(hl+), a
;include/player.h:36: p->vel_y     = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
;include/player.h:37: p->on_ground = 0;
	ld	(hl+), a
;include/player.h:38: p->dead      = 0;
;include/player.h:39: p->gravity_flipped = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
;include/player.h:40: p->anim_frame = 0;
;include/player.h:41: p->anim_timer = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:811: __asm__("di");
	di
;src/gameplay.c:137: DISPLAY_OFF;
	call	_display_off
;src/gameplay.c:138: _prev = _current_bank;
	ldh	a, (__current_bank + 0)
	ld	e, a
;src/gameplay.c:139: SWITCH_ROM(level_tiles_bank);
	ldhl	sp,	#37
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;src/gameplay.c:140: load_bkg_tileset(level_tiles, level_tile_count);
	push	de
	ldhl	sp,	#37
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#35
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_load_bkg_tileset
	pop	de
;src/gameplay.c:141: SWITCH_ROM(_prev);
	ld	a, e
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), e
;src/gameplay.c:143: set_sprite_data(0, 8, icon1_tiles);
	ld	de, #_icon1_tiles
	push	de
	ld	hl, #0x800
	push	hl
	call	_set_sprite_data
	add	sp, #4
;c:\gbdk\include\gb\gb.h:1461: SCX_REG=x, SCY_REG=y;
	ld	a, #0xe0
	ldh	(_SCX_REG + 0), a
	ld	a, #0x70
	ldh	(_SCY_REG + 0), a
;src/gameplay.c:147: fill_scroll_bg(level_map, level_map_w, level_map_h, level_map_bank);
	ldhl	sp,	#18
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_fill_scroll_bg
;src/gameplay.c:150: fill_bkg_rect(28, 0, 4, 32, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x20
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	hl, #0x1c
	push	hl
	call	_fill_bkg_rect
	add	sp, #5
;src/gameplay.c:152: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;src/gameplay.c:153: OBP0_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
;src/gameplay.c:154: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;src/gameplay.c:156: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/gameplay.c:157: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/gameplay.c:158: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;c:\gbdk\include\gb\gb.h:795: __asm__("ei");
	ei
;src/gameplay.c:161: waitpadup();
	call	_waitpadup
;src/gameplay.c:163: uint16_t scroll_acc = 0;
	ldhl	sp,	#27
;src/gameplay.c:164: uint8_t prev_joy = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/gameplay.c:165: while (1) {
	ld	de, #_song_bank
	ldhl	sp,	#40
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#31
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#30
	ld	(hl), a
	ldhl	sp,#38
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#33
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#32
	ld	(hl), a
00140$:
;src/gameplay.c:166: wait_vbl_done();
	call	_wait_vbl_done
;src/gameplay.c:167: uint8_t joy = joypad();
	call	_joypad
	ldhl	sp,	#33
	ld	(hl), a
;src/gameplay.c:168: if (joy & J_START) break;
	push	hl
	ldhl	sp,	#35
	bit	7, (hl)
	pop	hl
	jp	NZ, 00141$
;src/gameplay.c:171: if ((joy & J_B) && !(prev_joy & J_B)) {
	push	hl
	ldhl	sp,	#35
	bit	5, (hl)
	pop	hl
	jr	Z, 00109$
	push	hl
	ldhl	sp,	#30
	bit	5, (hl)
	pop	hl
	jr	NZ, 00109$
;src/gameplay.c:172: player_noclip = !player_noclip;
	ld	hl, #_player_noclip
	ld	a, (hl)
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	(hl), a
00109$:
;src/gameplay.c:174: prev_joy = joy;
	ldhl	sp,	#33
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;src/gameplay.c:177: if (cam_px < ((level_map_w - VIEW_MT_W) << 4)) {
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#37
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#39
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x04
00322$:
	ldhl	sp,	#36
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00322$
	ldhl	sp,	#41
	ld	a, (hl)
	ldhl	sp,	#38
	ld	(hl), a
	ldhl	sp,	#42
	ld	a, (hl)
	ldhl	sp,	#39
	ld	(hl), a
	ldhl	sp,	#38
	ld	e, l
	ld	d, h
	ldhl	sp,	#36
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jp	NC, 00117$
;src/gameplay.c:178: uint16_t px_prev = cam_px >> 4;
	ldhl	sp,	#41
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
	ldhl	sp,	#42
	ld	a, (hl)
	ldhl	sp,	#37
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
;src/gameplay.c:179: scroll_acc += SCROLL_SPEED_FP;
	ldhl	sp,	#27
	ld	a, (hl)
	ldhl	sp,	#38
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x035c
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#36
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#35
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#38
	ld	(hl), a
	ldhl	sp,	#35
	ld	a, (hl)
	ldhl	sp,	#39
	ld	(hl), a
;src/gameplay.c:180: cam_px += scroll_acc >> 8;
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#41
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#43
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#42
	ld	(hl), a
;src/gameplay.c:181: scroll_acc &= 0xFF;
	ldhl	sp,	#38
	ld	a, (hl+)
	ld	c, (hl)
	dec	hl
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
;src/gameplay.c:182: uint16_t px_curr = cam_px >> 4;
	ldhl	sp,	#41
	ld	a, (hl)
	ldhl	sp,	#38
	ld	(hl), a
	ldhl	sp,	#42
	ld	a, (hl)
	ldhl	sp,	#39
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
;src/gameplay.c:183: if (px_curr != px_prev) {
	dec	hl
	dec	hl
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ, 00323$
	dec	hl
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	Z, 00117$
00323$:
;src/gameplay.c:184: uint16_t need = px_curr + VIEW_MT_W;
	ldhl	sp,	#38
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#40
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#39
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#35
	ld	(hl), a
;src/gameplay.c:185: if (need > loaded_r && need < level_map_w) {
	ldhl	sp,	#25
	ld	e, l
	ld	d, h
	ldhl	sp,	#34
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00117$
	ldhl	sp,	#34
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00117$
;src/gameplay.c:186: loaded_r = need;
	ldhl	sp,	#34
	ld	a, (hl)
	ldhl	sp,	#25
	ld	(hl), a
	ldhl	sp,	#35
	ld	a, (hl)
	ldhl	sp,	#26
	ld	(hl), a
;src/gameplay.c:187: draw_mt_column((uint8_t)(need % BKG_MT_W), need, level_map, level_map_w, level_map_h, level_map_bank);
	ldhl	sp,	#34
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	and	a, #0x0f
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#18
	ld	h, (hl)
	push	hl
	inc	sp
	ldhl	sp,	#17
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ldhl	sp,	#17
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ldhl	sp,	#17
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ldhl	sp,	#41
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_draw_mt_column
00117$:
;src/gameplay.c:192: player.world_x = cam_px;
	ldhl	sp,	#41
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#42
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;src/gameplay.c:194: _prev = _current_bank;
	ldh	a, (__current_bank + 0)
	ld	c, a
;src/gameplay.c:195: SWITCH_ROM(level_map_bank);
	ldhl	sp,	#18
	ld	a, (hl)
	ldh	(__current_bank + 0), a
	ld	a, (hl)
	ld	(#_rROMB0),a
;src/gameplay.c:196: died = player_update(&player, joy, level_map, level_map_w, level_map_h);
	push	bc
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#41
	ld	a, (hl)
	ld	hl, #8
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_player_update
	ldhl	sp,	#37
	ld	(hl), a
	pop	bc
;src/gameplay.c:197: SWITCH_ROM(_prev);
	ld	a, c
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), c
;src/gameplay.c:200: py = player_screen_y(&player, cam_py);
;include/player.h:62: return p->world_y - (int16_t)cam_py;
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#37
	ld	(hl), a
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,#36
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	(hl-), a
	ld	(hl), e
;src/gameplay.c:201: if (py < CAM_Y_TOP_ZONE) {
;src/gameplay.c:204: if ((uint16_t)target_cam_py > cam_py_max) target_cam_py = (int16_t)cam_py_max;
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#37
;src/gameplay.c:201: if (py < CAM_Y_TOP_ZONE) {
	ld	(hl+), a
	ld	a, (hl+)
	sub	a, #0x14
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00324$
	bit	7, d
	jr	NZ, 00325$
	cp	a, a
	jr	00325$
00324$:
	bit	7, d
	jr	Z, 00325$
	scf
00325$:
	jr	NC, 00129$
;src/gameplay.c:202: int16_t target_cam_py = player.world_y - CAM_Y_TOP_ZONE;
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#38
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#39
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#34
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
	ldhl	sp,	#39
	ld	(hl-), a
	ld	(hl), e
;src/gameplay.c:203: if (target_cam_py < 0) target_cam_py = 0;
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl), a
	bit	7, (hl)
	jr	Z, 00119$
	xor	a, a
	ldhl	sp,	#38
	ld	(hl+), a
	ld	(hl), a
00119$:
;src/gameplay.c:204: if ((uint16_t)target_cam_py > cam_py_max) target_cam_py = (int16_t)cam_py_max;
	ldhl	sp,	#38
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#23
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jr	NC, 00121$
	ldhl	sp,	#36
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
00121$:
;src/gameplay.c:205: cam_py = (uint16_t)target_cam_py;
	ldhl	sp,	#38
	ld	a, (hl)
	ldhl	sp,	#21
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#22
	ld	(hl), a
	jr	00130$
00129$:
;src/gameplay.c:206: } else if (py > CAM_Y_BOTTOM_ZONE) {
	ldhl	sp,	#38
	ld	a, #0x64
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	jr	NC, 00130$
;src/gameplay.c:207: int16_t target_cam_py = player.world_y - CAM_Y_BOTTOM_ZONE;
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#38
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#39
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0064
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#39
	ld	(hl-), a
	ld	(hl), e
;src/gameplay.c:208: if (target_cam_py < 0) target_cam_py = 0;
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00123$
	dec	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00123$:
;src/gameplay.c:209: if ((uint16_t)target_cam_py > cam_py_max) target_cam_py = (int16_t)cam_py_max;
	ldhl	sp,	#38
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#23
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	jr	NC, 00125$
	ldhl	sp,	#36
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
00125$:
;src/gameplay.c:210: cam_py = (uint16_t)target_cam_py;
	ldhl	sp,	#38
	ld	a, (hl)
	ldhl	sp,	#21
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#22
	ld	(hl), a
00130$:
;src/gameplay.c:213: if (died) {
	ldhl	sp,	#35
	ld	a, (hl)
	or	a, a
	jp	Z, 00135$
;src/gameplay.c:214: music_ready = 0;
;src/gameplay.c:215: TAC_REG = 0x00;   // Stop music timer immediately
	xor	a, a
	ld	(#_music_ready), a
	ldh	(_TAC_REG + 0), a
;src/gameplay.c:217: NR52_REG = 0x00; // Silence
	xor	a, a
	ldh	(_NR52_REG + 0), a
;src/gameplay.c:218: for (uint8_t i = 0; i < 4; i++) wait_vbl_done();
	ld	c, #0x00
00163$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00131$
	call	_wait_vbl_done
	inc	c
	jr	00163$
00131$:
;src/gameplay.c:219: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;src/gameplay.c:220: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;src/gameplay.c:221: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;src/gameplay.c:223: if (level_songs[idx]) {
	ldhl	sp,#19
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
;src/gameplay.c:228: uint8_t pb = _current_bank;
	ldh	a, (__current_bank + 0)
;src/gameplay.c:229: SWITCH_ROM(1);
	push	af
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	pop	af
	ld	hl, #_rROMB0
	ld	(hl), #0x01
;src/gameplay.c:230: song_ptr = level_songs[idx];
	ldhl	sp,	#41
	ld	(hl), c
	inc	hl
	ld	(hl), b
;src/gameplay.c:231: s_bank = song_bank[idx];
	ldhl	sp,#29
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;src/gameplay.c:232: s_divider = l->timer_divider;
	inc	hl
	push	af
	ld	a, (de)
	ld	b, a
	pop	af
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
;src/gameplay.c:233: SWITCH_ROM(pb);
	ldh	(__current_bank + 0), a
	ld	(#_rROMB0),a
;src/gameplay.c:235: current_song_bank = s_bank;
	ld	hl, #_current_song_bank
	ld	(hl), b
;c:\gbdk\include\gb\gb.h:811: __asm__("di");
	di
;src/gameplay.c:237: uint8_t mb = _current_bank;
	ldh	a, (__current_bank + 0)
	ld	e, a
;src/gameplay.c:238: SWITCH_ROM(s_bank);
	ld	a, b
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), b
;src/gameplay.c:239: hUGE_init(song_ptr);
	push	bc
	push	de
	ldhl	sp,	#45
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_hUGE_init
	pop	de
	pop	bc
;src/gameplay.c:240: SWITCH_ROM(mb);
	ld	a, e
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), e
;src/gameplay.c:241: TMA_REG = s_divider;
	ld	a, c
	ldh	(_TMA_REG + 0), a
;c:\gbdk\include\gb\gb.h:795: __asm__("ei");
	ei
;src/gameplay.c:242: enable_interrupts();
00133$:
;c:\gbdk\include\gb\gb.h:811: __asm__("di");
	di
;src/gameplay.c:246: cam_px = 0;
	xor	a, a
	ldhl	sp,	#41
	ld	(hl+), a
	ld	(hl), a
;src/gameplay.c:247: cam_py = 112;
	ldhl	sp,	#21
	ld	a, #0x70
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/gameplay.c:248: scroll_acc = 0;
	ldhl	sp,	#27
;src/gameplay.c:249: loaded_r = BKG_MT_W - 1;
	xor	a, a
	ld	(hl-), a
	dec	hl
	ld	a, #0x0f
	ld	(hl+), a
;include/player.h:34: p->world_x   = start_x;
	xor	a, a
	ld	(hl), a
	ldhl	sp,	#0
	ld	(hl+), a
;include/player.h:35: p->world_y   = start_y;
	ld	(hl+), a
	ld	a, #0xf0
	ld	(hl+), a
;include/player.h:36: p->vel_y     = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
;include/player.h:37: p->on_ground = 0;
	ld	(hl+), a
;include/player.h:38: p->dead      = 0;
;include/player.h:39: p->gravity_flipped = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
;include/player.h:40: p->anim_frame = 0;
;include/player.h:41: p->anim_timer = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;c:\gbdk\include\gb\gb.h:1461: SCX_REG=x, SCY_REG=y;
	ld	a, #0xe0
	ldh	(_SCX_REG + 0), a
	ld	a, #0x70
	ldh	(_SCY_REG + 0), a
;src/gameplay.c:252: fill_scroll_bg(level_map, level_map_w, level_map_h, level_map_bank);
	ldhl	sp,	#18
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_fill_scroll_bg
;src/gameplay.c:253: fill_bkg_rect(28, 0, 4, 32, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x20
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	hl, #0x1c
	push	hl
	call	_fill_bkg_rect
	add	sp, #5
;src/gameplay.c:255: TAC_REG = 0x04;
	ld	a, #0x04
	ldh	(_TAC_REG + 0), a
;src/gameplay.c:256: music_ready = 1;
	ld	hl, #_music_ready
	ld	(hl), #0x01
;c:\gbdk\include\gb\gb.h:795: __asm__("ei");
	ei
;src/gameplay.c:258: waitpadup();
	call	_waitpadup
00135$:
;include/player.h:62: return p->world_y - (int16_t)cam_py;
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#37
	ld	(hl), a
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,#36
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	(hl-), a
	ld	(hl), e
;src/gameplay.c:262: if (player.gravity_flipped) {
	ldhl	sp,	#8
	ld	c, (hl)
;src/gameplay.c:263: move_metasprite_vflip(icon1_metasprites[player.anim_frame], 0, 0, PLAYER_SCREEN_X + 8, py + 16);
	ldhl	sp,	#38
	ld	a, (hl+)
	add	a, #0x10
	ld	(hl), a
;src/gameplay.c:262: if (player.gravity_flipped) {
	ld	a, c
	or	a, a
	jr	Z, 00137$
;src/gameplay.c:263: move_metasprite_vflip(icon1_metasprites[player.anim_frame], 0, 0, PLAYER_SCREEN_X + 8, py + 16);
	ld	c, (hl)
	ldhl	sp,	#9
	ld	l, (hl)
	xor	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_icon1_metasprites
	add	hl, de
	ld	a, (hl+)
	ld	b, (hl)
;c:\gbdk\include\gb\metasprites.h:209: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl+), a
	ld	(hl), b
;c:\gbdk\include\gb\metasprites.h:210: __current_base_tile = base_tile;
;c:\gbdk\include\gb\metasprites.h:211: __current_base_prop = 0;
	xor	a, a
	ld	(#___current_base_tile), a
	ld	(#___current_base_prop),a
;c:\gbdk\include\gb\metasprites.h:212: return __move_metasprite_vflip(base_sprite, (y << 8) | (uint8_t)(x - 8u));
	ld	d, c
	ld	e, #0x20
	xor	a, a
	call	___move_metasprite_vflip
;src/gameplay.c:263: move_metasprite_vflip(icon1_metasprites[player.anim_frame], 0, 0, PLAYER_SCREEN_X + 8, py + 16);
	jr	00138$
00137$:
;src/gameplay.c:265: move_metasprite(icon1_metasprites[player.anim_frame], 0, 0, PLAYER_SCREEN_X + 8, py + 16);
	ldhl	sp,	#39
	ld	c, (hl)
	ldhl	sp,	#9
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
	ld	d, c
	ld	e, #0x28
	xor	a, a
	call	___move_metasprite
;src/gameplay.c:265: move_metasprite(icon1_metasprites[player.anim_frame], 0, 0, PLAYER_SCREEN_X + 8, py + 16);
00138$:
;src/gameplay.c:267: move_bkg((uint8_t)(cam_px - PLAYER_SCREEN_X), (uint8_t)cam_py);
	ldhl	sp,	#21
	ld	c, (hl)
	ldhl	sp,	#41
	ld	a, (hl)
	add	a, #0xe0
	ldh	(_SCX_REG + 0), a
;c:\gbdk\include\gb\gb.h:1461: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
;src/gameplay.c:267: move_bkg((uint8_t)(cam_px - PLAYER_SCREEN_X), (uint8_t)cam_py);
	jp	00140$
00141$:
;src/gameplay.c:270: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;c:\gbdk\include\gb\gb.h:1461: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;src/gameplay.c:272: waitpadup();
	call	_waitpadup
;c:\gbdk\include\gb\gb.h:811: __asm__("di");
	di
;src/gameplay.c:274: setup_menu_font();
	call	_setup_menu_font
;c:\gbdk\include\gb\gb.h:795: __asm__("ei");
	ei
;src/gameplay.c:276: redraw = 1;
	ld	hl, #_redraw
	ld	(hl), #0x01
;src/gameplay.c:277: }
	add	sp, #43
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
;include/collision.h:39: static inline uint8_t col_of(uint8_t tile_id) {
;	---------------------------------
; Function col_of
; ---------------------------------
_col_of:
	ld	c, a
;include/collision.h:40: return famidash_metatile_collision[tile_id];
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
;include/collision.h:41: }
	ret
;include/collision.h:44: static inline uint8_t col_at(
;	---------------------------------
; Function col_at
; ---------------------------------
_col_at:
	add	sp, #-4
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;include/collision.h:51: if (world_py < 0) return COL_NONE;
	ld	h, b
	bit	7, h
	jr	Z, 00102$
	xor	a, a
	jr	00107$
00102$:
;include/collision.h:52: uint16_t mx = world_px >> 4;
	ldhl	sp,	#2
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#3
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
;include/collision.h:53: uint16_t my = (uint16_t)world_py >> 4;
	ld	e, c
	ld	d, b
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
;include/collision.h:55: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00103$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00104$
00103$:
	ld	a, #0x07
	jr	00107$
00104$:
;include/collision.h:56: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
;include/collision.h:40: return famidash_metatile_collision[tile_id];
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
;include/collision.h:56: return col_of(map[(uint16_t)my * map_w + mx]);
00107$:
;include/collision.h:57: }
	add	sp, #4
	pop	hl
	add	sp, #6
	jp	(hl)
;include/player.h:33: static inline void player_init(Player *p, uint16_t start_x, int16_t start_y) {
;	---------------------------------
; Function player_init
; ---------------------------------
_player_init:
;include/player.h:34: p->world_x   = start_x;
	ld	l, e
	ld	h, d
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;include/player.h:35: p->world_y   = start_y;
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;include/player.h:36: p->vel_y     = 0;
	ld	hl, #0x0004
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;include/player.h:37: p->on_ground = 0;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x00
;include/player.h:38: p->dead      = 0;
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x00
;include/player.h:39: p->gravity_flipped = 0;
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x00
;include/player.h:40: p->anim_frame = 0;
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x00
;include/player.h:41: p->anim_timer = 0;
	ld	hl, #0x000a
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;include/player.h:42: }
	pop	hl
	pop	af
	jp	(hl)
;include/player.h:45: static inline uint8_t col_point(
;	---------------------------------
; Function col_point
; ---------------------------------
_col_point:
	add	sp, #-8
	ldhl	sp,	#6
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;include/player.h:49: return col_at(px, py, map, map_w, map_h);
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
;include/collision.h:51: if (world_py < 0) return COL_NONE;
	ld	h, b
	bit	7, h
	jr	Z, 00102$
	ld	c, #0x00
	jr	00107$
00102$:
;include/collision.h:52: uint16_t mx = world_px >> 4;
	ldhl	sp,	#6
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
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
;include/collision.h:53: uint16_t my = (uint16_t)world_py >> 4;
	ld	e, c
	ld	d, b
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
;include/collision.h:55: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#6
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00104$
	ldhl	sp,	#14
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00105$
00104$:
	ld	c, #0x07
	jr	00107$
00105$:
;include/collision.h:56: return col_of(map[(uint16_t)my * map_w + mx]);
	pop	bc
	push	bc
	call	__mulint
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
;include/collision.h:40: return famidash_metatile_collision[tile_id];
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	c, (hl)
;include/player.h:49: return col_at(px, py, map, map_w, map_h);
00107$:
	ld	a, c
;include/player.h:50: }
	add	sp, #8
	pop	hl
	add	sp, #6
	jp	(hl)
;include/player.h:61: static inline int16_t player_screen_y(const Player *p, uint16_t cam_py) {
;	---------------------------------
; Function player_screen_y
; ---------------------------------
_player_screen_y:
;include/player.h:62: return p->world_y - (int16_t)cam_py;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	l, (hl)
	sub	a, c
	ld	c, a
	ld	a, l
	sbc	a, b
	ld	b, a
;include/player.h:63: }
	ret
;src/gameplay.c:70: void draw_menu(void) BANKED {
;	---------------------------------
; Function draw_menu
; ---------------------------------
	b_draw_menu	= 1
_draw_menu::
;src/gameplay.c:71: fill_bkg_rect(0, 0, 20, 18, 0x00);
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
;src/gameplay.c:72: gotoxy(0, 0);
	xor	a, a
	rrca
	push	af
	call	_gotoxy
	pop	hl
;src/gameplay.c:73: printf("GBDASH BETA 01\n\n");
	ld	de, #___str_1
	call	_puts
;src/gameplay.c:74: for (uint8_t i = 0; i < MAX_LEVELS; i++) {
	ld	c, #0x00
00106$:
	ld	a, (_MAX_LEVELS)
	ld	b, a
;src/gameplay.c:75: gotoxy(1, 2 + i);
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
;src/gameplay.c:76: if (i == selected) printf("0 %s", game_levels[i]->name);
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
;src/gameplay.c:77: else printf(" %s", game_levels[i]->name);
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
;src/gameplay.c:74: for (uint8_t i = 0; i < MAX_LEVELS; i++) {
	inc	c
	jr	00106$
00104$:
;src/gameplay.c:79: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/gameplay.c:80: redraw = 0;
	xor	a, a
	ld	(#_redraw),a
;src/gameplay.c:81: }
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
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
