; This is used for hackers to Configure the area, door and music track you start the game at.

startingRoomasm:
; Debug tests for UnkItems
; Area 5, Door 38 = Normal landing site for Redux
; Area 0, Door 0 for vanilla Brinstar starting room
; Area 0, Door 33 for Varia Suit
; Area 5, Door 25 for Plasma Beam
; Area 1, Door 50 for Space Jump
; Area 3, Door 1F for Gravity Suit
; Area 6, Door 58 for Charlie Fight (Needs Suitless Samus)
.org 0x8060F5C
	ldr     r0,=AreaID
	mov     r1,0			; New area
	strb    r1,[r0]
	mov     r1,0x0			; New door 0x38, 0x25 debug
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

.include "code/optional/RestoreOriginalCloseup.asm"
