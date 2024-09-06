DrawPickup:
	push 	r14
    push	r2-r6
    ldr		r0,=ChargeCounter
    ldrb	r0,[r0]
	cmp		r0,0x20
    bcc		@@Return
	sub		r0,0x1f
	lsr		r5,r0,0x1			; scaling speed
	mov		r5,r0

    ldr		r0,=ArmPosition
    ldrh	r2,[r0]				; r2 = arm Y position
    ldr		r0,=SamusData
    ldrh	r1,[r0,0x12]		; r1 = Sam's X position
    ldr		r0,=CurrSprite
    ldrh	r3,[r0,0x4]			; r3 = sprite X position
    ldrh	r4,[r0,0x2]			; r4 = sprite Y position
	add		r0,0x1
	sub		r1,r3,r1			; x
	sub		r0,r4,r2			; y
	
	bl	sinecosine
	mov		r2,r5
	mul		r0,r2				; apply speed scalar
	mul		r1,r2
	asr		r0,r0,0x10
	asr		r1,r1,0x10
	ldr		r3,=CurrSprite
	ldrh	r2,[r3,0x2]			; add y speed to position
	sub		r0,r2,r0
	strh	r0,[r3,0x2]
	
	ldrh	r2,[r3,0x4]
	sub		r1,r2,r1			; add x speed to position
	strh	r1,[r3,0x4]
		
@@Return:
	pop     r2-r6
	pop		r1
    ; replaced instructions
    ldr     r0,=CurrSprite
    add     r0,0x24
    bx      r1
    .pool

; r0 = y
; r1 = x

WrapperR3:
mov r15,r3

MyWrapperR1:
	bx	r1

sinecosine:
	push	r14
	lsl		r0,r0,0x10
	asr		r0,r0,0x10
	lsl		r1,r1,0x10
	asr		r1,r1,0x10
	mov		r3,r0
	mov		r4,r1
	
	mov		r1,r3
	mul		r1,r3
	mov		r2,r4
	mul		r2,r4
	add		r0,r1,r2
	push	r3
	ldr		r1,=0x80051C8+1		; load square root
	bl		MyWrapperR1
	pop		r3
	mov		r2,r0
	mov		r1,r0 				; divisor
	mov		r0,r3 				; dividend
	lsl		r0,r0,0x10
	ldr		r3,=0x808AC34 		; divide 0x1000 times r0 or r1
	push	r2
	bl		WrapperR3
	pop		r2
	mov		r1,r2 				; divisor
	mov		r2,r0
	mov		r0,r4				; dividend
	lsl		r0,r0,0x10
	ldr		r3,=0x808AC34		; divide 0x1000 times r0 or r1 
	push	r2
	bl		WrapperR3
	pop		r2
	mov		r4,r0
	mov		r0,r2
	mov		r1,r4
	pop		r15
.pool