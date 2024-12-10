SMControls:
;check control mode
	ldr		r1,=03000004h
	ldrb 	r1,[r1]
	cmp 	r1,0h
	beq 	ZMControls

;check triggers pressed
	ldrh 	r1,[r2]
	mov		r0,80h
	lsl		r0,r0,1h
	and		r0,r1
	cmp		r0,0h
	bne		RisPressed
	mov		r0,80h
	lsl		r0,r0,2h
	and		r0,r1
	cmp		r0,0h
	bne		LisPressed
 	ldr		r0,=08007AFCh     ; return to Lnotpressedcode
 	mov		r15,r0
RisPressed:
	mov		r0,80h
	lsl		r0,r0,2h
	and		r0,r1
	cmp		r0,0h
	bne		@@bothpressed
;OnlyRpressed
@@notstanding:
	mov		r0,1h
	strb    r0,[r4,2h]     ;
    b       jumpAngleReturn     
@@bothpressed:
	ldr		r0,=30013d4h
	ldrb	r0,[r0]
	cmp		r0,4h
	beq		@@aimdiagup
	cmp		r0,6h
	beq		@@aimdiagup
	cmp		r0,1h
	beq		@@aimup
	cmp		r0,3h
	beq		@@aimup
	cmp		r0,8h
	beq		@@aimdiagup
	cmp		r0,0Ch
	beq		@@aimdiagup
	cmp		r0,0Eh
	beq		@@aimdiagup
	cmp		r0,0Fh
	beq		@@aimdiagup
	cmp		r0,18h
	beq		@@aimup
	cmp		r0,22h
	beq		@@shinespark
	cmp		r0,19h
	bne		@@dontaimup
@@aimup:
	mov		r0,3h
	push	r1
	ldr		r1,=030013D6h
	strb    r0,[r1]     ;
	pop		r1
	b		nosetreturn
@@aimdiagup:
	mov		r0,1h
	push	r1
	ldr		r1,=030013D6h
	strb    r0,[r1]     ;
	pop		r1
	b		jumpAngleReturn
@@dontaimup:
 	ldr		r0,=08007AFCh     ; return to Lnotpressedcode
 	mov		r15,r0
@@shinespark:
	ldr		r0,=030013D8h
	push	r1
	mov		r1,0h
	strb	r1,[r0]
	pop		r1
	b		nosetreturn

LisPressed:
	mov		r0,2h
	strb    r0,[r4,2h]     ;
    b       jumpAngleReturn  

ZMControls:
;check if L pressed
	ldrh 	r1,[r2]
	mov		r0,80h
	lsl		r0,r0,2h
	and		r0,r1
	cmp		r0,0h
	bne		@@LisPressed
	ldr		r0,=08007AFCh     ; return to Lnotpressedcode
	mov		r15,r0



@@LisPressed:
    ldrh    r1,[r2]        ; 
    mov     r0,80h         ;
    and     r0,r1          ;
    cmp     r0,0h          ; if down pressed
    beq     @@downnotpressed       ;

    mov     r0,2h          ;
    strb    r0,[r4,2h]     ; set arm cannon direction = diagonal down
    b       jumpAngleReturn       ; return

@@downnotpressed:
    ldrb    r0,[r5]        ;
    cmp     r0,1h          ; if current cannon direction diag up
    bls     @@angledup  ;

    mov     r0,40h         ; if up pressed
    and     r0,r1          ;
    cmp     r0,0h          ;
    bne     @@angledup   ;
    b       nosetreturn       ; else noset return

@@angledup:
    mov     r0,1h          ;
    strb    r0,[r4,2h]     ; set armcannon direction = 1 diagonal up
    b       jumpAngleReturn       ; return

nosetreturn:
	ldr		r4,=AngleReturn
	mov		r0,2h
	add		r4,r0
	mov		r15,r4
jumpAngleReturn:
	ldr		r4,=AngleReturn
	mov		r15,r4
.pool

