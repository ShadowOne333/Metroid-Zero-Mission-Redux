MorphSpeed:
	push 	r14
	mov 	r4,r0
	bl 	80084DCh		;speedbooster timer routine
	mov 	r0,0h
	strb	r0,[r4,4h]		;prevents possible spring jump (without the actual ability)
	ldr 	r0,=3001380h	;overwritten things
	pop 	r1
	bx 		r1
.pool
