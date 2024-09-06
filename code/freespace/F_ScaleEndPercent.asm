ScaleNumber:
; r0 = obtained percent
	mov     r1,0x64			; 100
	mul     r1,r0
	mov     r0,0
	mov     r2,MaxPercent
@@Divide:
	cmp     r1,MaxPercent
	blt     @@Return
	sub     r1,r1,r2
	add     r0,1
	b       @@Divide
@@Return:
	bx      r14
	
FixCalcPercent:
	push    r14
	; hijacked code
	add     r0,r8
	add     r0,r0,r7		; r0 = obtained percent
	bl      ScaleNumber
	pop     r1
	bx      r1
	
FixDisplayedPercent:
	push    r14
	; hijacked code
	add     r0,0x99
	; swap registers
	mov     r1,r0
	mov     r0,r5			; r0 = obtained percent
	mov     r5,r1
	bl      ScaleNumber
	strb    r0,[r5]			; stores percent to 300175D
	pop     r0
	bx      r0