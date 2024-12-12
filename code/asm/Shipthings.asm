.org 0x8044FC2
	cmp r2,8h ; make ship land closer to ground

.org 0x8044FC6
	mov r0,0x25
	mov r1,0x24
	strb r0,[r4,r1]
	mov r0,0x32
	mov r1,0x5
	ldr r2,=0x8010850
	bl CallShip2
	cmp r0,0FFh

CallShip2:
	mov pc,r2
