smControlsasm:

; GFX for SM controls
.org 0x845a600
	.import "code/gfx/controlsText.lz"
.org 0x845c0f4
	.import "code/gfx/fileSelectSNES.lz"
.org 0x8458e14
	.import "code/gfx/fileSelectSNES2.lz"

;///////////////
;overwrite sound
.org	0x0807822c
	mov r1,1h ; Always stereo, change 1h to 0h for mono
	
;/////////////////FIXCHARGE
.org	08007D52h
	ldr	r0,=fixcharge
	mov	r15,r0
.pool

;//////////////// angle code
.org	08008796h
	b	0800879Eh     ;crouch while aiming up
.org 	08008A74h
	b	8008A7Ch	;morph while aiming up
.org 0x080079B8
	nop               ;dont check for lpress at beginning

.org 080079DCh          ;change pointers to free space
	.word SMControls
	.word SMControls
	.word ognostreturn
	.word SMControls
	.word SMControls
	.word ognostreturn
	.word SMControls
	.word ognostreturn	
	.word SMControls
	.word ognostreturn	
	.word SMControls
	.word SMControls
	.word SMControls
	.word ognostreturn
	.word SMControls
	.word SMControls
.org 0x08007A3C
	.word SMControls
.org 0x08007AC8
	.word SMControls
	.word SMControls

.org 0x08007A7C
	.word ziplinefix
.org 8007CEEh
AngleReturn:       ;define a return point label

;//////////////////////////////// WEAPON SELECT CODE
.org	08008084h
	ldr	r0,=weaponselect ; 876d18Ch
	mov	r15,r0
.pool
.org 0x08053530
	ldr		r0,=hudgfx
	mov		r15,r0
.pool

.org 0x8007352
	ldr		r0,=shinesparkfix
	mov		r15,r0
.pool

.org 0x80087BC
	.word crouchfix
.org 0x8008792
	mov	r15,r0

.org 0x8008a8c
	.word morphfix
.org 0x8008a70
	mov r15,r0

.org 0x8008a50
	.word standfix
.org 0x8008a26
	mov r15,r0
