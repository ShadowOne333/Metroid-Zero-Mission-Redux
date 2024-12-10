hudColorsasm:

.org 0x8052F18
	.word 0x832f2c8

.org 0x8052e44
	push	r0
	ldr		r0,=powerbombhijack
	mov		r15,r0
.pool

.org 0x8052d6c
	push	r0
	ldr		r0,=superhijack
	mov		r15,r0
.pool

;.org 0x832F2C8
;	.import "HUDExport.gfx"