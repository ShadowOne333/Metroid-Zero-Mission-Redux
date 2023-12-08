.gba
.open "zm.gba","HazardDamageSuit.gba",0x8000000

.org 0x80067C6
	mov r0,30h
	and r0,r1
	cmp r0,30h
	beq 800680Ah

.org 0x8008306
	mov r0,30h	;captain glitches tweak
	and r0,r1
	cmp r0,30h	;if both suits
	bne 800831Eh
	
.org 0x800831E
	cmp r0,10h	;if varia
	bne NoVaria
	cmp r2,4h	;strong acid
	bne NextHazardVaria
	mov r5,1h
	ldrb r0,[r4]
	cmp r0,1h
	bls 80083A8h
	mov r6,1h
	b 80083A8h
NextHazardVaria:
	cmp r2,2h	;lava
	bne 80083A8h
	mov r5,1h
	ldrb r0,[r4]
	cmp r0,4h
	bls 80083A8h
	mov r6,1h
	b 80083A8h
NoVaria:
	bl FreeSpace

.org 0x8304054	;Unused Crocomire Gfx
FreeSpace:
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
	
.close