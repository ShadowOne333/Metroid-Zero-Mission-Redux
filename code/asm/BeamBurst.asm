beamBurstasm:
.ifndef flareasm

.org 0804F17Ch ; part of UpdateArmCannonAndWeapons
	push	r0
	ldr		r0,=ChargeHack
	mov		r15,r0
.pool

.endif