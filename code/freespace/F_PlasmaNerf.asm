plasmaNerf:
	mov     r0,r4    
    add     r0,2Bh   
    ldrb    r1,[r0]    
    cmp     r1,0h   
	bne		beamStunned
	b		beamOriginalCode
beamStunned:
	ldr		r0,=08050644h  ;080505FCh
	mov		r15,r0

beamOriginalCode:
	mov     r0,r4    
    add     r0,32h   
    ldrb    r1,[r0]  
    mov     r0,8h    
    and     r0,r1    
    cmp     r0,0h    
    beq     beamHasnt8
beamHas8:
	ldr		r0,=080505E2h
	mov		r15,r0
beamHasnt8:
	ldr 	r0,=080505F4h
	mov 	r15,r0
.pool

plasmaChargeNerf:
	mov     r0,r4    
    add     r0,2Bh   
    ldrb    r1,[r0]    
    cmp     r1,0h   
	bne		ChargeStunned
	b		ChargeOriginalCode
ChargeStunned:
	ldr		r0,=080506ECh ;080506A4h
	mov		r15,r0

ChargeOriginalCode:
	mov     r0,r4    
    add     r0,32h   
    ldrb    r1,[r0]  
    mov     r0,8h    
    and     r0,r1    
    cmp     r0,0h    
    beq     ChargeHasnt8
ChargeHas8:
	ldr		r0,=0805068Ah
	mov		r15,r0
ChargeHasnt8:
	ldr 	r0,=0805069Ch
	mov 	r15,r0
.pool

plasmaIceNerf:
	mov     r0,r4    
    add     r0,2Bh   
    ldrb    r1,[r0]    
    cmp     r1,0h   
	bne		IceStunned
	b		IceOriginalCode
IceStunned:
	mov		r5,40
	ldr		r0,=08050818h ;08050778h
	mov		r15,r0

IceOriginalCode:
	mov     r0,r4    
    add     r0,32h   
    ldrb    r1,[r0]  
    mov     r0,8h    
    and     r0,r1    
    cmp     r0,0h    
    beq     IceHasnt8
IceHas8:
	ldr		r0,=0805075Ch
	mov		r15,r0
IceHasnt8:
	ldr 	r0,=0805076Eh
	mov 	r15,r0
.pool