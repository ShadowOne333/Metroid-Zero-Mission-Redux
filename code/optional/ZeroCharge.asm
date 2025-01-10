zeroPistolCharge:

.org 0x804EECE		; Show charge animation for Zero Suit
	nop

.org 0x80523C4		; No more hud charge meter display
	b 0x8052474

.org 0x8007DE4		; Match charge counter to regular charge animation speed
	cmp    r0,0x40

;.org 0x8007D5E		; Auto charge
	;bne 0x8007D82
.org 0x8007E34		; Regular charge functionality
	b 0x8007EDE

.org 0x8055084
	;mov    r15,r0

.org 0x80551F2		; Silent charge
	;nop
	;nop
