noBombJumpDown:
	add sp,-1Ch
	mov r8,r0
	ldr r0,=300137Ch
	ldrb r1,[r0]
	mov r0,80h
	and r1,r0
	cmp r1,80h
	beq NoBJ
	bx r14

NoBJ:
	ldr r0,=8051FE8h
	mov r15,r0

; Restore following original code overwritten by ".pool"
	strb r0, [r1]
.pool
