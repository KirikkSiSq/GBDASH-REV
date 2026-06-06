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
	add	sp, #-35
	ldhl	sp,	#33
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
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#31
	ld	(hl), a
	or	a, a
	jr	Z, 00102$
	ld	a, #0x01
	jp	00220$
00102$:
;src/player.c:15: if (!p->on_ground) {
	ldhl	sp,#33
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;src/player.c:16: p->vel_y += GRAVITY;
	ldhl	sp,#33
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
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
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x000a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:17: if (p->vel_y > MAX_FALL_SPEED) p->vel_y = MAX_FALL_SPEED;
	ld	e, b
	ld	d, #0x00
	ld	a, #0x69
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00642$
	bit	7, d
	jr	NZ, 00643$
	cp	a, a
	jr	00643$
00642$:
	bit	7, d
	jr	Z, 00643$
	scf
00643$:
	jr	NC, 00106$
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x69
	ld	(hl+), a
	ld	(hl), #0x00
00106$:
;src/player.c:22: if (joy & J_A) p->vel_y = JUMP_FORCE;
	ldhl	sp,	#32
	ld	a, (hl)
	and	a, #0x10
	ldhl	sp,	#6
	ld	(hl+), a
	ld	(hl), #0x00
;src/player.c:23: p->world_y += (int8_t)(p->vel_y >> 4);
	ldhl	sp,#33
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
;src/player.c:21: if (player_noclip) {
	ld	a, (#_player_noclip)
	or	a, a
	jr	Z, 00110$
;src/player.c:22: if (joy & J_A) p->vel_y = JUMP_FORCE;
	xor	a, a
	ldhl	sp,	#6
	or	a, (hl)
	jr	Z, 00108$
	dec	hl
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, #0xa3
	ld	(hl+), a
	ld	(hl), #0xff
00108$:
;src/player.c:23: p->world_y += (int8_t)(p->vel_y >> 4);
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	xor	a, a
	add	hl, hl
	jr	nc,00644$
	dec	a
00644$:
	add	hl, hl
	rla
	add	hl, hl
	rla
	add	hl, hl
	rla
	ld	e, a
	ld	a, h
	ld	l, a
	rlca
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:24: return 0;
	xor	a, a
	jp	00220$
00110$:
;src/player.c:28: if ((joy & J_A) && p->on_ground) {
	xor	a, a
	ldhl	sp,	#6
	or	a, (hl)
	jr	Z, 00112$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00112$
;src/player.c:29: p->vel_y = JUMP_FORCE;
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0xa3
	ld	(hl+), a
	ld	(hl), #0xff
;src/player.c:30: p->on_ground = 0;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00112$:
;src/player.c:34: int8_t pixels = (int8_t)(p->vel_y >> 4);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, h
	ldhl	sp,	#31
	ld	(hl), a
;src/player.c:35: int16_t ny = p->world_y + pixels;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#31
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
	ldhl	sp,	#10
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/player.c:36: p->on_ground = 0;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/player.c:40: uint8_t cl = col_at(p->world_x + 2, ny + PLAYER_SIZE, map, map_w, map_h);
	ldhl	sp,	#41
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
	ldhl	sp,	#42
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#40
	ld	a, (hl)
	ldhl	sp,	#15
	ld	(hl), a
	ldhl	sp,	#37
	ld	a, (hl)
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,	#38
	ld	a, (hl)
	ldhl	sp,	#17
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#29
	ld	(hl), a
	ldhl	sp,	#33
	ld	a, (hl)
	ldhl	sp,	#18
	ld	(hl), a
	ldhl	sp,	#34
	ld	a, (hl)
	ldhl	sp,	#19
	ld	(hl), a
;src/player.c:39: if (pixels > 0) { // Falling
	ldhl	sp,	#31
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00646$
	bit	7, d
	jr	NZ, 00647$
	cp	a, a
	jr	00647$
00646$:
	bit	7, d
	jr	Z, 00647$
	scf
00647$:
	jp	NC, 00138$
;src/player.c:40: uint8_t cl = col_at(p->world_x + 2, ny + PLAYER_SIZE, map, map_w, map_h);
	ldhl	sp,#28
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#22
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#21
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#29
	ld	(hl), a
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#30
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#24
	ld	(hl), a
	ldhl	sp,	#31
	ld	a, (hl)
	ldhl	sp,	#25
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#32
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#31
	ld	(hl), a
	ldhl	sp,	#28
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#29
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	bit	7, (hl)
	jr	Z, 00172$
	ldhl	sp,	#31
	ld	(hl), #0x00
	jp	00177$
00172$:
;include/collision.h:49: uint16_t mx = world_px >> 4;
	ldhl	sp,	#30
	ld	a, (hl)
	ldhl	sp,	#26
	ld	(hl), a
	ldhl	sp,	#31
	ld	a, (hl)
	ldhl	sp,	#27
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
;include/collision.h:50: uint16_t my = (uint16_t)world_py >> 4;
	inc	hl
	inc	hl
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
;src/player.c:40: uint8_t cl = col_at(p->world_x + 2, ny + PLAYER_SIZE, map, map_w, map_h);
	push	de
	ldhl	sp,	#28
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
	ldhl	sp,	#31
	ld	(hl), #0x07
	jr	00177$
00175$:
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#28
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,#28
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#26
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#32
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#31
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#16
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#30
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#29
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	de, #_famidash_metatile_collision
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#32
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#31
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
00177$:
;src/player.c:41: uint8_t cr = col_at(p->world_x + PLAYER_SIZE - 2, ny + PLAYER_SIZE, map, map_w, map_h);
	ldhl	sp,#24
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000d
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#29
	ld	(hl), c
	inc	hl
	ld	(hl), a
	ldhl	sp,	#22
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00179$
	ldhl	sp,	#30
	ld	(hl), #0x00
	jp	00184$
00179$:
;include/collision.h:49: uint16_t mx = world_px >> 4;
	ldhl	sp,	#29
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#30
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
;include/collision.h:50: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#22
	ld	a, (hl)
	ldhl	sp,	#29
	ld	(hl), a
	ldhl	sp,	#23
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
;src/player.c:41: uint8_t cr = col_at(p->world_x + PLAYER_SIZE - 2, ny + PLAYER_SIZE, map, map_w, map_h);
	ldhl	sp,	#27
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00181$
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#12
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00182$
00181$:
	ldhl	sp,	#30
	ld	(hl), #0x07
	jr	00184$
00182$:
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#29
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
	ld	c, a
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#30
	ld	(hl), a
00184$:
;src/player.c:42: if (IS_SOLID(cl) || IS_SOLID(cr)) {
	ldhl	sp,	#31
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00114$
	ldhl	sp,	#31
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00114$
	ldhl	sp,	#31
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00114$
	ldhl	sp,	#31
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00114$
	ldhl	sp,	#30
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00114$
	ldhl	sp,	#30
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00114$
	ldhl	sp,	#30
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00114$
	ldhl	sp,	#30
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00115$
00114$:
;src/player.c:43: p->world_y   = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
	ldhl	sp,	#20
	ld	a, (hl+)
	and	a, #0xf0
	ld	b, (hl)
	add	a, #0xf0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:44: p->vel_y     = 0;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/player.c:45: p->on_ground = 1;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
	jp	00139$
00115$:
;src/player.c:47: p->world_y = ny;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	jp	00139$
00138$:
;src/player.c:49: } else if (pixels < 0) { // Jumping
	ldhl	sp,	#31
	bit	7, (hl)
	jp	Z, 00135$
;src/player.c:50: uint8_t cl = col_at(p->world_x + 2, ny, map, map_w, map_h);
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ldhl	sp,	#23
	ld	(hl), c
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ldhl	sp,	#30
	ld	a, c
	ld	(hl+), a
	ld	a, b
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	rlca
	and	a,#0x01
	ldhl	sp,	#25
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#26
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
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00186$
	ldhl	sp,	#31
	ld	(hl), #0x00
	jr	00191$
00186$:
;include/collision.h:49: uint16_t mx = world_px >> 4;
	ldhl	sp,	#30
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#31
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
;include/collision.h:50: uint16_t my = (uint16_t)world_py >> 4;
	dec	hl
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#30
	ld	(hl), a
	ldhl	sp,	#27
	ld	a, (hl)
	ldhl	sp,	#31
	ld	(hl), a
	ldhl	sp,	#28
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00188$
	ldhl	sp,	#30
	ld	e, l
	ld	d, h
	ldhl	sp,	#12
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00189$
00188$:
	ldhl	sp,	#31
	ld	(hl), #0x07
	jr	00191$
00189$:
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#30
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#28
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
	ld	c, a
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#31
	ld	(hl), a
00191$:
;src/player.c:51: uint8_t cr = col_at(p->world_x + PLAYER_SIZE - 2, ny, map, map_w, map_h);
	ldhl	sp,#23
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000d
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#29
	ld	(hl), c
	inc	hl
	ld	(hl), a
	ldhl	sp,	#25
	ld	a, (hl)
	or	a, a
	jr	Z, 00193$
	ldhl	sp,	#30
	ld	(hl), #0x00
	jp	00198$
00193$:
;include/collision.h:49: uint16_t mx = world_px >> 4;
	ldhl	sp,	#30
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
;include/collision.h:50: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#26
	ld	a, (hl)
	ldhl	sp,	#23
	ld	(hl), a
	ldhl	sp,	#27
	ld	a, (hl)
	ldhl	sp,	#24
	ld	(hl), a
;src/player.c:51: uint8_t cr = col_at(p->world_x + PLAYER_SIZE - 2, ny, map, map_w, map_h);
	ldhl	sp,	#29
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00195$
	ldhl	sp,	#23
	ld	e, l
	ld	d, h
	ldhl	sp,	#12
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00196$
00195$:
	ldhl	sp,	#30
	ld	(hl), #0x07
	jr	00198$
00196$:
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#23
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#29
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
	push	hl
	ld	a, l
	ldhl	sp,	#31
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#30
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	de, #_famidash_metatile_collision
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
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
00198$:
;src/player.c:52: if (IS_SOLID(cl) || IS_SOLID(cr)) {
	ldhl	sp,	#31
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00124$
	ldhl	sp,	#31
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00124$
	ldhl	sp,	#31
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00124$
	ldhl	sp,	#31
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00124$
	ldhl	sp,	#30
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00124$
	ldhl	sp,	#30
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00124$
	ldhl	sp,	#30
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00124$
	ldhl	sp,	#30
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00125$
00124$:
;src/player.c:53: p->world_y = ((ny >> 4) + 1) << 4;
	ldhl	sp,#10
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
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:54: p->vel_y   = 0;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00139$
00125$:
;src/player.c:56: p->world_y = ny;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	jr	00139$
00135$:
;src/player.c:59: p->world_y = ny;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
00139$:
;src/player.c:35: int16_t ny = p->world_y + pixels;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
;src/player.c:63: uint8_t head = col_at(p->world_x + PLAYER_SIZE, p->world_y + 4, map, map_w, map_h);
	ldhl	sp,	#30
	ld	(hl), c
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#26
	ld	(hl), c
	inc	hl
	ld	(hl), a
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ldhl	sp,	#23
	ld	(hl), c
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#28
	ld	(hl), c
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#21
	ld	(hl), a
	ldhl	sp,	#29
	ld	a, (hl)
	ldhl	sp,	#22
	ld	(hl), a
	ldhl	sp,	#26
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00200$
	ld	c, #0x00
	jr	00205$
00200$:
;include/collision.h:49: uint16_t mx = world_px >> 4;
	ldhl	sp,	#22
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
;include/collision.h:50: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#26
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
;src/player.c:63: uint8_t head = col_at(p->world_x + PLAYER_SIZE, p->world_y + 4, map, map_w, map_h);
	push	de
	ldhl	sp,	#23
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
	jr	NC, 00202$
	ldhl	sp,	#12
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00203$
00202$:
	ld	c, #0x07
	jr	00205$
00203$:
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#21
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
	ld	c, a
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	c, (hl)
00205$:
	ldhl	sp,	#25
	ld	(hl), c
;src/player.c:64: uint8_t foot = col_at(p->world_x + PLAYER_SIZE, p->world_y + PLAYER_SIZE - 4, map, map_w, map_h);
	ldhl	sp,#30
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#26
	ld	(hl), c
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00207$
	inc	hl
	inc	hl
	ld	(hl), #0x00
	jp	00212$
00207$:
;include/collision.h:49: uint16_t mx = world_px >> 4;
	ldhl	sp,	#29
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
;include/collision.h:50: uint16_t my = (uint16_t)world_py >> 4;
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
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
;src/player.c:64: uint8_t foot = col_at(p->world_x + PLAYER_SIZE, p->world_y + PLAYER_SIZE - 4, map, map_w, map_h);
	ldhl	sp,	#28
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00209$
	ldhl	sp,	#26
	ld	e, l
	ld	d, h
	ldhl	sp,	#12
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00210$
00209$:
	ldhl	sp,	#29
	ld	(hl), #0x07
	jr	00212$
00210$:
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#28
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
	ld	c, a
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#29
	ld	(hl), a
00212$:
;src/player.c:67: uint8_t mid = col_at(p->world_x + 8, p->world_y + 8, map, map_w, map_h);
	ldhl	sp,#30
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#30
	ld	(hl), c
	inc	hl
	ld	(hl), a
	ldhl	sp,#23
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#27
	ld	(hl), c
	inc	hl
	ld	(hl+), a
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00214$
	ld	(hl), #0x00
	jp	00219$
00214$:
;include/collision.h:49: uint16_t mx = world_px >> 4;
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
;include/collision.h:50: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#31
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
;src/player.c:67: uint8_t mid = col_at(p->world_x + 8, p->world_y + 8, map, map_w, map_h);
	ldhl	sp,	#27
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00216$
	ldhl	sp,	#30
	ld	e, l
	ld	d, h
	ldhl	sp,	#12
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00217$
00216$:
	ldhl	sp,	#31
	ld	(hl), #0x07
	jr	00219$
00217$:
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#30
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#23
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,#27
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
	ldhl	sp,	#32
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#31
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#16
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#29
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#28
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#31
	ld	(hl), a
	ld	de, #_famidash_metatile_collision
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#32
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#31
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
00219$:
;src/player.c:68: if (IS_PAD(mid) || IS_PAD(head) || IS_PAD(foot)) {
	ldhl	sp,	#31
	ld	a, (hl)
	sub	a, #0x0b
	jr	Z, 00145$
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x0b
	jr	Z, 00145$
	ldhl	sp,	#29
	ld	a, (hl)
	sub	a, #0x0b
	jr	NZ, 00146$
00145$:
;src/player.c:69: p->vel_y = PAD_JUMP_FORCE;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x74
	ld	(hl+), a
	ld	(hl), #0xff
;src/player.c:70: p->on_ground = 0;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	jr	00147$
00146$:
;src/player.c:71: } else if ((joy & J_A) && (IS_ORB(mid) || IS_ORB(head) || IS_ORB(foot))) {
	xor	a, a
	ldhl	sp,	#6
	or	a, (hl)
	jr	Z, 00147$
	ldhl	sp,	#31
	ld	a, (hl)
	sub	a, #0x0a
	jr	Z, 00140$
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x0a
	jr	Z, 00140$
	ldhl	sp,	#29
	ld	a, (hl)
	sub	a, #0x0a
	jr	NZ, 00147$
00140$:
;src/player.c:72: p->vel_y = JUMP_FORCE;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0xa3
	ld	(hl+), a
	ld	(hl), #0xff
;src/player.c:73: p->on_ground = 0;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00147$:
;src/player.c:77: if (IS_HAZARD(head) || IS_HAZARD(foot) || IS_SOLID(head) || IS_SOLID(foot)) {
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x08
	jr	Z, 00150$
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00150$
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00150$
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00150$
	ldhl	sp,	#25
	ld	a, (hl)
	dec	a
	jr	Z, 00150$
	ldhl	sp,	#29
	ld	a, (hl)
	sub	a, #0x08
	jr	Z, 00150$
	ldhl	sp,	#29
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00150$
	ldhl	sp,	#29
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00150$
	ldhl	sp,	#29
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00150$
	ldhl	sp,	#29
	ld	a, (hl)
	dec	a
	jr	Z, 00150$
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00150$
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00150$
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00150$
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00150$
	ldhl	sp,	#29
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00150$
	ldhl	sp,	#29
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00150$
	ldhl	sp,	#29
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00150$
	ldhl	sp,	#29
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00151$
00150$:
;src/player.c:78: p->dead = 1;
	pop	hl
;src/player.c:79: return 1;
	ld	a, #0x01
	ld	(hl), a
	push	hl
	jr	00220$
00151$:
;src/player.c:83: if (p->world_y > (int16_t)((uint16_t)map_h << 4)) {
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#30
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#29
	ld	(hl), a
	ld	a, #0x04
00693$:
	ldhl	sp,	#28
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00693$
	ldhl	sp,	#28
	ld	e, l
	ld	d, h
	ldhl	sp,	#30
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
	jr	Z, 00694$
	bit	7, d
	jr	NZ, 00695$
	cp	a, a
	jr	00695$
00694$:
	bit	7, d
	jr	Z, 00695$
	scf
00695$:
	jr	NC, 00170$
;src/player.c:84: p->dead = 1;
	pop	hl
;src/player.c:85: return 1;
	ld	a, #0x01
	ld	(hl), a
	push	hl
	jr	00220$
00170$:
;src/player.c:88: return 0;
	xor	a, a
00220$:
;src/player.c:89: }
	add	sp, #35
	pop	hl
	add	sp, #6
	jp	(hl)
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;include/collision.h:36: static inline uint8_t col_of(uint8_t tile_id) {
;	---------------------------------
; Function col_of
; ---------------------------------
_col_of:
	ld	c, a
;include/collision.h:37: return famidash_metatile_collision[tile_id];
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
;include/collision.h:38: }
	ret
;include/collision.h:41: static inline uint8_t col_at(
;	---------------------------------
; Function col_at
; ---------------------------------
_col_at:
	add	sp, #-4
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;include/collision.h:48: if (world_py < 0) return COL_NONE;
	ld	h, b
	bit	7, h
	jr	Z, 00102$
	xor	a, a
	jr	00107$
00102$:
;include/collision.h:49: uint16_t mx = world_px >> 4;
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
;include/collision.h:50: uint16_t my = (uint16_t)world_py >> 4;
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
;include/collision.h:52: if (mx >= map_w || my >= map_h) return COL_ALL;
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
;include/collision.h:53: return col_of(map[(uint16_t)my * map_w + mx]);
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
;include/collision.h:37: return famidash_metatile_collision[tile_id];
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
;include/collision.h:53: return col_of(map[(uint16_t)my * map_w + mx]);
00107$:
;include/collision.h:54: }
	add	sp, #4
	pop	hl
	add	sp, #6
	jp	(hl)
;include/player.h:29: static inline void player_init(Player *p, uint16_t start_x, int16_t start_y) {
;	---------------------------------
; Function player_init
; ---------------------------------
_player_init:
;include/player.h:30: p->world_x   = start_x;
	ld	l, e
	ld	h, d
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;include/player.h:31: p->world_y   = start_y;
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
;include/player.h:32: p->vel_y     = 0;
	ld	hl, #0x0004
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;include/player.h:33: p->on_ground = 0;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x00
;include/player.h:34: p->dead      = 0;
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x00
;include/player.h:35: }
	pop	hl
	pop	af
	jp	(hl)
;include/player.h:38: static inline uint8_t col_point(
;	---------------------------------
; Function col_point
; ---------------------------------
_col_point:
	add	sp, #-8
	ldhl	sp,	#6
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;include/player.h:42: return col_at(px, py, map, map_w, map_h);
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
;include/collision.h:48: if (world_py < 0) return COL_NONE;
	ld	h, b
	bit	7, h
	jr	Z, 00102$
	ld	c, #0x00
	jr	00107$
00102$:
;include/collision.h:49: uint16_t mx = world_px >> 4;
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
;include/collision.h:50: uint16_t my = (uint16_t)world_py >> 4;
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
;include/collision.h:52: if (mx >= map_w || my >= map_h) return COL_ALL;
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
;include/collision.h:53: return col_of(map[(uint16_t)my * map_w + mx]);
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
;include/collision.h:37: return famidash_metatile_collision[tile_id];
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	c, (hl)
;include/player.h:42: return col_at(px, py, map, map_w, map_h);
00107$:
	ld	a, c
;include/player.h:43: }
	add	sp, #8
	pop	hl
	add	sp, #6
	jp	(hl)
;include/player.h:54: static inline int16_t player_screen_y(const Player *p, uint16_t cam_py) {
;	---------------------------------
; Function player_screen_y
; ---------------------------------
_player_screen_y:
;include/player.h:55: return p->world_y - (int16_t)cam_py;
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
;include/player.h:56: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__player_noclip:
	.db #0x00	; 0
	.area _CABS (ABS)
