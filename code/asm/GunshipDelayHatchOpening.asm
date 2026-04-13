.definelabel @HideHudFlag, 0x300004A

; In the Gunship function
.org 0x8046046
    bl      @CheckShouldOpen
    b       0x8046060

; Unused function ZoomerLandingInit_Unused
.org 0x801707C
.area 0x18, 0
@CheckShouldOpen:
    ldr     r0,=@HideHudFlag
    ldrb    r0,[r0]
    cmp     r0,0 :: bhi @@DontOpen
    mov     r0,1
    bx      lr 
@@DontOpen:
    ldr     r0,=0x8046062
    mov     pc,r0 
    .pool
.endarea

