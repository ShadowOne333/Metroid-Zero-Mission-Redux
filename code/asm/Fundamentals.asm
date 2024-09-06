.gba
;.open "zm_u.gba","zm_u_fundamentals.gba",	   0x8000000
;.definelabel Freespace, filesize("zm_u.gba") + 	0x8000000	; Removed for compatibility with Project ZM

/* 
a collective effort of yohann, somerando, biospark, captain glitch, raygun

biospark- unknown items, starting room, scale end percent, 4th map color

captglitch- faster item grab, tractor beam, start with items

raygun- tractor beam, unknown items, transparent map fix

somerando- more map messages, getting this to work

quote58- tractor beam

yohann- tractor beam, unknown items, more map messages

o7 thank you friends. you are the reason cool stuff like this exists
*/

;Ultimate start items ASM
;All values are and should stay in hex
;If you dont want to start with Missiles, or Supers, or any beams, etc, change the variable to 0.

;SUIT/MISC TABLE
;01 = Hi-jump  
;02 = Speed booster
;04 = Space jump
;08 = Screw attack
;10 = Varia suit
;20 = Gravity suit
;40 = Morph ball
;80 = Power grip

;BEAMS/BOMBS TABLE  
;01 = Long beam
;02 = Ice beam
;04 = Wave beam
;08 = Plasma beam
;10 = Charge beam
;80 = Bombs

;SUIT TYPES
;00 = Normal Suit
;01 = Full Powered Suit
;02 = Zero Suit

.definelabel StartingSuitType,			0x1	; 1 for FullyPowered, 2 for Suitless. 0 Normal is not handled correctly anymore because early Unknown Items require a fully powered "suit"
.definelabel StartingSuitMisc,			0x0
.definelabel StartingBeamBombs,			0x0

.definelabel StartingEnergy,			99	;
.definelabel StartingMissiles,			0x0	;
.definelabel StartingSuperMissiles,		0x0	; Hex or Decimal is fine here.
.definelabel StartingPowerBombs,		0x0	;

.definelabel StartingArea,			0x0
.definelabel StartingDoorID,			0x0
.definelabel StartingMusic,			0x0

.definelabel BigSuit,				0x10
.definelabel MaxPercent,			100

; set the colors of the 4th map color animation here
.definelabel Color1,				0x7C1F
.definelabel Color2,				0x7CFF
.definelabel Color3,				0x7D1F
.definelabel Color4,				0x7CFF
.definelabel Color5,				0x7C1F

.definelabel HideHudFlag,			0x300004A
.definelabel AreaID,				0x3000054
.definelabel CurrSpriteData,			0x3000738
.definelabel ArmPosition,			0x3000BEC
.definelabel MessageInfo,			0x3000C0C
.definelabel OneByteFrameCounter,		0x3000C77 
.definelabel OAMData,				0x3000E7C
.definelabel NextOAMSlot,			0x3001382
.definelabel SamusData,				0x30013D4
.definelabel ChargeCounter,			0x3001419
.definelabel Equipment,				0x3001530
.definelabel BeamBombActivation,		0x300153D
.definelabel SamusPhysics,			0x3001588

.definelabel PlaySound,				0x8002A18
.definelabel FadeSound,				0x8002C80
.definelabel DMATransfer,			0x80031E4	
.definelabel SamusCheckSetEnvironmentalEffect,	0x8006214
.definelabel SamusUpdateAnim,			0x800847C
.definelabel WrapperR1,				0x808ABFC
.definelabel SpawnNewPrimarySprite,		0x800E31C

; STARTING ROOM
;.org 0x8060F5C
	;ldr	 r0,=AreaID
	;mov	 r1,StartingArea	  ; new area
	;strb	r1,[r0]
	;mov	 r1,StartingDoorID ; new door
	;strb	r1,[r0,2h]
	;ldr	 r0,=HideHudFlag
	;mov	 r1,0
	;strh	r1,[r0]
	;ldr	 r0,=0x3000C75
	;strb	r1,[r0]
	;mov	 r0,StartingMusic  ; music track
	;bl	  0x80039F4
	;b	   0x8060FDA
	;.pool

