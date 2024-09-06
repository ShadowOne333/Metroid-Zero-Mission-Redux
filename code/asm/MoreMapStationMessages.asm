;-------------------------------------
;	MORE MAP STATION MESSAGES
;-------------------------------------

;.org 0x801F47C ; map station always usable (for testing)
;nop

.org 0x801F62C
.area 0xB0							  ; Beginning of MapStationSpawnMessage function
	 push	r4,lr					  ; 
	 sub	 sp,8h					  ;
	 ldr	 r2,=CurrSprite		 ; | Load CurrentSprite
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
SpawnMapDownloadMessage:		; This is all vanilla code
	 ldrh	r3,[r4,2h]		; CurrentSprite.YPosition
	 ldrh	r0,[r4,4h]		; CurrentSprite.XPosition
	 str	r0,[sp]			; Store x position to stack pointer(?)
	 mov	r0,0h			; |
	 str	r0,[sp,4h]		; | Set x position to 0
	 mov	r0,11h			; 
	 mov	r2,6h			; 
	 bl	SpawnNewPrimarySprite	;
	 add	r1,r4,0			;
	 add	r1,2Dh			;
	 strb	r0,[r1]			; 
	 mov	r2,0h			; 
	 ldr	r0,=0FFC0h		; -40
	 strh	r0,[r4,0Ch]		; store to hitbox bottom offset
	 sub	r1,9h			;
	 mov	r0,29h			; 
	 strb	r0,[r1]			; store pose to current sprite
	 ldr	r1,=SamusData		; 
	 strb	r2,[r1,1Dh]		; set samus current animation frame to 0
	 mov	r0,1h			; 
	 strb	r0,[r1,0Ah]		; set samus timer to 0
	 ldr	r0,=123h		; |
	 mov	r1,0Ah			; |
	 bl	FadeSound		; FadeSound (UsingMapStation, 0xA)
Return:
	 add	sp,8h
	 pop	r4,pc
.pool
.endarea

;-------------------------------------
;	UPDATED TEXT
;-------------------------------------

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
	beq 0x801B99C	;exit found, is two line, no need to modify
	sub r3,1
	bpl loop
notfound:		;change to one line
	;ldr r0,[r15,011h*4]	;82cbacc reuse pool from another section
	;str r0,[r2,18h]
	;mov r0,0
	;strb r0,[r2,1ch]
	;strb r0,[r2,16h]
	b 0x801B99C
.align

TwoLineMessageIDs:
	.byte 0x1,0x2,0x4,0x6,0x16,0x19,0x1A,0x21,0x22,0x24,0x25,0x26
EndOfTwoLineMessageIDs:

.endarea
