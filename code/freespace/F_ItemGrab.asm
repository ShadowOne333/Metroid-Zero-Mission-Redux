CheckSuitAnim:
	.notice tohex(.)
	ldr r1,=CurrSprite + 0x1E
	ldrb r0,[r1,#0x10]
	beq @@Return
	ldrb r0,[r1,#0x0]
	;cmp r0,#0xF
	;beq @@Call
	cmp r0,#0xE
	bne @@Return
@@Call:
	bl 0x8055fa4
	ldr r1,=SamusWeaponInfo
	mov r0,#0x0
	strb r0,[r1,#0x5]
@@Return:
	ldr r0,=0x801BB00
	mov pc,r0
.pool

EquipmentGet:
	orr	r1,r0
	strb	r1,[r2,0Eh]
	ldrb	r1,[r2,0Fh]
.ifdef unkItemsasm
	mov	r3,24h		;checks for space jump or grav and prevents their activation
	and	r3,r1		; r3,r0
	cmp	r3,0h		;
	bne	@@Return	;
.endif
	orr	r0,r1
	strb	r0,[r2,0Fh]
@@Return:
	bx	r14
	
BeamGet:
	orr	r1,r0
	strb	r1,[r2,0Ch]
	ldrb	r1,[r2,0Dh]
.ifdef unkItemsasm
	mov	r3,8h		;checks for plasma and prevents its activation
	and	r3,r1		; r3,r0
	cmp	r3,0h		;
	bne	@@Return	;
.endif
	orr	r0,r1
	strb	r0,[r2,0Dh]
@@Return:
	bx	r14
.pool