; TRANSPARENT MAP FIX
.org 0801f628h
	.word updatemap
.org 0801F61Eh
	mov  r15,r1

; No weapon toggle when samus is not alive
.org 0x80080A4
	bl WeaponToggle

;uncomment the instructions below if you use Biosparks unknown items patch and also activate fullsuit

.org 0x800B554	
	cmp r1,#0x1

.org 0x800BD78	;hijack point, accessed only on start game, do not change
	ldr r5,=StartWithItems
	mov r15,r5
.pool

;ITEM TOGGLE
; enable item toggle
.org 0x8071C1A
	b	   0x8071C36
	
; allow bombs to be toggled
.org 0x8071BAC
	beq	 0x8071C36
	mov	 r6,0x80
	ldr	 r5,=BeamBombActivation
	b	   0x8071C36
	.pool

; allow suits to be toggled
.org 0x8071BE6
	b	   0x8071C36
	
; always draw on/off
.org 0x8071D5A
	b	   0x8071D7A

; TRACTOR BEAM
; hijack pickup AI
.org 0x8012FF2
	bl	  DrawPickupWrapper


; 4TH MAP COLOR

.org 0x832C2C8
.incbin "code/fundamentals/particles.gfx"

; fix initial colors for pause screen minimap
.org 0x84113E4
	.dh Color1,Color1

; add animated palette
.org 0x840DCE6
	.dh Color1,Color2,Color3,Color4,Color5

; set color in generic sprite palette
.org 0x832BA74
	.dh Color1

; fix palette index used for hidden heated tiles on hud minimap
.org 0x840D73E
	.db 0x06,0x06
.org 0x840D78E
	.db 0x60,0x60

; modifies routine that updates minimap animated palettes
.org 0x806FD00
	push	r4,r5,r14
	ldr	 r0,=0x8754BC4
	ldr	 r3,[r0]
	ldrb	r4,[r3,0x11]
	mov	 r5,r0
	cmp	 r4,0
	bne	 @@_806FD86
	ldrh	r0,[r3,0x18]
	add	 r0,1
	strh	r0,[r3,0x18]
	ldr	 r2,=0x840DCF0
	mov	 r1,0x1A
	ldsb	r1,[r3,r1]
	add	 r1,r1,r2
	ldrb	r1,[r1]
	cmp	 r0,r1
	bcc	 @@_806FD86
	strh	r4,[r3,0x18]
	ldrb	r0,[r3,0x1A]
	add	 r0,1
	strb	r0,[r3,0x1A]
	ldr	 r1,[r5]
	ldrb	r0,[r1,0x1A]
	cmp	 r0,3
	bls	 @@_806FD3A
	mov	 r0,0
	strb	r0,[r1,0x1A]
@@_806FD3A:
	ldr	 r1,=0x840DCB0
	ldr	 r2,[r5]
	mov	 r0,0x1A
	ldsb	r0,[r2,r0]
	lsl	 r2,r0,1			; r2 = frame * 2
	add	 r0,r2,r1
	ldrh	r3,[r0]
	ldr	 r0,=0x8754BB8
	ldr	 r0,[r0]
	mov	 r12,r0			; r12 = 0x5000000
	strh	r3,[r0,0x24]	; normal
	strh	r3,[r0,0x26]

	ldr	 r1,=0x840DC90
	add	 r0,r2,r1
	ldrh	r3,[r0]
	mov	 r0,r12
	add	 r0,0x64
	strh	r3,[r0]			; hidden
	strh	r3,[r0,2]

	ldr	 r1,=0x840DCD0
	add	 r0,r2,r1
	ldrh	r3,[r0]
	mov	 r0,r12
	add	 r0,0x44
	strh	r3,[r0]			; heated
	strh	r3,[r0,2]
	
	ldr	 r1,=0x840DCE6
	add	 r0,r2,r1
	ldrh	r3,[r0]
	mov	 r0,r12
	add	 r0,0x84
	strh	r3,[r0]			; hidden heated
	strh	r3,[r0,2]
