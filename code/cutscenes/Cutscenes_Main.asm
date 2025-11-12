; Load a different set of GFX and Tile table for the Mother Brain cutscene with Samus in the elevator if Samus got Varia Suit

.definelabel CallLz77Uncomp,0x800090c

cutscenesVariaasm:

; Mother Brain cutscene data:
	; Tile Table 	= 382434
	; Graphics 	= 37B404
	; Varia Palette	= 3761E4

.org 0x8063008
	push r4,r5,r6,r7,lr

.org 0x8063230
	pop r4,r5,r6,r7

.org 0x80630c4
	nop
	nop

.org 0x806305c
	ldr r0,=MotherBrainCloseUp
	mov pc,r0
	.pool

; Kraid Rising cutscene data: (Code at 62994)
	; Graphics 	= 36F214
	; Varia Palette	= 36C0D8

.org 0x8062a24
	nop
	nop

.org 0x80629cc
	ldr r0,=KraidRising
	mov pc,r0
	.pool

; Ridley Spawn cutscene data: (Code at 656E8)
	; Graphics 	= 3B8CCC
	; Varia Pal1	= 3B5E74
	; Varia Pal2	= 3B5E94

.org 0x806570E
	;nop
	;nop

.org 0x8065748
	ldr r1,=RidleySpawning
	mov pc,r1
	.pool

; Tourian Escape cutscene data: (Code at 82664)
	; Tile Table 	= 484D5C
	; Graphics 	= 481CCC
	; Varia Palette	= 4796C0, 479760

.org 0x80826d0
	ldr r0,=TourianEscape
	mov pc,r0
	.pool

.org 0x80826f0
	nop
	nop

