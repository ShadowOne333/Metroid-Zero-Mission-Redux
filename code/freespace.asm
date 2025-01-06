;-------------------------------------
;	Freespace ASM
;-------------------------------------

;-------------------------------------
; First area, located within the unused Crocomire's AI portion of the ROM

.org 0x8043DF0 ; Unused Crocomire AI
.area 0x2EC
	.ifdef scaleEndPercentasm
		.include "code/freespace/F_ScaleEndPercent.asm"
		.notice "Scale Ending Percentage"
	.endif

	.ifdef powerBombJumpasm
		.include "code/freespace/F_PowerBombJump.asm"
		.notice "Power Bomb Jump"
	.endif
;.org 0x8043E58
	.ifdef noBombJumpDownasm
		.include "code/freespace/F_NoBombJumpDown.asm"
		.notice "No Bomb Jump Down"
	.endif

	.ifdef chargeHealasm
		.include "code/freespace/F_ChargeHeal.asm"
		.notice "Charge Heal"
	.endif

	.ifdef itemGrabasm
		.include "code/freespace/F_ItemGrab.asm"
		.notice "Item Grab"
	.endif
.endarea

;-------------------------------------
.org 0x8011F08	; 0x8043DF0-0x8043F10-F36, Croco AI, Unused, moved to 11F10 since it is area cleared up by MAGE
.area 0xC2
	.ifdef hazardDamageasm
		.include "code/freespace/F_HazardDamageSuit.asm"
		.notice "Hazard Damage Suit"
	.endif

	.ifdef weaponToggleOnDeathasm
		.include "code/freespace/F_WeaponToggleOnDeath.asm"
		.notice "No Weapon Toggle on Death"
	.endif
.endarea

;-------------------------------------
.org 0x8304054 ; Croco GFX, unused
.area 0x3094
	.ifdef smProjectilesasm
	ImNotAWrapper:
		ldr	r0,=AddSpeeds
		mov	r15,r0
	.pool
	.endif
;.org 0x830405C
	.ifdef ballSparkasm
		.include "code/freespace/F_BallSpark.asm"
		.notice "Ball Spark"
	.endif

	.ifdef betterRollasm
		.include "code/freespace/F_BetterMorphRoll.asm"
		.notice "Better Morph Ball Roll"
	.endif

	.ifdef rShotasm
		.include "code/freespace/F_RShot.asm"
		.notice "R-Shot"
	.endif
;.org 0x830410E
	.ifdef speedBallasm
		.include "code/freespace/F_SpeedBall.asm"
		.notice "Speed Ball"
	.endif

	.ifdef tractorBeamasm
	DrawPickupWrapper:
		ldr	r0,=DrawPickup
		mov	r15,r0
	.pool
	.endif

	.ifdef unkItemsasm
		.include "code/freespace/F_UnkItems.asm"
		.notice "Restore Original Unknown Items"
	.else
		.include "code/freespace/F_UnkItems.asm"
		.notice "Recognize Unknown Items on Item Get"
	.endif

	.ifdef unlockKraidasm
		.include "code/freespace/F_UnlockKraid.asm"
		.notice "Unlock Kraid"
	.endif

	.ifdef frozenWallJumpasm
		.include "code/freespace/F_FrozenWalljump.asm"
		.notice "Frozen Walljump"
	.endif

.endarea

;-------------------------------------
; Second area, located within the unused Crocomire's GFX portion of the ROM. All addresses are reused from available space made by MAGE
.org 0x833E8B8
.area 0xE5

.endarea

.org 0x833FD30
.area 0x53

.endarea

.org 0x8361B00
.area 0x60

.endarea

;-------------------------------------
; End of ROM area. Adjust as needed for your hacks.

;.org 0x87606EC
	;.word UnkItemText
;.org 0x87609EC
	;.word UnkAnalysis


