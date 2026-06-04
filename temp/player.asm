;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module player
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _player_noclip
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
_player_noclip::
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
;src/player.c:5: uint8_t player_update(
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
;src/player.c:12: if (p->dead) return 1;
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
	jp	00382$
00102$:
;src/player.c:15: if (!p->on_ground) {
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
;src/player.c:16: p->vel_y += GRAVITY;
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
;src/player.c:15: if (!p->on_ground) {
	ld	a, c
	or	a, a
	jr	NZ, 00106$
;src/player.c:16: p->vel_y += GRAVITY;
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
;src/player.c:17: if (p->vel_y > MAX_FALL_SPEED) p->vel_y = MAX_FALL_SPEED;
	ld	e, b
	ld	d, #0x00
	ld	a, #0x5f
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 01137$
	bit	7, d
	jr	NZ, 01138$
	cp	a, a
	jr	01138$
01137$:
	bit	7, d
	jr	Z, 01138$
	scf
01138$:
	jr	NC, 00106$
	ldhl	sp,	#35
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x5f
	ld	(hl+), a
	ld	(hl), #0x00
00106$:
;src/player.c:21: if ((joy & J_A) && p->on_ground) {
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
;src/player.c:22: p->vel_y = JUMP_FORCE;
	ldhl	sp,	#35
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0xa3
	ld	(hl+), a
	ld	(hl), #0xff
;src/player.c:23: p->on_ground = 0;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00108$:
;src/player.c:27: int8_t pixels = (int8_t)(p->vel_y >> 4);
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
;src/player.c:28: int8_t step   = (pixels >= 0) ? 1 : -1;
	ld	a, (hl)
	rlca
	and	a,#0x01
	ldhl	sp,	#36
	ld	(hl), a
	bit	0, (hl)
	ld	a, #0x01
	jr	Z, 00385$
	ld	a, #0xff
00385$:
	ldhl	sp,	#10
	ld	(hl), a
;src/player.c:29: int8_t steps  = (pixels >= 0) ? pixels : -pixels;
	ldhl	sp,	#36
	bit	0, (hl)
	jr	Z, 00387$
	xor	a, a
	ldhl	sp,	#40
	sub	a, (hl)
	ld	(hl), a
00387$:
	ldhl	sp,	#40
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
;src/player.c:30: if (steps > 16) steps = 16;
	ld	e, (hl)
	ld	a,#0x10
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 01140$
	bit	7, d
	jr	NZ, 01141$
	cp	a, a
	jr	01141$
01140$:
	bit	7, d
	jr	Z, 01141$
	scf
01141$:
	jr	NC, 00111$
	ldhl	sp,	#11
	ld	(hl), #0x10
00111$:
;src/player.c:32: p->on_ground = 0;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/player.c:35: for (int8_t i = 0; i < steps; i++) {
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
	jr	Z, 01142$
	bit	7, d
	jr	NZ, 01143$
	cp	a, a
	jr	01143$
01142$:
	bit	7, d
	jr	Z, 01143$
	scf
01143$:
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
00380$:
;src/player.c:36: int16_t ny = p->world_y + step;
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
;src/player.c:40: uint8_t cl = col_point(p->world_x,              ny + PLAYER_SIZE, map, map_w, map_h);
	ldhl	sp,	#38
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;src/player.c:35: for (int8_t i = 0; i < steps; i++) {
	ldhl	sp,	#11
	ld	e, (hl)
	ldhl	sp,	#40
	ld	a,(hl)
	ld	d,a
	ldhl	sp,	#11
	sub	a, (hl)
	bit	7, e
	jr	Z, 01144$
	bit	7, d
	jr	NZ, 01145$
	cp	a, a
	jr	01145$
01144$:
	bit	7, d
	jr	Z, 01145$
	scf
01145$:
	jp	NC, 00133$
;src/player.c:36: int16_t ny = p->world_y + step;
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
;src/player.c:40: uint8_t cl = col_point(p->world_x,              ny + PLAYER_SIZE, map, map_w, map_h);
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
;src/player.c:41: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny + PLAYER_SIZE, map, map_w, map_h);
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
;src/player.c:38: if (step > 0) {
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jp	Z, 00131$
;src/player.c:40: uint8_t cl = col_point(p->world_x,              ny + PLAYER_SIZE, map, map_w, map_h);
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
	jr	Z, 00172$
	xor	a, a
	jr	00177$
00172$:
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
;src/player.c:40: uint8_t cl = col_point(p->world_x,              ny + PLAYER_SIZE, map, map_w, map_h);
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
	jr	NC, 00174$
	ldhl	sp,	#12
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00175$
00174$:
	ld	a, #0x07
	jr	00177$
00175$:
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
00177$:
	ldhl	sp,	#32
;src/player.c:41: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny + PLAYER_SIZE, map, map_w, map_h);
	ld	(hl+), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00180$
	inc	hl
	inc	hl
	ld	(hl), #0x00
	jr	00185$
00180$:
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
;src/player.c:41: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny + PLAYER_SIZE, map, map_w, map_h);
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
	jr	NC, 00182$
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
	jr	C, 00183$
00182$:
	ldhl	sp,	#36
	ld	(hl), #0x07
	jr	00185$
00183$:
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
00185$:
;src/player.c:42: if (IS_SOLID(cl) || IS_SOLID(cr)) {
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
;src/player.c:43: p->world_y   = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
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
;src/player.c:44: p->vel_y     = 0;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/player.c:45: p->on_ground = 1;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;src/player.c:46: break;
	jp	00133$
00131$:
;src/player.c:50: uint8_t cl = col_point(p->world_x,              ny, map, map_w, map_h);
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
;src/player.c:50: uint8_t cl = col_point(p->world_x,              ny, map, map_w, map_h);
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00188$
	ldhl	sp,	#34
	ld	(hl), #0x00
	jr	00193$
00188$:
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
;src/player.c:50: uint8_t cl = col_point(p->world_x,              ny, map, map_w, map_h);
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
	jr	NC, 00190$
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
	jr	C, 00191$
00190$:
	ldhl	sp,	#34
	ld	(hl), #0x07
	jr	00193$
00191$:
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
00193$:
;src/player.c:51: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny, map, map_w, map_h);
	ldhl	sp,	#31
	ld	a, (hl)
	or	a, a
	jr	Z, 00196$
	ldhl	sp,	#36
	ld	(hl), #0x00
	jr	00201$
00196$:
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
;src/player.c:51: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny, map, map_w, map_h);
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
	jr	NC, 00198$
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
	jr	C, 00199$
00198$:
	ldhl	sp,	#36
	ld	(hl), #0x07
	jr	00201$
00199$:
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
00201$:
;src/player.c:52: if (IS_SOLID(cl) || IS_SOLID(cr)) {
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
;src/player.c:53: p->world_y = ((ny >> 4) + 1) << 4;
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
;src/player.c:54: p->vel_y   = 0;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/player.c:55: break;
	jr	00133$
00132$:
;src/player.c:59: p->world_y = ny;
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
;src/player.c:35: for (int8_t i = 0; i < steps; i++) {
	ldhl	sp,	#40
	inc	(hl)
	jp	00380$
00133$:
;src/player.c:63: if (!player_noclip) {
	ld	a, (#_player_noclip)
	or	a, a
	jp	NZ, 00156$
;src/player.c:64: uint16_t hx1 = p->world_x + PLAYER_HBOX;
	ldhl	sp,#27
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	a, h
	ldhl	sp,	#35
	ld	(hl), e
	inc	hl
	ld	(hl), a
;src/player.c:65: uint16_t hx2 = p->world_x + PLAYER_SIZE - PLAYER_HBOX;
	ld	hl, #0x000b
	add	hl, bc
	ld	c, l
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/player.c:66: int16_t  hy1 = p->world_y + PLAYER_HBOX;
	ldhl	sp,#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	e, c
	ld	d, a
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
;src/player.c:67: int16_t  hy2 = p->world_y + PLAYER_SIZE - PLAYER_HBOX;
	ld	hl, #0x000b
	add	hl, de
	ld	e, l
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), e
	inc	hl
;src/player.c:69: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ld	(hl+), a
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
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ld	a, b
	rlca
	and	a,#0x01
	ldhl	sp,	#40
	ld	(hl), a
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#35
	ld	a, (hl)
	ldhl	sp,	#29
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl)
	ldhl	sp,	#30
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
	jr	Z, 00204$
	ld	c, #0x00
	jr	00209$
00204$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#29
	ld	a, (hl)
	ldhl	sp,	#35
	ld	(hl), a
	ldhl	sp,	#30
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#37
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
	jr	NC, 00206$
	ldhl	sp,	#12
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00207$
00206$:
	ld	c, #0x07
	jr	00209$
00207$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#14
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
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00209$:
;src/player.c:69: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x08
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00212$
	ld	c, #0x00
	jr	00217$
00212$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#29
	ld	a, (hl)
	ldhl	sp,	#35
	ld	(hl), a
	ldhl	sp,	#30
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#37
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00214$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00215$
00214$:
	ld	c, #0x07
	jr	00217$
00215$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
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
	ldhl	sp,	#23
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
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00217$:
;src/player.c:69: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x03
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00220$
	ld	c, #0x00
	jr	00225$
00220$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#29
	ld	a, (hl)
	ldhl	sp,	#35
	ld	(hl), a
	ldhl	sp,	#30
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#37
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00222$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00223$
00222$:
	ld	c, #0x07
	jr	00225$
00223$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
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
	ldhl	sp,	#23
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
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00225$:
;src/player.c:69: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x04
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00228$
	ld	c, #0x00
	jr	00233$
00228$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#29
	ld	a, (hl)
	ldhl	sp,	#35
	ld	(hl), a
	ldhl	sp,	#30
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#37
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00230$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00231$
00230$:
	ld	c, #0x07
	jr	00233$
00231$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
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
	ldhl	sp,	#23
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
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00233$:
;src/player.c:69: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x02
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00236$
	ldhl	sp,	#36
	ld	(hl), #0x00
	jr	00241$
00236$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#29
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#30
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl)
	ldhl	sp,	#35
	ld	(hl), a
	ldhl	sp,	#32
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	ldhl	sp,	#33
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00238$
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#19
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00239$
00238$:
	ldhl	sp,	#36
	ld	(hl), #0x07
	jr	00241$
00239$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#35
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#33
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00241$:
;src/player.c:69: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ldhl	sp,	#36
	ld	a, (hl)
	dec	a
	jp	Z, 00134$
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#35
	ld	(hl), a
	ldhl	sp,	#9
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
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00244$
	ld	c, #0x00
	jr	00249$
00244$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#35
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00246$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00247$
00246$:
	ld	c, #0x07
	jr	00249$
00247$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#33
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00249$:
;src/player.c:70: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x08
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00252$
	ld	c, #0x00
	jr	00257$
00252$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#35
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00254$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00255$
00254$:
	ld	c, #0x07
	jr	00257$
00255$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#33
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00257$:
;src/player.c:70: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x03
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00260$
	ld	c, #0x00
	jr	00265$
00260$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#35
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00262$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00263$
00262$:
	ld	c, #0x07
	jr	00265$
00263$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#33
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00265$:
;src/player.c:70: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x04
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00268$
	ld	c, #0x00
	jr	00273$
00268$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#35
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00270$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00271$
00270$:
	ld	c, #0x07
	jr	00273$
00271$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#33
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00273$:
;src/player.c:70: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x02
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00276$
	ld	(hl), #0x00
	jr	00281$
00276$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#35
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	ldhl	sp,	#8
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00278$
	ldhl	sp,	#33
	ld	e, l
	ld	d, h
	ldhl	sp,	#19
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00279$
00278$:
	ldhl	sp,	#40
	ld	(hl), #0x07
	jr	00281$
00279$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#33
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#8
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#40
	ld	(hl), a
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00281$:
;src/player.c:70: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ldhl	sp,	#40
	ld	a, (hl)
	dec	a
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	a, (hl)
	rlca
	and	a,#0x01
	ldhl	sp,	#40
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#31
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
	jr	Z, 00284$
	ld	c, #0x00
	jr	00289$
00284$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#29
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#30
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00286$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00287$
00286$:
	ld	c, #0x07
	jr	00289$
00287$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#33
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00289$:
;src/player.c:71: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x08
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00292$
	ld	c, #0x00
	jr	00297$
00292$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#29
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#30
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00294$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00295$
00294$:
	ld	c, #0x07
	jr	00297$
00295$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#33
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00297$:
;src/player.c:71: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x03
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00300$
	ld	c, #0x00
	jr	00305$
00300$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#29
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#30
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00302$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00303$
00302$:
	ld	c, #0x07
	jr	00305$
00303$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#33
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00305$:
;src/player.c:71: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x04
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00308$
	ld	c, #0x00
	jr	00313$
00308$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#29
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#30
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00310$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00311$
00310$:
	ld	c, #0x07
	jr	00313$
00311$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#33
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00313$:
;src/player.c:71: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x02
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00316$
	ld	c, #0x00
	jr	00321$
00316$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#29
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#30
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00318$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00319$
00318$:
	ld	c, #0x07
	jr	00321$
00319$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#33
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00321$:
;src/player.c:71: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	dec	c
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00324$
	ld	c, #0x00
	jr	00329$
00324$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#35
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00326$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00327$
00326$:
	ld	c, #0x07
	jr	00329$
00327$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#33
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00329$:
;src/player.c:72: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ld	a, c
	sub	a, #0x08
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00332$
	ld	c, #0x00
	jr	00337$
00332$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#35
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00334$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00335$
00334$:
	ld	c, #0x07
	jr	00337$
00335$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#33
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00337$:
;src/player.c:72: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ld	a, c
	sub	a, #0x03
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00340$
	ld	c, #0x00
	jr	00345$
00340$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#35
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00342$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00343$
00342$:
	ld	c, #0x07
	jr	00345$
00343$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#33
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00345$:
;src/player.c:72: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ld	a, c
	sub	a, #0x04
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00348$
	ld	c, #0x00
	jr	00353$
00348$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#35
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
	push	de
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00350$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00351$
00350$:
	ld	c, #0x07
	jr	00353$
00351$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#33
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
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00353$:
;src/player.c:72: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ld	a, c
	sub	a, #0x02
	jp	Z, 00134$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00356$
	ld	(hl), #0x00
	jr	00361$
00356$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
;include/collision.h:45: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
;include/collision.h:47: if (mx >= map_w || my >= map_h) return COL_ALL;
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
	jr	NC, 00358$
	ldhl	sp,	#33
	ld	e, l
	ld	d, h
	ldhl	sp,	#19
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00359$
00358$:
	ldhl	sp,	#40
	ld	(hl), #0x07
	jr	00361$
00359$:
;include/collision.h:48: return col_of(map[(uint16_t)my * map_w + mx]);
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#33
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#31
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,#35
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#31
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#35
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#34
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#23
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#37
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#36
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#40
	ld	(hl), a
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00361$:
;src/player.c:72: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ldhl	sp,	#40
	ld	a, (hl)
	dec	a
	jr	NZ, 00156$
00134$:
;src/player.c:73: p->dead = 1;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
;src/player.c:74: return 1;
	ld	a,#0x01
	ld	(hl),a
	jp	00382$
00156$:
;src/player.c:79: if (!player_noclip) {
	ld	a, (#_player_noclip)
	or	a, a
	jp	NZ, 00167$
;src/player.c:80: uint8_t cm_l = col_point(p->world_x,              p->world_y + 7, map, map_w, map_h);
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#21
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#22
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#23
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#24
	ld	(hl), a
	ldhl	sp,	#16
	ld	a, (hl)
	ldhl	sp,	#29
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#30
	ld	(hl), a
	ldhl	sp,#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#35
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#37
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#36
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#31
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl)
	ldhl	sp,	#32
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
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
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
	ldhl	sp,	#33
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00364$
	xor	a, a
	jr	00369$
00364$:
;include/collision.h:44: uint16_t mx = world_px >> 4;
	ldhl	sp,	#28
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
	ldhl	sp,	#33
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
;src/player.c:80: uint8_t cm_l = col_point(p->world_x,              p->world_y + 7, map, map_w, map_h);
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
	jr	NC, 00366$
	ldhl	sp,	#12
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00367$
00366$:
	ld	a, #0x07
	jr	00369$
00367$:
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
	ld	l, a
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	a, (hl)
00369$:
	ldhl	sp,	#40
	ld	(hl), a
;src/player.c:81: uint8_t cm_r = col_point(p->world_x + PLAYER_SIZE, p->world_y + 7, map, map_w, map_h);
	ldhl	sp,#35
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#35
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#34
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ldhl	sp,	#31
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00372$
	ldhl	sp,	#36
	ld	(hl), #0x00
	jp	00377$
00372$:
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
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
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
;src/player.c:81: uint8_t cm_r = col_point(p->world_x + PLAYER_SIZE, p->world_y + 7, map, map_w, map_h);
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#23
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00374$
	ldhl	sp,	#33
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00375$
00374$:
	ldhl	sp,	#36
	ld	(hl), #0x07
	jr	00377$
00375$:
	ldhl	sp,	#23
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
	ldhl	sp,	#29
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
00377$:
;src/player.c:82: if (IS_SOLID(cm_l) || IS_SOLID(cm_r)) {
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00157$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00157$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00157$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00157$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00157$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00157$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00157$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00167$
00157$:
;src/player.c:83: p->dead = 1;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
;src/player.c:84: return 1;
	ld	a,#0x01
	ld	(hl),a
	jr	00382$
00167$:
;src/player.c:89: if (!player_noclip && p->world_y > (int16_t)((uint16_t)map_h << 4)) {
	ld	a, (#_player_noclip)
	or	a, a
	jr	NZ, 00169$
	ldhl	sp,#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#35
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl), a
	ld	a, #0x04
01194$:
	ldhl	sp,	#33
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 01194$
	ldhl	sp,	#33
	ld	e, l
	ld	d, h
	ldhl	sp,	#35
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 01195$
	bit	7, d
	jr	NZ, 01196$
	cp	a, a
	jr	01196$
01195$:
	bit	7, d
	jr	Z, 01196$
	scf
01196$:
	jr	NC, 00169$
;src/player.c:90: p->dead = 1;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
;src/player.c:91: return 1;
	ld	a,#0x01
	ld	(hl),a
	jr	00382$
00169$:
;src/player.c:94: return 0;
	xor	a, a
00382$:
;src/player.c:95: }
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
;include/player.h:28: static inline void player_init(Player *p, uint16_t start_x, int16_t start_y) {
;	---------------------------------
; Function player_init
; ---------------------------------
_player_init:
;include/player.h:29: p->world_x   = start_x;
	ld	l, e
	ld	h, d
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;include/player.h:30: p->world_y   = start_y;
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
;include/player.h:31: p->vel_y     = 0;
	ld	hl, #0x0004
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;include/player.h:32: p->on_ground = 0;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x00
;include/player.h:33: p->dead      = 0;
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x00
;include/player.h:34: }
	pop	hl
	pop	af
	jp	(hl)
;include/player.h:37: static inline uint8_t col_point(
;	---------------------------------
; Function col_point
; ---------------------------------
_col_point:
	add	sp, #-8
	ldhl	sp,	#6
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
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
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00107$:
	ld	a, c
;include/player.h:42: }
	add	sp, #8
	pop	hl
	add	sp, #6
	jp	(hl)
;include/player.h:53: static inline int16_t player_screen_y(const Player *p, uint16_t cam_py) {
;	---------------------------------
; Function player_screen_y
; ---------------------------------
_player_screen_y:
;include/player.h:54: return p->world_y - (int16_t)cam_py;
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
;include/player.h:55: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__player_noclip:
	.db #0x00	; 0
	.area _CABS (ABS)