standfix:
	ldr		r0,=3000004h
	ldrb	r0,[r0]
	cmp		r0,0h
	bne		@@notangled
	ldr		r0,=3001414h
	ldrb	r0,[r0]
	cmp		r0,0h
	beq		@@notangled
	ldr		r0,=8008a2ch
	mov		r15,r0
@@notangled:
	ldr		r0,=8008A32h
	mov		r15,r0

.pool


morphfix:
	ldr		r0,=3000004h
	ldrb	r0,[r0]
	cmp		r0,0h
	bne		@@notangled
	ldr     r0,=3001414h
	ldrb    r0,[r0]
	cmp     r0,0h
	beq     @@notangled
	ldr		r0,=8008a76h
	mov		r15,r0
@@notangled:
	ldr		r0,=8008a7Ch
	mov		r15,r0

crouchfix:
	ldr		r0,=3000004h
	ldrb	r0,[r0]
	cmp		r0,0h
	bne		@@notangled
	ldr     r0,=3001414h
	ldrb    r0,[r0]
	cmp     r0,0h
	beq     @@notangled
	ldr		r0,=8008798h
	mov		r15,r0
@@notangled:
	ldr		r0,=800879Eh
	mov		r15,r0

weaponselect:
	ldr		r0,=3000004h
	ldrb	r0,[r0]
	cmp		r0,0h
	bne		SMweaponselect

	mov     r4,r1            ; r4 = LAimingStatus
	mov     r5,r2            ; r5 = HealthCapacity
	mov     r6,0h            ; r6 = 0
	ldrb    r0,[r5,0Ah]      ;
	cmp     r0,0h            ;} If CurrentSuperMissiles = 0:
	bne     @@supesnotzero         ;
	ldr		r0,=08008090h
	mov		r15,r0
@@supesnotzero:
	ldr		r0,=08008094h
	mov		r15,r0




SMweaponselect:

	mov     r4,r1
	mov     r5,r2
	mov     r6,0h
	ldr r0,=3001380h	;changed input
	mov r1,4h
	ldrh r0,[r0]
	and r0,r1
	cmp r0,0h	
	beq doneswitch
	ldrb r0,[r4,2h]		;checks if PBs are selected
	cmp r0,4h
	beq @@Off
	bl SwitchWeapons
	cmp r0,1h
	bne dontskipsoundeffect
@@Off:
	ldr	r1,=0x3001419 ; charge counter
	mov	r0,0h
	strb	r0,[r1]
	mov r0,0h
	mov r1,8h
	strb r0,[r4,2h]
	strb r1,[r4,3h]		;unarms all ammo based weapons
	cmp r2,3h			;true if all weapons are out of ammo
	beq doneswitch		;skips switch weapon sound
	b pbdontskipsoundeffect
.pool



pbdontskipsoundeffect:
	ldrb	r0,[r4,2h]
	cmp		r0,0h
	bne		dontskipsoundeffect
	push	r14
	ldr		r1,=@@returnfromsubroutine
	add		r1,1h
	mov		r14,r1
	ldr		r0,=085h
	ldr		r1,=8002A18h
	mov		r15,r1
@@returnfromsubroutine:
	pop		r0
	mov		r14,r0
	b		doneswitch
dontskipsoundeffect:
	push	r14
	ldr		r1,=@@returnfromsubroutine
	add		r1,1h
	mov		r14,r1
	ldr		r0,=084h
	ldr		r1,=8002A18h
	mov		r15,r1
@@returnfromsubroutine:
	pop		r0
	mov		r14,r0
doneswitch:
	b		fake080081A6
	
;876D1F8
.notice tohex(.)
SwitchWeapons:
	mov r5,r2
	mov r2,0h		;used to check to not play switch sound
	cmp r0,0h
	beq @@Missile
	cmp r0,1h
	beq @@Super
	b @@PowerBomb		;checks which item to arm
@@Missile:
	ldrh r0,[r5,8h]
	cmp r0,0h		;checks if missile count is 0
	beq @@PreSuper
	mov r0,0h
	mov r1,1h
	strb r1,[r4,2h]
	strb r0,[r4,3h]
	mov	r6,1h
	mov r0,0h		;turns on missiles
	b @@Return
