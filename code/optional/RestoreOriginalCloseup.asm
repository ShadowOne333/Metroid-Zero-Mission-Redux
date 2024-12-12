restoreCloseup:
; Original code
.org 0x806061C
	ldr r4, [pc, #0xB0]
	ldr r2, [pc, #0xB4]
	mov r3, #0x80
	lsl r3, r3, #6
	mov r0, #0x10
	str r0, [sp]

; Original code
.org 0x805F9A4
	ldr r5, [pc, #0xB8]
	ldr r2, [pc, #0xBC]
	mov r6, #0xA0

; Samus Closeup palette
.org 0x8367924
.incbin "code/optional/closeup/CloseupBGPalette.pal"


