; Enables initiating a morph ball shinespark, in midair.
ballSparkasm:
; hijack input check
.org 0x8008010
	bl Ballspark
	b 0x8008018

; hijack y pos adjust
.org 0x8009E4C
	bl CheckMidair
	b 0x8009E54
