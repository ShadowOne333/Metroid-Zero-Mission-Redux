; With a fully charged beam you can suck in item drops, a la Metroid Prime.

tractorBeamasm:

; Updated tractor beam ASM
; By raygun, captain glitch, quote58, cosmic
; hijack pickup AI
.org 0x8012FF2
	bl      DrawPickupWrapper
