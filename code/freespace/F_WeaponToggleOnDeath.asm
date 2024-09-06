WeaponToggle:
	mov r0,4h
	and r0,r1
	cmp r0,0h
	beq Return1
	ldrh r0,[r5,6h]
Return1:
	bx r14
.pool