.org EndOfROM	; 0x87F8000

	.ifdef smControlsasm
		.include "code/freespace/F_SMControls.asm"
		.notice "Super Metroid Controls"
	.endif

	.ifdef fiveByThreeMapasm
		.include "code/freespace/F_FiveByThreeMap.asm"
		.notice "5x3 Minimap"
	.endif

	.ifdef beamBurstasm
	.ifndef flareasm
		.include "code/freespace/F_BeamBurst.asm"
		.notice "Beam Burst"
	.endif
	.endif

	.ifdef betterWallJumpasm
		.include "code/freespace/F_BetterWallJump.asm"
		.notice "Better Walljump"
	.endif

	.ifdef mapFixasm
		.include "code/freespace/F_MapFix.asm"
		.notice "Transparent Map Fix"
	.endif

	.ifdef newPhysicsasm
		.include "code/freespace/F_NewPhysics.asm"
		.notice "New Physics"
	.endif

	.ifdef plasmaNerfasm
		.include "code/freespace/F_PlasmaNerf.asm"
		.notice "Plasma Beam Nerfed"
	.endif

	.ifdef sparkSteeringasm
		.include "code/freespace/F_SparkSteering.asm"
		.notice "Spark Steering"
	.endif

	.ifdef startingItemsasm
		.include "code/freespace/F_StartingItems.asm"
		.notice "Starting Items"
	.endif

	.ifdef hudColorsasm
		.include "code/freespace/F_HudColors.asm"
		.notice "HUD Colors"
	.endif

	.ifdef smProjectilesasm
		.include "code/freespace/F_SMProjectiles.asm"
		.notice "Super Metroid Projectiles"
	.endif

	.ifdef speedDamageasm
		.include "code/freespace/F_SpeedDamage.asm"
		.notice "Speed Damage"
	.endif

	.ifdef lowHealthasm
		.include "code/freespace/F_LowHealth.asm"
		.notice "Low Health"
	.endif

	.ifdef flareasm
		.include "code/freespace/F_Flare.asm"
	.endif
	.ifdef flareasm
	.ifndef beamBurstasm
		.notice "Flare"
	.endif
	.endif

	.ifdef tractorBeamasm
		.include "code/freespace/F_TractorBeam.asm"
		.notice "Tractor beam"
	.endif

	.ifdef breakBlocksasm
		.include "code/freespace/F_BreakBlocks.asm"
		.notice "Break Blocks"
	.endif

	.ifdef autoChargeasm
		.include "code/freespace/F_AutoCharge.asm"
		.notice "Auto Charge"
	.endif

	.ifdef flashyDoorsasm
		.include "code/freespace/F_FlashyDoors.asm"
		.notice "Flashy Doors"
	.endif
	
	.ifdef ledgeVaultasm
		.include "code/freespace/F_LedgeVault.asm"
		.notice "Ledge Vault"
	.endif

	.ifdef singleWaveBeamasm
		.include "code/freespace/F_SingleWaveBeamShot.asm"
		.notice "Single Wave Beam Shot"
	.endif

	.ifdef soundTestExpansionasm
		.include "code/freespace/F_SoundTestExpansion.asm"
		.notice "Sound Test Expansion"
	.endif

;-------------------------------------
;.org 0x8442D22		; Unknown Item
UnkItemText:
	; Unknown Item
	.halfword 0x8050
	.halfword 0x8105,0x95,0xCE,0xCB,0xCE,0xCF,0xD7,0xCE,0x40
	.halfword 0x89,0xD4,0xC5,0xCD,0x8100
	.halfword 0xFE00,0x8000

UnkAnalysis:
	; Analysis Inconclusive
	.halfword 0x8106,0x81,0xCE,0xC1,0xCC,0xD9,0xD3,0xC9,0xD3,0x40
	.halfword 0xC9,0xCE,0xC3,0xCF,0xCE,0xC3,0xCC,0xD5,0xD3,0xC9,0xD6,0xC5,0x4E
	.halfword 0x8100
	; Item incompatible with current suit
	.halfword 0x89,0xD4,0xC5,0xCD,0x40
	.halfword 0xC9,0xCE,0xC3,0xCF,0xCD,0xD0,0xC1,0xD4,0xC9,0xC2,0xCC,0xC5,0x40
	.halfword 0xD7,0xC9,0xD4,0xC8,0x40
	;.halfword 0xC3,0xD5,0xD2,0xD2,0xC5,0xCE,0xD4,0x40
	.halfword 0xD3,0xD5,0xC9,0xD4,0x4E,0xFF00

;-------------------------------------
.notice "Freespace Loaded."
;-------------------------------------
