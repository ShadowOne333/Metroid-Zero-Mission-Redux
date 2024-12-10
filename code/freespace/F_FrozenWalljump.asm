CheckSpritesWallJump:	
	push r5,r6,lr
	ldrb r0,[r4,7h]
	cmp r0,0h
	bne @@end         ;墙跳时间不为0则跳过
	ldr r5,=30001ACh
@@Loop:	
	ldrb r0,[r5]
	cmp r0,0h         ;检查是否死亡
	beq @@NextSpriteCheck
	mov r2,r5
	add r2,20h
	ldrb r0,[r2,5h]   ;检查属性是否是砖块
	cmp r0,1h
	beq @@PassFrozenCheck
	ldrb r0,[r2,10h]
	cmp r0,0h
	beq @@NextSpriteCheck ;检查冰冻时间是否不为零
@@PassFrozenCheck:	
	mov r6,0h
	bl CheckSpritesWallJumpLeftOrRightDicide
	cmp r0,1h
	bne @@NextSpriteCheck
	ldrh r0,[r4,0Eh]
	mov r1,10h
	and r1,r0
	cmp r1,0h
	beq @@SamusFaceLeft
	mov r0,20h
	b @@WriteWallDirection
	.pool
@@SamusFaceLeft:
	mov r0,10h
@@WriteWallDirection:
	strb r0,[r4,0Ch]     ;写入墙面向
	mov r0,8h
	strb r0,[r4,7h]      ;墙跳时间写入
	mov r0,80h
	mov r2,r5
	add r2,20h
	ldrb r1,[r2,17h]
	orr r0,r1
	strb r0,[r2,17h]     ;可被登标记
	bl ClearOtherSpritesWallFlag
	b @@end
@@NextSpriteCheck:
	add r5,38h
	ldr r0,=30006ECh
	cmp r5,r0
	bcc @@Loop
@@end:
	ldrb r0,[r4,7h]
	cmp r0,0h
	pop r5,r6
	pop r15
.pool

CheckBlockWallAndSpriteWall:     ;检查砖块墙壁和精灵墙壁都支持墙跳
	push lr
	bl 8057DF8h
	mov r1,80h
	lsl r1,r1,11h
	and r1,r0
	cmp r1,0h
	bne @@end
	mov r6,1h
	bl CheckSpritesWallJumpLeftOrRightDicide
	cmp r0,0h
	beq @@end
	mov r0,0h
	strb r0,[r4,4h]
	add r5,20h
	strb r0,[r5,17h]
	mov r0,80h
	lsl r0,r0,11h
@@end:
	pop r1
	bx r1
.pool	
CheckSpritesWallJumpLeftOrRightDicide:
	push r6,lr
	add sp,-10h
	ldrh r0,[r4,14h] ;s Y坐标
	str r0,[sp,4h]   ;人极下
	cmp r6,0h
	bne @@SpritesWallSecondCheck
	sub r0,5Ch 
	b @@SamusTopWrite
@@SpritesWallSecondCheck:
	sub r0,20h
@@SamusTopWrite:	
	str r0,[sp]      ;人极上或人脚上
	ldrh r0,[r4,0Eh]
	cmp r6,0h
	bne @@SecondFaceCheck
	mov r1,10h	
	and r1,r0
	cmp r1,0h
	beq @@SamusLeftFace
	;-------------萨姆斯面右
	ldrh r0,[r4,12h] ;s X坐标
	add r0,1Eh       ;人极右+2
	str r0,[sp,0Ch]
	sub r0,3Ah       ;人极左
	str r0,[sp,08h]
	b @@Peer
@@SamusLeftFace:
	ldrh r0,[r4,12h] ;s X坐标
	sub r0,1Eh       
	str r0,[sp,8h]   ;人极左+2
	add r0,3Ah
	str r0,[sp,0Ch]  ;人极右
	b @@Peer
@@SecondFaceCheck:
	mov r1,20h	
	and r1,r0
	cmp r1,0h
	beq @@SamusOtherFace
	ldrh r0,[r4,12h] ;s X坐标
	add r0,28h       ;人极右
	str r0,[sp,0Ch]
	sub r0,50h       ;人极左
	str r0,[sp,08h]
	b @@Peer
@@SamusOtherFace:
	ldrh r0,[r4,12h] ;s X坐标
	sub r0,28h       
	str r0,[sp,8h]   ;人极左
	add r0,50h
	str r0,[sp,0Ch]  ;人极右
@@Peer:
	cmp r6,0h
	beq @@WallJumpFlag
	ldr r5,=30001ACh
@@Loop:	
	mov r2,r5
	add r2,20h
	ldrb r0,[r2,17h]
	mov r1,80h
	and r1,r0
	cmp r1,0h
	bne @@WallJumpFlag
	add r5,38h
	ldr r0,=30006ECh
	cmp r5,r0
	bcc @@Loop
	mov r0,0h
	b @@end
	.pool
@@WallJumpFlag:	
	ldrh r0,[r5,2h]  ;精Y坐标
	mov r6,0Ah
	ldsh r6,[r5,r6]  ;精上判定值
	add r0,r6
	lsl r0,r0,10h
	lsr r0,r0,10h
	ldrh r1,[r5,2h]  ;精Y坐标
	mov r6,0Ch
	ldsh r6,[r5,r6]  ;精下判定值
	add r1,r6
	lsl r1,r1,10h
	lsr r1,r1,10h
	ldrh r2,[r5,4h]  ;精X坐标
	mov r6,0Eh
	ldsh r6,[r5,r6]  ;精左判定值
	add r2,r6
	lsl r2,r2,10h
	lsr r2,r2,10h
	ldrh r3,[r5,4h]  ;精X坐标
	mov r6,10h
	ldsh r6,[r5,r6]  ;精右判定值
	add r3,r6
	lsl r3,r3,10h
	lsr r3,r3,10h
	bl 800E6F8h
@@end:	
	add sp,10h
	pop r6
	pop r1
	bx r1
	.pool
	
ClearOtherSpritesWallFlag:
	ldr r0,=30001ACh
@@Loop:	
	cmp r0,r5
	beq @@NextSpriteCheck
	mov r1,r0
	add r1,20h
	ldrb r3,[r1,17h]
	mov r2,80h
	and r2,r3
	cmp r2,0h
	beq @@NextSpriteCheck
	mov r2,80h
	eor r3,r2
	strb r3,[r1,17h]
@@NextSpriteCheck:
	add r0,38h
	ldr r1,=30006ECh
	cmp r0,r1
	bcc @@Loop
	bx r14
	.pool