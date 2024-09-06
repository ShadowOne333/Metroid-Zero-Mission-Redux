; Makes the morphball only do its "rolling" animation if the ball is moving
betterRollasm:

.org 0x80075FE	; Moved from 75FA for Project ZM
	bl MorphCheck		; Checks when to 0 animation values
.org 0x80077AC
	bl IdleStop		; Stops animation if ball is idle
