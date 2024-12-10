.notice tohex(.)
AutoChargeHijack:
    ldr		r1,=0x300153B ; current power bombs
	ldrb	r0,[r1]
	cmp		r0,0x0
	beq		@@nocharge
	ldr		r0,=0x3001417 ; missile type selected
	ldrb	r0,[r0]
	mov		r1,2h
	and		r1,r0
	cmp		r1,0h
	bne		@@charge
	b		@@nocharge

@@charge:
    ldr     r0,=0x30013d4
    ldrb    r0,[r0]
    cmp     r0,0x10
    beq     @@zerochargecounter
    cmp     r0,0x4
    bne     @@notcrouching
    ldr     r0,=0x3001380
    ldrh    r0,[r0]
    ldr     r1,=0x300137c
    ldrh    r1,[r1]
    ORR     r0,r1
    ldr     r1,=0x80
    and     r0,r1
    cmp     r0,0x0
    beq     @@notcrouching
@@zerochargecounter:
    ldr     r1,=0x3001419
    mov     r0,0x0
    b       @@setchargecounter
    @@notcrouching:



    ldr     r1,=0x3001419
    ldrb    r0,[r1]
    cmp     r0,0x40
    bcc     @@set40
    cmp     r0,0x4f
    bcs     @@set40
    add     r0,0x1
    b       @@setchargecounter
@@set40:
    mov     r0,0x40
@@setchargecounter:
    strb    r0,[r1]



    ldr     r0,=0x3001380 ; changed input
    ldrh    r1,[r0]
    mov     r5,0x2
    mov     r0,r5
    and     r0,r1
    cmp     r0,0x0
    bne     @@jump8007d82 ; release charge shot
    ldr     r1,=0x8007d60 ; return to missile/super check
    mov     r15,r1

@@jump8007d82: ; release charge shot
    ldr     r4,=0x3001418
    ldrb    r0,[r4]
    cmp     r0,0x0
    bne     @@continue2
	ldr		r4,=0x300153B ; current power bombs
	ldrb	r0,[r4]
	sub		r0,r0,0x1
	strb	r0,[r4]
	cmp		r0,0x0
	bne		@@continue2
	mov		r0,0x8
	lsl		r0,r0,0x8
	ldr		r1,=0x3001416 ; missile type highlighted
	strh	r0,[r1]
@@continue2:
    mov     r4,0x6
    ldr     r0,=0x8007d82
    mov     r15,r0


@@nocharge:
    ldr     r0,=0x3001380 ; changed input
    ldrh    r1,[r0]
    mov     r5,0x2
    mov     r0,r5
    and     r0,r1
    cmp     r0,0x0
    beq     @@jump8007d4a
    ldr     r1,=0x8007d1c ; return to missile/super check
    mov     r15,r1
@@jump8007d4a:
    ldr     r1,=0x8007d4a ; 
    mov     r15,r1
    
.pool