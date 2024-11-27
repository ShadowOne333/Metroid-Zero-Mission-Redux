itemGrabasm:

;.org 0x8014090 ; 02 0E -> 00 22
;	mov r0,2h ; pick up items already acquired, for testing purposes

.org 0x8055FA4
	cmp r0,#0xE
.org 0x8055fa8
	b 0x8055FB4
; Charlie fight fix by commenting this out
;.org 0x8056008
	;cmp r0,#0xF

; Charlie fight X-pos fix after Status screen
.org 0x8056054 ; set X pos
	.word 0x7BF	;Originally .word 0x280
.org 0x8056020 ; set Y pos
	mov r0,#0x60
	lsl r0,r0,#0x4
.org 0x805FED0
	b 0x8060318


; 2 - Line text boxes (biospark)
.org 0x801B910
   nop
   nop

.org 0x801BAF0
	bl 0x804F670		;refreshes beam GFX (thanks biospark)	
	b 0x801BB00		;prevents going to status screen when getting an item

;change pointer from SetPauseFlag to unused RAM
;.org 0x8055FA0	; This line causes rooms with water to show a graphical glitch after returning from the Pause menu
	;.word	0x3000C22
.org 0x8060FA4
	.word	0x3000C22
.org 0x801BB10
	.word	0x3000C22
;.org 0x8060F90	; This line causes the Charlie fight to reset
	;.word	0x3000C22
.org 0x8056004
	.word	0x801BB00
.org 0x8056064
	.word	0x801BB00
.org 0x8055FE6
	mov pc,r0
; Charlie fight fix by commenting this out
;.org 0x8056048
	;mov pc,r0

.ifdef unkItemsasm
.org 0x801BAF4
	bl CheckSuitAnim
.endif

;-------------------------------
; Additional options

.ifdef knownItemsasm
.org 0x801B8CC		; Play sound routine for abilities (Prevents music from cutting off)
	bl PlaySound
.org 0x801B886		; sound for unknown items
	mov r0,0x37	; mov r0,0x3A
.org 0x801B898		; sound for abilities
	mov r0,0x37	; mov r0,0x3A

; .org 0x801B920
	;.byte 14h	;makes ability messages two lines
; .org 0x801B950
	;.byte 14h	;makes ability messages use the proper timer

.org 0x801B958			;time before an ability message can be closed (default 64h)
	mov	r0,32h
.org 0x801B962			;time before an expansion messages can be closed (default 64h)
	mov	r0,32h
.else	;If unkItems instead of knownItems
.org 0x801B958			;time before an ability message can be closed (default 64h)
	mov	r0,64h
.org 0x801B962			;time before an expansion messages can be closed (default 64h)
	mov	r0,64h
.endif

;-------------------------------

.org 0x8013172
	bl EquipmentGet		;MorphBall
.org 0x8013B26
	bl EquipmentGet		;SpeedBooster
.org 0x8013B3E
	bl EquipmentGet		;HiJump
.org 0x8013B5E
	bl EquipmentGet		;ScrewAttack
.org 0x8013B7E
.ifdef unkItemsasm
	orr r0, r1
	strb r0, [r2,0Eh]
.else
	bl EquipmentGet		;Varia
.endif
.org 0x8013BB6
.ifdef unkItemsasm
	orr r0, r1
	strb r0, [r2,0Eh]
.else
	bl EquipmentGet		;Gravity
.endif
.org 0x80133B0
	bl EquipmentGet		;Grip

.org 0x8013B9E
.ifdef unkItemsasm
	orr r0, r1
	strb r0, [r2,0Eh]
.else
	bl EquipmentGet		;SpaceJump
.endif
.org 0x8013AC6
	bl BeamGet		;LongBeam
.org 0x8013ADE
	bl BeamGet		;IceBeam
.org 0x8013AF6
	bl BeamGet		;WaveBeam
.org 0x8013BCE
.ifdef unkItemsasm
	orr r0, r1
	strb r0, [r2,0Ch]
.else
	bl BeamGet		;PlasmaBeam
.endif
.org 0x8013656
	ldrb	r1,[r2,0Ch]
	mov	r0,10h
	bl	BeamGet		;ChargeBeam	
.org 0x8013B0E
	bl	BeamGet		;Bombs

