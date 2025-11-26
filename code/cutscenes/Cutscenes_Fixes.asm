; Miscoloration and other fixes for cutscenes from the original game

cutscenesFixesasm:

// Fix a wrongly coloured pixel in Ridley's tail during the Ridley in Space - Ridley Sitting cutscene
// Import only the GFX data, since it's the only change made to fix it
.org 0x83888FC
	.import "code/cutscenes/RidleySittingGFXFix.bin"
	.align 4,0


