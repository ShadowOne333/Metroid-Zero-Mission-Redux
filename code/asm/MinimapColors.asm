; fix initial colors for pause screen minimap
.org 0x84113E4
	.dh Color1,Color1

; add animated palette
.org 0x840DCE6
	.dh Color1,Color2,Color3,Color4,Color5

; set color in generic sprite palette
.org 0x832BA74
	.dh Color1

; fix palette index used for hidden heated tiles on hud minimap
.org 0x840D73E
	.db 0x06,0x06
.org 0x840D78E
	.db 0x60,0x60

; modifies routine that updates minimap animated palettes
.org 0x806FD00
    push    r4,r5,r14
    ldr     r0,=0x8754BC4
    ldr     r3,[r0]
    ldrb    r4,[r3,0x11]
    mov     r5,r0
    cmp     r4,0
    bne     @@_806FD86
    ldrh    r0,[r3,0x18]
    add     r0,1
    strh    r0,[r3,0x18]
    ldr     r2,=0x840DCF0
    mov     r1,0x1A
    ldsb    r1,[r3,r1]
    add     r1,r1,r2
    ldrb    r1,[r1]
    cmp     r0,r1
    bcc     @@_806FD86
    strh    r4,[r3,0x18]
    ldrb    r0,[r3,0x1A]
    add     r0,1
    strb    r0,[r3,0x1A]
    ldr     r1,[r5]
    ldrb    r0,[r1,0x1A]
    cmp     r0,3
    bls     @@_806FD3A
    mov     r0,0
    strb    r0,[r1,0x1A]
@@_806FD3A:
    ldr     r1,=0x840DCB0
    ldr     r2,[r5]
    mov     r0,0x1A
    ldsb    r0,[r2,r0]
    lsl     r2,r0,1			; r2 = frame * 2
    add     r0,r2,r1
    ldrh    r3,[r0]
    ldr     r0,=0x8754BB8
    ldr     r0,[r0]
    mov     r12,r0			; r12 = 0x5000000
    strh    r3,[r0,0x24]	; normal
    strh    r3,[r0,0x26]

    ldr     r1,=0x840DC90
    add     r0,r2,r1
    ldrh    r3,[r0]
    mov     r0,r12
    add     r0,0x64
    strh    r3,[r0]			; hidden
    strh    r3,[r0,2]

    ldr     r1,=0x840DCD0
    add     r0,r2,r1
    ldrh    r3,[r0]
    mov     r0,r12
    add     r0,0x44
    strh    r3,[r0]			; heated
    strh    r3,[r0,2]
	
    ldr     r1,=0x840DCE6
    add     r0,r2,r1
    ldrh    r3,[r0]
    mov     r0,r12
    add     r0,0x84
    strh    r3,[r0]			; hidden heated
    strh    r3,[r0,2]
@@_806FD86:
    mov     r4,r5
    ldr     r2,[r4]
    ldrb    r0,[r2,0x12]
    cmp     r0,7
    bhi     @@_806FDEE
    ldrh    r0,[r2,0x1C]
    add     r0,1
    strh    r0,[r2,0x1C]
    mov     r3,0x1E
    ldsb    r3,[r2,r3]
    cmp     r3,0
    bge     @@_806FDA0
    neg     r3,r3
@@_806FDA0:
    ldr     r1,=0x840DCF4
    add     r1,r3,r1
    ldrb    r1,[r1]
    cmp     r0,r1
    bcc     @@_806FDEE
    mov     r0,0
    strh    r0,[r2,0x1C]
    ldrb    r0,[r2,0x1E]
    add     r0,1
    strb    r0,[r2,0x1E]
    ldr     r1,[r4]
    mov     r0,0x1E
    ldsb    r0,[r1,r0]
    cmp     r0,0x10
    blt     @@_806FDC8
    mov     r0,0xE
    neg     r0,r0
    strb    r0,[r1,0x1E]
@@_806FDC8:
    ldr     r0,[r5]
    mov     r3,0x1E
    ldsb    r3,[r0,r3]
    cmp     r3,0
    bge     @@_806FDD4
    neg     r3,r3
@@_806FDD4:
    ldr     r1,=0x840DD04
    ldrb    r0,[r0,0x12]
    add     r0,r0,r1
    ldrb    r1,[r0]
    ldr     r0,=0x8754BB8
    ldr     r0,[r0]
    lsl     r1,r1,1
    add     r1,r1,r0
    ldr     r2,=0x83FD2F0
    lsl     r0,r3,1
    add     r0,r0,r2
    ldrh    r0,[r0]
    strh    r0,[r1]
@@_806FDEE:
    pop     r4,r5
    pop     r0
    bx      r0
    .pool