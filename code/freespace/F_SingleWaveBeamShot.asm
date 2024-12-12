zero:
	ldr 	r0,=0804F2a2h
	mov 	r15,r0
spawn2charges:
	pop 	r0
	lsl 	r0,r0,18h
	cmp 	r0,0h
	bne 	@@notzero
	b 	zero
	
@@notzero:
	ldr 	r0,=300153Dh
	ldrb 	r0,[r0]
	mov 	r1,1h
	and 	r1,r0
	cmp 	r4,9h
	beq 	chargedwavebeam
	ldr 	r0,=03000BECh
	ldrh 	r1,[r0]
	ldr 	r0,=3000BEEh
	ldrh 	r2,[r0]
	b 	returntocode

chargedwavebeam:	
	ldr 	r0,=03000BECh
	ldrh 	r1,[r0]
	ldr 	r0,=3000BEEh
	ldrh 	r2,[r0]
	mov 	r0,0x10
	ldr 	r3,=@@spawnlink2
	add 	r3,1h
	mov 	r14,r3
	ldr 	r3,=0804EDE4h
	mov 	r15,r3

@@spawnlink2:
	ldr 	r0,=03000BECh
	ldrh	r1,[r0]
	ldr 	r0,=3000BEEh
	ldrh	r2,[r0]
	b 	returntocode

returntocode:
	ldr 	r0,=0804F18Ch
	mov 	r15,r0
.pool


spawnhijack:
	mov 	r1,r4
	cmp 	r1,0x10
	bne 	@@end
	mov 	r1,0x9
	mov 	r4,r1
	mov 	r0,0xC
	lsl 	r0,r0,0x8
	orr 	r2,r0
	;strb	r0,[r3,0x1]

@@end:
	mov 	r0,r12
	ldrh 	r1,[r0,0xE]
	mov 	r0,0x10
	and 	r0,r1
	cmp 	r0,0x0
	beq 	@@returnequal

	ldr 	r1,=0x0804EE32
	mov 	r15,r1

@@returnequal:
	ldr 	r1,=0x804EE36
	mov 	r15,r1
.pool


horizontal:
	push	r14
	mov 	r2,r4
	ldrb	r0,[r2,0x1]
	cmp 	r0,0x4
	bls 	@@stage1
	cmp 	r0,0x8
	bls 	@@stage2
	cmp 	r0,0xc
	bls 	@@stage3
	cmp 	r0,0x10
	bls 	@@stage4
	cmp 	r0,0x14
	bls 	@@stage5
	cmp 	r0,0x18
	bls 	@@stage6
	mov 	r0,0x0
	strb	r0,[r2,0x1]
	b 	@@return
@@stage1:
	ldrh	r0,[r2,0x8]
	mov 	r1,0x8
	sub 	r0,r0,r1
	strh	r0,[r2,0x8]
	b 	@@return
@@stage2:
	b 	@@return
@@stage3:
	ldrh	r0,[r2,0x8]
	mov 	r1,0x8
	add 	r0,r0,r1
	strh	r0,[r2,0x8]
	b 	@@return
@@stage4:
	ldrh	r0,[r2,0x8]
	mov 	r1,0x8
	add 	r0,r0,r1
	strh	r0,[r2,0x8]
	b 	@@return
@@stage5:
	b 	@@return
@@stage6:
	ldrh	r0,[r2,0x8]
	mov 	r1,0x8
	sub 	r0,r0,r1
	strh	r0,[r2,0x8]
	b 	@@return

@@return:
	pop 	r14
	bx 	r14
.pool

vertical:
	push	r14
	mov 	r2,r4
	ldrb	r0,[r2,0x1]
	cmp 	r0,0x4
	bls 	@@stage1
	cmp 	r0,0x8
	bls 	@@stage2
	cmp 	r0,0xc
	bls 	@@stage3
	cmp 	r0,0x10
	bls 	@@stage4
	cmp 	r0,0x14
	bls 	@@stage5
	cmp 	r0,0x18
	bls 	@@stage6
	mov 	r0,0x0
	strb	r0,[r2,0x1]
	b 	@@return
@@stage1:
	ldrh	r0,[r2,0xA]
	mov 	r1,0x8
	sub 	r0,r0,r1
	strh	r0,[r2,0xA]
	b 	@@return
@@stage2:
	b 	@@return
@@stage3:
	ldrh	r0,[r2,0xA]
	mov 	r1,0x8
	add 	r0,r0,r1
	strh	r0,[r2,0xA]
	b 	@@return
@@stage4:
	ldrh	r0,[r2,0xA]
	mov 	r1,0x8
	add 	r0,r0,r1
	strh	r0,[r2,0xA]
	b 	@@return
@@stage5:
	b 	@@return
@@stage6:
	ldrh	r0,[r2,0xA]
	mov 	r1,0x8
	sub 	r0,r0,r1
	strh	r0,[r2,0xA]
	b 	@@return

@@return:
	pop 	r14
	bx 	r14
.pool

positiveslope:
	push	r14
	mov 	r2,r4
	ldrb	r0,[r2,0x1]
	cmp 	r0,0x4
	bls 	@@stage1
	cmp 	r0,0x8
	bls 	@@stage2
	cmp 	r0,0xc
	bls 	@@stage3
	cmp 	r0,0x10
	bls 	@@stage4
	cmp 	r0,0x14
	bls 	@@stage5
	cmp 	r0,0x18
	bls 	@@stage6
	mov 	r0,0x0
	strb	r0,[r2,0x1]
	b 	@@return
