FreeSpaceLedge:
	push r2,r5 ; Save r2 and r5
	mov r1,r7
	add r1,#0x58
	push r7
	mov r5,r3
	ldrb r0,[r1,#0x0]
	add r0,#0x1
	strb r0,[r1,#0x0] ; Touching side block flag

;Check for power grip. Comment out the lines below to make ledge vault possible without power grip	
	ldr r0,=Equipment
	ldrb r0,[r0,#0xF]
	mov r1,80h
	and r0,r1
	cmp r0,0h
	bne @@Continue1
	b @@Return
;End of check for power grip

@@Continue1:
	ldr r0,=CheckMorphed
	bl CallR0
	cmp r0,#0x0
	beq @@Continue2
	b @@Return

@@Continue2:
	ldrh r0,[r6,#0x14] ; r6 = Samus data
	add r0,#0x40
	ldrh r1,[r6,#0x12]
	ldr r2,=ProcessClipdataForSamus ; Block below samus
	bl CallR2
	mov r1,#0x80
	lsl r1,#0x11
	and r0,r1
	cmp r0,#0x0
	bne @@Continue3
	b @@Return ; If not solid

@@Continue3:
	ldrh r7,[r6,#0x14] ; r6 = Samus data
	cmp r7,#0x1F
	bls @@TooLow
	sub r7,#0x20
@@TooLow:
	mov r0,#0x3F
	orr r7,r0 ; Round Samus y position to the nearest block height

	; r4 has the hitbox offset
	mov r0,r7
	sub r0,#0x40 ; Block above
	add r1,r5,r4 ; r1 = X + Offset
	ldr r2,=ProcessClipdataForSamus ; Bottom block
	bl CallR2
	mov r1,#0x80
	lsl r1,#0x11
	and r0,r1
	cmp r0,#0x0
	beq @@OneTileLedge; If not solid
	
	mov r0,r7
	sub r0,#0x80 ; 2 Blocks above
	add r1,r5,r4 ; r1 = X + Offset
	ldr r2,=ProcessClipdataForSamus
	bl CallR2
	mov r1,#0x80
	lsl r1,#0x11
	and r0,r1
	cmp r0,#0x0
	bne @@Return ; If solid
	
	mov r0,r7
	sub r0,#0x80 ; 2 Blocks above
	ldrh r1,[r6,#0x12]
	ldr r2,=ProcessClipdataForSamus
	bl CallR2
	mov r1,#0x80
	lsl r1,#0x11
	and r0,r1
	cmp r0,#0x0
	bne @@Return ; If solid

	mov r0,r7
	sub r0,#0x0C0 ; 3 Blocks above
	add r1,r5,r4 ; r1 = X + Offset
	ldr r2,=ProcessClipdataForSamus
	bl CallR2
	mov r1,#0x80
	lsl r1,#0x11
	and r0,r1
	cmp r0,#0x0
	bne @@TwoTilePullInMorphTunnel ; If solid
	
	mov r0,r7
	sub r0,#0x0C0 ; 3 Blocks above
	ldrh r1,[r6,#0x12]
	ldr r2,=ProcessClipdataForSamus
	bl CallR2
	mov r1,#0x80
	lsl r1,#0x11
	and r0,r1
	cmp r0,#0x0
	bne @@TwoTilePullInMorphTunnel ; If solid

	b @@TwoTilePullForward

@@OneTileLedge:
	mov r0,r7
	add r1,r5,r4 ; r1 = X + Offset
	ldr r2,=ProcessClipdataForSamus ; Bottom block
	bl CallR2
	mov r1,#0x80
	lsl r1,#0x11
	and r0,r1
	cmp r0,#0x0
	beq @@Return ; If not solid

	mov r0,r7
	sub r0,#0x80 ; 2 Blocks above
	add r1,r5,r4 ; r1 = X + Offset
	ldr r2,=ProcessClipdataForSamus
	bl CallR2
	mov r1,#0x80
	lsl r1,#0x11
	and r0,r1
	cmp r0,#0x0
	bne @@OneTilePullInMorphTunnel ; If solid
	
	mov r0,r7
	sub r0,#0x80 ; 2 Blocks above
	ldrh r1,[r6,#0x12]
	ldr r2,=ProcessClipdataForSamus
	bl CallR2
	mov r1,#0x80
	lsl r1,#0x11
	and r0,r1
	cmp r0,#0x0
	bne @@OneTilePullInMorphTunnel ; If solid
	
@@OneTilePullForward:
	mov r0,#0x1B ; Pulling youself forward
	mov r1,r7
	sub r1,#0x40
	b @@LedgeReturn
	
@@OneTilePullInMorphTunnel:
	ldr r0,=Equipment
	ldrb r0,[r0,#0xF]
	mov r1,40h
	and r0,r1
	cmp r0,0h
	beq @@Return
	mov r0,#0x1C ; Pulling youself into morphball tunnel
	mov r1,r7
	add r1,#0x40
	b @@LedgeReturn

@@TwoTilePullForward:
	mov r0,#0x1B ; Pulling youself forward
	mov r1,r7
	sub r1,#0x80
	b @@LedgeReturn
	
@@TwoTilePullInMorphTunnel:
	ldr r0,=Equipment
	ldrb r0,[r0,#0xF]
	mov r1,40h
	and r0,r1
	cmp r0,0h
	beq @@Return
	mov r0,#0x1C ; Pulling youself into morphball tunnel
	mov r1,r7

@@LedgeReturn:
	strh r1,[r6,#0x14]
	pop r7
	pop r2,r5
	ldr r1,=SamusDataCopy
	strb r2,[r1,#0xA]
	ldr r1,=0x8005ac4
	mov pc,r1

@@Return:
	pop r7
	pop r2,r5
	ldr r0,=0x800590c
	mov pc,r0
	.pool

CallR0:
	mov pc,r0

CallR2:
	mov pc,r2
.pool
