; Improve the Sound engine of Zero Mission to get better music samples

; 0194F600 -> 0197F600 - The 4 is the nibble that sets the music frequency
; 0 = SOUND_MODE_FREQ_NONE
; 1 = SOUND_MODE_FREQ_05734
; 2 = SOUND_MODE_FREQ_07884
; 3 = SOUND_MODE_FREQ_10512
; 4 = SOUND_MODE_FREQ_13379
; 5 = SOUND_MODE_FREQ_15768
; 6 = SOUND_MODE_FREQ_18157
; 7 = SOUND_MODE_FREQ_21024
; 8 and above glitches the audio

; Modify the Sample Rate of the music from 13kHz to 21Khz
soundImprovement:
.org 0x080027C8
	.dw 0x0197F700	; 00 F7 94 01 - 0x0194F700

; Modifying the sample rate (frequency) also modifies how certain Sound Effects play (pitch)
; These changes all the sound effects so they don't rely on sample rate changes and instead play normally.
.org 0x0808D450
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D45C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D468
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D474
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D480
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D498
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D4A4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D4BC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D4C8
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D504
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D510
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D51C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D534
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D540
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D54C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D564
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D570
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D57C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D5A0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D5AC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D5C4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D5D0
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D5E8
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D618
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808D624
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808DD2C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808DD50
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808DD5C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808DD68
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808E92C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808E95C
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808E9A4
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

.org 0x0808EADC
	.db 0x00	; 08 - Change voice_directsound_no_resample -> voice_directsound 

