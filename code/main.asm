.gba
.open "out/PZM.gba","out/Metroid Zero Mission Redux.gba",0x8000000

;-------------------------------------
;	Main hacks
;-------------------------------------

	.include "code/BetterMorphRoll.asm"
	.include "code/DessgeegaSidehopperFix.asm"
	.include "code/flashydoors.asm"
	;.include "code/Fundamentals.asm"
	.include "code/UnkItems.asm"
	.include "code/KraidPlasmaDamage.asm"
	.include "code/misc.asm"
	;.include "code/addons/HazardDamageSuit_1.1.asm"
	;.include "code/addons/LedgeVault_2.1.asm"

;-------------------------------------
;	Optional hacks
;-------------------------------------
	;.include "optional/low_health_alarm.asm"

.close
