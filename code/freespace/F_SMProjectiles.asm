
AddSpeeds:
	mov 	r0,r4
	add 	r0,13h
	ldrb 	r0,[r0]
	cmp 	r0,2h
	bhi 	ResetReturn 	; Projectile initializing


; Add samus velocity to speed
	ldr     r0,=Pose ;
    ldrh    r2,[r0,16h]     ;|
	add		r1,r4,2h		; Store Velocity to Projectile0 +0x2
    strh    r2,[r1]		

	ldrb	r2,[r0]
	cmp		r2,28h
	beq		@@onzipline
	cmp		r2,29h
	bne		@@notonzipline
@@onzipline:
	ldr		r2,=3000191h
@@loop:
	add		r2,38h
	ldr		r1,=3000755h
	cmp		r2,r1
	bcs		@@notonzipline
	ldrb	r0,[r2]
	mov		r1,03Dh
	cmp 	r0,r1
	bne		@@loop
	sub		r2,1dh
	ldrh	r1,[r2]
	mov     r0,80h      
    lsl     r0,r0,4h       ; Only if carrying Samus
    and     r0,r1       
    cmp     r0,0h       
    beq     @@loop

	ldr		r0,=030013D6h
	ldrb 	r0,[r0]
	cmp		r0,4h
	beq		@@faster

	mov		r0,80h		;direction of zipline
	lsl		r0,r0,2h
	and		r0,r1
	cmp		r0,0h
	beq		@@zipleft
	ldr		r0,=30013E2h
	ldrb	r0,[r1]
	mov		r1,10h
	and		r1,r0
	cmp		r1,0h
	beq		@@faster
	b		@@slower

@@zipleft:
	ldr		r0,=30013E2h
	ldrb	r0,[r1]
	mov		r1,10h
	and		r1,r0
	cmp		r1,0h
	bne		@@faster
	b		@@slower

@@faster:
	add		r1,r4,2h		; Store Velocity to Projectile0 +0x2
	ldrh	r2,[r1]
	add		r2,070h
    strh    r2,[r1]		
	b		@@notonzipline

@@slower:
	add		r1,r4,2h		; Store Velocity to Projectile0 +0x2
	ldrh	r2,[r1]
	sub		r2,070h
    strh    r2,[r1]		
	b		@@notonzipline

@@notonzipline:
	b		ResetReturn


ResetReturn:


;Get Base Speed for each ProjType
	mov 	r0,r4				
	add 	r0,0Fh
	ldrb 	r0,[r0]
	cmp 	r0,00h	; if short beam
	beq		ShortBeam
	cmp 	r0,01h	
	beq 	LongBeam  ; 1 for long beam
	cmp 	r0,02h	; for ice
	beq		IceBeam
	cmp 	r0,03h	; for wave
	beq		WaveBeam
	cmp 	r0,04	; if plasma
	beq		PlasmaBeam
	cmp 	r0,05h	; if pistol
	beq		Pistol
	cmp 	r0,06h	; if charged short
	beq		ChargedShort
	cmp 	r0,07h	; if charged long
	beq		ChargedLong
	cmp 	r0,08h	; if charged ice
	beq		ChargedIce
	cmp 	r0,09h	; if charged wave
	beq		ChargedWave
	cmp 	r0,0Ah	; if charged plasma
	beq		ChargedPlasma
	cmp 	r0,0Bh	; if charged pistol
	beq		ChargedPistol
	cmp 	r0,0Ch
	beq 	Missile
	cmp 	r0,0Dh	; if Super missile
	beq		SuperMissile
	b 		EndofCode

ShortBeam:
	mov 	r1,14h
	b 		EndofCode
LongBeam:
	mov 	r1,18h
	b 		EndofCode
IceBeam:
	mov 	r1,1Ah
	b 		EndofCode
WaveBeam:
	mov		r1,18h
	b		EndofCode
PlasmaBeam:
	mov		r1,20h
	b		EndofCode
Pistol:
	mov		r1,16h
	b		EndofCode
ChargedShort:
	mov		r1,14h
	b		EndofCode
ChargedLong:
	mov		r1,18h
	b		EndofCode
ChargedIce:
	mov		r1,1Ah
	b		EndofCode
ChargedWave:
	mov		r1,1Ch
	b		EndofCode
ChargedPlasma:
	mov		r1,20h
	b		EndofCode
ChargedPistol:
	mov		r1,16h
	b		EndofCode
SuperMissile:
	mov 	r0,r4
	add 	r0,13h
	ldrb 	r0,[r0]
	add 	r0,0Ch
	mov 	r1,r0
	b		EndofCode
Missile:
	mov 	r0,r4
	add 	r0,13h
	ldrb 	r0,[r0]
	add 	r0,8h
	mov 	r1,r0
	b 		EndofCode


EndofCode:

	mov 	r0,r4
	bx 		r14
.pool