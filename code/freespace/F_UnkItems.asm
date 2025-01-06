;----------
; UNKITEMS
;----------
StartFullSuit:
	strh    r0,[r1]
	strh    r0,[r1,6]
	mov     r0,1
	strb    r0,[r1,0x12]
	bx      r14

ChangeSuit:
	ldr     r6,=Equipment
	ldrb    r0,[r6,0x12]
	push    r0
	cmp 	r0,2h		; Suitless Samus fix by HAMGER
	beq 	@@Return	; branch if Suitless Samus
.ifdef unkItemsasm	; Fix by kiliwily
	mov  	r1,1h		;cmp     r0,1
	strb 	r1,[r6,0x12]	;bne     @@Return
	; if full suit
; Default -- If full suit and not have BigSuit = 0x10 for Varia, or 0x20 for Gravity
	ldrb    r0,[r6,0xF]
	mov     r1,BigSuit
	and     r0,r1
	cmp     r0,0
	bne     @@Return
	mov     r0,0h
	strb    r0,[r6,0x12]
.else	; If KnownItems
; Changed code -- If full suit and not have Bigsuit = 0x30 (Gravity + Varia)
	ldrb    r0,[r6,0xF]
	mov 	r1,BigSuit
	and     r0,r1
	cmp     r0,r1
	beq     @@Return
	mov 	r0,0h
	strb    r0,[r6,0x12]
.endif
@@Return:
	add     sp,-4h
	bx      r14
	.pool

RestoreSuit:
	add     sp,4h
	pop     r0
	ldr     r1,=Equipment
	strb    r0,[r1,0x12]
	pop     r3-r5
	bx      r14
	.pool

StatusScreen:	; 2 = Suitless, 1 = Full, 0 = Normal
	ldr 	r0,=Equipment
	ldrb    r2,[r0,0x12]
	cmp     r2,2h
	beq     @@Return		; return r2 = 2 if suitless
.ifdef unkItemsasm
; This part has issues with showing up non-full suit when deactivating Varia/Gravity
; Look into Charlie's cutscene code to make it activate both Varia and Gravity to possibly fix this.
	;cmp 	r2,1h
	;beq 	@@Return		; Fix for FullSuit anim after Charlie is defeated
; Default code -- If have BigSuit = 0x10 for Varia, or 0x20 for Gravity
	ldrb    r2,[r0,0xF]
	mov     r1,BigSuit
	and     r2,r1
	cmp     r2,0
	beq     @@Return		; return r2 = 0 if no gravity
	mov     r2,1			; return r2 = 1 if gravity 
.else	; If KnownItems
; Changed code -- If have Bigsuit = 0x30 (Gravity + Varia)
	ldrb    r2,[r0,0xF]
	mov 	r1,BigSuit
	and     r2,r1
	cmp     r2,r1
	bne     @@Return		; return r2 = 0 if not gravity + varia
	mov     r2,1			; return r2 = 1 if gravity + varia
.endif
@@Return:
	bx      r14
	.pool

SwitchText:
	push    r14
	; check for full suit
	ldr     r0,=Equipment
	ldrb    r0,[r0,0x12]
	cmp     r0,1
	beq     @@ReplacedCode
	; check if unknown item
	mov     r0,r8
	cmp     r0,0xC
	beq     @@IsUnknown
	cmp     r0,0xF
	beq     @@IsUnknown
	cmp     r0,0x14
	bne     @@ReplacedCode
@@IsUnknown:
	ldr     r0,=MessageInfo
	ldrb    r1,[r0,0xC]
	cmp     r1,2
	bne     @@ReplacedCode
	mov     r1,0x23
	strb    r1,[r0,0xA]
@@ReplacedCode:
	bl      0x806F28C
	ldr     r1,=MessageInfo
	mov     r2,r8
	strb    r2,[r1,0xA]
	pop     r1
	bx      r1
	.pool
	
GetJingleNumber:
	ldr     r0,=Equipment
	ldrb    r0,[r0,0x12]
	cmp     r0,1
	beq     @@FullSuit
	mov     r0,0x42
	b       @@Return
@@FullSuit:
	mov     r0,0x37	; Get Item Jingle (0x37), 0x42 for UnkItem Jingle
@@Return:
	bx      r14
	.pool

GetSoundNumber:
	ldr     r0,=Equipment
	ldrb    r0,[r0,0x12]
	cmp     r0,1
	beq     @@FullSuit
	ldr     r0,=0x20F
	b       @@Return
@@FullSuit:
	ldr     r0,=0x1F7
@@Return:
	bx      r14
	.pool
