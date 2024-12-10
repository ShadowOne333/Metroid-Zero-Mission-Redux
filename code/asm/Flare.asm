flareasm:
;FLARE
.org 0x805144C
	mov		r15,r0
.org 0x8051464
	.word flarehijack

.org 0804F17Ch
	push	r0
	ldr		r0,=doflare
	mov		r15,r0
.pool


.org 0x0804EE26
	ldr		r0,=flareSpawnhijack
	mov		r15,r0
.pool
.org 0x804ee36
	str		r2,[r3] ;set word status

;clearprojectile1
.org 0x0804EE36
	str	r2,[r3]
.org 0x8050ba2
	str r0,[r4]
.org 0x8050166
	str r0,[r2]
.org 0x804f940
	str r2,[r0]
	
