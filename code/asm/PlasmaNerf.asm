plasmaNerfasm:

;set length of hit stun timer
.org 0x08050490
	mov r1,09h
	
.org 0x0805040A ; set Ice Stun timer
	mov r1,09h

.org 0x080505D4
	ldr 	r0,=plasmaNerf
	mov 	r15,r0
.pool

;Charged
.org 0x0805067C
	ldr 	r0,=plasmaChargeNerf
	mov 	r15,r0
.pool

;Ice
.org 0x0805074E
	ldr 	r0,=plasmaIceNerf
	mov 	r15,r0
.pool
