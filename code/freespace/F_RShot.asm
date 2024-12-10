; new code
CheckFireBeam:
	push    r14
	ldrb    r0,[r4,5]		; load charge counter
	cmp     r0,0x3F
	bls     @@Return
; fire beam
	mov     r0,0
	strb    r0,[r4,5]		; reset charge counter
	mov     r0,6
	strb    r0,[r4,1]		; set flag to fire charged shot
@@Return:
; replaced code
	mov     r0,0x84
	bl      PlaySound
	pop     r0
	bx      r0