@@_806FD86:
	mov	 r4,r5
	ldr	 r2,[r4]
	ldrb	r0,[r2,0x12]
	cmp	 r0,7
	bhi	 @@_806FDEE
	ldrh	r0,[r2,0x1C]
	add	 r0,1
	strh	r0,[r2,0x1C]
	mov	 r3,0x1E
	ldsb	r3,[r2,r3]
	cmp	 r3,0
	bge	 @@_806FDA0
	neg	 r3,r3
@@_806FDA0:
	ldr	 r1,=0x840DCF4
	add	 r1,r3,r1
	ldrb	r1,[r1]
	cmp	 r0,r1
	bcc	 @@_806FDEE
	mov	 r0,0
	strh	r0,[r2,0x1C]
	ldrb	r0,[r2,0x1E]
	add	 r0,1
	strb	r0,[r2,0x1E]
	ldr	 r1,[r4]
	mov	 r0,0x1E
	ldsb	r0,[r1,r0]
	cmp	 r0,0x10
	blt	 @@_806FDC8
	mov	 r0,0xE
	neg	 r0,r0
	strb	r0,[r1,0x1E]
@@_806FDC8:
	ldr	 r0,[r5]
	mov	 r3,0x1E
	ldsb	r3,[r0,r3]
	cmp	 r3,0
	bge	 @@_806FDD4
	neg	 r3,r3
@@_806FDD4:
	ldr	 r1,=0x840DD04
	ldrb	r0,[r0,0x12]
	add	 r0,r0,r1
	ldrb	r1,[r0]
	ldr	 r0,=0x8754BB8
	ldr	 r0,[r0]
	lsl	 r1,r1,1
	add	 r1,r1,r0
	ldr	 r2,=0x83FD2F0
	lsl	 r0,r3,1
	add	 r0,r0,r2
	ldrh	r0,[r0]
	strh	r0,[r1]
@@_806FDEE:
	pop	 r4,r5
	pop	 r0
	bx	  r0
.pool


; MORE MAP STATION MESSAGES

;.org 0x801F47C ; map station always usable (for testing)
;nop

