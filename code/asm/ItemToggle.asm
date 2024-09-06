itemToggleasm:

; enable item toggle
.org 0x8071C1A
    b       0x8071C36
    
; allow bombs to be toggled
.org 0x8071BAC
    beq     0x8071C36
    mov     r6,0x80
    ldr     r5,=BeamBombActivation
    b       0x8071C36
    .pool

; allow suits to be toggled
.org 0x8071BE6
    b       0x8071C36
    
; always draw on/off
.org 0x8071D5A
    b       0x8071D7A
    
;