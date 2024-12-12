; In Fusion, samus could fire a charged beam without interrupting her spin jump by pressing [R]. This ASM brings that functionality back to Zero Mission.

rShotasm:

; hijack code
.org 0x80081B0
	bl      CheckFireBeam
	b       0x80081B8

; Prevent Screw Attack from overwriting jump glow palette, so when your jump glows are bright you will know your beam is charged.
.org 0x800B72A
	.byte 0x5B
