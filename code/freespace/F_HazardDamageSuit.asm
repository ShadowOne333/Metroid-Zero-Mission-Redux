FreespaceHazard:
	cmp r0,20h	;if gravity
	bne Return
	cmp r2,4h	;strong acid
	bne NextHazardGravityA
	mov r5,1h
	ldrb r0,[r4]
	cmp r0,2h
	bls ReturnGravity
	mov r6,1h
	b ReturnGravity
NextHazardGravityA:	
	cmp r2,6h	;snow
	bne NextHazardGravityB
	mov r5,1h
	ldrb r0,[r4]
	cmp r0,5h
	bls ReturnGravity
	mov r6,0Fh
	b ReturnGravity
NextHazardGravityB:	
	cmp r2,2h	;lava
	bne NextHazardGravityC
	mov r5,1h
	ldrb r0,[r4]
	cmp r0,3h
	bls ReturnGravity
	mov r6,1h
	b ReturnGravity
NextHazardGravityC:	
	cmp r2,5h	;heat
	beq NextHazardGravityD
	cmp r2,7h	;cold
	bne ReturnGravity
NextHazardGravityD:
	mov r5,1h
	ldrb r0,[r4]
	cmp r0,7h
	bls ReturnGravity
	mov r6,0Fh
ReturnGravity:
	mov r0,r14
	add r0,62h
	mov r14,r0
Return:
	bx r14

;.close
