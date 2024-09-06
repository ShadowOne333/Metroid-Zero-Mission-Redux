; Moved from 0x8761000 for compatibility with Project ZM
flashroutine:
	ldr	r0,=30054E4h
	ldrb	r0,[r0]	
	lsl	r0,r0,18h   
	asr	r0,r0,18h   
	cmp	r0,0h	 
	beq	doorsnotunlocked
	ldr		r0,=08056F1Ah
	mov		r15,r0
doorsnotunlocked:
	ldr	r1,=30056F0h
	ldrb	r0,[r1]	
	add	r0,1h
	mov	r2,0h
	strb	r0,[r1]	
	lsl	r0,r0,18h   
	lsr	r0,r0,18h   
	cmp	r0,7h
	bls	@@return	
	strb	r2,[r1]	
	ldrb	r0,[r1,1h]  
	add	r0,1h
	strb	r0,[r1,1h]  
	lsl	r0,r0,18h   
	asr	r0,r0,18h   
	cmp	r0,5h
	ble	@@dontreset	
	strb	r2,[r1,1h]
@@dontreset:
	ldrb	r1,[r1,1h]  
	lsl	r1,r1,18h   
	asr	r1,r1,18h   
	lsl	r1,r1,5h	
	add	r1,10h	 
	add	r1,r4,r1	
	ldr	r2,=5000030h
	push	r4
	ldr	r0,=@@returnlink
	add	r0,1h
	mov	r14,r0
	ldr	r0,=080031E4h
	add	r0,1h
	mov	r4,r0

	mov	r0,10h	
	str	r0,[sp]
	mov	r0,3h
	mov	r3,10h
	bx	r4
@@returnlink:
	pop	r4
@@return:
	ldr	r0,=08056F58h
	mov	r15,r0

.pool
