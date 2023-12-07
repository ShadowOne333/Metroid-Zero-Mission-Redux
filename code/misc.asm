; [MF_U] -- In-Game Timer increments a second every 60 frames, instead of every 64.
; Editing in no$gba: 08068678:  3F  >>  3B
; Editing in HxD: 00068678:  3F  >>  3B
; Side Effects: None~!

;Now made my Zero Mission (ZM_U) version! Head over to address 080579D0. The ME_E, MF_J and MF_C  versions are still WIP.
.org 0x080579D0
	.db 0x3B	; 3F
