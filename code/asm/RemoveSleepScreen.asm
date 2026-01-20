;-------------------------------------
; [ZM_U] Ignore L button on the map screen to block access to sleep mode (SpineShark)
.org 0x806E174
	b 0x806E18C	; 80 20 -> 0A E0
;-------------------------------------
; Import graphics to remove the "Sleep" icon on the Map Pause Screen
.org 0x80400698
	.import "code/gfx/removeSleepScreenJapanese.bin"
	.align 4,0
.org 0x8040BE38
	.import "code/gfx/removeSleepScreenHiragana.bin"
	.align 4,0
.org 0x8040BFFC
	.import "code/gfx/removeSleepScreenEnglish.bin"
	.align 4,0
.org 0x8040C16C
	.import "code/gfx/removeSleepScreenGerman.bin"
	.align 4,0
.org 0x8040C2F0
	.import "code/gfx/removeSleepScreenFrench.bin"
	.align 4,0
.org 0x8040C45C
	.import "code/gfx/removeSleepScreenItalian.bin"
	.align 4,0
.org 0x8040C5CC
	.import "code/gfx/removeSleepScreenSpanish.bin"
	.align 4,0

