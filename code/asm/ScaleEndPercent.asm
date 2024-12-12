; Allows hackers to scale the item collection percentage at the end of the game to the correct amount, based on what is in each area.

scaleEndPercentasm:

; hijack calc percent routine
.org 0x8087B98
	bl      FixCalcPercent
	
; hijack percent displayed at end
.org 0x8086892
	bl      FixDisplayedPercent
