; Shinesparking is now steerable with the DPAD, within reason. Vertical sparks steer horizontally, Horizontal sparks steer vertically. Diagonal sparks are also effected.

sparkSteeringasm:

.org 0x80077BC
	cmp		r0,0FFh
	beq		@@Skip
	bl 		80074E8h
@@Skip:
	.halfword 0x4907	;loads value from pool
	bl		BXR1
.org 0x80077E4
	.word	SpeedSteer + 1
