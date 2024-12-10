rShotasm:

; hijack code
.org 0x80081B0
	bl      CheckFireBeam
	b       0x80081B8
