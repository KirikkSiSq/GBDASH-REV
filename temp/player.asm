;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (MINGW64)
;--------------------------------------------------------
	.module player
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b___func_player_update
	.globl ___func_player_update
	.globl _col_at
	.globl _player_noclip
	.globl b_player_init
	.globl _player_init
	.globl b_player_screen_y
	.globl _player_screen_y
	.globl b_player_update
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
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_1
;src/player.c:5: BANKREF(player_update)
;	---------------------------------
; Function __func_player_update
; ---------------------------------
	b___func_player_update	= 1
___func_player_update::
	.local b___func_player_update 
	___bank_player_update = b___func_player_update 
	.globl ___bank_player_update 
;src/player.c:9: void player_init(Player *p, uint16_t start_x, int16_t start_y) __banked {
;	---------------------------------
; Function player_init
; ---------------------------------
	b_player_init	= 1
_player_init::
;src/player.c:10: p->world_x = start_x;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	ld	(de), a
	inc	de
;src/player.c:11: p->world_y = start_y;
	ld	a, (hl+)
	ld	(de), a
	dec	de
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/player.c:12: p->vel_y = 0;
	ld	hl, #0x0004
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/player.c:13: p->on_ground = 0;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x00
;src/player.c:14: p->dead = 0;
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x00
;src/player.c:15: p->anim_timer = 0;
	ld	hl, #0x000a
	add	hl, de
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/player.c:16: p->anim_frame = 0;
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x00
;src/player.c:17: p->gravity_flipped = 0;
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x00
;src/player.c:18: }
	ret
;src/player.c:20: int16_t player_screen_y(const Player *p, uint16_t cam_y) __banked {
;	---------------------------------
; Function player_screen_y
; ---------------------------------
	b_player_screen_y	= 1
_player_screen_y::
;src/player.c:21: return (int16_t)p->world_y - (int16_t)cam_y;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, (hl)
	ld	l, a
	ld	h, c
	inc	hl
	inc	hl
	ld	a, (hl+)
	ld	b, (hl)
	ldhl	sp,	#8
	ld	c, (hl)
	inc	hl
	ld	e, (hl)
	sub	a, c
	ld	c, a
	ld	a, b
	sbc	a, e
	ld	b, a
;src/player.c:22: }
	ret
