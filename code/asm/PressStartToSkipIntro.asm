; Press start button to skip new file intro.
; This is the new code from the japanese version backported to MF_U.
; By SpineShark

.definelabel SubGameMode1, 0x3000BE0
.definelabel GameCompletion, 0x3000014
.definelabel ChangedInputStart, 0x30011EC
.definelabel WrittenToBLDY, 0x300121E
.definelabel NonGameplayRam, 0x3001484

pressStartToSkipIntroasm:
.org 0x808770E ; In NewFileIntroSubroutine
    mov     pc,r0
    mov     r1,0 ; return point
    ldsh    r1,[r2,r1]

.org 0x8087724
    .dw StartToSkipIntro ; use existing ldr for hijack
