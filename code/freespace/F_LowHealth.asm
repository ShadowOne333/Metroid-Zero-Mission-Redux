hijack:
	ldr		r1,=0x3001536
	ldrh	r1,[r1]
	cmp		r1,0x1d
	bhi		@@notlow
@@lowhealth:
	ldr		r1,=0x832fec8  ; red tens place digits
	b		@@continue
@@notlow:
	ldr		r1,=0x8330948 ;vanilla tens place digits

@@continue:
	add		r0,r0,r1
	ldr		r1,=0x8052846
	mov		r15,r1

.pool
	

hijack2:
	ldr		r1,=0x3001536
	ldrh	r1,[r1]
	cmp		r1,0x1d
	bhi		@@notlow
@@lowhealth:
	ldr		r1,=0x8330008  ; red ones place digits
	b		@@continue
@@notlow:
	ldr		r1,=0x8330a88 ;vanilla ones place digits

@@continue:
	add		r0,r0,r1
	ldr		r1,=0x8052874
	mov		r15,r1

.pool