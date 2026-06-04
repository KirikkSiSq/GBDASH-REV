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
	jp	00389$
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
	ld	hl, #0x000a
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
	jr	Z, 01165$
	bit	7, d
	jr	NZ, 01166$
	cp	a, a
	jr	01166$
01165$:
	bit	7, d
	jr	Z, 01166$
	scf
01166$:
	jr	NC, 00106$
	ldhl	sp,	#35
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x5f
	ld	(hl+), a
	ld	(hl), #0x00
00106$:
;src/player.c:23: if (joy & J_A) {
	ldhl	sp,	#37
	ld	a, (hl)
	and	a, #0x10
	ldhl	sp,	#33
	ld	(hl+), a
	ld	(hl), #0x00
;src/player.c:22: if (player_noclip) {
	ld	a, (#_player_noclip)
	or	a, a
	jr	Z, 00113$
;src/player.c:23: if (joy & J_A) {
	xor	a, a
	ldhl	sp,	#33
	or	a, (hl)
	jr	Z, 00114$
;src/player.c:24: p->vel_y = JUMP_FORCE;
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0xa3
	ld	(hl+), a
	ld	(hl), #0xff
	jr	00114$
00113$:
;src/player.c:26: } else if ((joy & J_A) && p->on_ground) {
	xor	a, a
	ldhl	sp,	#33
	or	a, (hl)
	jr	Z, 00114$
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00114$
;src/player.c:27: p->vel_y = JUMP_FORCE;
	ldhl	sp,	#35
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0xa3
	ld	(hl+), a
	ld	(hl), #0xff
;src/player.c:28: p->on_ground = 0;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00114$:
;src/player.c:32: int8_t pixels = (int8_t)(p->vel_y >> 4);
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
;src/player.c:33: int8_t step   = (pixels >= 0) ? 1 : -1;
	ld	a, c
	rlca
	and	a,#0x01
	ld	b, a
	bit	0, b
	ld	a, #0x01
	jr	Z, 00392$
	ld	a, #0xff
00392$:
	ldhl	sp,	#10
	ld	(hl), a
;src/player.c:34: int8_t steps  = (pixels >= 0) ? pixels : -pixels;
	bit	0, b
	jr	Z, 00394$
	xor	a, a
	sub	a, c
	ld	c, a
00394$:
	ldhl	sp,	#11
	ld	(hl), c
;src/player.c:35: if (steps > 16) steps = 16;
	ld	e, (hl)
	ld	a,#0x10
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 01167$
	bit	7, d
	jr	NZ, 01168$
	cp	a, a
	jr	01168$
01167$:
	bit	7, d
	jr	Z, 01168$
	scf
01168$:
	jr	NC, 00116$
	ldhl	sp,	#11
	ld	(hl), #0x10
00116$:
;src/player.c:37: p->on_ground = 0;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/player.c:40: for (int8_t i = 0; i < steps; i++) {
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
00387$:
;src/player.c:41: int16_t ny = p->world_y + step;
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
;src/player.c:46: uint8_t cl = col_point(p->world_x,              ny + PLAYER_SIZE, map, map_w, map_h);
	ldhl	sp,	#38
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#39
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
;src/player.c:40: for (int8_t i = 0; i < steps; i++) {
	ldhl	sp,	#11
	ld	e, (hl)
	ldhl	sp,	#40
	ld	a,(hl)
	ld	d,a
	ldhl	sp,	#11
	sub	a, (hl)
	bit	7, e
	jr	Z, 01171$
	bit	7, d
	jr	NZ, 01172$
	cp	a, a
	jr	01172$
01171$:
	bit	7, d
	jr	Z, 01172$
	scf
01172$:
	jp	NC, 00140$
;src/player.c:41: int16_t ny = p->world_y + step;
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
	ld	(hl), a
;src/player.c:43: if (!player_noclip) {
	ld	a, (#_player_noclip)
	or	a, a
	jp	NZ, 00139$
;src/player.c:46: uint8_t cl = col_point(p->world_x,              ny + PLAYER_SIZE, map, map_w, map_h);
	ldhl	sp,	#29
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
;src/player.c:47: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny + PLAYER_SIZE, map, map_w, map_h);
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
;src/player.c:44: if (step > 0) {
	ldhl	sp,	#18
	ld	a, (hl)
	or	a, a
	jp	Z, 00136$
;src/player.c:46: uint8_t cl = col_point(p->world_x,              ny + PLAYER_SIZE, map, map_w, map_h);
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
	jr	Z, 00179$
	xor	a, a
	jr	00184$
00179$:
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
;src/player.c:46: uint8_t cl = col_point(p->world_x,              ny + PLAYER_SIZE, map, map_w, map_h);
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
	jr	NC, 00181$
	ldhl	sp,	#12
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00182$
00181$:
	ld	a, #0x07
	jr	00184$
00182$:
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
00184$:
	ldhl	sp,	#32
;src/player.c:47: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny + PLAYER_SIZE, map, map_w, map_h);
	ld	(hl+), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, b
	jr	Z, 00187$
	inc	hl
	inc	hl
	ld	(hl), #0x00
	jr	00192$
00187$:
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
;src/player.c:47: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny + PLAYER_SIZE, map, map_w, map_h);
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
	jr	NC, 00189$
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
	jr	C, 00190$
00189$:
	ldhl	sp,	#36
	ld	(hl), #0x07
	jr	00192$
00190$:
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
00192$:
;src/player.c:48: if (IS_SOLID(cl) || IS_SOLID(cr)) {
	ldhl	sp,	#32
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00117$
	ldhl	sp,	#32
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00117$
	ldhl	sp,	#32
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00117$
	ldhl	sp,	#32
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00117$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00117$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00117$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00117$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x06
	jp	NZ, 00139$
00117$:
;src/player.c:49: p->world_y   = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
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
;src/player.c:50: p->vel_y     = 0;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/player.c:51: p->on_ground = 1;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;src/player.c:52: break;
	jp	00140$
00136$:
;src/player.c:56: uint8_t cl = col_point(p->world_x,              ny, map, map_w, map_h);
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
;src/player.c:56: uint8_t cl = col_point(p->world_x,              ny, map, map_w, map_h);
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00195$
	ldhl	sp,	#34
	ld	(hl), #0x00
	jr	00200$
00195$:
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
;src/player.c:56: uint8_t cl = col_point(p->world_x,              ny, map, map_w, map_h);
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
	jr	NC, 00197$
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
	jr	C, 00198$
00197$:
	ldhl	sp,	#34
	ld	(hl), #0x07
	jr	00200$
00198$:
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
00200$:
;src/player.c:57: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny, map, map_w, map_h);
	ldhl	sp,	#31
	ld	a, (hl)
	or	a, a
	jr	Z, 00203$
	ldhl	sp,	#36
	ld	(hl), #0x00
	jr	00208$
00203$:
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
;src/player.c:57: uint8_t cr = col_point(p->world_x + PLAYER_SIZE, ny, map, map_w, map_h);
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
	jr	NC, 00205$
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
	jr	C, 00206$
00205$:
	ldhl	sp,	#36
	ld	(hl), #0x07
	jr	00208$
00206$:
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
00208$:
;src/player.c:58: if (IS_SOLID(cl) || IS_SOLID(cr)) {
	ldhl	sp,	#34
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00126$
	ldhl	sp,	#34
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00126$
	ldhl	sp,	#34
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00126$
	ldhl	sp,	#34
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00126$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00126$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00126$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00126$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00139$
00126$:
;src/player.c:59: p->world_y = ((ny >> 4) + 1) << 4;
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
;src/player.c:60: p->vel_y   = 0;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/player.c:61: break;
	jr	00140$
00139$:
;src/player.c:66: p->world_y = ny;
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
;src/player.c:40: for (int8_t i = 0; i < steps; i++) {
	ldhl	sp,	#40
	inc	(hl)
	jp	00387$
00140$:
;src/player.c:70: if (!player_noclip) {
	ld	a, (#_player_noclip)
	or	a, a
	jp	NZ, 00163$
;src/player.c:71: uint16_t hx1 = p->world_x + PLAYER_HBOX;
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
;src/player.c:72: uint16_t hx2 = p->world_x + PLAYER_SIZE - PLAYER_HBOX;
	ld	hl, #0x000b
	add	hl, bc
	ld	c, l
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/player.c:73: int16_t  hy1 = p->world_y + PLAYER_HBOX;
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
;src/player.c:74: int16_t  hy2 = p->world_y + PLAYER_SIZE - PLAYER_HBOX;
	ld	hl, #0x000b
	add	hl, de
	ld	e, l
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), e
	inc	hl
;src/player.c:76: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
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
	jr	Z, 00211$
	ld	c, #0x00
	jr	00216$
00211$:
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
	jr	NC, 00213$
	ldhl	sp,	#12
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00214$
00213$:
	ld	c, #0x07
	jr	00216$
00214$:
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
	ld	l, a
;include/collision.h:32: return famidash_metatile_collision[tile_id];
	ld	h, #0x00
	ld	de, #_famidash_metatile_collision
	add	hl, de
	ld	c, (hl)
;include/player.h:41: return col_at(px, py, map, map_w, map_h);
00216$:
;src/player.c:76: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x08
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00219$
	ld	c, #0x00
	jr	00224$
00219$:
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
	jr	NC, 00221$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00222$
00221$:
	ld	c, #0x07
	jr	00224$
00222$:
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
00224$:
;src/player.c:76: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x03
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00227$
	ld	c, #0x00
	jr	00232$
00227$:
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
	jr	NC, 00229$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00230$
00229$:
	ld	c, #0x07
	jr	00232$
00230$:
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
00232$:
;src/player.c:76: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x04
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00235$
	ld	c, #0x00
	jr	00240$
00235$:
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
	jr	NC, 00237$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00238$
00237$:
	ld	c, #0x07
	jr	00240$
00238$:
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
00240$:
;src/player.c:76: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x02
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00243$
	ldhl	sp,	#36
	ld	(hl), #0x00
	jr	00248$
00243$:
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
	jr	NC, 00245$
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
	jr	C, 00246$
00245$:
	ldhl	sp,	#36
	ld	(hl), #0x07
	jr	00248$
00246$:
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
00248$:
;src/player.c:76: if (IS_HAZARD(col_point(hx1, hy1, map, map_w, map_h)) ||
	ldhl	sp,	#36
	ld	a, (hl)
	dec	a
	jp	Z, 00141$
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
	jr	Z, 00251$
	ld	c, #0x00
	jr	00256$
00251$:
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
	jr	NC, 00253$
	ldhl	sp,	#19
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
00256$:
;src/player.c:77: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x08
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00259$
	ld	c, #0x00
	jr	00264$
00259$:
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
	jr	NC, 00261$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00262$
00261$:
	ld	c, #0x07
	jr	00264$
00262$:
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
00264$:
;src/player.c:77: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x03
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00267$
	ld	c, #0x00
	jr	00272$
00267$:
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
	jr	NC, 00269$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00270$
00269$:
	ld	c, #0x07
	jr	00272$
00270$:
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
00272$:
;src/player.c:77: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x04
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00275$
	ld	c, #0x00
	jr	00280$
00275$:
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
	jr	NC, 00277$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00278$
00277$:
	ld	c, #0x07
	jr	00280$
00278$:
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
00280$:
;src/player.c:77: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x02
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00283$
	ld	(hl), #0x00
	jr	00288$
00283$:
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
	jr	NC, 00285$
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
	jr	C, 00286$
00285$:
	ldhl	sp,	#40
	ld	(hl), #0x07
	jr	00288$
00286$:
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
00288$:
;src/player.c:77: IS_HAZARD(col_point(hx2, hy1, map, map_w, map_h)) ||
	ldhl	sp,	#40
	ld	a, (hl)
	dec	a
	jp	Z, 00141$
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
	jr	Z, 00291$
	ld	c, #0x00
	jr	00296$
00291$:
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
	jr	NC, 00293$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00294$
00293$:
	ld	c, #0x07
	jr	00296$
00294$:
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
00296$:
;src/player.c:78: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x08
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00299$
	ld	c, #0x00
	jr	00304$
00299$:
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
	jr	NC, 00301$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00302$
00301$:
	ld	c, #0x07
	jr	00304$
00302$:
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
00304$:
;src/player.c:78: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x03
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00307$
	ld	c, #0x00
	jr	00312$
00307$:
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
	jr	NC, 00309$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00310$
00309$:
	ld	c, #0x07
	jr	00312$
00310$:
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
00312$:
;src/player.c:78: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x04
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00315$
	ld	c, #0x00
	jr	00320$
00315$:
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
	jr	NC, 00317$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00318$
00317$:
	ld	c, #0x07
	jr	00320$
00318$:
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
00320$:
;src/player.c:78: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	ld	a, c
	sub	a, #0x02
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00323$
	ld	c, #0x00
	jr	00328$
00323$:
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
	jr	NC, 00325$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00326$
00325$:
	ld	c, #0x07
	jr	00328$
00326$:
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
00328$:
;src/player.c:78: IS_HAZARD(col_point(hx1, hy2, map, map_w, map_h)) ||
	dec	c
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00331$
	ld	c, #0x00
	jr	00336$
00331$:
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
	jr	NC, 00333$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00334$
00333$:
	ld	c, #0x07
	jr	00336$
00334$:
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
00336$:
;src/player.c:79: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ld	a, c
	sub	a, #0x08
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00339$
	ld	c, #0x00
	jr	00344$
00339$:
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
	jr	NC, 00341$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00342$
00341$:
	ld	c, #0x07
	jr	00344$
00342$:
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
00344$:
;src/player.c:79: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ld	a, c
	sub	a, #0x03
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00347$
	ld	c, #0x00
	jr	00352$
00347$:
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
	jr	NC, 00349$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00350$
00349$:
	ld	c, #0x07
	jr	00352$
00350$:
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
00352$:
;src/player.c:79: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ld	a, c
	sub	a, #0x04
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00355$
	ld	c, #0x00
	jr	00360$
00355$:
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
	jr	NC, 00357$
	ldhl	sp,	#19
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00358$
00357$:
	ld	c, #0x07
	jr	00360$
00358$:
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
00360$:
;src/player.c:79: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ld	a, c
	sub	a, #0x02
	jp	Z, 00141$
;include/collision.h:43: if (world_py < 0) return COL_NONE;
	ldhl	sp,	#40
	ld	a, (hl)
	or	a, a
	jr	Z, 00363$
	ld	(hl), #0x00
	jr	00368$
00363$:
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
	jr	NC, 00365$
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
	jr	C, 00366$
00365$:
	ldhl	sp,	#40
	ld	(hl), #0x07
	jr	00368$
00366$:
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
00368$:
;src/player.c:79: IS_HAZARD(col_point(hx2, hy2, map, map_w, map_h))) {
	ldhl	sp,	#40
	ld	a, (hl)
	dec	a
	jr	NZ, 00163$
00141$:
;src/player.c:80: p->dead = 1;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
;src/player.c:81: return 1;
	ld	a,#0x01
	ld	(hl),a
	jp	00389$
00163$:
;src/player.c:86: if (!player_noclip) {
	ld	a, (#_player_noclip)
	or	a, a
	jp	NZ, 00174$
;src/player.c:87: uint8_t cm_l = col_point(p->world_x,              p->world_y + 7, map, map_w, map_h);
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
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0007
	add	hl, bc
	ld	c, l
	ld	a, h
	ldhl	sp,	#31
	ld	(hl), c
	inc	hl
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
	jr	Z, 00371$
	xor	a, a
	jr	00376$
00371$:
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
;src/player.c:87: uint8_t cm_l = col_point(p->world_x,              p->world_y + 7, map, map_w, map_h);
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
	jr	NC, 00373$
	ldhl	sp,	#12
	ld	a, e
	sub	a, (hl)
	inc	hl
	ld	a, d
	sbc	a, (hl)
	jr	C, 00374$
00373$:
	ld	a, #0x07
	jr	00376$
00374$:
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
00376$:
	ldhl	sp,	#40
	ld	(hl), a
;src/player.c:88: uint8_t cm_r = col_point(p->world_x + PLAYER_SIZE, p->world_y + 7, map, map_w, map_h);
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
	jr	Z, 00379$
	ldhl	sp,	#36
	ld	(hl), #0x00
	jp	00384$
00379$:
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
;src/player.c:88: uint8_t cm_r = col_point(p->world_x + PLAYER_SIZE, p->world_y + 7, map, map_w, map_h);
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
	jr	NC, 00381$
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
	jr	C, 00382$
00381$:
	ldhl	sp,	#36
	ld	(hl), #0x07
	jr	00384$
00382$:
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
00384$:
;src/player.c:89: if (IS_SOLID(cm_l) || IS_SOLID(cm_r)) {
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00164$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00164$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00164$
	ldhl	sp,	#40
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00164$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00164$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00164$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00164$
	ldhl	sp,	#36
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00174$
00164$:
;src/player.c:90: p->dead = 1;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
;src/player.c:91: return 1;
	ld	a,#0x01
	ld	(hl),a
	jr	00389$
00174$:
;src/player.c:96: if (!player_noclip && p->world_y > (int16_t)((uint16_t)map_h << 4)) {
	ld	a, (#_player_noclip)
	or	a, a
	jr	NZ, 00176$
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
01221$:
	ldhl	sp,	#33
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 01221$
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
	jr	Z, 01222$
	bit	7, d
	jr	NZ, 01223$
	cp	a, a
	jr	01223$
01222$:
	bit	7, d
	jr	Z, 01223$
	scf
01223$:
	jr	NC, 00176$
;src/player.c:97: p->dead = 1;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
;src/player.c:98: return 1;
	ld	a,#0x01
	ld	(hl),a
	jr	00389$
00176$:
;src/player.c:101: return 0;
	xor	a, a
00389$:
;src/player.c:102: }
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
