hazardDamageasm:

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
	bl FreeSpaceHazard
.pool
