; ???
.org 0x832C2C8
	.import "code/fundamentals/particles.gfx"

; GFX for SM controls
.org 0x845a600
	.import "code/gfx/controlsText.lz"
.org 0x845c0f4
	.import "code/gfx/fileSelectSNES.lz"
.org 0x8458e14
	.import "code/gfx/fileSelectSNES2.lz"

; This replaces the flashing hatch graphics for the mothership, for when red hatches take more than one missile to open.
.org 0x85DA40C
	.import "code/gfx/mothership.gfx"
;
; This replaces the USA font with the EUR font.
.org 0x8415C60
	.import "code/gfx/ZMUFont.gfx"
.org 0x841D460
	.import "code/gfx/ZMUFont.gfx"
; This adds a special character from EUR that says [100%].
.org 0x841B780
	.import "code/gfx/100.gfx"	
;
; Updates Character Widths for using EUR font
.org 0x840D7B0
	.import "code/gfx/ZMUFontWidths.bin"

.org 0x8400E08
	.incbin "code/gfx/status.lz"
	
.org 0x8409d70
	.incbin "code/gfx/items.lz"
	
.org 0x83FEFB8
	.incbin "code/gfx/icons.lz"

; Compact HUD, low energy HUD, 3 colors HUD, 4th map color HUD
.org 0x832BAC8
	.incbin "code/gfx/genspritept1.gfx"
.org 0x8331348
	.incbin "code/gfx/genspritept2.gfx"
.org 0x832BA4E ; shade of yellow for generic sprite
	.halfword 0x02D6
; transparent map
.org 0x840E0C4
	.incbin "code/gfx/map.gfx"
	
; mini escape timer
.org 0x832618C
	.incbin "code/gfx/timer.gfx"
.org 0x833d794
	.incbin "code/gfx/timer.gfx"
.org 0x833DF9E ; second digit X
	.byte 06h
.org 0x833DFA4 ; first colon X
	.byte 0Ch
.org 0x833DFAA ; third digit X
	.byte 12h
.org 0x833DFB0 ; fourth digit X
	.byte 18h
.org 0x833DFB6 ; second colon X
	.byte 1Eh
.org 0x833DFBC ; fifth digit X
	.byte 24h
.org 0x833DFC2 ; sixth digit X
	.byte 2Ah
	
;HUD Energy positions (in pixels) (WIP, will need ASM to change first half X position)
;.org 0x8052326; = 02 to ?? (First half Y position)
;.org 0x8052378; = 02 to ?? (Second half Y position)
;.org 0x8052390; = 20 to ?? (Second half X position)

;HUD Ammo positions (in pixels)
;.org 0x8052484; = 40 46 to ?? 20 } (Missiles Y, first byte)
;.org 0x8052486; = 06 74 to 10 70 /
.org 0x805249C; = 36 to ?? (Missiles X)
	mov r1,2Ch
;.org 0x80524D8; = 02 to ?? (Super Missiles Y)
.org 0x80524F0; = 50 to ?? (Super Missiles X)
	mov r1,46h
;.org 0x805252C; = 02 to ?? (Power Bombs Y)
.org 0x8052544; = 6A to ?? (Power Bombs X)
	mov r1,5Ah

;HUD Minimap positions (in pixels)
;.org 0x805257E; = 0A to ?? (Minimap flicker Y)
;.org 0x8052596; = DE to ?? (Minimap flicker X) 
;.org 0x8052602; = FA to ?? (Minimap Y)
;.org 0x805261A; = D6 to ?? (Minimap X)

;HUD Escape Timer Positions (in pixels)
.org 0x8053A78; = 02 to ?? (Escape timer Y)
	mov r0,01h
.org 0x8053A7A ; -> 8D to ?? escape timer X
    mov r1,84h

.org 0x85E0420
	.incbin "code/gfx/zebesunlock.pal"

.org 0x85E0220
	.incbin "code/gfx/shipunlock.pal"

; minimap blank tiles replaced with air
; .org 0x840d700
	; .byte 00
; .org 0x840d750
	; .byte 00
