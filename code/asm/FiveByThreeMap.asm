fiveByThreeMapasm:
;.org 0x8053A7A ; -> 8D to ?? escape timer X
;   mov r1,8Dh-03h

.org 0x805257e
mov r0,minimapy+8*1 ;y offset blinky based on define
.org 0x8052596
mov r0,minimapx+8*2 ;x offset blinky based on define
.org 0x80525f4
ldr r0,=makemapoam ;no longer using original 32x32 oam to make minimap movable
mov r15,r0
.pool


.org 0x80538a0
b 0x80538c0 ;skip transfering mapgfx, we'll handle that

.org 0x806c5cc
ldr r6,[r15,1ch] ;reconfigure to only use first 5 tiles out of 9 tile buffer.. should free 20*4 bytes but only during gameplay, pause uses it iirc
b .+0ah
.org 0x806c60a
mov r5,2 ;start row update at -2 x
.org 0x806c61e ;free pool for our own use be reusing another pointer
ldr r0,[r15,080h]
ldrb r0,[r0,1]
.org 0x806c68c
ldr r0,[r15,14h]
mov r15,r0
.org 0x806c6a4 ;put addr in pool
dw mapjack