.gba
.open "out/PZM.gba","out/Metroid Zero Mission Redux.gba",0x8000000

.include "code/BetterMorphRoll.asm"
.include "code/DessgeegaSidehopperFix.asm"
.include "code/flashydoors.asm"
.include "code/Fundamentals.asm"
.include "code/KraidPlasmaDamage.asm"
.include "code/misc.asm"

.close