.org 0x801F62C
.area 0xB0							  ; Beginning of MapStationSpawnMessage function
	 push	r4,lr					  ; 
	 sub	 sp,8h					  ;
	 ldr	 r2,=CurrSpriteData		 ; | Load CurrentSprite
	 add	 r1,r2,0h				   ; 
	 add	 r1,2Ch					 ;
	 ldrb	r0,[r1,#0x0]			   ; |
	 sub	 r0,1h					  ; | 
	 strb	r0,[r1,#0x0]			   ; | CurrentSprite.Timer = CurrentSprite.Timer - 0x1
	 add	 r4,r2,0h				   ;
	 cmp	 r0,0h					  ;
	 bne	 Return					 ;
	 ldr	 r0,=AreaID				 ; |
	 ldrb	r0,[r0,#0x0]			   ; Load current area ID
	 ldr	 r1,=MapAcquiredMessageIDs  ;
	 ldrb	r1,[r1,r0]				 ; Message id in r1, forward it to the Spawn sprite function
	 b	   SpawnMapDownloadMessage	;


MapAcquiredMessageIDs: ;Tourian and Crateria message IDs replace unused ones. Change them to whatever.
	 .byte 1Bh, 1Ch, 1Dh, 1Eh, 18h, 23h, 1Fh
;		   |	|	|	|	|	|	|
;	   Brinstar |	|	|	|	|	|
;			  Kraid  |	|	|	|	|
;				  Norfair |	|	|	|
;						Ridley |	|	|
;							Tourian |	|
;								 Crateria|
;									  Chozodia   
.pool

.align 2
SpawnMapDownloadMessage:				; This is all vanilla code
	 ldrh	r3,[r4,2h]				 ; CurrentSprite.YPosition
	 ldrh	r0,[r4,4h]				 ; CurrentSprite.XPosition
	 str	 r0,[sp]					; Store x position to stack pointer(?)
	 mov	 r0,0h					  ; |
	 str	 r0,[sp,4h]				 ; | Set x position to 0
	 mov	 r0,11h					 ; 
	 mov	 r2,6h					  ; 
	 bl	  SpawnNewPrimarySprite	  ;
	 add	 r1,r4,0					;
	 add	 r1,2Dh					 ;
	 strb	r0,[r1]					; 
	 mov	 r2,0h					  ; 
	 ldr	 r0,=0FFC0h				 ; -40
	 strh	r0,[r4,0Ch]				; store to hitbox bottom offset
	 sub	 r1,9h					  ;
	 mov	 r0,29h					 ; 
	 strb	r0,[r1]					; store pose to current sprite
	 ldr	 r1,=SamusData			  ; 
	 strb	r2,[r1,1Dh]				; set samus current animation frame to 0
	 mov	 r0,1h					  ; 
	 strb	r0,[r1,0Ah]				; set samus timer to 0
	 ldr	 r0,=123h				   ; |
	 mov	 r1,0Ah					 ; |
	 bl	  FadeSound				  ; FadeSound (UsingMapStation, 0xA)
Return:
	 add	 sp,8h
	 pop	 r4,pc
.pool
.endarea


; ; ; ; ; ; ; ; ;
; UPDATED TEXT  ;
; ; ; ; ; ; ; ; ;

.org 0x84429BE; replace message 0x18 for tourian
.area 0x48
.incbin "code/fundamentals/tourianMapMessage.bin"
.endarea

.org 0x8442D22; replace message 0x19 for crateria
.area 0x72
.incbin "code/fundamentals/crateriaMapMessage.bin"
.endarea

.org 0x801b8f2
.area 0x801b924-.
	ldr r2,[r15,32h*4]	;currspritedata, use pool of another function
	mov r1,2eh
	ldrb r1,[r2,r1]
	cmp r1,0
	bne notfound
	add r1,r15,6*4
	mov r3,EndOfTwoLineMessageIDs-TwoLineMessageIDs-1 ;count of 2line messages - 1
loop:
	ldrb r0,[r1,r3]
	cmp r0,r8
	beq 0x801b99c	;exit found, is two line, no need to modify
	sub r3,1
	bpl loop
notfound:		;change to one line
	;ldr r0,[r15,011h*4]	;82cbacc reuse pool from another section
	;str r0,[r2,18h]
	;mov r0,0
	;strb r0,[r2,1ch]
	;strb r0,[r2,16h]
	b 0x801b99c
.align

TwoLineMessageIDs:
	.byte 0x1,0x2,0x4,0x6,0x16,0x19,0x1A,0x21,0x22,0x24,0x25,0x26
EndOfTwoLineMessageIDs:

.endarea


; FASTER ITEM GRAB
;additional options
;.org 0x801B8CC		  ; Play sound routine for abilities (Prevents music from cutting off)
;   bl PlaySound
;.org 0x801B886		  ; sound for unknown items
;   mov r0,0x3A   
;.org 0x801B898		  ; sound for abilities
;	mov r0,0x3A
;.org 0x801B958			;time before an ability message can be closed
;	mov		r0,32h
;.org 0x801B962			;time before an expansion messages can be closed
;	mov		r0,32h


.org 0x801BAF0
	bl 0x804F670	;refreshes beam GFX (thanks biospark)	
	b  0x801BB00	;prevents going to status screen when getting an item
.org 0x8013172
	bl EquipmentGet		;MorphBall
.org 0x8013B26
	bl EquipmentGet		;SpeedBooster
.org 0x8013B3E
	bl EquipmentGet		;HiJump
.org 0x8013B5E
	bl EquipmentGet		;ScrewAttack
.org 0x8013B7E
	bl EquipmentGet		;Varia
.org 0x8013BB6
	bl EquipmentGet		;Gravity
.org 0x80133B0
	bl EquipmentGet		;Grip
.org 0x8013B9E
	bl EquipmentGet		;SpaceJump
.org 0x8013AC6
	bl BeamGet		;LongBeam
.org 0x8013ADE
	bl BeamGet		;IceBeam
.org 0x8013AF6
	bl BeamGet		;WaveBeam
.org 0x8013BCE
	bl BeamGet		;PlasmaBeam
.org 0x8013656
	ldrb	r1,[r2,0Ch]
	mov	r0,10h
	bl BeamGet		;ChargeBeam	
.org 0x8013B0E
	bl BeamGet		;Bombs	


; hijack calc percent routine
.org 0x8087B98
	bl FixCalcPercent
	
; hijack percent displayed at end
.org 0x8086892
	bl FixDisplayedPercent


;-----------
; Full Suit
;-----------
; start with full suit
; .org 0x800BD7E
	; bl	  StartFullSuit
	
; display correct graphics
.org 0x800A692
	mov r9,r0
	mov r4,r1
	bl ChangeSuit
.org 0x800B452
	bl RestoreSuit
	
; display correct palette
.org 0x800B4AE
	beq 0x800B558

; status screen graphics
.org 0x8068DE0
	bl StatusScreen

;-------
; Items
;-------
; display correct text
.org 0x801B84C
	bl SwitchText

; play correct jingle
.org 0x801B886
	bl GetJingleNumber
	b  0x801B8CA
	
; play correct sound
.org 0x8071118
	bl GetSoundNumber
	bl PlaySound
	b  0x8071144

;----------------
; Obtaining Suit
;----------------
; skip giving players varia for free if they beat charlie and don't already have it
.org 0x805CA36
	mov r0,1
	b   0x805CA52

;.org 0x805CA1A ; skips setting events 0x13 (varia obtained) and 0x44 (varia skipped)
	;b  0x805CA36

;.org 80600d8h
	;add r1,10h
	;b 80600eeh
	
; only activate gravity if obtained
.org 0x80600EC
	ldrb r1,[r2,0xE]
	strb r1,[r2,0xF]
	b    0x8060318	; skip check for SubSpriteData1.workVariable3 = 0x7 (RUINS_TEST_FIGHT_STAGE_STARTING_SUIT_ANIM)

; don't change varia's map tile with full suit
.org 0x806B212
	b    0x806B22E

;------
; Text
;------
	
.org 0x844284C		; Plasma Beam
	.halfword 0x804E,0x8105,0x90,0xCC,0xC1,0xD3,0xCD,0xC1,0x40,0x82,0xC5,0xC1,0xCD,0xFE00,0x806E,0xFF00
	
.org 0x844289E		; Gravity Suit
	.halfword 0x8050,0x8105,0x87,0xD2,0xC1,0xD6,0xC9,0xD4,0xD9,0x40,0x93,0xD5,0xC9,0xD4,0xFE00,0x806E,0xFF00
	
.org 0x844293C		; Space Jump
	.halfword 0x804E,0x8105,0x93,0xD0,0xC1,0xC3,0xC5,0x40,0x8A,0xD5,0xCD,0xD0,0xFE00,0x806E,0xFF00
	
.org 0x8442D22		; Unknown Item
	.halfword 0x804A,0x8105,0x0095,0x00CE,0x00CB,0x00CE,0x00CF,0x00D7,0x00CE,0x0040,0x0089,0x00D4,0x00C5,0x00CD,0xFE00,0x806E,0xFF00

;---------
; Statues
;---------
; replace chozo statue gfx
.org 0x82C15F0
	.import "code/fundamentals/gravity.gfx.lz"
.org 0x82C2B24
	.import "code/fundamentals/gravity_item.palette"

.org 0x82BF534
	.import "code/fundamentals/space.gfx.lz"
.org 0x82C0A58
	.import "code/fundamentals/space_item.palette"

.org 0x82C2BC4
	.import "code/fundamentals/plasma.gfx.lz"
.org 0x82C40F4
	.import "code/fundamentals/plasma_item.palette"

; change secondary sprites
.org 0x801528A
	mov	r0,1
.org 0x80152AE
	mov	r0,1
.org 0x80152D0
	mov	r0,1
.org 0x80152EC
	mov	r0,1

; change chozo statue OAM
.org 0x8015114
	.word 0x875F4E4	

; change ability OAM
; opening
.org 0x80163D4
	.word 0x82B5890
.org 0x80163E4
	.word 0x82B5890
.org 0x80163F4
	.word 0x82B5890
; opened
.org 0x8016438
	.word 0x82B58B0
.org 0x8016448
	.word 0x82B58B0
.org 0x8016458
	.word 0x82B58B0


;---------
;.org 0x8043DF0		; unused Crocomire AI
;.area 0x3094

.org 0x8011F50
.area 0x75
;SCALE END PERCENT
ScaleNumber:
; r0 = obtained percent
	mov	r1,0x64			; 100
	mul	r1,r0
	mov	r0,0
	mov	r2,MaxPercent
@@Divide:
	cmp	r1,MaxPercent
	blt	@@Return
	sub	r1,r1,r2
	add	r0,1
	b	@@Divide
@@Return:
	bx	r14
	
FixCalcPercent:
	push	r14
	; hijacked code
	add	r0,r8
	add	r0,r0,r7		; r0 = obtained percent
	bl	ScaleNumber
	pop	r1
	bx	r1
	
FixDisplayedPercent:
	push	r14
	; hijacked code
	add	r0,0x99
	; swap registers
	mov	r1,r0
	mov	r0,r5			; r0 = obtained percent
	mov	r5,r1
	bl	ScaleNumber
	strb	r0,[r5]			; stores percent to 300175D
	pop	r0
	bx	r0
	
EquipmentGet:
	orr	r1,r0
	strb	r1,[r2,0Eh]
	ldrb	r1,[r2,0Fh]
;uncomment if not using Obtain Unknown Items
;	mov	r3,24h		;checks for space jump or grav and prevents their activation
;	and	r3,r1
;	cmp	r3,0h
;	bne	@@Return
	orr	r0,r1
	strb	r0,[r2,0Fh]
@@Return:
	bx	r14
	
BeamGet:
	orr	r1,r0
	strb	r1,[r2,0Ch]
	ldrb	r1,[r2,0Dh]
;uncomment if not using Obtain Unknown Items
;	mov	r3,8h		;checks for plasma and prevents its activation
;	and	r3,r1
;	cmp	r3,0h
;	bne	@@Return
	orr	r0,r1
	strb	r0,[r2,0Dh]
@@Return:
	bx	r14
.endarea

;----------
; New Code
;----------
;.org 0x8304054		; crocomire graphics
;.org Freespace

; All new addresses are reused from available space made by MAGE
.org 0x833E8B8
.area 0xE5
;TRACTOR BEAM
DrawPickupWrapper:
	ldr	r0,=DrawPickup
	mov	r15,r0
.pool

;UNKNOWN ITEMS
;StartFullSuit:
	;strh	r0,[r1]
	;strh	r0,[r1,6]
	;mov	r0,1
	;strb	r0,[r1,0x12]
	;bx	r14

ChangeSuit:
	ldr	r6,=Equipment
	ldrb	r0,[r6,0x12]
	push	r0
	cmp	r0,1
	bne	@@Return
	; if full suit
; Default -- If full suit and not have BigSuit = 0x10 for Varia, or 0x20 for Gravity
	ldrb	r0,[r6,0xF]
	mov	r1,BigSuit
	and	r0,r1
	cmp	r0,0
	bne	@@Return
	mov	r0,0h
	strb	r0,[r6,0x12]
; Changed code -- If full suit and not have Bigsuit = 0x30 (Gravity + Varia)
	;ldrb	r0,[r6,0xF]
	;mov	r1,BigSuit
	;and	r0,r1
	;cmp	r0,r1
	;beq	@@Return
	;mov	r0,0h	
	;strb	r0,[r6,0x12]
@@Return:
	add	sp,-4h
	bx	r14
	.pool
	
RestoreSuit:
	add	sp,4h
	pop	r0
	ldr	r1,=Equipment
	strb	r0,[r1,0x12]
	pop	r3-r5
	bx	r14
	.pool

StatusScreen:
	ldr	r0,=Equipment
	ldrb	r2,[r0,0x12]
	cmp	r2,2
	beq	@@Return		; return r2 = 2 if suitless
	ldrb	r2,[r0,0xF]
; Default code -- If have BigSuit = 0x10 for Varia, or 0x20 for Gravity
	mov	r1,BigSuit
	and	r2,r1
	cmp	r2,0
	beq	@@Return		; return r2 = 0 if no gravity
	mov	r2,1			; return r2 = 1 if gravity 
; Changed code -- If have Bigsuit = 0x30 (Gravity + Varia)
	;mov	r1,BigSuit
	;and	r2,r1
	;cmp	r2,r1
	;bne	@@Return		; return r2 = 0 if not gravity + varia
	;mov	r2,1			; return r2 = 1 if gravity + varia
@@Return:
	bx	r14
	.pool

SwitchText:
	push	r14
	; check for full suit
	ldr	r0,=Equipment
	ldrb	r0,[r0,0x12]
	cmp	r0,1
	beq	@@ReplacedCode
	; check if unknown item
	mov	r0,r8
	cmp	r0,0xC
	beq	@@IsUnknown
	cmp	r0,0xF
	beq	@@IsUnknown
	cmp	r0,0x14
	bne	@@ReplacedCode
@@IsUnknown:
	ldr	r0,=MessageInfo
	ldrb	r1,[r0,0xC]
	cmp	r1,2
	bne	@@ReplacedCode
	mov	r1,0x23
	strb	r1,[r0,0xA]
@@ReplacedCode:
	bl	0x806F28C
	ldr	r1,=MessageInfo
	mov	r2,r8
	strb	r2,[r1,0xA]
	pop	r1
	bx	r1
	.pool

GetJingleNumber:
	ldr	r0,=Equipment
	ldrb	r0,[r0,0x12]
	cmp	r0,1
	beq	@@FullSuit
	mov	r0,0x42
	b	@@Return
@@FullSuit:
	mov	r0,0x37
@@Return:
	bx	r14
	.pool

GetSoundNumber:
	ldr	r0,=Equipment
	ldrb	r0,[r0,0x12]
	cmp	r0,1
	beq	@@FullSuit
	ldr	r0,=0x20F
	b	@@Return
@@FullSuit:
	ldr	r0,=0x1F7
@@Return:
	bx	r14
	.pool
.endarea

;---------
.org 0x8343B60
.area 0x90
; TRACTOR BEAM
DrawPickup:
	push 	r14
	push	r2-r6
	ldr	r0,=ChargeCounter
	ldrb	r0,[r0]
	cmp	r0,0x20
	bcc	@@Return
	sub	r0,0x1f
	lsr	r5,r0,0x1		; scaling speed
	mov	r5,r0

	ldr	r0,=ArmPosition
	ldrh	r2,[r0]			; r2 = arm Y position
	ldr	r0,=SamusData
	ldrh	r1,[r0,0x12]		; r1 = Sam's X position
	ldr	r0,=CurrSpriteData
	ldrh	r3,[r0,0x4]		; r3 = sprite X position
	ldrh	r4,[r0,0x2]		; r4 = sprite Y position
	add	r0,0x1
	sub	r1,r3,r1		; x
	sub	r0,r4,r2		; y
	
	bl	sinecosine
	mov	r2,r5
	mul	r0,r2			; apply speed scalar
	mul	r1,r2
	asr	r0,r0,0x10
	asr	r1,r1,0x10
	ldr	r3,=CurrSpriteData
	ldrh	r2,[r3,0x2]		; add y speed to position
	sub	r0,r2,r0
	strh	r0,[r3,0x2]
	
	ldrh	r2,[r3,0x4]
	sub	r1,r2,r1		; add x speed to position
	strh	r1,[r3,0x4]
		
@@Return:
	pop	r2-r6
	pop	r1
	; replaced instructions
	ldr	r0,=CurrSpriteData
	add	r0,0x24
	bx	r1
	.pool
.endarea
;---------
; r0 = y
; r1 = x
;---------
.org 0x8361600
.area 0x60
WrapperR3:
mov r15,r3

MyWrapperR1:
	bx	r1

sinecosine:
	push	r14
	lsl	r0,r0,0x10
	asr	r0,r0,0x10
	lsl	r1,r1,0x10
	asr	r1,r1,0x10
	mov	r3,r0
	mov	r4,r1
	
	mov	r1,r3
	mul	r1,r3
	mov	r2,r4
	mul	r2,r4
	add	r0,r1,r2
	push	r3
	ldr	r1,=0x80051C8+1		; load square root
	bl	MyWrapperR1
	pop	r3
	mov	r2,r0
	mov	r1,r0 			; divisor
	mov	r0,r3 			; dividend
	lsl	r0,r0,0x10
	ldr	r3,=0x808AC34 		; divide 0x1000 times r0 or r1
	push	r2
	bl	WrapperR3
	pop	r2
	mov	r1,r2 			; divisor
	mov	r2,r0
	mov	r0,r4			; dividend
	lsl	r0,r0,0x10
	ldr	r3,=0x808AC34		; divide 0x1000 times r0 or r1 
	push	r2
	bl	WrapperR3
	pop	r2
	mov	r4,r0
	mov	r0,r2
	mov	r1,r4
	pop	r15
.pool
.endarea
;---------
.org 0x8361880
.area 0x60
; START WITH ITEMS
StartWithItems:
	ldr r5,=Equipment		;Samus equipment
	mov r6,StartingSuitMisc		;Change X to any combinations of values according to the Suit/Misc table above. For example, 60h gives you Gravity and morphball
	strb r6,[r5,0Eh]		;Stores X to aquired Suit/Misc Items
	strb r6,[r5,0Fh]		;Stores X to equipped Suit/Misc Items
	mov r6,StartingBeamBombs	;Change Y to any combination of values according to the Beams/Bombs table. For example, 98h gives you Bombs, Charge Beam , and Plasma
	strb r6,[r5,0Ch]		;Stores Y to aquired Beams/Bombs
	strb r6,[r5,0Dh]		;Stores Y to equipped Beams/Bombs
	mov r6,StartingMissiles		;Change Z to the number of missiles you'd like to start with. For example, 0Ah is 10 missiles.
	strh r6,[r5,2h]			;Stores Z to max Missiles
	strh r6,[r5,8h]			;Stores Z to current Missiles
	mov r6,StartingSuperMissiles	;Change N to number of supers you'd like to start with. For example 0Ah is 10 Super Missiles.
	strb r6,[r5,4h]			;Stores N to max Super Missiles
	strb r6,[r5,0Ah]		;Stores N to current Super Missiles
	mov r6,StartingPowerBombs	;Change V to the number of Power Bombs you'd like to start with. For example 0Ah is 10 Power Bombs
	strb r6,[r5,5h]			;Stores V to Max Power Bombs
	strb r6,[r5,0Bh]		;Stores V to Current Power Bombs
	mov r6,StartingSuitType		;Change W to type of Suit you'd like to start with
	strb r6,[r5,12h]		;Stores W to Suit type flag


	strh r0,[r4,0Eh]		;everything after this is Hijack stuff, don't change
	mov r0,StartingEnergy		;starting health, suppose you could change this
	mov r1,r8					  
	strh r0,[r1]				   
	strh r0,[r1,6h]				
	ldr r5,=800BD82h		;Goes back to hijack area, do not change
	mov r15,r5
.pool
.endarea
;---------
.org 0x8361B00
.area 0x60
; TRANSPARENT MAP FIX
updatemap:
	ldr r1,=3000BF0h
	mov	r0,5h
	strb r0,[r1]

	ldr r1,=0x600C000
@@startloop:

	ldr r0,=0eeeeeeeeh
	str r0,[r1]
	add r1,r1,4h
	ldr	r0,=0x600C500
	cmp r1,r0
	bls @@startloop

@@return:
	pop r4
	pop r0
	bx r0
.pool

;---------
WeaponToggle:
	mov r0,4h
	and r0,r1
	cmp r0,0h
	beq Return1
	ldrh r0,[r5,6h]
Return1:
	bx r14
.pool
.endarea
