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

.include "code/asm/AutoCharge.asm"
.include "code/asm/BallSpark.asm"
;.include "code/asm/BeamBurst.asm"
.include "code/asm/BetterMorphRoll.asm"
.include "code/asm/BetterWallJump.asm"
.include "code/asm/BreakBlocks.asm"
;.include "code/asm/ChargeHeal.asm"
.include "code/asm/DessgeegaSidehopperFix.asm"
.notice "Dessgeega Sidehopper Fix"

;.include "code/asm/EditWeapons.asm"

.include "code/asm/FiveByThreeMap.asm"
;.include "code/asm/Flare.asm"
.include "code/asm/FlashyDoors.asm"
.include "code/asm/FrozenWalljump.asm"
.include "code/asm/HazardDamageSuit.asm"
.include "code/asm/HudColors.asm"

.include "code/asm/ImagoCocoonBlocksFix.asm"
.notice "Imago Cocoon Blocks Fix"

.include "code/asm/ItemGrab.asm"
.include "code/asm/ItemToggle.asm"

.include "code/asm/KraidPlasmaDamage.asm"
.notice "Kraid Vulnerable to Plasma Beam"

.include "code/asm/LedgeVault.asm"
.include "code/asm/LowHealth.asm"
.include "code/asm/MapFix.asm"

.include "code/asm/MinimapColours.asm"
.notice "Add a 4th Minimap Colour"

.include "code/asm/NewPhysics.asm"
.include "code/asm/NoBombJumpDown.asm"
.include "code/asm/PBsBeforeBombs.asm"
.include "code/asm/PowerBombJump.asm"

.include "code/asm/RestoreCloseup.asm"
.notice "Restore Samus Close Up"

.include "code/asm/RShot.asm"

.include "code/asm/ScaleEndPercent.asm"
.include "code/asm/SetTimerValues.asm"
;.include "code/asm/Shipthings.asm"
.include "code/asm/SMControls.asm"
.include "code/asm/SMProjectiles.asm"
.include "code/asm/SparkSteering.asm"
.include "code/asm/SpeedBall.asm"

.include "code/asm/StartingRoom.asm"

.include "code/asm/TractorBeam.asm"

unkItemsasm:
;knownItemsasm:
.include "code/asm/UnkItems.asm"
.ifdef knownItemsasm
	.include "code/asm/PlasmaNerf.asm"
	.include "code/asm/StartingItems.asm"
.endif

;.include "code/asm/UnlockKraid.asm"

.include "code/asm/WeaponToggleOnDeath.asm"

.include "code/asm/ZeroCharge.asm"

;-------------------------------------
;	Freespace Hijacks
;-------------------------------------
.include "code/freespace.asm"

;-------------------------------------
;	Optional hacks
;-------------------------------------

;.include "optional/RemoveLowHealthAlarm.asm"
.ifdef removeHealthAlarm
	.notice "Optional: Low Health Alarm Removed"
.endif

;.include "optional/RemoveCloseup.asm"
.ifdef removeCloseup
	.notice "Optional: Remove Samus Close Up"
.endif

;.include "optional/HideGalleryImages.asm"
.ifdef hideGalleryImages
	.notice "Optional: Hide Back All Gallery Images"
.endif

.include "optional/PurpleGravitySuit.asm"
.ifdef blueGravity
	.notice "Optional: Purple Gravity Suit"
.endif

;-------------------------------------

.notice "Done." 
.close
