;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module player
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _player_update
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
;src/player.c:3: uint8_t player_update(
;	---------------------------------
; Function player_update
; ---------------------------------
_player_update::
	add	sp, #-41
	ldhl	sp,	#38
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
;src/player.c:10: if (p->dead) return 1;
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#40
	ld	(hl), a
	or	a, a
	jr	Z, 00102$
	ld	a, #0x01
	jp	00377$
00102$:
;src/player.c:13: if (!p->on_ground) {
	ldhl	sp,#38
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;src/player.c:14: p->vel_y += GRAVITY;
	ldhl	sp,#38
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#37
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#36
	ld	(hl), a
;src/player.c:13: if (!p->on_ground) {
	ld	a, c
	or	a, a
	jr	NZ, 00106$
;src/player.c:14: p->vel_y += GRAVITY;
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#33
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#35
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:15: if (p->vel_y > MAX_FALL_SPEED) p->vel_y = MAX_FALL_SPEED;
	ld	e, b
	ld	d, #0x00
	ld	a, #0x5f
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 01111$
	bit	7, d
	jr	NZ, 01112$
	cp	a, a
	jr	01112$
01111$:
	bit	7, d
	jr	Z, 01112$
	scf
01112$:
	jr	NC, 00106$
	ldhl	sp,	#35
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x5f
	ld	(hl+), a
	ld	(hl), #0x00
00106$:
;src/player.c:19: if ((joy & J_A) && p->on_ground) {
	push	hl
	ldhl	sp,	#39
	bit	4, (hl)
	pop	hl
	jr	Z, 00108$
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00108$
;src/player.c:20: p->vel_y = JUMP_FORCE;
	ldhl	sp,	#35
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0xa3
	ld	(hl+), a
	ld	(hl), #0xff
;src/player.c:21: p->on_ground = 0;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00108$:
;src/player.c:25: int8_t pixels = (int8_t)(p->vel_y >> 4);
	ldhl	sp,	#35
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,#35
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#40
	ld	(hl), c
;src/player.c:26: int8_t step   = (pixels >= 0) ? 1 : -1;
	ld	a, (hl)
	rlca
	and	a,#0x01
	ldhl	sp,	#36
	ld	(hl), a
	bit	0, (hl)
	ld	a, #0x01
	jr	Z, 00380$
	ld	a, #0xff
00380$:
	ldhl	sp,	#10
	ld	(hl), a
;src/player.c:27: int8_t steps  = (pixels >= 0) ? pixels : -pixels;
	ldhl	sp,	#36
	bit	0, (hl)
	jr	Z, 00382$
	xor	a, a
	ldhl	sp,	#40
	sub	a, (hl)
	ld	(hl), a
00382$:
	ldhl	sp,	#40
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
;src/player.c:28: if (steps > 16) steps = 16;
	ld	e, (hl)
	ld	a,#0x10
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 01114$
	bit	7, d
	jr	NZ, 01115$
	cp	a, a
	jr	01115$
01114$:
	bit	7, d
	jr	Z, 01115$
	scf
01115$:
	jr	NC, 00111$
	ldhl	sp,	#11
	ld	(hl), #0x10
00111$:
;src/player.c:30: p->on_ground = 0;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/player.c:33: for (int8_t i = 0; i < steps; i++) {
	ldhl	sp,	#47
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
	ldhl	sp,	#48
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#45
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#46
	ld	a, (hl)
	ldhl	sp,	#15
	ld	(hl), a
	ldhl	sp,	#43
	ld	a, (hl)
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,	#44
	ld	a, (hl)
	ldhl	sp,	#17
	ld	(hl), a
	ldhl	sp,	#10
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 01116$
	bit	7, d
	jr	NZ, 01117$
	cp	a, a
	jr	01117$
01116$:
	bit	7, d
	jr	Z, 01117$
	scf
01117$:
	ld	a, #0x00
	rla
	ldhl	sp,	#18
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#19
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#20
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#21
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#22
	ld	(hl), a
	ldhl	sp,	#16
	ld	a, (hl)
	ldhl	sp,	#23
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#24
	ld	(hl), a
	ldhl	sp,	#40
	ld	(hl), #0x00
00375$:
;src/player.c:34: int16_t ny = p->world_y + step;
	ldhl	sp,#38
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#27
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#26
	ld	(hl), a
;src/player.c:38: uint8_t cl = col_point(p->world_x,              ny + PLAYER_SIZE, map, map_w, map_h);
	ldhl	sp,	#38
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;src/player.c:33: for (int8_t i = 0; i < steps; i++) {
	ldhl	sp,	#11
	ld	e, (hl)
	ldhl	sp,	#40
	ld	a,(hl)
	ld	d,a
	ldhl	sp,	#11
	sub	a, (hl)
	bit	7, e
	jr	Z, 01118$
	bit	7, d
	jr	NZ, 01119$
	cp	a, a
	jr	01119$
01118$:
	bit	7, d
	jr	Z, 01119$
	scf
01119$:
	jp	NC, 00133$
;src/player.c:34: int16_t ny = p->world_y + step;
	ldhl	sp,#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#10
	ld	a, (hl)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	a, c
	add	a, e
	ld	c, a
	ld	a, b
	adc	a, d
	ldhl	sp,	#29
	ld	(hl), c
	inc	hl
;src/player.c:38: uint8_t cl = col_point(p->world_x,              ny + PLAYER_SIZE, map, map_w, map_h);
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#30
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl), a
	ldhl	sp,#27
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#31
	ld	(hl+), a
	inc	de
	ld	a, (de)
;src/player.c:39: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny + PLAYER_SIZE, map, map_w, map_h);
	ld	(hl-), a
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x0f
	ld	c, a
	ld	a, b
	adc	a, #0x00
	ldhl	sp,	#35
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/player.c:36: if (step > 0) {
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jp	Z, 00131$
;src/player.c:38: uint8_t cl = col_point(p->world_x,              ny + PLAYER_SIZE, map, map_w, map_h);
	ldhl	sp,#33
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	h, b
	bit	7, h
	jr	Z, 00167$
	xor	a, a
	jr	00172$
00167$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#32
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
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
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
;src/player.c:38: uint8_t cl = col_point(p->world_x,              ny + PLAYER_SIZE, map, map_w, map_h);
	push	de
	ldhl	sp,	#33
	ld	e, l
	ld	d, h
	ldhl	sp,	#16
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00169$
	ldhl	sp,	#12
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00170$
00169$:
	ld	a, #0x07
	jr	00172$
00170$:
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#31
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#16
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	a, (hl)
00172$:
	ldhl	sp,	#32
;src/player.c:39: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny + PLAYER_SIZE, map, map_w, map_h);
	ld	(hl+), a
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00175$
	inc	hl
	inc	hl
	ld	(hl), #0x00
	jr	00180$
00175$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#36
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
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	dec	hl
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
;src/player.c:39: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny + PLAYER_SIZE, map, map_w, map_h);
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00177$
	ldhl	sp,	#33
	ld	e, l
	ld	d, h
	ldhl	sp,	#12
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00178$
00177$:
	ldhl	sp,	#36
	ld	(hl), #0x07
	jr	00180$
00178$:
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#33
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#35
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#16
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
00180$:
;src/player.c:40: if (IS_SOLID(cl) || IS_SOLID(cr)) {
	ldhl	sp,	#32
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00112$
	ldhl	sp,	#32
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00112$
	ldhl	sp,	#32
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00112$
	ldhl	sp,	#32
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00112$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00112$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00112$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00112$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x06
	jp	NZ, 00132$
00112$:
;src/player.c:41: p->world_y   = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
	ldhl	sp,	#2
	ld	a, (hl+)
	and	a, #0xf0
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xf0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:42: p->vel_y     = 0;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/player.c:43: p->on_ground = 1;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;src/player.c:44: break;
	jp	00133$
00131$:
;src/player.c:48: uint8_t cl = col_point(p->world_x,              ny, map, map_w, map_h);
	ldhl	sp,	#31
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#32
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#34
	ld	a, (hl)
	rlca
	and	a,#0x01
	ldhl	sp,	#31
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	inc	hl
	ld	b, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
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
;src/player.c:48: uint8_t cl = col_point(p->world_x,              ny, map, map_w, map_h);
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00183$
	ldhl	sp,	#34
	ld	(hl), #0x00
	jr	00188$
00183$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
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
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#32
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#33
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
;src/player.c:48: uint8_t cl = col_point(p->world_x,              ny, map, map_w, map_h);
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00185$
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#19
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00186$
00185$:
	ldhl	sp,	#34
	ld	(hl), #0x07
	jr	00188$
00186$:
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#23
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl), a
00188$:
;src/player.c:49: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny, map, map_w, map_h);
	ldhl	sp,	#31
	ld	a, (hl)
	or	a, a
	jr	Z, 00191$
	ldhl	sp,	#36
	ld	(hl), #0x00
	jr	00196$
00191$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#36
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
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
;src/player.c:49: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny, map, map_w, map_h);
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00193$
	ldhl	sp,	#32
	ld	e, l
	ld	d, h
	ldhl	sp,	#19
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00194$
00193$:
	ldhl	sp,	#36
	ld	(hl), #0x07
	jr	00196$
00194$:
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#32
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#35
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#23
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
00196$:
;src/player.c:50: if (IS_SOLID(cl) || IS_SOLID(cr)) {
	ldhl	sp,	#34
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00121$
	ldhl	sp,	#34
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00121$
	ldhl	sp,	#34
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00121$
	ldhl	sp,	#34
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00121$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00121$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00121$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00121$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00132$
00121$:
;src/player.c:51: p->world_y = ((ny >> 4) + 1) << 4;
	ldhl	sp,#29
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	l, c
	ld	h, b
	inc	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:52: p->vel_y   = 0;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/player.c:53: break;
	jr	00133$
00132$:
;src/player.c:57: p->world_y = ny;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#29
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/player.c:33: for (int8_t i = 0; i < steps; i++) {
	ldhl	sp,	#40
	inc	(hl)
	jp	00375$
00133$:
;src/player.c:62: uint16_t hx1 = p->world_x + PLAYER_HBOX;
	ldhl	sp,#27
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#35
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#29
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl)
	ldhl	sp,	#30
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#27
	ld	(hl), c
	inc	hl
;src/player.c:63: uint16_t hx2 = p->world_x + PLAYER_SIZE - PLAYER_HBOX;
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#31
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/player.c:64: int16_t  hy1 = p->world_y + PLAYER_HBOX;
	ldhl	sp,#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#33
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#34
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
;src/player.c:65: int16_t  hy2 = p->world_y + PLAYER_SIZE - PLAYER_HBOX;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	ld	e, l
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), e
	inc	hl
	ld	(hl), a
;src/player.c:67: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ldhl	sp,	#12
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#19
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#20
	ld	(hl), a
	ldhl	sp,	#16
	ld	a, (hl)
	ldhl	sp,	#21
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#22
	ld	(hl), a
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ld	a, b
	rlca
	and	a,#0x01
	ldhl	sp,	#40
	ld	(hl), a
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#27
	ld	a, (hl)
	ldhl	sp,	#23
	ld	(hl), a
	ldhl	sp,	#28
	ld	a, (hl)
	ldhl	sp,	#24
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
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	inc	hl
	inc	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
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
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00199$
	ld	c, #0x00
	jr	00204$
00199$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#16
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00201$
	ldhl	sp,	#12
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00202$
00201$:
	ld	c, #0x07
	jr	00204$
00202$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#16
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00204$:
;src/player.c:67: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x08
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00207$
	ld	c, #0x00
	jr	00212$
00207$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00209$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00210$
00209$:
	ld	c, #0x07
	jr	00212$
00210$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00212$:
;src/player.c:67: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x03
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00215$
	ld	c, #0x00
	jr	00220$
00215$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00217$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00218$
00217$:
	ld	c, #0x07
	jr	00220$
00218$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	l, a
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00220$:
;src/player.c:67: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x04
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00223$
	ld	c, #0x00
	jr	00228$
00223$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00225$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00226$
00225$:
	ld	c, #0x07
	jr	00228$
00226$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	l, a
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00228$:
;src/player.c:67: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x02
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00231$
	ld	e, #0x00
	jr	00236$
00231$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00233$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00234$
00233$:
	ld	e, #0x07
	jr	00236$
00234$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	e, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00236$:
;src/player.c:67: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	dec	e
	jp	Z, 00134$
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#32
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
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00239$
	ld	c, #0x00
	jr	00244$
00239$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#31
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#32
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00241$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00242$
00241$:
	ld	c, #0x07
	jr	00244$
00242$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00244$:
;src/player.c:68: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x08
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00247$
	ld	c, #0x00
	jr	00252$
00247$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#31
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#32
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00249$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00250$
00249$:
	ld	c, #0x07
	jr	00252$
00250$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00252$:
;src/player.c:68: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x03
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00255$
	ld	c, #0x00
	jr	00260$
00255$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#31
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#32
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00257$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00258$
00257$:
	ld	c, #0x07
	jr	00260$
00258$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00260$:
;src/player.c:68: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x04
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00263$
	ld	c, #0x00
	jr	00268$
00263$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#31
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#32
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00265$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00266$
00265$:
	ld	c, #0x07
	jr	00268$
00266$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00268$:
;src/player.c:68: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x02
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00271$
	ld	(hl), #0x00
	jr	00276$
00271$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#31
	ld	a, (hl)
	ldhl	sp,	#17
	ld	(hl), a
	ldhl	sp,	#32
	ld	a, (hl)
	ldhl	sp,	#18
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	ldhl	sp,	#17
	ld	e, l
	ld	d, h
	ldhl	sp,	#19
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00273$
	ldhl	sp,	#27
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00274$
00273$:
	ldhl	sp,	#40
	ld	(hl), #0x07
	jr	00276$
00274$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#27
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#17
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#40
	ld	(hl), a
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00276$:
;src/player.c:68: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ldhl	sp,	#40
	ld	a, (hl)
	dec	a
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	a, (hl)
	rlca
	and	a,#0x01
	ldhl	sp,	#40
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#25
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
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
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00279$
	ld	c, #0x00
	jr	00284$
00279$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00281$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00282$
00281$:
	ld	c, #0x07
	jr	00284$
00282$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00284$:
;src/player.c:69: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x08
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00287$
	ld	c, #0x00
	jr	00292$
00287$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00289$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00290$
00289$:
	ld	c, #0x07
	jr	00292$
00290$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00292$:
;src/player.c:69: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x03
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00295$
	ld	c, #0x00
	jr	00300$
00295$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00297$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00298$
00297$:
	ld	c, #0x07
	jr	00300$
00298$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00300$:
;src/player.c:69: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x04
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00303$
	ld	c, #0x00
	jr	00308$
00303$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00305$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00306$
00305$:
	ld	c, #0x07
	jr	00308$
00306$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00308$:
;src/player.c:69: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x02
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00311$
	ld	c, #0x00
	jr	00316$
00311$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00313$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00314$
00313$:
	ld	c, #0x07
	jr	00316$
00314$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00316$:
;src/player.c:69: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	dec	c
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00319$
	ld	c, #0x00
	jr	00324$
00319$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#31
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#32
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00321$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00322$
00321$:
	ld	c, #0x07
	jr	00324$
00322$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00324$:
;src/player.c:70: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ld	a, c
	sub	a, #0x08
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00327$
	ld	c, #0x00
	jr	00332$
00327$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#31
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#32
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00329$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00330$
00329$:
	ld	c, #0x07
	jr	00332$
00330$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00332$:
;src/player.c:70: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ld	a, c
	sub	a, #0x03
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00335$
	ld	c, #0x00
	jr	00340$
00335$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#31
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#32
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00337$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00338$
00337$:
	ld	c, #0x07
	jr	00340$
00338$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00340$:
;src/player.c:70: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ld	a, c
	sub	a, #0x04
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00343$
	ld	c, #0x00
	jr	00348$
00343$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#31
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#32
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00345$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00346$
00345$:
	ld	c, #0x07
	jr	00348$
00346$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#27
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00348$:
;src/player.c:70: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ld	a, c
	sub	a, #0x02
	jr	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00351$
	ld	(hl), #0x00
	jr	00356$
00351$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#25
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	ldhl	sp,	#31
	ld	e, l
	ld	d, h
	ldhl	sp,	#19
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00353$
	ldhl	sp,	#27
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00354$
00353$:
	ldhl	sp,	#40
	ld	(hl), #0x07
	jr	00356$
00354$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#27
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#31
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#40
	ld	(hl), a
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00356$:
;src/player.c:70: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ldhl	sp,	#40
	ld	a, (hl)
	dec	a
	jr	NZ, 00135$
00134$:
;src/player.c:71: p->dead = 1;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
;src/player.c:72: return 1;
	ld	a,#0x01
	ld	(hl),a
	jp	00377$
00135$:
;src/player.c:78: uint8_t cm_l = col_point(p->world_x,              p->world_y + 7, map, map_w, map_h);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#33
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#32
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#32
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#31
	ld	(hl), a
	ldhl	sp,	#28
	ld	a, (hl)
	ldhl	sp,	#32
	ld	(hl-), a
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00359$
	xor	a, a
	jr	00364$
00359$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#36
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
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
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
;src/player.c:78: uint8_t cm_l = col_point(p->world_x,              p->world_y + 7, map, map_w, map_h);
	push	de
	ldhl	sp,	#37
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00361$
	ldhl	sp,	#10
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00362$
00361$:
	ld	a, #0x07
	jr	00364$
00362$:
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#35
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	a, (hl)
00364$:
	ldhl	sp,	#40
	ld	(hl), a
;src/player.c:79: uint8_t cm_r = col_point(p->world_x + PLAYER_SIZE, p->world_y + 7, map, map_w, map_h);
	ldhl	sp,#29
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#35
	ld	(hl), c
	inc	hl
	ld	(hl), a
	ldhl	sp,	#27
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00367$
	ldhl	sp,	#36
	ld	(hl), #0x00
	jp	00372$
00367$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#35
	ld	a, (hl)
	ldhl	sp,	#31
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl)
	ldhl	sp,	#32
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
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#27
	ld	a, (hl)
	ldhl	sp,	#35
	ld	(hl), a
	ldhl	sp,	#28
	ld	a, (hl)
	ldhl	sp,	#36
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
;src/player.c:79: uint8_t cm_r = col_point(p->world_x + PLAYER_SIZE, p->world_y + 7, map, map_w, map_h);
	ldhl	sp,	#31
	ld	e, l
	ld	d, h
	ldhl	sp,	#19
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00369$
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00370$
00369$:
	ldhl	sp,	#36
	ld	(hl), #0x07
	jr	00372$
