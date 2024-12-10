NewWallJumpCheck:
	ldrh    r0,[r4,14h]  ;
	ldrh    r1,[r4,12h]  ;
	add     r1,r1,r2     ;
	lsl     r1,r1,10h    ;
	lsr     r1,r1,10h    ; original y position
	push 	r2
	ldr		r2,=@continue
	add		r2,1h
	mov 	r14,r2
	ldr		r2,=08057DF8h
	mov		r15,r2
@continue:
	pop 	r2
	mov     r1,80h       ;
	lsl     r1,r1,11h    ;
	and     r1,r0        ;
	cmp     r1,0h        ;
	bne     yeswalljump  ;

;now for upper y position
	ldrh    r0,[r4,14h]  ;
	ldrh    r1,[r4,12h]  ;
	add     r1,r1,r2     ;
	lsl     r1,r1,10h    ;
	lsr     r1,r1,10h    ;
	push 	r2
	mov 	r2,40h		 ;  <=== Change this 40 to how many pixels to shift the collision check
	sub		r0,r0,r2
	ldr		r2,=@continue2
	add		r2,1h
	mov 	r14,r2
	ldr		r2,=08057DF8h
	mov		r15,r2
@continue2:
	pop 	r2
	mov     r1,80h       ;
	lsl     r1,r1,11h    ;
	and     r1,r0        ;
	cmp     r1,0h        ;
	beq     notwalljump  ;
yeswalljump:
    ldr		r0,=08008FD6h
	mov		r15,r0
notwalljump:
	ldr		r2,=08008FE4h
	mov		r15,r2
.pool
