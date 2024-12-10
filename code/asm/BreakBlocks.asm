;Basically just a table similar to the block weakness
;So you'll end up with something like
;if (BlockWeaknesses[type] & ClipdataDamageTypes[CCAA])
;    // Destroy
;else if (BlockRevealWeaknesses[type] & ClipdataDamageTypes[type])
;    // Reveal
;else
;    // Do nothing
breakBlocksasm:


.org 0x805978e
    ldrh r3,[r1,#0x0] ; Save CCAA damage in r3

.org 0x8059792
    and r0,r3 ; Preserve r3
    cmp r0,#0x0

.org 0x80597ac
    ldr r0,=CheckForWeakness
    mov pc,r0
    .pool

;.org 0x805982C
;    .word BlockWeaknessesRevealTable

; bomb/bombchains

.org 0x8059800
    ;ldrb r4,[r0,#0x2]

.org 0x805980e
    ;lsl r5,r4,#0x1

.org 0x8059812
;    ldrh r2,[r0,#0x0]
    ;ldrh r3,[r0,#0x0]

.org 0x8059816
;   and r0,r2
;   cmp r0,#0x0
    ;and r0,r3
    ;cmp r0,#0x0

;.org 0x8059830
.org 0x8059830
    ldr r0,=CheckForWeaknessChain
    mov pc,r0
    .pool
    