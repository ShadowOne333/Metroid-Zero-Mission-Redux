powerbombhijack:
	ldr		r0,=0x300
	cmp		r1,r0
	bcc		@@jumptoreturn
	ldr		r0,=0x480
	cmp		r1,r0
	bcs		@@jumptoreturn
	b		@@newcolor
@@jumptoreturn:
	pop		r0
	b		@@return
@@newcolor:
	ldr		r0,=0x780
	add		r1,r1,r0
	add		r2,r2,r0

	pop		r0
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80


@@return:
	push	r4-r7,r14
	lsl		r0,r0,0x10
	lsr		r5,r0,0x10
	lsl		r1,r1,0x10
	lsr		r4,r1,0x10
	lsl		r2,r2,0x10
	lsr		r2,r2,0x10
	
	ldr		r3,=0x8052e52
	mov		r15,r3

.pool












superhijack:
	ldr		r0,=0x300
	cmp		r1,r0
	bcc		@@jumptoreturn
	ldr		r0,=0x480
	cmp		r1,r0
	bcs		@@jumptoreturn
	b		@@newcolor
@@jumptoreturn:
	pop		r0
	b		@@return
@@newcolor:
	ldr		r0,=0x600
	add		r1,r1,r0
	add		r2,r2,r0

	pop		r0
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80
	add		r0,0x80


@@return:
	push	r4-r7,r14
	lsl		r0,r0,0x10
	lsr		r5,r0,0x10
	lsl		r1,r1,0x10
	lsr		r4,r1,0x10
	lsl		r2,r2,0x10
	lsr		r2,r2,0x10
	
	ldr		r3,=0x8052D7A
	mov		r15,r3

.pool