;.gba
;.open "zm.gba","KraidPlasmaDamage.gba",0x8000000

.org 0x80187F8
	mov r4,14h ;Missile Damage (14 -> 28)
	
.org 0x801880E
	mov r4,64h ;Super Missile Damage (64 -> 78)

.org 0x8018816 ;28ops(1Ch)
	cmp r0,06h ;check if projectile is a charged beam
	bls 0x801889C
	cmp r0,0Ah ;check if projectile is a charged beam
	bgt 0x801889C
	ldr r0,=Equipment ;equipment flag
	ldrb r0,[r0,0Ch] ;beams and bombs
	mov r1,0Fh
	and r0,r1
	cmp r0,0h  ;check if charge beam
	beq 0x801889C
	mov r4,08h	; 08h -> 0Ch
	mov r2,2Ah
	mov r3,1h
	and r3,r0
	cmp r3,1h ;check for long
	bne nolong
	add r4,1h	;lsl r4,r4,1h
	mov r2,2Bh
nolong:
	mov r3,2h
	and r3,r0
	cmp r3,2h ;check for ice
	bne noice
	add r4,1h	;lsl r4,r4,1h
	mov r2,2Ch
noice:
	mov r3,4h
	and r3,r0
	b 0x8018856
	nop
	
.org 0x8018854 ;17ops(11h)
	nop
	cmp r3,4h ;check for wave
	bne nowave
	add r4,1h	;lsl r4,r4,1h
	mov r2,2Dh
nowave:
	mov r3,8h
	and r3,r0
	cmp r3,8h ;check for plasma
	bne noplasma
	add r4,1h	;lsl r4,r4,1h
	mov r2,2Eh
noplasma:
	mov r3,1h
	mov r8,r2
	b 0x80188B2
	nop
	nop
	nop
	
.org 0x801887C ;delete the rest of the old projectile code
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	
.pool
;.close
