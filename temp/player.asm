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
	add	sp, #-45
	ldhl	sp,	#43
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
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#41
	ld	(hl), a
	or	a, a
	jr	Z, 00102$
	ld	a, #0x01
	jp	00271$
00102$:
;src/player.c:15: if (!p->on_ground) {
	ldhl	sp,#43
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
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
	ld	a, (de)
	ld	c, a
;src/player.c:16: if (p->gravity_flipped) {
	ldhl	sp,#43
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
;src/player.c:17: p->vel_y -= GRAVITY;
	ldhl	sp,#43
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
;src/player.c:15: if (!p->on_ground) {
	ld	a, c
	or	a, a
	jr	NZ, 00111$
;src/player.c:16: if (p->gravity_flipped) {
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
;src/player.c:17: p->vel_y -= GRAVITY;
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
;src/player.c:16: if (p->gravity_flipped) {
	ld	a, c
	or	a, a
	jr	Z, 00108$
;src/player.c:17: p->vel_y -= GRAVITY;
	ld	bc, #0xfff6
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:18: if (p->vel_y < -MAX_FALL_SPEED) p->vel_y = -MAX_FALL_SPEED;
	ld	a, c
	sub	a, #0x97
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00111$
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x97
	ld	(hl+), a
	ld	(hl), #0xff
	jr	00111$
00108$:
;src/player.c:20: p->vel_y += GRAVITY;
	ld	bc, #0x000a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:21: if (p->vel_y > MAX_FALL_SPEED) p->vel_y = MAX_FALL_SPEED;
	ld	e, b
	ld	d, #0x00
	ld	a, #0x69
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 01053$
	bit	7, d
	jr	NZ, 01054$
	cp	a, a
	jr	01054$
01053$:
	bit	7, d
	jr	Z, 01054$
	scf
01054$:
	jr	NC, 00111$
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x69
	ld	(hl+), a
	ld	(hl), #0x00
00111$:
;src/player.c:27: if (joy & J_A) p->vel_y = (p->gravity_flipped) ? -JUMP_FORCE : JUMP_FORCE;
	ldhl	sp,	#42
	ld	a, (hl)
	and	a, #0x10
	ldhl	sp,	#11
	ld	(hl+), a
	ld	(hl), #0x00
;src/player.c:28: p->world_y += (int8_t)(p->vel_y >> 4);
	ldhl	sp,#43
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
;src/player.c:26: if (player_noclip) {
	ld	a, (#_player_noclip)
	or	a, a
	jr	Z, 00115$
;src/player.c:27: if (joy & J_A) p->vel_y = (p->gravity_flipped) ? -JUMP_FORCE : JUMP_FORCE;
	xor	a, a
	ldhl	sp,	#11
	or	a, (hl)
	jr	Z, 00113$
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	ld	a, #0x5d
	jr	NZ, 00274$
	ld	a, #0xa3
00274$:
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00113$:
;src/player.c:28: p->world_y += (int8_t)(p->vel_y >> 4);
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,#9
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
	jr	nc,01055$
	dec	a
01055$:
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
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:29: return 0;
	xor	a, a
	jp	00271$
00115$:
;src/player.c:33: if ((joy & J_A) && p->on_ground) {
	xor	a, a
	ldhl	sp,	#11
	or	a, (hl)
	jr	Z, 00117$
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00117$
;src/player.c:34: p->vel_y = (p->gravity_flipped) ? -JUMP_FORCE : JUMP_FORCE;
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	ld	a, #0x5d
	jr	NZ, 00276$
	ld	a, #0xa3
00276$:
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:35: p->on_ground = 0;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00117$:
;src/player.c:39: int8_t pixels = (int8_t)(p->vel_y >> 4);
	ldhl	sp,#9
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
	ldhl	sp,	#15
;src/player.c:40: int16_t ny = p->world_y + pixels;
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	a, c
	add	a, e
	ld	c, a
	ld	a, b
	adc	a, d
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/player.c:41: p->on_ground = 0;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/player.c:45: int16_t check_y_foot = (p->gravity_flipped) ? ny : ny + PLAYER_SIZE;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#18
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#19
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#20
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#23
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#22
	ld	(hl), a
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jr	Z, 00277$
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#40
	ld	(hl), a
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#41
	ld	(hl), a
	jr	00278$
00277$:
	ldhl	sp,	#21
	ld	a, (hl)
	ldhl	sp,	#40
	ld	(hl), a
	ldhl	sp,	#22
	ld	a, (hl)
	ldhl	sp,	#41
	ld	(hl), a
00278$:
	ldhl	sp,	#40
	ld	a, (hl)
	ldhl	sp,	#36
	ld	(hl), a
	ldhl	sp,	#41
	ld	a, (hl)
	ldhl	sp,	#37
	ld	(hl), a
;src/player.c:46: int16_t check_y_head = (p->gravity_flipped) ? ny + PLAYER_SIZE : ny;
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jr	Z, 00279$
	ldhl	sp,	#21
	ld	a, (hl)
	ldhl	sp,	#40
	ld	(hl), a
	ldhl	sp,	#22
	ld	a, (hl)
	ldhl	sp,	#41
	ld	(hl), a
	jr	00280$
00279$:
	ldhl	sp,	#16
	ld	a, (hl)
	ldhl	sp,	#40
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#41
	ld	(hl), a
00280$:
	ldhl	sp,	#40
	ld	a, (hl)
	ldhl	sp,	#23
	ld	(hl), a
	ldhl	sp,	#41
	ld	a, (hl)
	ldhl	sp,	#24
	ld	(hl), a
;src/player.c:49: uint8_t cl = col_at(p->world_x + 2, check_y_foot, map, map_w, map_h);
	ldhl	sp,	#51
	ld	a, (hl)
	ldhl	sp,	#25
	ld	(hl), a
	ldhl	sp,	#52
	ld	a, (hl)
	ldhl	sp,	#26
	ld	(hl), a
	ldhl	sp,	#49
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#50
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
	ldhl	sp,	#47
	ld	a, (hl)
	ldhl	sp,	#29
	ld	(hl), a
	ldhl	sp,	#48
	ld	a, (hl)
	ldhl	sp,	#30
	ld	(hl), a
	ldhl	sp,	#43
	ld	a, (hl)
	ldhl	sp,	#31
	ld	(hl), a
	ldhl	sp,	#44
	ld	a, (hl)
	ldhl	sp,	#32
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ldhl	sp,	#40
	ld	(hl), c
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ldhl	sp,	#33
	ld	a, c
	ld	(hl+), a
	ld	a, b
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#38
	ld	(hl), a
	ldhl	sp,	#34
	ld	a, (hl)
	ldhl	sp,	#39
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl+)
	ld	a, (hl)
	rlca
	and	a,#0x01
	ldhl	sp,	#2
	ld	(hl), a
;include/collision.h:53: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#36
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	dec	hl
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
;src/player.c:49: uint8_t cl = col_at(p->world_x + 2, check_y_foot, map, map_w, map_h);
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00209$
	ldhl	sp,	#39
	ld	(hl), #0x00
	jr	00214$
00209$:
;include/collision.h:52: uint16_t mx = world_px >> 4;
	ldhl	sp,	#38
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#1
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
	ldhl	sp,	#35
	ld	a, (hl)
	ldhl	sp,	#38
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#39
	ld	(hl), a
;src/player.c:49: uint8_t cl = col_at(p->world_x + 2, check_y_foot, map, map_w, map_h);
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	ldhl	sp,	#27
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00211$
	ldhl	sp,	#38
	ld	e, l
	ld	d, h
	ldhl	sp,	#25
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00212$
00211$:
	ldhl	sp,	#39
	ld	(hl), #0x07
	jr	00214$
00212$:
	ldhl	sp,	#27
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#38
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	pop	hl
	push	hl
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
	ld	c, a
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#39
	ld	(hl), a
00214$:
	ldhl	sp,	#39
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
;src/player.c:50: uint8_t cr = col_at(p->world_x + PLAYER_SIZE - 2, check_y_foot, map, map_w, map_h);
	ldhl	sp,#40
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000d
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#38
	ld	(hl), c
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00216$
	ldhl	sp,	#41
	ld	(hl), #0x00
	jr	00221$
00216$:
;include/collision.h:52: uint16_t mx = world_px >> 4;
	ldhl	sp,	#41
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
	ldhl	sp,	#35
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;src/player.c:50: uint8_t cr = col_at(p->world_x + PLAYER_SIZE - 2, check_y_foot, map, map_w, map_h);
	push	de
	ldhl	sp,	#42
	ld	e, l
	ld	d, h
	ldhl	sp,	#29
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00218$
	ldhl	sp,	#25
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00219$
00218$:
	ldhl	sp,	#41
	ld	(hl), #0x07
	jr	00221$
00219$:
	ldhl	sp,	#27
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__mulint
	ldhl	sp,	#40
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
	ld	c, a
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#41
	ld	(hl), a
00221$:
	ldhl	sp,	#41
	ld	a, (hl-)
	ld	(hl), a
;src/player.c:52: uint8_t falling = (p->gravity_flipped) ? (pixels <= 0) : (pixels >= 0);
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jr	Z, 00281$
	ldhl	sp,	#15
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 01057$
	bit	7, d
	jr	NZ, 01058$
	cp	a, a
	jr	01058$
01057$:
	bit	7, d
	jr	Z, 01058$
	scf
01058$:
	ld	a, #0x00
	rla
	ldhl	sp,	#41
	ld	(hl), a
	xor	a, #0x01
	ld	(hl), a
	jr	00282$
00281$:
	ldhl	sp,	#15
	ld	a, (hl)
	rlca
	and	a,#0x01
	xor	a, #0x01
	ldhl	sp,	#41
	ld	(hl), a
00282$:
;src/player.c:56: p->world_y = ((ny >> 4) + 1) << 4;
	ldhl	sp,#16
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
;src/player.c:58: p->world_y = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
	push	hl
	ldhl	sp,	#23
	ld	a, (hl)
	pop	hl
	and	a, #0xf0
	push	hl
	ldhl	sp,	#24
	ld	c, (hl)
	pop	hl
;src/player.c:56: p->world_y = ((ny >> 4) + 1) << 4;
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
;src/player.c:58: p->world_y = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
	add	a, #0xf0
	ld	b, a
	ld	a, c
	adc	a, #0xff
;src/player.c:56: p->world_y = ((ny >> 4) + 1) << 4;
	ldhl	sp,	#21
	ld	(hl), e
	inc	hl
	ld	(hl), d
;src/player.c:58: p->world_y = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
	ldhl	sp,	#35
	ld	(hl), b
	inc	hl
	ld	(hl), a
;src/player.c:54: if (falling && (IS_SOLID(cl) || IS_SOLID(cr))) {
	ldhl	sp,	#41
	ld	a, (hl)
	or	a, a
	jr	Z, 00145$
	ldhl	sp,	#37
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00144$
	ldhl	sp,	#37
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00144$
	ldhl	sp,	#37
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00144$
	ldhl	sp,	#37
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00144$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00144$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00144$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00144$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00145$
00144$:
;src/player.c:55: if (p->gravity_flipped) {
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jr	Z, 00120$
;src/player.c:56: p->world_y = ((ny >> 4) + 1) << 4;
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	jr	00121$
00120$:
;src/player.c:58: p->world_y = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#35
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
00121$:
;src/player.c:60: p->vel_y = 0;
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/player.c:61: p->on_ground = 1;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
	jp	00146$
00145$:
;src/player.c:64: uint8_t hl = col_at(p->world_x + 2, check_y_head, map, map_w, map_h);
	ldhl	sp,	#23
	ld	a, (hl+)
	ld	a, (hl)
	rlca
	and	a,#0x01
	ldhl	sp,	#41
	ld	(hl), a
;include/collision.h:53: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#23
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
;src/player.c:64: uint8_t hl = col_at(p->world_x + 2, check_y_head, map, map_w, map_h);
	ldhl	sp,	#41
	ld	a, (hl)
	or	a, a
	jr	Z, 00223$
	ld	c, #0x00
	jr	00228$
00223$:
;include/collision.h:52: uint16_t mx = world_px >> 4;
	ldhl	sp,	#34
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
	ldhl	sp,	#23
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;src/player.c:64: uint8_t hl = col_at(p->world_x + 2, check_y_head, map, map_w, map_h);
	push	de
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#29
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00225$
	ldhl	sp,	#25
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
	ldhl	sp,	#27
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
	ldhl	sp,	#29
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
00228$:
	ldhl	sp,	#40
;src/player.c:65: uint8_t hr = col_at(p->world_x + PLAYER_SIZE - 2, check_y_head, map, map_w, map_h);
	ld	a, c
	ld	(hl+), a
	ld	a, (hl)
	or	a, a
	jr	Z, 00230$
	ld	(hl), #0x00
	jr	00235$
00230$:
;include/collision.h:52: uint16_t mx = world_px >> 4;
	ldhl	sp,	#39
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
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#24
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl), a
;src/player.c:65: uint8_t hr = col_at(p->world_x + PLAYER_SIZE - 2, check_y_head, map, map_w, map_h);
	ldhl	sp,	#38
	ld	e, l
	ld	d, h
	ldhl	sp,	#27
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00232$
	ldhl	sp,	#33
	ld	e, l
	ld	d, h
	ldhl	sp,	#25
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00233$
00232$:
	ldhl	sp,	#41
	ld	(hl), #0x07
	jr	00235$
00233$:
	ldhl	sp,	#27
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#33
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#38
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
	ld	c, a
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#41
	ld	(hl), a
00235$:
;src/player.c:66: if (IS_SOLID(hl) || IS_SOLID(hr)) {
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00134$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00134$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00134$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00134$
	ldhl	sp,	#41
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00134$
	ldhl	sp,	#41
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00134$
	ldhl	sp,	#41
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00134$
	ldhl	sp,	#41
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00135$
00134$:
;src/player.c:67: if (p->gravity_flipped) {
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jr	Z, 00123$
;src/player.c:68: p->world_y = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#35
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	jr	00124$
00123$:
;src/player.c:70: p->world_y = ((ny >> 4) + 1) << 4;
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
00124$:
;src/player.c:72: p->vel_y = 0;
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jp	00146$
00135$:
;src/player.c:74: p->world_y = ny;
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/player.c:77: int16_t sticky_y = (p->gravity_flipped) ? ny - 1 : ny + PLAYER_SIZE + 1;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00283$
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0001
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#41
	ld	(hl-), a
	ld	(hl), e
	jr	00284$
00283$:
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#42
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#41
	ld	(hl), a
00284$:
	ldhl	sp,	#40
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;src/player.c:78: uint8_t gl = col_at(p->world_x + 2, sticky_y, map, map_w, map_h);
	ldhl	sp,#31
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#40
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#41
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	ldhl	sp,	#40
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ld	a, b
	rlca
	and	a,#0x01
	ldhl	sp,	#35
	ld	(hl), a
;include/collision.h:53: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#36
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
;src/player.c:78: uint8_t gl = col_at(p->world_x + 2, sticky_y, map, map_w, map_h);
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00237$
	ldhl	sp,	#41
	ld	(hl), #0x00
	jr	00242$
00237$:
;include/collision.h:52: uint16_t mx = world_px >> 4;
	ldhl	sp,	#40
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#41
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
	dec	hl
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#40
	ld	(hl), a
	ldhl	sp,	#37
	ld	a, (hl)
	ldhl	sp,	#41
	ld	(hl), a
;src/player.c:78: uint8_t gl = col_at(p->world_x + 2, sticky_y, map, map_w, map_h);
	ldhl	sp,	#38
	ld	e, l
	ld	d, h
	ldhl	sp,	#27
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00239$
	ldhl	sp,	#40
	ld	e, l
	ld	d, h
	ldhl	sp,	#25
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00240$
00239$:
	ldhl	sp,	#41
	ld	(hl), #0x07
	jr	00242$
00240$:
	ldhl	sp,	#27
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#40
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#38
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
	ld	c, a
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#41
	ld	(hl), a
00242$:
;src/player.c:79: uint8_t gr = col_at(p->world_x + PLAYER_SIZE - 2, sticky_y, map, map_w, map_h);
	ldhl	sp,#33
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000d
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#39
	ld	(hl), c
	inc	hl
	ld	(hl), a
	ldhl	sp,	#35
	ld	a, (hl)
	or	a, a
	jr	Z, 00244$
	ldhl	sp,	#40
	ld	(hl), #0x00
	jr	00249$
00244$:
;include/collision.h:52: uint16_t mx = world_px >> 4;
	ldhl	sp,	#40
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
	ldhl	sp,	#36
	ld	a, (hl)
	ldhl	sp,	#33
	ld	(hl), a
	ldhl	sp,	#37
	ld	a, (hl)
	ldhl	sp,	#34
	ld	(hl), a
;src/player.c:79: uint8_t gr = col_at(p->world_x + PLAYER_SIZE - 2, sticky_y, map, map_w, map_h);
	ldhl	sp,	#39
	ld	e, l
	ld	d, h
	ldhl	sp,	#27
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00246$
	ldhl	sp,	#33
	ld	e, l
	ld	d, h
	ldhl	sp,	#25
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00247$
00246$:
	ldhl	sp,	#40
	ld	(hl), #0x07
	jr	00249$
00247$:
	ldhl	sp,	#27
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#33
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#39
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
	ld	c, a
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#40
	ld	(hl), a
00249$:
;src/player.c:80: if (IS_SOLID(gl) || IS_SOLID(gr)) {
	ldhl	sp,	#41
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00125$
	ldhl	sp,	#41
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00125$
	ldhl	sp,	#41
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00125$
	ldhl	sp,	#41
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00125$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00125$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00125$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00125$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00146$
00125$:
;src/player.c:81: p->on_ground = 1;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;src/player.c:82: p->vel_y = 0;
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00146$:
;src/player.c:40: int16_t ny = p->world_y + pixels;
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
;src/player.c:88: uint8_t head = col_at(p->world_x + PLAYER_SIZE, p->world_y + 4, map, map_w, map_h);
	ldhl	sp,	#40
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
	ldhl	sp,	#36
	ld	(hl), c
	inc	hl
	ld	(hl), a
	ldhl	sp,#31
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
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
	ldhl	sp,	#38
	ld	(hl), c
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#31
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#32
	ld	(hl), a
	ldhl	sp,	#36
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00251$
	ld	c, #0x00
	jr	00256$
00251$:
;include/collision.h:52: uint16_t mx = world_px >> 4;
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
;include/collision.h:53: uint16_t my = (uint16_t)world_py >> 4;
	ldhl	sp,	#36
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
;src/player.c:88: uint8_t head = col_at(p->world_x + PLAYER_SIZE, p->world_y + 4, map, map_w, map_h);
	push	de
	ldhl	sp,	#33
	ld	e, l
	ld	d, h
	ldhl	sp,	#29
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	pop	de
	jr	NC, 00253$
	ldhl	sp,	#25
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00254$
00253$:
	ld	c, #0x07
	jr	00256$
00254$:
	ldhl	sp,	#27
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
	ldhl	sp,	#29
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
00256$:
	ldhl	sp,	#35
	ld	(hl), c
;src/player.c:89: uint8_t foot = col_at(p->world_x + PLAYER_SIZE, p->world_y + PLAYER_SIZE - 4, map, map_w, map_h);
	ldhl	sp,#40
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#36
	ld	(hl), c
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00258$
	inc	hl
	inc	hl
	ld	(hl), #0x00
	jp	00263$
00258$:
;include/collision.h:52: uint16_t mx = world_px >> 4;
	ldhl	sp,	#39
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
;src/player.c:89: uint8_t foot = col_at(p->world_x + PLAYER_SIZE, p->world_y + PLAYER_SIZE - 4, map, map_w, map_h);
	ldhl	sp,	#38
	ld	e, l
	ld	d, h
	ldhl	sp,	#27
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00260$
	ldhl	sp,	#36
	ld	e, l
	ld	d, h
	ldhl	sp,	#25
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00261$
00260$:
	ldhl	sp,	#39
	ld	(hl), #0x07
	jr	00263$
00261$:
	ldhl	sp,	#27
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#36
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#38
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
	ld	c, a
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#39
	ld	(hl), a
00263$:
;src/player.c:92: uint8_t mid = col_at(p->world_x + 8, p->world_y + 8, map, map_w, map_h);
	ldhl	sp,#40
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#40
	ld	(hl), c
	inc	hl
	ld	(hl), a
	ldhl	sp,#33
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	c, l
	ld	a, h
	ldhl	sp,	#37
	ld	(hl), c
	inc	hl
	ld	(hl+), a
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00265$
	ldhl	sp,	#37
	ld	(hl), #0x00
	jp	00270$
00265$:
;include/collision.h:52: uint16_t mx = world_px >> 4;
	ldhl	sp,	#38
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
	ldhl	sp,	#40
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
;src/player.c:92: uint8_t mid = col_at(p->world_x + 8, p->world_y + 8, map, map_w, map_h);
	ldhl	sp,	#37
	ld	e, l
	ld	d, h
	ldhl	sp,	#27
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00267$
	ldhl	sp,	#40
	ld	e, l
	ld	d, h
	ldhl	sp,	#25
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00268$
00267$:
	ldhl	sp,	#37
	ld	(hl), #0x07
	jr	00270$
00268$:
	ldhl	sp,	#27
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#40
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#33
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,#33
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#37
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#42
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#41
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#29
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#39
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#38
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	hl, #_famidash_metatile_collision
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#37
	ld	(hl), a
00270$:
	ldhl	sp,	#37
	ld	a, (hl+)
	ld	(hl), a
;src/player.c:93: if (IS_PAD(mid) || IS_PAD(head) || IS_PAD(foot)) {
	ldhl	sp,	#35
	ld	a, (hl)
	sub	a, #0x0b
	ld	a, #0x01
	jr	Z, 01087$
	xor	a, a
01087$:
	ldhl	sp,	#40
	ld	(hl), a
	ldhl	sp,	#35
	ld	a, (hl)
	sub	a, #0x0e
	ld	a, #0x01
	jr	Z, 01089$
	xor	a, a
01089$:
	ldhl	sp,	#41
	ld	(hl), a
	ldhl	sp,	#37
	ld	a, (hl)
	sub	a, #0x0b
	jr	Z, 00175$
	ldhl	sp,	#37
	ld	a, (hl)
	sub	a, #0x0e
	jr	Z, 00175$
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	NZ, 00175$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00175$
	dec	hl
	dec	hl
	ld	a, (hl)
	sub	a, #0x0b
	jr	Z, 00175$
	ldhl	sp,	#39
	ld	a, (hl)
	sub	a, #0x0e
	jr	NZ, 00176$
00175$:
;src/player.c:94: uint8_t hit = (IS_PAD(mid)) ? mid : (IS_PAD(head) ? head : foot);
	ldhl	sp,	#38
	ld	a, (hl)
	sub	a, #0x0b
	jr	Z, 00288$
	ldhl	sp,	#38
	ld	a, (hl)
	sub	a, #0x0e
	jr	NZ, 00285$
00288$:
	ldhl	sp,	#38
	ld	c, (hl)
	jr	00286$
00285$:
	ldhl	sp,	#40
	bit	0, (hl)
	jr	NZ, 00293$
	inc	hl
	bit	0, (hl)
	jr	Z, 00290$
00293$:
	ldhl	sp,	#35
	ld	c, (hl)
	jr	00291$
00290$:
	ldhl	sp,	#39
	ld	c, (hl)
00291$:
00286$:
;src/player.c:45: int16_t check_y_foot = (p->gravity_flipped) ? ny : ny + PLAYER_SIZE;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#41
	ld	(hl), a
;src/player.c:95: if (hit == COL_PAD_BLUE) {
	ld	a, c
	sub	a, #0x0e
	jr	NZ, 00156$
;src/player.c:96: p->gravity_flipped = !p->gravity_flipped;
	ld	a, (hl)
	sub	a, #0x01
	ld	a, #0x00
	rla
	ldhl	sp,	#7
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;src/player.c:98: p->vel_y = (p->gravity_flipped) ? -20 : 20;
	ldhl	sp,	#9
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	or	a, a
	ld	a, #0xec
	jr	NZ, 00296$
	ld	a, #0x14
00296$:
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	jr	00157$
00156$:
;src/player.c:100: p->vel_y = (p->gravity_flipped) ? -PAD_JUMP_FORCE : PAD_JUMP_FORCE;
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#41
	ld	a, (hl)
	or	a, a
	jr	Z, 00297$
	ld	bc, #0x008c
	jr	00298$
00297$:
	ld	bc, #0xff74
00298$:
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
00157$:
;src/player.c:102: p->on_ground = 0;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	jp	00177$
00176$:
;src/player.c:103: } else if ((joy & J_A) && (IS_ORB(mid) || IS_ORB(head) || IS_ORB(foot))) {
	xor	a, a
	ldhl	sp,	#11
	or	a, (hl)
	jp	Z, 00177$
	ldhl	sp,	#35
	ld	a, (hl)
	sub	a, #0x0a
	ld	a, #0x01
	jr	Z, 01101$
	xor	a, a
01101$:
	ldhl	sp,	#41
	ld	(hl), a
	ldhl	sp,	#35
	ld	a, (hl)
	sub	a, #0x0c
	ld	a, #0x01
	jr	Z, 01103$
	xor	a, a
01103$:
	ld	b, a
	ldhl	sp,	#35
	ld	a, (hl)
	sub	a, #0x0d
	ld	a, #0x01
	jr	Z, 01105$
	xor	a, a
01105$:
	ld	d, a
	ldhl	sp,	#37
	ld	a, (hl)
	sub	a, #0x0a
	jr	Z, 00164$
	ldhl	sp,	#37
	ld	a, (hl)
	sub	a, #0x0c
	jr	Z, 00164$
	ldhl	sp,	#37
	ld	a, (hl)
	sub	a, #0x0d
	jr	Z, 00164$
	ldhl	sp,	#41
	ld	a, (hl)
	or	a, a
	jr	NZ, 00164$
	or	a, b
	jr	NZ, 00164$
	or	a, d
	jr	NZ, 00164$
	dec	hl
	dec	hl
	ld	a, (hl)
	sub	a, #0x0a
	jr	Z, 00164$
	ldhl	sp,	#39
	ld	a, (hl)
	sub	a, #0x0c
	jr	Z, 00164$
	ldhl	sp,	#39
	ld	a, (hl)
	sub	a, #0x0d
	jp	NZ, 00177$
00164$:
;src/player.c:104: uint8_t hit = (IS_ORB(mid)) ? mid : (IS_ORB(head) ? head : foot);
	ldhl	sp,	#38
	ld	a, (hl)
	sub	a, #0x0a
	jr	Z, 00302$
	ldhl	sp,	#38
	ld	a, (hl)
	sub	a, #0x0c
	jr	Z, 00302$
	ldhl	sp,	#38
	ld	a, (hl)
	sub	a, #0x0d
	jr	NZ, 00299$
00302$:
	ldhl	sp,	#38
	ld	a, (hl)
	jr	00300$
00299$:
	ldhl	sp,	#41
	bit	0, (hl)
	jr	NZ, 00310$
	bit	0, b
	jr	NZ, 00310$
	bit	0, d
	jr	Z, 00307$
00310$:
	ldhl	sp,	#35
	ld	a, (hl)
	jr	00308$
00307$:
	ldhl	sp,	#39
	ld	a, (hl)
00308$:
00300$:
;src/player.c:45: int16_t check_y_foot = (p->gravity_flipped) ? ny : ny + PLAYER_SIZE;
	ldhl	sp,#7
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
;src/player.c:105: if (hit == COL_ORB_MAGENTA) {
	cp	a, #0x0d
	jr	NZ, 00162$
;src/player.c:106: p->vel_y = (p->gravity_flipped) ? -MAGENTA_JUMP_FORCE : MAGENTA_JUMP_FORCE;
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	or	a, a
	ld	a, #0x3c
	jr	NZ, 00316$
	ld	a, #0xc4
00316$:
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	jr	00163$
00162$:
;src/player.c:107: } else if (hit == COL_ORB_BLUE) {
	sub	a, #0x0c
	jr	NZ, 00159$
;src/player.c:108: p->gravity_flipped = !p->gravity_flipped;
	ld	a, c
	sub	a, #0x01
	ld	a, #0x00
	rla
	ldhl	sp,	#7
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;src/player.c:109: p->vel_y = (p->gravity_flipped) ? -20 : 20;
	push	af
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#42
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#43
	ld	(hl), a
	pop	af
	or	a, a
	ld	a, #0xec
	jr	NZ, 00318$
	ld	a, #0x14
00318$:
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ldhl	sp,	#40
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00163$
00159$:
;src/player.c:111: p->vel_y = (p->gravity_flipped) ? -JUMP_FORCE : JUMP_FORCE;
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#40
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#41
	ld	(hl), a
	ld	a, c
	or	a, a
	jr	Z, 00319$
	ldhl	sp,	#38
	ld	(hl), #0x5d
	jr	00320$
00319$:
	ldhl	sp,	#38
	ld	(hl), #0xa3
00320$:
	ldhl	sp,	#38
	ld	a, (hl+)
	inc	hl
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00163$:
;src/player.c:113: p->on_ground = 0;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00177$:
;src/player.c:117: if (IS_HAZARD(head) || IS_HAZARD(foot) || IS_SOLID(head) || IS_SOLID(foot)) {
	ldhl	sp,	#35
	ld	a, (hl)
	sub	a, #0x08
	jr	Z, 00183$
	ldhl	sp,	#35
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00183$
	ldhl	sp,	#35
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00183$
	ldhl	sp,	#35
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00183$
	ldhl	sp,	#35
	ld	a, (hl)
	dec	a
	jr	Z, 00183$
	ldhl	sp,	#39
	ld	a, (hl)
	sub	a, #0x08
	jr	Z, 00183$
	ldhl	sp,	#39
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00183$
	ldhl	sp,	#39
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00183$
	ldhl	sp,	#39
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00183$
	ldhl	sp,	#39
	ld	a, (hl)
	dec	a
	jr	Z, 00183$
	ldhl	sp,	#35
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00183$
	ldhl	sp,	#35
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00183$
	ldhl	sp,	#35
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00183$
	ldhl	sp,	#35
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00183$
	ldhl	sp,	#39
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00183$
	ldhl	sp,	#39
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00183$
	ldhl	sp,	#39
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00183$
	ldhl	sp,	#39
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00184$
00183$:
;src/player.c:118: p->dead = 1;
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
;src/player.c:119: return 1;
	ld	a,#0x01
	ld	(hl),a
	jp	00271$
00184$:
;src/player.c:123: if (p->on_ground) {
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#41
	ld	(hl), a
;src/player.c:124: p->anim_timer = 0;
	ldhl	sp,#43
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
;src/player.c:125: p->anim_frame = 0;
	ldhl	sp,#43
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#41
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#40
;src/player.c:123: if (p->on_ground) {
	ld	(hl+), a
	ld	a, (hl)
	or	a, a
	jr	Z, 00203$
;src/player.c:124: p->anim_timer = 0;
;src/player.c:125: p->anim_frame = 0;
	dec	hl
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x00
	jr	00204$
00203$:
;src/player.c:127: p->anim_timer++;
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;src/player.c:129: p->anim_frame = ((uint32_t)p->anim_timer * 2 / 3) % 24;
	ld	c, l
	ld	b, h
	ld	de, #0x0000
	sla	c
	rl	b
	rl	e
	rl	d
	ld	hl, #0x0000
	push	hl
	ld	l, #0x03
	push	hl
	call	__divulong
	ld	e, c
	ld	d, b
	ld	bc, #0x0018
	call	__modsint
	ldhl	sp,	#39
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00204$:
;src/player.c:40: int16_t ny = p->world_y + pixels;
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#40
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/player.c:133: if (p->world_y > (int16_t)((uint16_t)map_h << 4) || p->world_y < -32) {
	ldhl	sp,	#25
	ld	a, (hl)
	ldhl	sp,	#38
	ld	(hl), a
	ldhl	sp,	#26
	ld	a, (hl)
	ldhl	sp,	#39
	ld	(hl), a
	ld	a, #0x04
01142$:
	ldhl	sp,	#38
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 01142$
	ldhl	sp,	#38
	ld	e, l
	ld	d, h
	ldhl	sp,	#40
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
	jr	Z, 01143$
	bit	7, d
	jr	NZ, 01144$
	cp	a, a
	jr	01144$
01143$:
	bit	7, d
	jr	Z, 01144$
	scf
01144$:
	jr	C, 00205$
	ldhl	sp,	#40
	ld	a, (hl+)
	sub	a, #0xe0
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	ld	e, a
	bit	7, e
	jr	Z, 01145$
	bit	7, d
	jr	NZ, 01146$
	cp	a, a
	jr	01146$
01145$:
	bit	7, d
	jr	Z, 01146$
	scf
01146$:
	jr	NC, 00206$
00205$:
;src/player.c:134: p->dead = 1;
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
;src/player.c:135: return 1;
	ld	a,#0x01
	ld	(hl),a
	jr	00271$
00206$:
;src/player.c:138: return 0;
	xor	a, a
00271$:
;src/player.c:139: }
	add	sp, #45
	pop	hl
	add	sp, #6
	jp	(hl)
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
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
	.area _CODE
	.area _INITIALIZER
__xinit__player_noclip:
	.db #0x00	; 0
	.area _CABS (ABS)
