scaleEndPercentasm:

; hijack calc percent routine
.org 0x8087B98
	bl      FixCalcPercent
	
; hijack percent displayed at end
.org 0x8086892
	bl      FixDisplayedPercent