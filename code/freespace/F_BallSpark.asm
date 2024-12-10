Ballspark:
	; check pose
	ldr r1,=ShineTimer
	ldrb r0,[r1]
	cmp r0,0x0
	beq @@Return
	ldr r1,=ChangedInput
	ldrb r0,[r1]
	mov r1,0x1
	and r0,r1
	cmp r0,0x0
	beq @@Return

	; ; check if hi-jump is enabled
	; ldr r1,=Equipment
	; ldrb r0,[r1,0xF]
	; mov r1,1h
	; and r0,r1
	; cmp r0,0h
	; beq @@Return			; return if high jump disabled or not obtained
	
	; check if on ground
	ldr r1,=Yposition
	ldrb r0,[r1,0x4]		; y velocity
	cmp r0,0x0
	bne @@Midair
	; check if moving
	ldrb r0,[r1,0x2]		; x velocity
	cmp r0,0x0
	bne @@Return			; return if moving (spring ball instead)
	ldrh r0,[r1]
	sub r0,0x20
	strh r0,[r1]

@@Midair:
	mov r0,0x0
	strh r0,[r1,0x2]		; set x velocity to 0

	ldr r1,=SamusData		; pose
	mov r0,0x25
	strb r0,[r1]
	ldr r1,=0x3001528
	mov r0,0x1
	strb r0,[r1]
	ldr r1,=0x3003B54
	strb r0,[r1]
	add r1,0x1
	mov r0,0xE4
	strb r0,[r1]
	add r1,0x1
	mov r0,0x0
	strb r0,[r1]
	add r1,0x2
	ldr r0,=0x820BD34
	str r0,[r1]
@@Return:
	ldr r1,=ChangedInput
	ldrb r0,[r1]
	mov r1,0x2
	and r0,r1
	bx r14
.pool

CheckMidair:
	ldr r1,=Yposition
	ldrh r0,[r1]
	ldr r1,=PrevYposition
	ldrh r1,[r1]
	cmp r0,r1
	beq @@Return
	ldr r1,=Yposition
	sub r0,0x20
	strh r0,[r1]
@@Return:
	ldr r1,=ShineTimer
	ldrb r0,[r1,0x2]
	bx r14
	.pool