@@PreSuper:
	add r2,1h
@@Super:
	ldrb r0,[r5,0Ah]
	cmp r0,0h		;checks if super missile count is 0	
	beq @@PrePB
	mov r0,1h
	mov r1,2h
	strb r1,[r4,2h]
	strb r0,[r4,3h]
	mov	r6,2h
	mov r0,0h		;turns on Supers
	b @@Return
@@PrePB:
	add r2,1h
@@PowerBomb:
	ldrb r0,[r5,0Bh]
	cmp r0,0h		;checks if PB count is 0	
	beq @@Off
	mov r0,2h
	mov r1,4h
	strb r1,[r4,2h]
	strb r0,[r4,3h]
	mov	r6,4h
	mov r0,0h		;turns on PBs
	b @@Return
@@Off:
	add r2,1h
	mov r0,1h		;return value to unarm all ammo based weapons
@@Return:
	bx r14
.pool

	
fake080081A6:


@@notcharging:
	pop     r4-r7            ;  -Missile:        r6 = 1
	pop     r0               ;  -Super Missile:  r6 = 2
	bx      r0               ;  -Power Bomb:     r6 = 4
.pool

fixcharge:
	ldrb	r0,[r3,2h]
	cmp		r0,0h
	beq		@@returntrue
	cmp		r0,4h
	beq		@@returntrue
	ldr		r0,=08007D9Ch
	mov		r15,r0
@@returntrue:
	ldr		r0,=300137Ch
	ldrh	r1,[r0]
	mov		r0,2h
	and		r0,r1

	ldr		r1,=08007D5Ch
	mov		r15,r1
.pool

hudgfx:
	ldr		r0,=03000004h
	ldrb	r0,[r0]
	cmp		r0,0h
	bne		@@snes
	ldrb    r1,[r4]     
    cmp     r1,2h       
    bne     @@althighlightflagnotset    
    ldr     r1,=3001414h
	ldr		r0,=08053538h
	mov		r15,r0
@@althighlightflagnotset:
	ldr		r0,=80535A8h
	mov		r15,r0
.pool

@@snes:
	ldr		r1,=3001414h
	ldrb	r0,[r1,2h]
	cmp		r0,0h
	beq		@@nonehighlighted
	cmp		r0,1h
	beq		@@missilehighlighted
	cmp		r0,2h
	beq		@@superhighlighted
	cmp		r0,4h
	beq		@@extendjump
	b		@@nonehighlighted
@@extendjump:
	b		@@pbhighlighted
@@nonehighlighted:
	ldr     r1,=40000D4h 
	ldr     r0,=83304C8h 
	str     r0,[r1]      
	ldr     r0,=6010E00h 
	str     r0,[r1,4h]   
	ldr     r0,=80000020h
	str     r0,[r1,8h]   
	ldr     r0,[r1,8h]   
	mov     r0,0h 
	ldr     r0,=8330648h
	str     r0,[r1]      
	ldr     r0,=6010E80h 
	str     r0,[r1,4h]   
	ldr     r0,=80000020h
	str     r0,[r1,8h]   
	ldr     r0,[r1,8h]   
	mov     r0,0h 
	ldr     r0,=83307C8h 
	str     r0,[r1]      
	ldr     r0,=6010B00h 
	str     r0,[r1,4h]   
	ldr     r0,=80000020h
	str     r0,[r1,8h]   
	ldr     r0,[r1,8h]   
	mov     r0,0h           ;
	strb    r0,[r4] 
	strb    r0,[r4,2h]        
	strb    r0,[r4,1h] 
	ldr		r0,=@@nonesublink
	add		r0,1h
	mov		r14,r0
	mov     r0,1h       
	ldr		r1,=8052F1Ch
	mov		r15,r1
@@nonesublink:
	ldr		r0,=@@nonesublink2
	add		r0,1h
	mov		r14,r0
	mov     r0,1h       
	ldr		r1,=805313Ch
	mov		r15,r1
