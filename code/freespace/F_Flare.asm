; Shooting a charged shot creates a muzzle flare that can damage enemies in close proximity, like in Fusion.

flareSpawnhijack:
	mov		r1,r4
	cmp		r1,0x17
	bne		@@end
@@flare:
	mov		r1,0x6
	mov		r4,r1
	mov		r0,0x8
	lsl		r0,r0,0xC ;orientation has 4000 top
	mov		r1,0x10
	orr		r0,r1
	orr		r2,r0
	b		@@end

@@end:
	mov		r0,r12
	ldrh	r1,[r0,0xE]
	mov		r0,0x10
	and		r0,r1
	cmp		r0,0x0
	beq		@@returnequal
	ldr		r1,=0x0804EE32
	mov		r15,r1
@@returnequal:
	ldr		r1,=0x804EE36
	mov		r15,r1
.pool



flareZero:
	ldr		r0,=0804F2a2h
	mov		r15,r0
doflare:
	pop	r0
	lsl	r0,r0,18h
	cmp	r0,0h
	bne	@@notzero
	b	flareZero
@@notzero:
.ifdef beamburstasm
	bl		beamburstwithflare
	.warning "beam burst + flare (same hijack)"
.endif
	cmp		r4,0xb
	bcs		@@notbeam
	cmp		r4,0x6
	bcc		@@notchargedbeam
	ldr		r0,=03000BECh
	ldrh	r1,[r0]
	ldr		r0,=3000BEEh
	ldrh	r2,[r0]
	mov		r0,0x17
	ldr		r3,=@@spawnlinkflare
	add		r3,1h
	mov		r14,r3
	ldr		r3,=0804EDE4h
	mov		r15,r3
@@spawnlinkflare:
@@notchargedbeam:
@@notbeam:
	ldr		r0,=03000BECh
	ldrh	r1,[r0]
	ldr		r0,=3000BEEh
	ldrh	r2,[r0]
	b		flareReturntocode
flareReturntocode:
	ldr		r0,=0804F18Ch
	mov		r15,r0

beamburstwithflare:
	ldr		r1,=0x300153B
	ldrb	r0,[r1]
	cmp		r0,0x0
	beq		@@continue2
	ldr		r0,=0x3001417
	ldrb	r0,[r0]
	mov		r1,2h
	and		r1,r0
	cmp		r1,0h
	bne		@@charge
	b		@@continue2
@@charge:
	cmp		r4,0x0
	beq		@@chargeshort
	cmp		r4,0x1
	beq		@@chargelong
	cmp		r4,0x2
	beq		@@chargeice
	cmp		r4,0x3
	beq		@@chargewave
	cmp		r4,0x4
	beq		@@chargeplasma
	b		@@continue2
@@chargeshort:
	mov		r4,0x6
	b		@@continue1
@@chargelong:
	mov		r4,0x7
	b		@@continue1
@@chargeice:
	mov		r4,0x8
	b		@@continue1
@@chargewave:
	mov		r4,0x9
	b		@@continue1
@@chargeplasma:
	mov		r4,0xA
	b		@@continue1
@@continue1:
	mov		r0,0x20
	add		r0,r0,r5
	mov		r5,r0
	ldr		r1,=0x300153B
	ldrb	r0,[r1]
	sub		r0,r0,0x1
	strb	r0,[r1]
	cmp		r0,0x0
	bne		@@continue2
	mov		r0,0x8
	lsl		r0,r0,0x8
	ldr		r1,=0x3001416
	strh	r0,[r1]
@@continue2:
	bx		r14



flarehijack:
	ldrb	r0,[r4,0x1]
	cmp		r0,0x80
	beq		@@flare
;	ldr     r0,=3001530
;	ldrb    r1,[r0,0Dh]
;	ldr		r0,=0x080518A8
;	mov		r15,r0
	ldr		r0,=0x3000079
	mov		r1,0x7
	strb	r1,[r0]
	ldr		r0,=0x8051450
	mov		r15,r0



@@flare:
	ldrb	r0,[r4,0x13]
	add		r0,0x1
	strb	r0,[r4,0x13]
	ldrb	r1,[r4,0x10]
	cmp		r1,0x0
	beq		@@sethitboxhor
	cmp		r1,0x3
	bcc		@@sethitboxdiag
	b		@@sethitboxvert


@@sethitboxvert:
	ldr		r1,=0xffe0
	strh	r1,[r4,0x14]
	mov		r1,0x50
	strh	r1,[r4,0x16]
	ldrb	r1,[r4]
	mov		r2,0x40
	and		r2,r1
	cmp		r2,0x0
	beq		@@leftvert
	ldr		r1,=0xFFc0
	strh	r1,[r4,0x18]
	mov		r1,0x40
	strh	r1,[r4,0x1a]
	b		@@setOAMvert
@@leftvert:
	ldr		r1,=0xFFc0
	strh	r1,[r4,0x18]
	mov		r1,0x40
	strh	r1,[r4,0x1a]
@@setOAMvert:
	ldr		r1,=vertflareoam
	str		r1,[r4,0x4]
	cmp		r0,0x4
	bcc		@@vert1
	cmp		r0,0x5
	bcc		@@vert2
	cmp		r0,0x6
	bcc		@@vert3
	cmp		r0,0x7
	bcc		@@vert4
	cmp		r0,0x8
	bcc		@@vert5
	b		@@die



@@sethitboxdiag:
	ldr		r1,=0xFFc0
	strh	r1,[r4,0x18]
	mov		r1,0x40
	strh	r1,[r4,0x1a]
	ldrb	r1,[r4]
	mov		r2,0x20
	and		r2,r1
	cmp		r2,0x0
	beq		@@updiag
	ldr		r1,=0xffb0
	strh	r1,[r4,0x14]
	mov		r1,0x18
	strh	r1,[r4,0x16]
	b		@@setOAMdiag
