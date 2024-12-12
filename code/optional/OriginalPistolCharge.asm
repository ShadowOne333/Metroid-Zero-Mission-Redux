originalPistolCharge:

.org 0x804EECE		; Show charge animation for Zero Suit
	.halfword 0xD018	; beq #0x34

.org 0x80523C4		; No more hud charge meter display
	.halfword 0xD156	; bne #0xB0

.org 0x8007DE4		; Match charge counter to regular charge animation speed
	cmp    r0,0x6F

;.org 0x8007D5E		; Auto charge
	;bne 0x8007D82
.org 0x8007E34		; Regular charge functionality
	.halfword 0xD153	; bne #0xAA

.org 0x8055084
	ldrb r1, [r0, #0xD]

.org 0x80551F2		; Silent charge
	;bl ????
