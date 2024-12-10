BetterPhysic:
	push	r14
	mov		r1,r0
	ldr		r0,=SamusDataCopy
	ldr		r2,=SamusData
	ldr		r3,=ScrewAttackFlag
	cmp		r1,4h
	beq		@@Landing
	cmp		r1,7h
	beq 	@@Landing
	cmp		r1,18h
	beq		@@Landing
	cmp		r1,19h
	beq		@@Landing
	cmp		r1,05h
	beq		@@Landing
;	cmp		r1,0Fh
;	beq		@@MAMorph
	cmp		r1,1Bh
	bne		@@Return1
@@MAMorph:
	bl		MidAirMorph
	b		@@Return
@@Landing:
    ldrb    r4,[r2,0x5]
    cmp     r4,0x1
    bne     @@Return1
	bl		Land
	b		@@Return
@@Return1:
	mov		r1,1h
@@Return:
	pop		r5
	bx		r5
.pool

Land:			;prevents X speed reset when landing
	ldr		r1,=ButtonInput
	ldrh	r1,[r1]
	ldrb	r4,[r2,0Eh]
	and		r1,r4
	cmp		r1,r4
	bne		@@Fail   ;checks if direction held and direction facing is the same
	ldrb	r1,[r2]
	cmp		r1,22h
	beq		@@Fail
	cmp		r1,26h
	beq		@@Fail
	ldrb	r1,[r2,5h]
	cmp		r1,1h		;speedboost flag
	bne		@@Next
	mov		r1,0A0h		;should be max speedboost value
	strb	r1,[r2,0Ah]	;sets speedboost timer to max (speedboost will restart otherwise)
@@Next:
	mov		r1,r2
	ldmia   [r1]!,r4-r6 
	stmia   [r0]!,r4-r6 
	ldmia   [r1]!,r4-r6 
	stmia   [r0]!,r4-r6 
	ldmia   [r1]!,r4,r5 
	stmia   [r0]!,r4,r5 
	ldrb    r0,[r2,3h]  
	cmp     r0,0h       
	beq     @@ResetFlags    
	ldrh    r0,[r2,0Eh] 
	mov    	r1,30h      
	eor    	r0,r1       
	mov    	r1,0h       
	strh    r0,[r2,0Eh] 
	strb    r1,[r2,3h]
@@ResetFlags:	
	mov    	r0,0h       
	strb    r0,[r2,2h]  
	strb    r0,[r2,4h]    
	strb    r0,[r2,7h]  
	mov    	r1,0h       
	strh    r0,[r2,0Ch] 
	strh    r0,[r2,10h] 
	strh    r0,[r2,18h] 
	strb    r1,[r2,1Ch] 
	strb    r1,[r2,1Dh] 
	ldrb    r0,[r2,8h]  
	cmp     r0,0B4h     
	beq     @@ZeroFlags   
	strb    r1,[r3]
@@ZeroFlags:	
	strb    r1,[r3,1h]  
	strb    r1,[r3,2h]
	b 		@@Return
@@Fail:
	mov		r1,1h ;fail flag
@@Return:	
	bx		r14
.pool

MidAirMorph:    ;prevents Y and X velocity and speedboost flag reset when midair morph/unmorphing
	mov		r1,r2     
	ldmia   [r1]!,r4-r6 
	stmia   [r0]!,r4-r6 
	ldmia   [r1]!,r4-r6 
	stmia   [r0]!,r4-r6 
	ldmia   [r1]!,r4,r5 
	stmia   [r0]!,r4,r5 
	ldrb    r0,[r2,3h]  
	cmp     r0,0h       
	beq     @@ResetFlags    
	ldrh    r0,[r2,0Eh] 
	mov    	r1,30h      
	eor    	r0,r1       
	mov    	r1,0h       
	strh    r0,[r2,0Eh] 
	strb    r1,[r2,3h]
@@ResetFlags:	
	mov    	r0,0h       
	strb    r0,[r2,2h]  
	strb    r0,[r2,4h]    
	strb    r0,[r2,7h]  
	mov    	r1,0h       
	strh    r0,[r2,0Ch] 
	strh    r0,[r2,10h]  
	strb    r1,[r2,1Ch] 
	strb    r1,[r2,1Dh] 
	ldrb    r0,[r2,8h]  
	cmp     r0,0B4h     
	beq     @@Return   
	strb    r1,[r3]
@@Return:	
	strb    r1,[r3,1h]  
	strb    r1,[r3,2h]
	bx     	r14