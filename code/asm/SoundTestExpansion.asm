.definelabel NumberOfTracks,0x35	; 0x31

soundTestExpansionasm:
.org 0x807ADC4
	.word SoundIDs

.org 0x807AE68
	.word SoundIDs
	
.org 0x807AE7C
	cmp r0,NumberOfTracks-1

.org 0x807AEB8
	mov r0,NumberOfTracks
	
.org 0x807AF00
	.word SoundIDs
	
.org 0x807B028
	mov r0,NumberOfTracks

.org 0x807B08C
	.word SoundIDs

.org 0x8760BAC	;Old SoundID Offset
	.fill 0x30,0xFF

