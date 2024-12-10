mapjack:
;r6=destination ram
;r9=y offset
;r5=x offset
cmp r5,3
beq @@transfertiles
@@skip:
ldr r0,=0x806c610
mov r15,r0 ;continue normal loop

@@transfertiles:
ldr r1,=0x40000d4
sub r6,0x20*5
str r6,[r1] ;src
mov r0,1
add r0,r9
lsl r0,r0,0ah
ldr r7,=0x6011f80
add r0,r0,r7
str r0,[r1,4] ;dest
ldr r0,=0x80000040 ;4 tiles
str r0,[r1,8]
ldr r0,[r1,8] ;technically not needed but why not

add r6,0x20*4
str r6,[r1] ;src
mov r0,1
add r0,r9
mov r7,20h
mul r0,r7
ldr r7,=0x6011b80 ;hidden 4th tile
add r0,r0,r7
str r0,[r1,4] ;dest
ldr r0,=0x80000010 ;1 tile
str r0,[r1,8]
ldr r0,[r1,8] ;technically not needed but why not

ldr r0,=0x806c690
mov r15,r0 ;row done, exit



ldr r4,=0x806c60e
mov r15,r4
.pool

makemapoam:
;r7=next oam offset
;r6=nextoamslotindex-1
;r5=zero

add r6,1+5;1 from overwritten code, 6 from our. original versions used 4 oam pieces total

ldr r0,=0x80004000+(minimapx+0*8)*10000h+minimapy+0*8
str r0,[r7,0]
ldr r0,=0x000050fc
strh r0,[r7,4]

ldr r0,=0x40004000+(minimapx+0*8)*10000h+minimapy+2*8
str r0,[r7,8]
ldr r0,=0x0000513c
strh r0,[r7,0ch]

ldr r0,=0x00000000+(minimapx+4*8)*10000h+minimapy+0*8
str r0,[r7,10h]
ldr r0,=0x000050dc
strh r0,[r7,14h]

ldr r0,=0x00000000+(minimapx+4*8)*10000h+minimapy+1*8
str r0,[r7,18h]
ldr r0,=0x000050dd
strh r0,[r7,1ch]

ldr r0,=0x00000000+(minimapx+4*8)*10000h+minimapy+2*8
str r0,[r7,20h]
ldr r0,=0x000050de
strh r0,[r7,24h]
;add r6,3 ;moved this to up because unused by me

ldr r1,=0x8052644
mov r15,r1
.pool