@@nonesublink2:
	ldr		r0,=@@end
	add		r0,1h
	mov		r14,r0
	mov     r0,1h       
	ldr		r1,=8053334h
	mov		r15,r1
	b		@@end
@@missilehighlighted:
	ldr     r1,=40000D4h 
	ldr     r0,=8330548h 
	str     r0,[r1]      
	ldr     r0,=6010E00h 
	str     r0,[r1,4h]   
	ldr     r0,=80000020h
	str     r0,[r1,8h]   
	ldr     r0,[r1,8h]   
	mov     r0,0h 
	ldr     r0,=8330648h
	str     r0,[r1]      
	ldr     r0,=6010E80h 
	str     r0,[r1,4h]   
	ldr     r0,=80000020h
	str     r0,[r1,8h]   
	ldr     r0,[r1,8h]   
	mov     r0,0h 
	ldr     r0,=83307C8h 
	str     r0,[r1]      
	ldr     r0,=6010B00h 
	str     r0,[r1,4h]   
	ldr     r0,=80000020h
	str     r0,[r1,8h]   
	ldr     r0,[r1,8h]   
	mov     r0,2h           ;
	strb    r0,[r4] 
	mov		r0,0h
	strb    r0,[r4,2h]        
	strb    r0,[r4,1h] 
	ldr		r0,=@@missilesublink
	add		r0,1h
	mov		r14,r0
	mov     r0,1h       
	ldr		r1,=8052F1Ch
	mov		r15,r1
@@missilesublink:
	ldr		r0,=@@missilesublink2
	add		r0,1h
	mov		r14,r0
	mov     r0,1h       
	ldr		r1,=805313Ch
	mov		r15,r1
@@missilesublink2:
	ldr		r0,=@@end
	add		r0,1h
	mov		r14,r0
	mov     r0,1h       
	ldr		r1,=8053334h
	mov		r15,r1
	b		@@end
@@superhighlighted:
	ldr     r1,=40000D4h 
	ldr     r0,=83304C8h 
	str     r0,[r1]      
	ldr     r0,=6010E00h 
	str     r0,[r1,4h]   
	ldr     r0,=80000020h
	str     r0,[r1,8h]   
	ldr     r0,[r1,8h]   
	mov     r0,0h 
	ldr     r0,=83306C8h
	str     r0,[r1]      
	ldr     r0,=6010E80h 
	str     r0,[r1,4h]   
	ldr     r0,=80000020h
	str     r0,[r1,8h]   
	ldr     r0,[r1,8h]   
	mov     r0,0h 
	ldr     r0,=83307C8h 
	str     r0,[r1]      
	ldr     r0,=6010B00h 
	str     r0,[r1,4h]   
	ldr     r0,=80000020h
	str     r0,[r1,8h]   
	ldr     r0,[r1,8h]   
	mov     r0,0h           ;
	strb    r0,[r4]        
	strb    r0,[r4,1h] 
	mov		r0,2h
	strb    r0,[r4,2h]  
	ldr		r0,=@@supersublink
	add		r0,1h
	mov		r14,r0
	mov     r0,1h       
	ldr		r1,=8052F1Ch
	mov		r15,r1
@@supersublink:
	ldr		r0,=@@supersublink2
	add		r0,1h
	mov		r14,r0
	mov     r0,1h       
	ldr		r1,=805313Ch
	mov		r15,r1
@@supersublink2:
	ldr		r0,=@@end
	add		r0,1h
	mov		r14,r0
	mov     r0,1h       
	ldr		r1,=8053334h
	mov		r15,r1       
	b		@@end