00370$:
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#35
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#31
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
00372$:
;src/player.c:80: if (IS_SOLID(cm_l) || IS_SOLID(cm_r)) {
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00155$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00155$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00155$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00155$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00155$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00155$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00155$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00156$
00155$:
;src/player.c:81: p->dead = 1;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
;src/player.c:82: return 1;
	ld	a,#0x01
	ld	(hl),a
	jr	00377$
00156$:
;src/player.c:87: if (p->world_y > (int16_t)((uint16_t)map_h << 4)) {
	ldhl	sp,	#10
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
	ld	c, a
	ldhl	sp,	#33
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 01169$
	bit	7, d
	jr	NZ, 01170$
	cp	a, a
	jr	01170$
01169$:
	bit	7, d
	jr	Z, 01170$
	scf
01170$:
	jr	NC, 00165$
;src/player.c:88: p->dead = 1;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
;src/player.c:89: return 1;
	ld	a,#0x01
	ld	(hl),a
	jr	00377$
00165$:
;src/player.c:92: return 0;
	xor	a, a
00377$:
;src/player.c:93: }
	add	sp, #41
	pop	hl
	add	sp, #6
	jp	(hl)
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;include/collision.h:31: static inline uint8_t col_of(uint8_t tile_id) {
;	---------------------------------
; Function col_of
; ---------------------------------
_col_of:
	ld	c, a
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
;include/collision.h:33: }
	ret
;include/collision.h:36: static inline uint8_t col_at(
;	---------------------------------
; Function col_at
; ---------------------------------
_col_at:
	add	sp, #-4
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ld	h, b
	bit	7, h
	jr	Z, 00102$
	xor	a, a
	jr	00107$
00102$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
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
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
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
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
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
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
00107$:
;include/collision.h:49: }
	add	sp, #4
	pop	hl
	add	sp, #6
	jp	(hl)
;include/player.h:26: static inline void player_init(Player *p, uint16_t start_x, int16_t start_y) {
;	---------------------------------
; Function player_init
; ---------------------------------
_player_init:
;include/player.h:27: p->world_x   = start_x;
	ld	l, e
	ld	h, d
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;include/player.h:28: p->world_y   = start_y;
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
;include/player.h:29: p->vel_y     = 0;
	ld	hl, #0x0004
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;include/player.h:30: p->on_ground = 0;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x00
;include/player.h:31: p->dead      = 0;
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x00
;include/player.h:32: }
	pop	hl
	pop	af
	jp	(hl)
;include/player.h:35: static inline uint8_t col_point(
;	---------------------------------
; Function col_point
; ---------------------------------
_col_point:
	add	sp, #-8
	ldhl	sp,	#6
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
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
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ld	h, b
	bit	7, h
	jr	Z, 00102$
	ld	c, #0x00
	jr	00107$
00102$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
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
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
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
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
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
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	c, (hl)
;include/player.h:39: return col_at(px, py, map, map_w, map_h);
00107$:
	ld	a, c
;include/player.h:40: }
	add	sp, #8
	pop	hl
	add	sp, #6
	jp	(hl)
;include/player.h:51: static inline int16_t player_screen_y(const Player *p, uint16_t cam_py) {
;	---------------------------------
; Function player_screen_y
; ---------------------------------
_player_screen_y:
;include/player.h:52: return p->world_y - (int16_t)cam_py;
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
;include/player.h:53: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
