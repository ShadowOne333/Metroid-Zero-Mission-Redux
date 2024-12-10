SpeedSteer:
	push	r14
	ldr 	r3,=ButtonInput
	ldr 	r2,=SamusData
	ldrb 	r0,[r2]
	cmp 	r0,22h		;checks if shinesparking
	beq 	@@SparkType
	cmp 	r0,26h		;checks if ballsparking
	beq 	@@SparkType
	b 		@@Return
.pool
@@SparkType:
	ldrb 	r0,[r2,4h]
	cmp 	r0,0h		;checks for upwards Shinespark
	beq 	@@UpwardSpark
	b 		@@SideSpark


@@UpwardSpark:
	ldrb 	r0,[r3]		;button input
	mov 	r1,10h
	and 	r1,r0
	cmp 	r1,10h		;checks if right is pressed
	beq 	@@MoveRight
	mov 	r1,20h
	and 	r1,r0
	cmp 	r1,20h		;checks if left is pressed
	beq 	@@MoveLeft
	b 		@@Return

@@SideSpark:
	ldr	 	r1,=ChangedInput
	ldrh 	r0,[r1]
	mov	 	r1,1h
	and	 	r1,r0
	cmp	 	r1,1h
	beq  	@@BreakSpark		   
	ldrh 	r0,[r3]
	mov 	r1,40h
	and 	r1,r0
	cmp 	r1,40h	;checks if up is being pressed
	beq 	@@MoveUp
	mov 	r1,80h
	and 	r1,r0
	cmp 	r1,80h	;checks if just down is being pressed
	beq 	@@MoveDown
	b 		@@Return

@@BreakSpark:
	mov		r0,0Bh
	strb	r0,[r2]				;shinespark to spinjump
	mov		r0,0h			
	strb	r0,[r2,4h]
	strh	r0,[r2,1Ch]
	ldr		r2,=ScrewAttackFlag		;needs to be reset or will crash game for invalid animation
	strh	r0,[r2]
	strb	r0,[r2,2h]
	mov 	r0,8Bh
	ldr		r1,=PlaySound + 1		;starts speedboost sound, resets shinespark sound
	bl		Wrapper
	b 		@@Return
@@MoveRight:
	ldrh	r0,[r2,12h]
	add		r0,4h
	strh	r0,[r2,12h]
	b @@Return

@@MoveLeft:
	ldrh	r0,[r2,12h]
	sub		r0,4h
	strh	r0,[r2,12h]
	b	 @@Return
@@MoveUp:					;moves player upwards but doesnt start up spark
	ldrh	 r0,[r2,14h]	
	sub	 	 r0,4h
	strh	 r0,[r2,14h]	;Changes Y position, makes it move player Upwards
	b	 @@Return
	
@@MoveDown:					;moves player down 
	ldrh	r0,[r2,14h]
	add		r0,4h		
	strh	r0,[r2,14h]		;Changes Y position, makes it move player downwards
	b	 @@Return

@@Return:
	ldr	r1,=3001588h
	pop	r0	   
	bx	r0
.pool

Wrapper:
	bx	r1