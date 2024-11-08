;-------------------------------------------------------------------
; 		Main assembly file
;-------------------------------------------------------------------
.gba
.open "out/PZM.gba","out/Metroid Zero Mission Redux.gba",0x8000000
.notice "Standard"

;-------------------------------------
;		Options
;-------------------------------------

.include "code/tweaks.asm"
.include "code/settings.asm"
;.include "code/gfx.asm"
.include "code/labels.asm"

;-------------------------------------
;		Main hacks
;-------------------------------------
/* Credits for the different hacks:
A collective effort of yohann, somerando, biospark, captain glitch, raygun

biospark- unknown items, starting room, scale end percent, 4th map color

captglitch- faster item grab, tractor beam, start with items

raygun- tractor beam, unknown items, transparent map fix

somerando- more map messages, getting this to work

quote58- tractor beam

yohann- tractor beam, unknown items, more map messages

o7 thank you friends. you are the reason cool stuff like this exists
*/

;-------------------------------------
; Start including source code files
;-------------------------------------

.include "code/asm/BetterMorphRoll.asm"

.include "code/asm/DessgeegaSidehopperFix.asm"
.notice "Dessgeega Sidehopper Fix"

.include "code/asm/FlashyDoors.asm"

.include "code/asm/ItemGrab.asm"
.include "code/asm/ItemToggle.asm"

.include "code/asm/KraidPlasmaDamage.asm"
.notice "Kraid Vulnerable to Plasma Beam"

.include "code/asm/MapFix.asm"

.include "code/asm/MinimapColours.asm"
.notice "Add a 4th Minimap Colour"

.include "code/asm/KnownItems.asm"

.include "code/asm/ScaleEndPercent.asm"

.include "code/asm/StartingItems.asm"
.include "code/asm/StartingRoom.asm"

.include "code/asm/TractorBeam.asm"

;.include "code/asm/UnkItems.asm"

.include "code/asm/WeaponToggleOnDeath.asm"

;.include "code/addons/HazardDamageSuit_1.1.asm"

;.include "code/addons/LedgeVault_2.1.asm"

;-------------------------------------
;	Freespace Hijacks
;-------------------------------------
.include "code/freespace.asm"

;-------------------------------------
;	Optional hacks
;-------------------------------------

;.include "optional/low_health_alarm.asm"

;-------------------------------------

.notice "Done." 
.close