@@pbhighlighted:
	ldr     r1,=40000D4h 
	ldr     r0,=83304C8h 
	str     r0,[r1]      
	ldr     r0,=6010E00h 
	str     r0,[r1,4h]   
	ldr     r0,=80000020h
	str     r0,[r1,8h]   
	ldr     r0,[r1,8h]   
	mov     r0,0h 
	ldr     r0,=8330648h
	str     r0,[r1]      
	ldr     r0,=6010E80h 
	str     r0,[r1,4h]   
	ldr     r0,=80000020h
	str     r0,[r1,8h]   
	ldr     r0,[r1,8h]   
	mov     r0,0h 
	ldr     r0,=8330848h 
	str     r0,[r1]      
	ldr     r0,=6010B00h 
	str     r0,[r1,4h]   
	ldr     r0,=80000020h
	str     r0,[r1,8h]   
	ldr     r0,[r1,8h]   
	mov     r0,0h      
  
	mov     r0,0h           ;
	strb    r0,[r4]        
	strb    r0,[r4,2h] 
	mov		r0,2h
	strb    r0,[r4,1h]  
	ldr		r0,=@@pbsublink
	add		r0,1h
	mov		r14,r0
	mov     r0,1h       
	ldr		r1,=8052F1Ch
	mov		r15,r1
@@pbsublink:
	ldr		r0,=@@pbsublink2
	add		r0,1h
	mov		r14,r0
	mov     r0,1h       
	ldr		r1,=805313Ch
	mov		r15,r1
@@pbsublink2:
	ldr		r0,=@@end
	add		r0,1h
	mov		r14,r0
	mov     r0,1h       
	ldr		r1,=8053334h
	mov		r15,r1
	b		@@end

@@end:
	ldr r0,=8053894h
	mov r15,r0

.pool
shinesparkfix:
	ldr		r0,=03000004h
	ldrb	r0,[r0]
	cmp		r0,0h
	bne		@@snes
	ldr		r0,=300137ch
	ldr		r1,=300168Ch
	ldrh	r2,[r0]
	ldrh	r0,[r1,2h]
	and		r0,r2
	cmp		r0,0h
	beq		@@lnotpressed
	ldr		r0,=08007360h
	mov		r15,r0
@@lnotpressed:
	ldr		r0,=08007388h
	mov		r15,r0
@@snes:
	ldr		r0,=300137ch
	ldr		r1,=300168Ch
	ldrh	r2,[r0]
	ldrh	r0,[r1,2h]
	and		r0,r2
	cmp		r0,0h
	beq		@@SLnotpressed
	ldrh	r0,[r1]
	and		r0,r2
	cmp		r0,0h
	bne		@@upspark
	b		@@diagonalspark
@@SLnotpressed:
	ldrh	r0,[r1]
	and		r0,r2
	cmp		r0,0h
	beq		@@upspark
	b		@@diagonalspark

@@diagonalspark:
	ldr		r0,=08007360h
	mov		r15,r0
@@upspark:
	ldr		r0,=08007388h
	mov		r15,r0

.pool

ziplinefix:
;check control mode
	ldr		r1,=03000004h
	ldrb 	r1,[r1]
	cmp 	r1,0h
	beq 	@@ZMControls

;check triggers pressed
	ldrh 	r1,[r2]
	mov		r0,80h
	lsl		r0,r0,1h
	and		r0,r1
	cmp		r0,0h
	bne		@@RisPressed
	mov		r0,80h
	lsl		r0,r0,2h
	and		r0,r1
	cmp		r0,0h
	bne		@@angledown
 	ldr		r0,=08007AFCh     ; return to Lnotpressedcode
 	mov		r15,r0
@@RisPressed:
	mov		r0,80h
	lsl		r0,r0,2h
	and		r0,r1
	cmp		r0,0h
	beq		@@angledown
 	ldr		r0,=08007AFCh     ; return to Lnotpressedcode
 	mov		r15,r0

@@angledown:
    mov     r0,2h          ;
    strb    r0,[r4,2h]     ; set arm cannon direction = diagonal down
	ldr		r4,=AngleReturn
	mov		r15,r4

@@ZMControls:
	ldrh 	r1,[r2]
	mov		r0,80h
	lsl		r0,r0,2h
	and		r0,r1
	cmp		r0,0h
	bne		@@ZMangledown
 	ldr		r0,=08007AFCh     ; return to Lnotpressedcode
 	mov		r15,r0
@@ZMangledown:
	mov     r0,2h          ;
    strb    r0,[r4,2h]     ; set arm cannon direction = diagonal down
	ldr		r4,=AngleReturn
	mov		r15,r4

.pool