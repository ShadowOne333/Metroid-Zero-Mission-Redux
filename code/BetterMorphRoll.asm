; Makes the morphball only do its "rolling" animation if the ball is moving

.org 0x80075FE	; Moved from 75FA for Project ZM
	bl MorphCheck		; Checks when to 0 animation values
.org 0x80077AC
	bl IdleStop		; Stops animation if ball is idle


.org 0x8011F10	; 0x8043DF0 ; Croco AI, Unused, moved to 11F10 since its area cleared up by MAGE
IdleStop:
	push r5
	mov r5,r0
	ldrb r0,[r4]		;checks if not moving in morphball
	cmp r0,11h
	beq @@Return
	add r5,1h		;if moving, adds to animation counter like normal
	strb r5,[r4,1Ch]
@@Return:
	pop r5
	bx r14

MorphCheck:
	ldrb r0,[r2]
	cmp r0,11h		;checks ball poses
	beq @@ButtonCheck
	cmp r0,12h		;checks ball poses
	beq @@ButtonCheck
@@Zero:
	strb r1,[r2,1Ch]	;zeros animation values
	strb r1,[r2,1Dh]
	b @@Return
@@ButtonCheck:			;needed if player is unmorphing, otherwise the game can 
	push r1			;load an animation that doesnt exist and crash
	ldr r0,=3001380h	;changed input
	ldrh r0,[r0]
	mov r1,40h
	and r0,r1
	pop r1
	cmp r0,40h		;checks if pressed up is pressed
	beq @@Zero
@@Return:
	bx r14
	
.pool
