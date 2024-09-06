fastSaveasm:

.org 0x801fd04
    nop

.org 0x801fd0e
    beq 0x801fd6c

.org 0x801fcda
    mov r0,#0x0
    mov r1,#0x35
    strb r0,[r5,r1]
    nop

.org 0x801fd84
    ldr r0,=fastSave+1
    bl BXR0
    pop pc
    .pool