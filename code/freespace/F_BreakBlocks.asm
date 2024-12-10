; ---------- 

CheckForWeakness: ; r4 has block type ; r3 has CAA damage type
    ldr r0,=BlockWeaknessesRevealTable
    lsl r1,r4,#0x1
    add r0,r1
    ldrh r0,[r0,#0x0]
    and r0,r3 ; BlockWeaknessesRevealTable[type] & CCAADamageType
    beq @@DoNothing
    ldr r0,=0x80597be
    mov pc,r0 ; Jump to reveal code

    @@DoNothing:
    ldr r0,=0x80597e2
    mov pc,r0
    .pool

CheckForWeaknessChain: ; r3 has block type ; r2 has CAA damage type
    ldr r0,=BlockWeaknessesRevealTable
    lsl r1,r3,#0x1
    add r0,r1
    ldrh r0,[r0,#0x0]
    and r0,r2 ; BlockWeaknessesRevealTable[type] & CCAADamageType
    beq @@DoNothing
    ldr r0,=0x8059838
    mov pc,r0 ; Jump to reveal code

    @@DoNothing:
    ldr r0,=0x805986E
    mov pc,r0
    .pool

.definelabel ClipDamageNone,0x0
.definelabel ClipDamageBeam,0x1
.definelabel ClipDamageBomb,0x2
.definelabel ClipDamageMissile,0x4
.definelabel ClipDamageSuperMissile,0x8
.definelabel ClipDamagePowerBomb,0x10
.definelabel ClipDamageSpeedboost1,0x20
.definelabel ClipDamageSpeedboost2,0x40
.definelabel ClipDamageScrew,0x80
.definelabel ClipDamageBombChain,0x1000

BlockWeaknessesRevealTable: ; Offset with block type
    .halfword ClipDamageNone
    .halfword ClipDamageNone ; Shot block reform
    .halfword ClipDamageBeam | ClipDamageMissile | ClipDamageSuperMissile | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 ; Bomb block reform
    .halfword ClipDamageBomb | ClipDamageMissile | ClipDamageSuperMissile | ClipDamagePowerBomb | ClipDamageBombChain ; Speedbooster reform
    .halfword ClipDamageBomb | ClipDamageMissile | ClipDamageSuperMissile | ClipDamagePowerBomb | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Crumble
    .halfword ClipDamageBomb | ClipDamageMissile | ClipDamageSuperMissile | ClipDamagePowerBomb | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Slow Crumble
    .halfword ClipDamageBeam | ClipDamageBomb | ClipDamageMissile | ClipDamageSuperMissile | ClipDamagePowerBomb | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Missile never reform
    .halfword ClipDamageBeam | ClipDamageBomb | ClipDamageMissile | ClipDamageSuperMissile | ClipDamagePowerBomb | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Missile non reform
    .halfword ClipDamageBomb | ClipDamageMissile | ClipDamageSuperMissile | ClipDamagePowerBomb | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Super Missile never reform
    .halfword ClipDamageBomb | ClipDamageMissile | ClipDamageSuperMissile | ClipDamagePowerBomb | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Super Missile no reform
    .halfword ClipDamageBomb | ClipDamageMissile | ClipDamageSuperMissile | ClipDamagePowerBomb | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Power Bomb never reform
    .halfword ClipDamageBomb | ClipDamageMissile | ClipDamageSuperMissile | ClipDamagePowerBomb | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Screw no reform
    .halfword ClipDamageBomb | ClipDamageMissile | ClipDamageSuperMissile | ClipDamagePowerBomb | ClipDamageBombChain ; Speedbooster no reform
    .halfword ClipDamageBeam | ClipDamageMissile | ClipDamageSuperMissile | ClipDamagePowerBomb | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Bomb never reform
    .halfword ClipDamageBeam | ClipDamageMissile | ClipDamageSuperMissile | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Vertical bomb chain 1
    .halfword ClipDamageBeam | ClipDamageMissile | ClipDamageSuperMissile | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Vertical bomb chain 2
    .halfword ClipDamageBeam | ClipDamageMissile | ClipDamageSuperMissile | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Vertical bomb chain 3
    .halfword ClipDamageBeam | ClipDamageMissile | ClipDamageSuperMissile | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Vertical bomb chain 4
    .halfword ClipDamageBeam | ClipDamageMissile | ClipDamageSuperMissile | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Horizontal bomb chain 1
    .halfword ClipDamageBeam | ClipDamageMissile | ClipDamageSuperMissile | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Horizontal bomb chain 2
    .halfword ClipDamageBeam | ClipDamageMissile | ClipDamageSuperMissile | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Horizontal bomb chain 3
    .halfword ClipDamageBeam | ClipDamageMissile | ClipDamageSuperMissile | ClipDamageSpeedboost1 | ClipDamageSpeedboost2 | ClipDamageBombChain ; Horizontal bomb chain 4