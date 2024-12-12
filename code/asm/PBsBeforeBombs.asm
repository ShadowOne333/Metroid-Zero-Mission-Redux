; This lets you use Power Bombs before obtaining Bombs, and prevents a softlock in the status screen for doing so.

; allow laying PBs before bombs
.org 0x8008022
	ldrb    r1,[r3,2]
	mov     r0,4
	and     r0,r1
	cmp     r0,0	
	beq     @@TryLayBomb
	mov     r0,5  ; power bomb
	b       LayBomb
@@TryLayBomb:
	ldrb    r1,[r2,0Dh]
	mov     r0,80h
	and     r0,r1
	cmp     r0,0h
	beq     8008046h
	mov     r0,4h  ; normal bomb
	b       LayBomb

.org 0x8008044
LayBomb:
	strb    r0,[r3,1h]


; fix status screen

; check PBs if no bombs
.org 0x80709F2
	beq     0x8070A08
.org 0x8070A02
	b       0x8070A08
.org 0x8070A24
	b       0x8070BFE  ; return if not any bombs

; if PBs and no bombs, gray bombs out
.org 0x8070A9E
	beq     0x8070B66

; make PB activation not depend on bomb activation
.org 0x8070B1A
	b       0x8070B28

; skip assigning cursor position (avoid selecting bombs)
.org 0x8070BEC
	b       0x8070BFE

;
