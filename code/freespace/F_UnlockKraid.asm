UnlockDoors:
	ldr r0,=DoorUnlockTimer
	mov r1,0FFh
	strb r1,[r0]
	ldr r0,=300070Ch
	ldrh r1,[r0,6h]
	bx r14
.pool