.org 0x8053AA8
	push	r4-r6,r14
	bl		CheckTimerDisplayed			;checks escape timer type	
	ldr		r1,=300095Dh					;some sort of timer
	mov		r2,0FFh
	strb	r2,[r1]
	cmp		r0,1h						;1 = MB timer
	bne		@@AltTimerCheck
	ldr		r0,=Difficulty
	ldrb	r0,[r0]
	cmp		r0,0h
	bne		@@NormalCheck
;easy mode timer values for timer 1 (MB in vanilla)
	mov		r1,0h						;minutes tens place
	mov		r2,3h						;minutes ones place
	mov		r3,0h						;seconds tens place
	mov		r4,0h						;seconds ones place
	mov		r5,0h						;tenths of second
	mov		r6,0h						;hundredths of second
	b		@@StoreValues
@@NormalCheck:
	cmp		r0,1h
	bne		@@HardValues
;normal mode timer values for timer 1 (MB in vanilla)
	mov		r1,0h						;minutes tens place
	mov		r2,2h						;minutes ones place
	mov		r3,0h						;seconds tens place
	mov		r4,0h						;seconds ones place
	mov		r5,0h						;tenths of second
	mov		r6,0h						;hundredths of second
	b		@@StoreValues
@@HardValues:
;hard mode timer values for timer 1 (MB in vanilla)
	mov		r1,0h						;minutes tens place
	mov		r2,1h						;minutes ones place
	mov		r3,3h						;seconds tens place
	mov		r4,0h						;seconds ones place
	mov		r5,0h						;tenths of second
	mov		r6,0h						;hundredths of second
	b		@@StoreValues	
@@AltTimerCheck:
	cmp		r0,2h						;2 = Mecha timer
	bne		@@Oopsie
	ldr		r0,=Difficulty
	ldrb	r0,[r0]
	cmp		r0,0h
	bne		@@NormalCheck2
;easy mode timer values for timer 2 (Mecha in vanilla)
	mov		r1,0h						;minutes tens place
	mov		r2,5h						;minutes ones place
	mov		r3,0h						;seconds tens place
	mov		r4,0h						;seconds ones place
	mov		r5,0h						;tenths of second
	mov		r6,0h						;hundredths of second
	b		@@StoreValues	
.pool	
@@NormalCheck2:
	cmp		r0,1h
	bne		@@HardValues2
;normal mode timer values for timer 2 (Mecha in vanilla)
	mov		r1,0h						;minutes tens place
	mov		r2,4h						;minutes ones place
	mov		r3,0h						;seconds tens place
	mov		r4,0h						;seconds ones place
	mov		r5,0h						;tenths of second
	mov		r6,0h						;hundredths of second
	b		@@StoreValues	
@@HardValues2:
;hard mode timer values for timer 2 (Mecha in vanilla)
	mov		r1,0h						;minutes tens place
	mov		r2,3h						;minutes ones place
	mov		r3,0h						;seconds tens place
	mov		r4,0h						;seconds ones place
	mov		r5,0h						;tenths of second
	mov		r6,0h						;hundredths of second	
@@StoreValues:
	ldr		r0,=EscapeTimerValues
	strb	r1,[r0,5h]
	strb	r2,[r0,4h]
	strb	r3,[r0,3h]
	strb	r4,[r0,2h]
	strb	r5,[r0,1h]
	strb	r6,[r0]
	b		@@Return
@@Oopsie:
	ldr		r1,=EscapeTimerValues
	mov		r0,9h						;safety block in case a invalid timer value is given, can technially be removed but I put it here to be safe
	strb	r0,[r1,5h]
	strb	r0,[r1,4h]
	strb	r0,[r1,3h]
	strb	r0,[r1,2h]
	strb	r0,[r1,1h]
	strb	r0,[r1]
@@Return:
	pop		r4-r6
	pop		r0
	bx		r0
.pool