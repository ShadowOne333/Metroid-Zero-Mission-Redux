knownItemsasm:

;uncomment the instructions below if you use Biosparks unknown items patch and also activate fullsuit
.org 0x800B554	
	cmp r1,#0x1	; cmp r1,#0x1

;-----------
; Full Suit
;-----------
; start with full suit
.org 0x800BD7E
	;bl	  StartFullSuit
	
; display correct graphics
.org 0x800A692
	mov r9,r0
	mov r4,r1
	bl ChangeSuit
.org 0x800B452
	bl RestoreSuit
	
; display correct palette
.org 0x800B4AE
	beq 0x800B558

; status screen graphics
.org 0x8068DE0
	bl StatusScreen

;----------------
; Obtaining Suit
;----------------
; skip giving players varia for free if they beat charlie and don't already have it
.org 0x805CA36
	mov r0,1
	b   0x805CA52

;.org 0x805CA1A ; skips setting events 0x13 (varia obtained) and 0x44 (varia skipped)
	;b  0x805CA36

;.org 80600d8h
	;add r1,10h
	;b 80600eeh
	
; only activate gravity if obtained
.org 0x80600EC
	ldrb r1,[r2,0xE]
	strb r1,[r2,0xF]
	b    0x8060318	; skip check for SubSpriteData1.workVariable3 = 0x7 (RUINS_TEST_FIGHT_STAGE_STARTING_SUIT_ANIM)

; don't change varia's map tile with full suit
.org 0x806B212
	b    0x806B22E

;------
; Text
;------
	
.org 0x844284C		; Plasma Beam
	.halfword 0x804E,0x8105,0x90,0xCC,0xC1,0xD3,0xCD,0xC1,0x40,0x82,0xC5,0xC1,0xCD,0xFE00,0x806E,0xFF00
	
.org 0x844289E		; Gravity Suit
	.halfword 0x8050,0x8105,0x87,0xD2,0xC1,0xD6,0xC9,0xD4,0xD9,0x40,0x93,0xD5,0xC9,0xD4,0xFE00,0x806E,0xFF00
	
.org 0x844293C		; Space Jump
	.halfword 0x804E,0x8105,0x93,0xD0,0xC1,0xC3,0xC5,0x40,0x8A,0xD5,0xCD,0xD0,0xFE00,0x806E,0xFF00
	
.org 0x8442D22		; Unknown Item
	.halfword 0x804A,0x8105,0x0095,0x00CE,0x00CB,0x00CE,0x00CF,0x00D7,0x00CE,0x0040,0x0089,0x00D4,0x00C5,0x00CD,0xFE00,0x806E,0xFF00

;---------
; Statues
;---------
; replace chozo statue gfx
.org 0x82C15F0
	.import "code/fundamentals/gravity.gfx.lz"
.org 0x82C2B24
	.import "code/fundamentals/gravity_item.palette"

.org 0x82BF534
	.import "code/fundamentals/space.gfx.lz"
.org 0x82C0A58
	.import "code/fundamentals/space_item.palette"

.org 0x82C2BC4
	.import "code/fundamentals/plasma.gfx.lz"
.org 0x82C40F4
	.import "code/fundamentals/plasma_item.palette"

; change secondary sprites
.org 0x801528A
	mov	r0,1
.org 0x80152AE
	mov	r0,1
.org 0x80152D0
	mov	r0,1
.org 0x80152EC
	mov	r0,1

; change chozo statue OAM
.org 0x8015114
	.word 0x875F4E4	

; change ability OAM
; opening
.org 0x80163D4
	.word 0x82B5890
.org 0x80163E4
	.word 0x82B5890
.org 0x80163F4
	.word 0x82B5890
; opened
.org 0x8016438
	.word 0x82B58B0
.org 0x8016448
	.word 0x82B58B0
.org 0x8016458
	.word 0x82B58B0