@@updiag:
	ldr		r1,=0xffe8
	strh	r1,[r4,0x14]
	mov		r1,0x50
	strh	r1,[r4,0x16]



@@setOAMdiag:
	ldr		r1,=diagflareoam
	str		r1,[r4,0x4]
	cmp		r0,0x4
	bcc		@@diag1
	cmp		r0,0x5
	bcc		@@diag2
	cmp		r0,0x6
	bcc		@@diag3
	cmp		r0,0x7
	bcc		@@diag4
	cmp		r0,0x8
	bcc		@@diag5
	b		@@die

@@sethitboxhor:
	ldr		r1,=0xfff8
	strh	r1,[r4,0x14]
	mov		r1,0x50
	strh	r1,[r4,0x16]
	ldrb	r1,[r4]
	mov		r2,0x40
	and		r2,r1
	cmp		r2,0x0
	beq		@@left
	ldr		r1,=0xFFA0
	strh	r1,[r4,0x18]
	mov		r1,0x40
	strh	r1,[r4,0x1a]
	b		@@setOAMhor
@@left:
	ldr		r1,=0xFFc0
	strh	r1,[r4,0x18]
	mov		r1,0x60
	strh	r1,[r4,0x1a]
@@setOAMhor:
	ldr		r1,=horflareoam
	str		r1,[r4,0x4]
	cmp		r0,0x4
	bcc		@@hor1
	cmp		r0,0x5
	bcc		@@hor2
	cmp		r0,0x6
	bcc		@@hor3
	cmp		r0,0x7
	bcc		@@hor4
	cmp		r0,0x8
	bcc		@@hor5
	b		@@die

@@vert1:
	ldr		r3,=vert1
	b		@@setgfx
@@vert2:
	ldr		r3,=vert2
	b		@@setgfx
@@vert3:
	ldr		r3,=vert3
	b		@@setgfx
@@vert4:
	ldr		r3,=vert4
	b		@@setgfx
@@vert5:
	ldr		r3,=vert5
	b		@@setgfx

@@diag1:
	ldr		r3,=diag1
	b		@@setgfx
@@diag2:
	ldr		r3,=diag2
	b		@@setgfx
@@diag3:
	ldr		r3,=diag3
	b		@@setgfx
@@diag4:
	ldr		r3,=diag4
	b		@@setgfx
@@diag5:
	ldr		r3,=diag5
	b		@@setgfx

@@hor1:
	ldr		r3,=hor1
	b		@@setgfx
@@hor2:
	ldr		r3,=hor2
	b		@@setgfx
@@hor3:
	ldr		r3,=hor3
	b		@@setgfx
@@hor4:
	ldr		r3,=hor4
	b		@@setgfx
@@hor5:
	ldr		r3,=hor5
	b		@@setgfx

@@setgfx:
	ldr		r0,=0x40000d4
	str		r3,[r0]
	ldr		r1,=0x6010900
	str		r1,[r0,0x4]
	ldr		r2,=0x80000080
	str		r2,[r0,0x8]
	ldr		r1,[r0,0x8]
	ldr		r1,=0x6010d00
	str		r1,[r0,0x4]
	ldr		r1,=0x100
	add		r1,r1,r3
	str		r1,[r0]
	str		r2,[r0,0x8]
	ldr		r1,[r0,0x8]

	b		@@return

@@die:
	mov		r0,0x0
	str		r0,[r4]
	b		@@return
@@return:
;	pop		r4-r6
	pop		r4
	pop		r14
	bx		r14

.pool


.align
horflareoamframe:
.align
	.halfword	0002
	.halfword	0x40f4,0x81f0,0x2048
	.halfword	0x4004,0x81f0,0x204c

.align
horflareoam:
.word horflareoamframe
.word 0x000000ff
.word 0x0,0x0

.align
diagflareoamframe:
.align
	.halfword	0002
	.halfword	0x40f4,0x81f0,0x2048
	.halfword	0x4004,0x81f0,0x204c

.align
diagflareoam:
.word diagflareoamframe
.word 0x000000ff
.word 0x0,0x0

.align
vertflareoamframe:
.align
	.halfword	0002
	.halfword	0x40f4,0x81f0,0x2048
	.halfword	0x4004,0x81f0,0x204c

.align
vertflareoam:
.word vertflareoamframe
.word 0x000000ff
.word 0x0,0x0

.align 0x10
hor1:
.import "code/gfx/flareHor/hor1.gfx"
hor2:
.import "code/gfx/flareHor/hor2.gfx"
hor3:
.import "code/gfx/flareHor/hor3.gfx"
hor4:
.import "code/gfx/flareHor/hor4.gfx"
hor5:
.import "code/gfx/flareHor/hor5.gfx"
diag1:
.import "code/gfx/flareDiag/diag1.gfx"
diag2:
.import "code/gfx/flareDiag/diag2.gfx"
diag3:
.import "code/gfx/flareDiag/diag3.gfx"
diag4:
.import "code/gfx/flareDiag/diag4.gfx"
diag5:
.import "code/gfx/flareDiag/diag5.gfx"
vert1:
.import "code/gfx/flareVert/vert1.gfx"
vert2:
.import "code/gfx/flareVert/vert2.gfx"
vert3:
.import "code/gfx/flareVert/vert3.gfx"
vert4:
.import "code/gfx/flareVert/vert4.gfx"
vert5:
.import "code/gfx/flareVert/vert5.gfx"
