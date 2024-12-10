powerBombJumpA:
	push r14
	bl 80576ECh
	strb r5,[r4]
	mov r0,r4
	ldrb r1,[r4,11h]
	cmp r1,3h
	bne NoBallCanon
	bl 8051E14h
	mov r0,0h
	strb r0,[r4]
NoBallCanon:
	bl 8051ECCh
ReturnPBJump:
	pop r0
	bx r0

powerBombJumpB:
	cmp r0,0Eh
	beq NBombs
	cmp r0,0Fh
	bne Return2
PBombs:
	ldrb r0,[r2,11h]
	cmp r0,2h
	bne Return2
	mov r7,3h
	b Return3
NBombs:
	ldrb r0,[r2,11h]
	cmp r0,1h
	bne Return2
	mov r7,4h
	b Return3
Return2:
	mov r0,0h
Return3:
	bx r14

.pool