@@stage1:
	ldrh	r0,[r2,0x8]
	mov 	r1,0x6
	add 	r0,r0,r1
	strh	r0,[r2,0x8]
	ldrh	r0,[r2,0xA]
	mov 	r1,0x6
	add 	r0,r0,r1
	strh	r0,[r2,0xA]
	b 	@@return
@@stage2:
	b 	@@return
@@stage3:
	ldrh	r0,[r2,0x8]
	mov 	r1,0x6
	sub 	r0,r0,r1
	strh	r0,[r2,0x8]
	ldrh	r0,[r2,0xA]
	mov 	r1,0x6
	sub 	r0,r0,r1
	strh	r0,[r2,0xA]
	b 	@@return
@@stage4:
	ldrh	r0,[r2,0x8]
	mov 	r1,0x6
	sub 	r0,r0,r1
	strh	r0,[r2,0x8]
	ldrh	r0,[r2,0xA]
	mov 	r1,0x6
	sub 	r0,r0,r1
	strh	r0,[r2,0xA]
	b 	@@return
@@stage5:
	b 	@@return
@@stage6:
	ldrh	r0,[r2,0x8]
	mov 	r1,0x6
	add 	r0,r0,r1
	strh	r0,[r2,0x8]
	ldrh	r0,[r2,0xA]
	mov 	r1,0x6
	add 	r0,r0,r1
	strh	r0,[r2,0xA]
	b 	@@return

@@return:
	pop 	r14
	bx 	r14
.pool

negativeslope:
	push	r14
	mov 	r2,r4
	ldrb	r0,[r2,0x1]
	cmp 	r0,0x4
	bls 	@@stage1
	cmp 	r0,0x8
	bls 	@@stage2
	cmp 	r0,0xc
	bls 	@@stage3
	cmp 	r0,0x10
	bls 	@@stage4
	cmp 	r0,0x14
	bls 	@@stage5
	cmp 	r0,0x18
	bls 	@@stage6
	mov 	r0,0x0
	strb	r0,[r2,0x1]
	b 	@@return
@@stage1:
	ldrh	r0,[r2,0x8]
	mov 	r1,0x6
	sub 	r0,r0,r1
	strh	r0,[r2,0x8]
	ldrh	r0,[r2,0xA]
	mov 	r1,0x6
	add 	r0,r0,r1
	strh	r0,[r2,0xA]
	b 	@@return
@@stage2:
	b 	@@return
@@stage3:
	ldrh	r0,[r2,0x8]
	mov 	r1,0x6
	add 	r0,r0,r1
	strh	r0,[r2,0x8]
	ldrh	r0,[r2,0xA]
	mov 	r1,0x6
	sub 	r0,r0,r1
	strh	r0,[r2,0xA]
	b 	@@return
@@stage4:
	ldrh	r0,[r2,0x8]
	mov 	r1,0x6
	add 	r0,r0,r1
	strh	r0,[r2,0x8]
	ldrh	r0,[r2,0xA]
	mov 	r1,0x6
	sub 	r0,r0,r1
	strh	r0,[r2,0xA]
	b 	@@return
@@stage5:
	b 	@@return
@@stage6:
	ldrh	r0,[r2,0x8]
	mov 	r1,0x6
	sub 	r0,r0,r1
	strh	r0,[r2,0x8]
	ldrh	r0,[r2,0xA]
	mov 	r1,0x6
	add 	r0,r0,r1
	strh	r0,[r2,0xA]
	b 	@@return

@@return:
	pop 	r14
	bx 	r14
.pool


wavebeamhijack:
	push	r5
	push	r4
	ldrb	r0,[r4,0xF]
	cmp 	r0,0x9
	beq 	@@chargedwave
	cmp 	r0,0x3
	;bne 	@@return
@@normalwave:
	ldr 	r1,=0x8051084
	b 	@@continue
@@chargedwave:
	ldr 	r1,=0x8051780
	b 	@@continue
@@continue:
	push	r1
	ldrb	r1,[r1]
	mov 	r0,0x1
	and 	r0,r1
	mov 	r1,r4
	cmp 	r0,0x0
	beq 	@@reset
	ldrb	r0,[r1,0x1]
	add 	r0,r0,0x1
	cmp 	r0,0x18
	bcc 	@@dontreset
@@reset:
	mov 	r0,0
@@dontreset:
	strb	r0,[r1,0x1]
	ldrb	r0,[r1,0x10]
	cmp 	r0,0x0
	beq 	@@horizontal
	cmp 	r0,0x2
	bhi 	@@vertical
	cmp 	r0,0x1
	beq 	@@diagup
	cmp 	r0,0x2
	beq 	@@diagdown
@@diagup:
	ldrb	r0,[r1]
	mov 	r1,0x40
	and 	r0,r1
	cmp 	r0,0
	bne 	@@positiveslope
	b 	@@negativeslope
@@diagdown:
	ldrb	r0,[r1]
	mov 	r1,0x40
	and 	r0,r1
	cmp 	r0,0
	beq 	@@positiveslope
	b 	@@negativeslope

@@horizontal:
	bl 	horizontal
	b 	@@return
@@vertical:
	bl 	vertical
	b 	@@return
@@positiveslope:
	bl 	positiveslope
	b 	@@return
@@negativeslope:
	bl 	negativeslope
	b 	@@return


@@return:
	pop 	r1
	pop 	r4
	pop 	r5
	ldr 	r0,=Equipment
	ldrb	r0,[r0,0xD]
	mov 	r15,r1
.pool
