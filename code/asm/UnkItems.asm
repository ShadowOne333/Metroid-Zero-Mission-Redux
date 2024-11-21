unkItemsasm:

;uncomment the instructions below if you use Biosparks unknown items patch and also activate fullsuit
;.org 0x800B554	
	;cmp r1,#0x1	; cmp r1,#0x1

;-----------
; Full Suit
;-----------
; start with full suit

; ENABLING THIS MAKES STARTING ITEMS NOT WORK WITH OG UNK ITEMS
; COMMENTING OUT STARTING ITEMS+THIS MAKES UNK ITEMS UNTOGGABLE
;.org 0x800BD7E
	;bl StartFullSuit

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

;Uncommenting this restores the Power->Varia Suit obtain transition
.org 80600D8h
	add r1,10h
	b 80600EEh
	
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
	.halfword 0x804A,0x8105,0x95,0xCE,0xCB,0xCE,0xCF,0xD7,0xCE,0x40,0x89,0xD4,0xC5,0xCD,0xFE00,0x806E,0xFF00

; Restore the "Unknown Item" text for all 3 items.
.org 0x8760690		; Pointer for Plasma Beam (0x844284C)
	.word	UnkItemText
.org 0x87606B0		; Pointer for Space Jump (0x844293C)
	.word	UnkItemText
.org 0x876069C		; Pointer for Gravity Suit (0x844289E)
	.word	UnkItemText

