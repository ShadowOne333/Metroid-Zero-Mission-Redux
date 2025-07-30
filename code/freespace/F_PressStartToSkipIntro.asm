; Press start button to skip new file intro.
; This is the new code from the japanese version backported to MF_U.
; By SpineShark

StartToSkipIntro:
    ldr     r0,=SubGameMode1
    mov     r2,0
    ldsh    r1,[r0,r2]
    mov     r2,r0
; New code from MF_J:
    cmp     r1,0
    beq     @@_808866E
    cmp     r1,0xC
    beq     @@_808866E
;    ldr     r0,=GameCompletion ;\
;    ldrb    r0,[r0]            ; \
;    lsl     r0,r0,0x18         ;  check if game completed before 
;    asr     r0,r0,0x18         ;  checking if start pressed
;    cmp     r0,0               ; /
;    beq     @@_808866E         ;/
    ldr     r0,=ChangedInputStart
    ldrh    r1,[r0]
    mov     r0,8
    and     r0,r1
    cmp     r0,0
    beq     @@_808866E
    ldr     r0,=WrittenToBLDY
    mov     r1,0x10
    strh    r1,[r0]
    ldr     r0,=0x4000054
    strh    r1,[r0]
    ldr     r0,=NonGameplayRam
    ldr     r3,=0x20E
    add     r0,r0,r3
    strh    r7,[r0]
    mov     r0,0xC
    strh    r0,[r2]
@@_808866E:
    ldr     r3,=0x8087710 ; return address
    mov     pc,r3
.pool
