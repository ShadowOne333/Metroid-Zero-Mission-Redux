powerBombJumpasm:
.org 0x80269F4
	bl powerBombJumpB
	cmp r0,0h
	beq 8026A30h
	nop

.org 0x8026A1C
	mov r0,r7

.org 0x8026A38
	bls 80269DEh

.org 0x80521FA
	cmp r0,0h
	beq 805220Eh
	cmp r0,1h
	beq 80522B0h
	cmp r0,2h
	beq 80522D8h
	cmp r0,3h
	beq 80522D8h
	b 80522FCh
	nop
	
.org 0x80522F6
	bl powerBombJumpA
	nop