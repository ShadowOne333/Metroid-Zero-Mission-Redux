; [ZM_U] Change the Gravity Suit's palette to purple instead of pink

purpleGravity:

; Default Gravity colours
.org 0x82383C8	;0x82379E8
	.halfword 0x2207,0x2408,0x57FF
; Visor
	.halfword 0x3BE0,0x1EA4,0x01A0
; Pink/purple hue
	.halfword 0x421F,0x5914,0x30AA	; Super Metroid colours
	;.halfword 0x6DDB,0x50D4,0x408F	; Gallery Image #1 palette
; Main body
	.halfword 0x3DEF,0x0108,0x0252,0x035B,0x195F,0x0078,0x0011

; Beam release Gravity palette
.org 0x8238428

; Flashing Gravity palette
.org 0x82384C8

; Speed boost Gravity palette
.org 0x8238508

; Unmorphing Gravity palette
.org 0x8238568

; Saving Gravity palette
.org 0x82385A8

; Charging Beam Gravity palette
.org 0x8238608

; Map Download Gravity palette
.org 0x8238748

; Frozen Gravity palette
.org 0x8238788

;-------------------------------------
; Original colours:
;Default Gravity
	;.word 0x2207,0x2408,0x57FF,0x3BE0,0x1EA4,0x01A0,0x56FF,0x4D9D
	;.word 0x4891,0x3DEF,0x0108,0x0252,0x035B,0x195F,0x0078,0x0011

; Gallery images

; 0x7F20 7F9A 20A8 310C 4D30 3D8E 5917 49B1 51F3 617A 69FB 5E76 725C 72BD 76FD 7B5E
; 7F20 0861 2C89 0960 2969 44F1 1661 5D18 1B01 699B 27A2 43AA 6E5C 76DD 5BD3 279F
; 7F20 0000 1825 1083 2849 346B 2107 408F 50D4 398E 5CF9 1EC3 6179 6DDB 6E3C 771D
