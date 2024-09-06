updatemap:
	ldr r1,=3000BF0h
	mov	r0,5h
	strb r0,[r1]

	ldr r1,=0x600C000
@@startloop:

	ldr r0,=0eeeeeeeeh
	str r0,[r1]
	add r1,r1,4h
	ldr	r0,=0x600C540
	cmp r1,r0
	bls @@startloop


@@return:
	pop r4
	pop r0
	bx r0
.pool