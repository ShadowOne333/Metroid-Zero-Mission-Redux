; [ZM_U] Change the Gravity Suit's palette to purple instead of pink
;.hword or .halfword
blueGravity:

; Default Gravity colours
.org 0x82383C8	;0x82379E8
	.halfword 0x2207,0x2408,0x57FF
; Visor
	.halfword 0x7FE0,0x6EC0,0x45C0
; Pink/purple hue
	.halfword 0x7EBF,0x7593,0x48E4
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
;
     