;src/player.c:24: uint8_t player_update(
;	---------------------------------
; Function player_update
; ---------------------------------
	b_player_update	= 1
_player_update::
	add	sp, #-28
;src/player.c:32: if (p->dead) return 1;
	ldhl	sp,#34
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
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
	ldhl	sp,	#27
	ld	(hl), a
	or	a, a
	jr	Z, 00102$
	ld	a, #0x01
	jp	00226$
00102$:
;src/player.c:35: if (!p->on_ground) {
	ldhl	sp,#34
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#27
	ld	(hl), a
;src/player.c:36: if (p->gravity_flipped) {
	ldhl	sp,#34
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
;src/player.c:37: p->vel_y -= GRAVITY;
	ldhl	sp,#34
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl), a
;src/player.c:35: if (!p->on_ground) {
	ldhl	sp,	#27
	ld	a, (hl)
	or	a, a
	jp	NZ, 00111$
;src/player.c:36: if (p->gravity_flipped) {
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#25
	ld	(hl), a
;src/player.c:37: p->vel_y -= GRAVITY;
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#26
	ld	(hl+), a
	inc	de
	ld	a, (de)
;src/player.c:36: if (p->gravity_flipped) {
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00108$
;src/player.c:37: p->vel_y -= GRAVITY;
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#25
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#26
	ld	a, (hl+)
	ld	(de), a
	inc	de
;src/player.c:38: if (p->vel_y < -MAX_FALL_SPEED) p->vel_y = -MAX_FALL_SPEED;
	ld	a, (hl-)
	ld	(de), a
	ld	a, (hl+)
	sub	a, #0x97
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	bit	7,a
	jr	Z, 01008$
	bit	7, d
	jr	NZ, 01009$
	cp	a, a
	jr	01009$
01008$:
	bit	7, d
	jr	Z, 01009$
	scf
01009$:
	jr	NC, 00111$
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x97
	ld	(hl+), a
	ld	(hl), #0xff
	jr	00111$
00108$:
;src/player.c:40: p->vel_y += GRAVITY;
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#26
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#25
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#26
	ld	a, (hl+)
	ld	(de), a
	inc	de
;src/player.c:41: if (p->vel_y > MAX_FALL_SPEED) p->vel_y = MAX_FALL_SPEED;
	ld	a, (hl-)
	ld	(de), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	ld	d, #0x00
	ld	a, #0x69
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 01010$
	bit	7, d
	jr	NZ, 01011$
	cp	a, a
	jr	01011$
01010$:
	bit	7, d
	jr	Z, 01011$
	scf
01011$:
	jr	NC, 00111$
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, #0x69
	ld	(hl+), a
	ld	(hl), #0x00
00111$:
;src/player.c:48: p->world_y += (int8_t)(p->vel_y >> 4);
	ldhl	sp,#34
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl), a
;src/player.c:46: if (player_noclip) {
	ld	a, (#_player_noclip)
	or	a, a
	jr	Z, 00115$
;src/player.c:47: if (joy & J_A) p->vel_y = (p->gravity_flipped) ? -JUMP_FORCE : JUMP_FORCE;
	ldhl	sp,	#36
	bit	4, (hl)
	jr	Z, 00113$
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	ld	a, #0x5d
	jr	NZ, 00229$
	ld	a, #0xa3
00229$:
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00113$:
;src/player.c:48: p->world_y += (int8_t)(p->vel_y >> 4);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
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
	jr	nc,01013$
	dec	a
01013$:
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
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:49: return 0;
	xor	a, a
	jp	00226$
00115$:
;src/player.c:53: if ((joy & J_A) && p->on_ground) {
	ldhl	sp,	#36
	ld	a, (hl)
	and	a, #0x10
	ldhl	sp,	#16
	ld	(hl), a
	or	a, a
	jr	Z, 00117$
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00117$
;src/player.c:54: p->vel_y = (p->gravity_flipped) ? -JUMP_FORCE : JUMP_FORCE;
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	ld	a, #0x5d
	jr	NZ, 00231$
	ld	a, #0xa3
00231$:
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/player.c:55: p->on_ground = 0;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00117$:
;src/player.c:59: int8_t pixels = (int8_t)(p->vel_y >> 4);
	ldhl	sp,#12
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
	ldhl	sp,	#23
	ld	(hl), a
;src/player.c:60: int16_t ny = p->world_y + pixels;
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#23
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
	ldhl	sp,	#0
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/player.c:61: p->on_ground = 0;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;src/player.c:65: int16_t check_y_foot = (p->gravity_flipped) ? ny : ny + PLAYER_SIZE;
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#20
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000f
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#26
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#25
	ld	(hl), a
	ldhl	sp,	#20
	ld	a, (hl)
	or	a, a
	jr	Z, 00232$
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#26
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	jr	00233$
00232$:
	ldhl	sp,	#24
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
00233$:
	ldhl	sp,	#26
	ld	a, (hl)
	ldhl	sp,	#21
	ld	(hl), a
	ldhl	sp,	#27
	ld	a, (hl)
	ldhl	sp,	#22
;src/player.c:66: int16_t check_y_head = (p->gravity_flipped) ? ny + PLAYER_SIZE : ny;
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00234$
	ldhl	sp,	#24
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	jr	00235$
00234$:
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#26
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
00235$:
	ldhl	sp,	#26
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#27
	ld	a, (hl)
	ldhl	sp,	#5
	ld	(hl), a
;src/player.c:69: uint8_t cl = col_at(p->world_x + 2, check_y_foot, map, map_w, map_h, map_bank);
	ldhl	sp,	#34
	ld	a, (hl)
	ldhl	sp,	#26
	ld	(hl), a
	ldhl	sp,	#35
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	e, c
	ld	d, a
	inc	de
	inc	de
	ldhl	sp,	#43
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#28
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	_col_at
	ldhl	sp,	#18
	ld	(hl), a
;src/player.c:70: uint8_t cr = col_at(p->world_x + PLAYER_SIZE - 2, check_y_foot, map, map_w, map_h, map_bank);
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x000d
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#43
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#28
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	_col_at
	ldhl	sp,	#19
	ld	(hl), a
;src/player.c:72: uint8_t falling = (p->gravity_flipped) ? (pixels <= 0) : (pixels >= 0);
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#20
	ld	(hl), a
	or	a, a
	jr	Z, 00236$
	ldhl	sp,	#23
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 01015$
	bit	7, d
	jr	NZ, 01016$
	cp	a, a
	jr	01016$
01015$:
	bit	7, d
	jr	Z, 01016$
	scf
01016$:
	ld	a, #0x00
	rla
	xor	a, #0x01
	ldhl	sp,	#21
	ld	(hl), a
	jr	00237$
00236$:
	ldhl	sp,	#23
	ld	a, (hl-)
	dec	hl
	rlca
	and	a, #0x01
	xor	a, #0x01
	ld	(hl), a
00237$:
;src/player.c:76: p->world_y = ((ny >> 4) + 1) << 4;
	pop	bc
	push	bc
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
;src/player.c:78: p->world_y = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
	push	hl
	ldhl	sp,	#26
	ld	a, (hl)
	pop	hl
	and	a, #0xf0
	push	hl
	ldhl	sp,	#27
	ld	b, (hl)
	pop	hl
;src/player.c:76: p->world_y = ((ny >> 4) + 1) << 4;
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
;src/player.c:78: p->world_y = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
	add	a, #0xf0
	ld	c, a
	ld	a, b
	adc	a, #0xff
;src/player.c:76: p->world_y = ((ny >> 4) + 1) << 4;
	ldhl	sp,	#22
	ld	(hl), e
	inc	hl
	ld	(hl), d
;src/player.c:78: p->world_y = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
	inc	hl
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/player.c:74: if (falling && (IS_SOLID(cl) || IS_SOLID(cr))) {
	ldhl	sp,	#21
	ld	a, (hl)
	or	a, a
	jr	Z, 00145$
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00144$
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00144$
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00144$
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00144$
	ldhl	sp,	#19
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00144$
	ldhl	sp,	#19
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00144$
	ldhl	sp,	#19
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00144$
	ldhl	sp,	#19
	ld	a, (hl)
	sub	a, #0x06
	jr	NZ, 00145$
00144$:
;src/player.c:75: if (p->gravity_flipped) {
	ldhl	sp,	#20
	ld	a, (hl)
	or	a, a
	jr	Z, 00120$
;src/player.c:76: p->world_y = ((ny >> 4) + 1) << 4;
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	jr	00121$
00120$:
;src/player.c:78: p->world_y = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#24
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
00121$:
;src/player.c:80: p->vel_y = 0;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/player.c:81: p->on_ground = 1;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
	jp	00146$
00145$:
;src/player.c:84: uint8_t hl = col_at(p->world_x + 2, check_y_head, map, map_w, map_h, map_bank);
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	e, c
	ld	d, a
	inc	de
	inc	de
	ldhl	sp,	#43
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	_col_at
	ldhl	sp,	#21
	ld	(hl), a
;src/player.c:85: uint8_t hr = col_at(p->world_x + PLAYER_SIZE - 2, check_y_head, map, map_w, map_h, map_bank);
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x000d
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#43
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	_col_at
	ld	c, a
;src/player.c:86: if (IS_SOLID(hl) || IS_SOLID(hr)) {
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00134$
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00134$
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00134$
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00134$
	ld	a,c
	cp	a,#0x07
	jr	Z, 00134$
	cp	a,#0x09
	jr	Z, 00134$
	cp	a,#0x05
	jr	Z, 00134$
	sub	a, #0x06
	jr	NZ, 00135$
00134$:
;src/player.c:87: if (p->gravity_flipped) {
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00123$
;src/player.c:88: p->world_y = ((ny + PLAYER_SIZE) & ~15) - PLAYER_SIZE - 1;
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#24
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	jr	00124$
00123$:
;src/player.c:90: p->world_y = ((ny >> 4) + 1) << 4;
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
00124$:
;src/player.c:92: p->vel_y = 0;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jp	00146$
00135$:
;src/player.c:94: p->world_y = ny;
	ldhl	sp,	#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;src/player.c:97: int16_t sticky_y = (p->gravity_flipped) ? ny - 1 : ny + PLAYER_SIZE + 1;
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00238$
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	jr	00239$
00238$:
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	ld	c, l
	ld	b, h
00239$:
;src/player.c:98: uint8_t gl = col_at(p->world_x + 2, sticky_y, map, map_w, map_h, map_bank);
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	e, l
	ld	d, a
	inc	de
	inc	de
	push	bc
	ldhl	sp,	#45
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	push	hl
	ldhl	sp,	#44
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#44
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_col_at
	ldhl	sp,	#27
	ld	(hl), a
	pop	bc
;src/player.c:99: uint8_t gr = col_at(p->world_x + PLAYER_SIZE - 2, sticky_y, map, map_w, map_h, map_bank);
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	de, #0x000d
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#43
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_col_at
	ld	c, a
;src/player.c:100: if (IS_SOLID(gl) || IS_SOLID(gr)) {
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x07
	jr	Z, 00125$
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x09
	jr	Z, 00125$
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00125$
	ldhl	sp,	#25
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00125$
	ld	a,c
	cp	a,#0x07
	jr	Z, 00125$
	cp	a,#0x09
	jr	Z, 00125$
	cp	a,#0x05
	jr	Z, 00125$
	sub	a, #0x06
	jr	NZ, 00146$
00125$:
;src/player.c:101: p->on_ground = 1;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
;src/player.c:102: p->vel_y = 0;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00146$:
;src/player.c:108: uint8_t front_head = col_at(p->world_x + PLAYER_SIZE, p->world_y + PLAYER_HBOX, map, map_w, map_h, map_bank);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	de, #0x000f
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#43
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_col_at
	ldhl	sp,	#17
	ld	(hl), a
;src/player.c:109: uint8_t front_foot = col_at(p->world_x + PLAYER_SIZE, p->world_y + PLAYER_SIZE - PLAYER_HBOX, map, map_w, map_h, map_bank);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x000b
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	de, #0x000f
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#43
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_col_at
	ldhl	sp,	#18
	ld	(hl), a
;src/player.c:112: uint8_t hz_tl = col_at(p->world_x + PLAYER_HBOX, p->world_y + PLAYER_HBOX, map, map_w, map_h, map_bank);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	e, l
	ld	d, a
	inc	de
	inc	de
	inc	de
	inc	de
	ldhl	sp,	#43
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_col_at
	ldhl	sp,	#19
	ld	(hl), a
;src/player.c:113: uint8_t hz_tr = col_at(p->world_x + PLAYER_SIZE - PLAYER_HBOX, p->world_y + PLAYER_HBOX, map, map_w, map_h, map_bank);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	de, #0x000b
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#43
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_col_at
	ldhl	sp,	#20
	ld	(hl), a
;src/player.c:114: uint8_t hz_bl = col_at(p->world_x + PLAYER_HBOX, p->world_y + PLAYER_SIZE - PLAYER_HBOX, map, map_w, map_h, map_bank);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x000b
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	e, l
	ld	d, a
	inc	de
	inc	de
	inc	de
	inc	de
	ldhl	sp,	#43
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_col_at
	ldhl	sp,	#21
	ld	(hl), a
;src/player.c:115: uint8_t hz_br = col_at(p->world_x + PLAYER_SIZE - PLAYER_HBOX, p->world_y + PLAYER_SIZE - PLAYER_HBOX, map, map_w, map_h, map_bank);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x000b
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	de, #0x000b
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#43
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_col_at
	ldhl	sp,	#22
	ld	(hl), a
;src/player.c:118: uint8_t mid = col_at(p->world_x + 8, p->world_y + 8, map, map_w, map_h, map_bank);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,#26
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	ld	de, #0x0008
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#43
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#42
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	_col_at
;src/player.c:119: if (IS_PAD(mid) || IS_PAD(front_head) || IS_PAD(front_foot)) {
	ldhl	sp,#23
	ld	(hl), a
	sub	a, #0x0b
	ld	a, #0x01
	jr	Z, 01045$
	xor	a, a
01045$:
	ldhl	sp,	#24
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x0e
	ld	a, #0x01
	jr	Z, 01047$
	xor	a, a
01047$:
	ldhl	sp,	#25
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	sub	a, #0x0b
	ld	a, #0x01
	jr	Z, 01049$
	xor	a, a
01049$:
	ldhl	sp,	#26
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	sub	a, #0x0e
	ld	a, #0x01
	jr	Z, 01051$
	xor	a, a
01051$:
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#24
	ld	a, (hl)
	or	a, a
	jr	NZ, 00175$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00175$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00175$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00175$
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x0b
	jr	Z, 00175$
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x0e
	jr	NZ, 00176$
00175$:
;src/player.c:120: uint8_t hit = (IS_PAD(mid)) ? mid : (IS_PAD(front_head) ? front_head : front_foot);
	ldhl	sp,	#24
	bit	0, (hl)
	jr	NZ, 00243$
	inc	hl
	bit	0, (hl)
	jr	Z, 00240$
00243$:
	ldhl	sp,	#23
	ld	c, (hl)
	jr	00241$
00240$:
	ldhl	sp,	#26
	bit	0, (hl)
	jr	NZ, 00248$
	inc	hl
	bit	0, (hl)
	jr	Z, 00245$
00248$:
	ldhl	sp,	#17
	ld	c, (hl)
	jr	00246$
00245$:
	ldhl	sp,	#18
	ld	c, (hl)
00246$:
00241$:
;src/player.c:65: int16_t check_y_foot = (p->gravity_flipped) ? ny : ny + PLAYER_SIZE;
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
;src/player.c:121: if (hit == COL_PAD_BLUE) {
	ld	a, c
	sub	a, #0x0e
	jr	NZ, 00156$
;src/player.c:122: p->gravity_flipped = !p->gravity_flipped;
	dec	hl
	ld	a, b
	sub	a, #0x01
	ld	a, #0x00
	rla
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;src/player.c:124: p->vel_y = (p->gravity_flipped) ? -20 : 20;
	ldhl	sp,	#12
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	or	a, a
	ld	a, #0xec
	jr	NZ, 00251$
	ld	a, #0x14
00251$:
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
;src/player.c:126: p->vel_y = (p->gravity_flipped) ? -PAD_JUMP_FORCE : PAD_JUMP_FORCE;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, b
	or	a, a
	jr	Z, 00252$
	ld	bc, #0x008c
	jr	00253$
00252$:
	ld	bc, #0xff74
00253$:
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
00157$:
;src/player.c:128: p->on_ground = 0;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	jp	00177$
00176$:
;src/player.c:129: } else if ((joy & J_A) && (IS_ORB(mid) || IS_ORB(front_head) || IS_ORB(front_foot))) {
	ldhl	sp,	#16
	ld	a, (hl)
	or	a, a
	jp	Z, 00177$
	ldhl	sp,	#23
	ld	a, (hl)
	sub	a, #0x0a
	ld	a, #0x01
	jr	Z, 01058$
	xor	a, a
01058$:
	ld	b, a
	ldhl	sp,	#23
	ld	a, (hl)
	sub	a, #0x0c
	ld	a, #0x01
	jr	Z, 01060$
	xor	a, a
01060$:
	ldhl	sp,	#26
	ld	(hl), a
	ldhl	sp,	#23
	ld	a, (hl)
	sub	a, #0x0d
	ld	a, #0x01
	jr	Z, 01062$
	xor	a, a
01062$:
	ld	c, a
	ldhl	sp,	#17
	ld	a, (hl)
	sub	a, #0x0a
	ld	a, #0x01
	jr	Z, 01064$
	xor	a, a
01064$:
	ld	e, a
	ldhl	sp,	#17
	ld	a, (hl)
	sub	a, #0x0c
	ld	a, #0x01
	jr	Z, 01066$
	xor	a, a
01066$:
	ldhl	sp,	#27
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	sub	a, #0x0d
	ld	a, #0x01
	jr	Z, 01068$
	xor	a, a
01068$:
	ld	d, a
	ld	a, b
	or	a, a
	jr	NZ, 00164$
	ldhl	sp,	#26
	ld	a, (hl)
	or	a, a
	jr	NZ, 00164$
	or	a, c
	jr	NZ, 00164$
	or	a, e
	jr	NZ, 00164$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00164$
	or	a, d
	jr	NZ, 00164$
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x0a
	jr	Z, 00164$
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x0c
	jr	Z, 00164$
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x0d
	jp	NZ, 00177$
00164$:
;src/player.c:130: uint8_t hit = (IS_ORB(mid)) ? mid : (IS_ORB(front_head) ? front_head : front_foot);
	bit	0, b
	jr	NZ, 00257$
	ldhl	sp,	#26
	bit	0, (hl)
	jr	NZ, 00257$
	bit	0, c
	jr	Z, 00254$
00257$:
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	jr	00255$
00254$:
	bit	0, e
	jr	NZ, 00265$
	ldhl	sp,	#27
	bit	0, (hl)
	jr	NZ, 00265$
	bit	0, d
	jr	Z, 00262$
00265$:
	ldhl	sp,	#17
	ld	a, (hl)
	jr	00263$
00262$:
	ldhl	sp,	#18
	ld	a, (hl)
00263$:
	ldhl	sp,	#27
	ld	(hl), a
00255$:
	ldhl	sp,	#27
	ld	a, (hl)
;src/player.c:65: int16_t check_y_foot = (p->gravity_flipped) ? ny : ny + PLAYER_SIZE;
	ldhl	sp,#10
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
;src/player.c:131: if (hit == COL_ORB_MAGENTA) {
	cp	a, #0x0d
	jr	NZ, 00162$
;src/player.c:132: p->vel_y = (p->gravity_flipped) ? -MAGENTA_JUMP_FORCE : MAGENTA_JUMP_FORCE;
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	or	a, a
	ld	a, #0x3c
	jr	NZ, 00271$
	ld	a, #0xc4
00271$:
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
;src/player.c:133: } else if (hit == COL_ORB_BLUE) {
	sub	a, #0x0c
	jr	NZ, 00159$
;src/player.c:134: p->gravity_flipped = !p->gravity_flipped;
	ld	a, c
	sub	a, #0x01
	ld	a, #0x00
	rla
	ldhl	sp,	#10
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;src/player.c:135: p->vel_y = (p->gravity_flipped) ? -20 : 20;
	push	af
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#28
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#29
	ld	(hl), a
	pop	af
	or	a, a
	ld	a, #0xec
	jr	NZ, 00273$
	ld	a, #0x14
00273$:
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ldhl	sp,	#26
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00163$
00159$:
;src/player.c:137: p->vel_y = (p->gravity_flipped) ? -JUMP_FORCE : JUMP_FORCE;
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#26
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#27
	ld	(hl), a
	ld	a, c
	or	a, a
	jr	Z, 00274$
	dec	hl
	dec	hl
	ld	(hl), #0x5d
	jr	00275$
00274$:
	ldhl	sp,	#25
	ld	(hl), #0xa3
00275$:
	ldhl	sp,	#25
	ld	a, (hl+)
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
;src/player.c:139: p->on_ground = 0;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00177$:
;src/player.c:143: if (IS_SOLID(front_head) || IS_SOLID(front_foot) ||
	ldhl	sp,	#17
	ld	a, (hl)
	sub	a, #0x07
	jp	Z, 00183$
	ldhl	sp,	#17
	ld	a, (hl)
	sub	a, #0x09
	jp	Z, 00183$
	ldhl	sp,	#17
	ld	a, (hl)
	sub	a, #0x05
	jp	Z, 00183$
	ldhl	sp,	#17
	ld	a, (hl)
	sub	a, #0x06
	jp	Z, 00183$
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x07
	jp	Z, 00183$
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x09
	jp	Z, 00183$
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x05
	jp	Z, 00183$
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, #0x06
	jp	Z, 00183$
;src/player.c:144: IS_HAZARD(hz_tl) || IS_HAZARD(hz_tr) || IS_HAZARD(hz_bl) || IS_HAZARD(hz_br)) {
	ldhl	sp,	#19
	ld	a, (hl)
	sub	a, #0x08
	jp	Z, 00183$
	ldhl	sp,	#19
	ld	a, (hl)
	sub	a, #0x03
	jp	Z, 00183$
	ldhl	sp,	#19
	ld	a, (hl)
	sub	a, #0x04
	jp	Z, 00183$
	ldhl	sp,	#19
	ld	a, (hl)
	sub	a, #0x02
	jp	Z, 00183$
	ldhl	sp,	#19
	ld	a, (hl)
	dec	a
	jp	Z, 00183$
	ldhl	sp,	#19
	ld	a, (hl)
	sub	a, #0x10
	jp	Z, 00183$
	ldhl	sp,	#19
	ld	a, (hl)
	sub	a, #0x11
	jp	Z, 00183$
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x08
	jp	Z, 00183$
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x03
	jp	Z, 00183$
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00183$
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00183$
	ldhl	sp,	#20
	ld	a, (hl)
	dec	a
	jr	Z, 00183$
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x10
	jr	Z, 00183$
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x11
	jr	Z, 00183$
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x08
	jr	Z, 00183$
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00183$
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00183$
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00183$
	ldhl	sp,	#21
	ld	a, (hl)
	dec	a
	jr	Z, 00183$
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x10
	jr	Z, 00183$
	ldhl	sp,	#21
	ld	a, (hl)
	sub	a, #0x11
	jr	Z, 00183$
	ldhl	sp,	#22
	ld	a, (hl)
	sub	a, #0x08
	jr	Z, 00183$
	ldhl	sp,	#22
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00183$
	ldhl	sp,	#22
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00183$
	ldhl	sp,	#22
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00183$
	ldhl	sp,	#22
	ld	a, (hl)
	dec	a
	jr	Z, 00183$
	ldhl	sp,	#22
	ld	a, (hl)
	sub	a, #0x10
	jr	Z, 00183$
	ldhl	sp,	#22
	ld	a, (hl)
	sub	a, #0x11
	jr	NZ, 00184$
00183$:
;src/player.c:145: p->dead = 1;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
;src/player.c:146: return 1;
	ld	a,#0x01
	ld	(hl),a
	jp	00226$
00184$:
;src/player.c:150: if (p->on_ground) {
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#27
	ld	(hl), a
;src/player.c:151: p->anim_timer = 0;
	ldhl	sp,#34
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
;src/player.c:152: p->anim_frame = 0;
	ldhl	sp,#34
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#27
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#26
;src/player.c:150: if (p->on_ground) {
	ld	(hl+), a
	ld	a, (hl)
	or	a, a
	jr	Z, 00221$
;src/player.c:151: p->anim_timer = 0;
;src/player.c:152: p->anim_frame = 0;
	dec	hl
	xor	a, a
	ld	(bc), a
	inc	bc
	ld	(bc), a
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	(hl), #0x00
	jr	00222$
00221$:
;src/player.c:154: p->anim_timer++;
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
;src/player.c:156: p->anim_frame = ((uint32_t)p->anim_timer * 3 / 5) % 24;
	ld	c, l
	ld	b, h
	xor	a, a
	ld	d, a
	ld	e, a
	push	de
	push	bc
	ld	bc, #0x0003
	ld	de, #0x0000
	call	__mullong
	ld	hl, #0x0000
	push	hl
	ld	l, #0x05
	push	hl
	call	__divulong
	ld	e, c
	ld	d, b
	ld	bc, #0x0018
	call	__modsint
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00222$:
;src/player.c:60: int16_t ny = p->world_y + pixels;
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
;src/player.c:160: if (p->world_y > (int16_t)((uint16_t)map_h << 4) || p->world_y < -32) {
	ldhl	sp,	#41
	ld	a, (hl+)
	ld	e, (hl)
	add	a, a
	rl	e
	add	a, a
	rl	e
	add	a, a
	rl	e
	add	a, a
	rl	e
	ld	l, a
	ld	h, e
	ld	e, b
	ld	d, h
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	bit	7, e
	jr	Z, 01115$
	bit	7, d
	jr	NZ, 01116$
	cp	a, a
	jr	01116$
01115$:
	bit	7, d
	jr	Z, 01116$
	scf
01116$:
	jr	C, 00223$
	ld	a, c
	sub	a, #0xe0
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00224$
00223$:
;src/player.c:161: p->dead = 1;
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
;src/player.c:162: return 1;
	ld	a,#0x01
	ld	(hl),a
	jr	00226$
00224$:
;src/player.c:165: return 0;
	xor	a, a
00226$:
;src/player.c:166: }
	add	sp, #28
	ret
	.area _CODE_1
	.area _INITIALIZER
__xinit__player_noclip:
	.db #0x00	; 0
	.area _CABS (ABS)
