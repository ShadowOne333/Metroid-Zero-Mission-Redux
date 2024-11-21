startingRoomasm:

; Area 0, Door 33 is the one for Varia Suit
; Area 5, Door 25 is the one for Plasma Beam
.org 0x8060F5C
	ldr     r0,=AreaID
	mov     r1,5			; New area
	strb    r1,[r0]
	mov     r1,0x38		; New door 0x38, 0x25 debug
	strb    r1,[r0,2h]
	ldr     r0,=HideHudFlag
	mov     r1,0
	strh    r1,[r0]
	ldr     r0,=0x3000C75
	strb    r1,[r0]
	mov     r0,0x0E			; Music track 0x0E, 0x17 debug
	bl      0x80039F4
	b       0x8060FDA
	.pool
