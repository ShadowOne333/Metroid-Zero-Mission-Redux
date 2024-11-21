;-------------------------------------
;	Freespace ASM
;-------------------------------------

;-------------------------------------
; First area, located within the unused Crocomire's AI portion of the ROM

.org 0x8011F08	; 0x8043DF0, Croco AI, Unused, moved to 11F10 since its area cleared up by MAGE
.area 0xC2
	.ifdef betterRollasm
		.include "code/freespace/F_BetterMorphRoll.asm"
		.notice "Better Morph Ball Roll"
	.endif

	.ifdef itemGrabasm
		.include "code/freespace/F_ItemGrab.asm"
		.notice "Item Grab"
	.endif

	.ifdef scaleEndPercentasm
		.include "code/freespace/F_ScaleEndPercent.asm"
		.notice "Scale Ending Percentage"
	.endif
.endarea

;-------------------------------------
; Second area, located within the unused Crocomire's GFX portion of the ROM

; All new addresses are reused from available space made by MAGE
.org 0x833E8B8
.area 0xE5
	.ifdef unkItemsasm
		.include "code/freespace/F_UnkItems.asm"
		.notice "Restore Original Unknown Items"
	.endif

	.ifdef knownItemsasm
		.include "code/freespace/F_UnkItems.asm"
		.notice "Recognize Unknown Items on Item Get"
	.endif
.endarea

.org 0x833FD30
.area 0x53
	.ifdef hazardDamageasm
		.include "code/freespace/F_HazardDamageSuit.asm"
		.notice "Hazard Damage Suit"
	.endif
.endarea

.org 0x8361B00	; 
.area 0x60
	.ifdef smProjectilesasm
	ImNotAWrapper:
		ldr	r0,=AddSpeeds
		mov	r15,r0
	.pool
	.endif

	.ifdef tractorBeamasm
	DrawPickupWrapper:
		ldr	r0,=DrawPickup
		mov	r15,r0
	.pool
	.endif

	.ifdef weaponToggleOnDeathasm
		.include "code/freespace/F_WeaponToggleOnDeath.asm"
		.notice "No Weapon Toggle on Death"
	.endif
.endarea



;-------------------------------------
; End of ROM area. Adjust as needed for your hacks.

.org 0x87606EC
	.word UnkItemText
.org 0x87609EC
	.word UnkAnalysis

.org EndOfROM
	.ifdef flashyDoorsasm
		.include "code/freespace/F_FlashyDoors.asm"
		.notice "Flashy Doors"
	.endif

	.ifdef mapFixasm
		.include "code/freespace/F_MapFix.asm"
		.notice "Transparent Map Fix"
	.endif

	.ifdef plasmaNerfasm
		.include "code/freespace/F_PlasmaNerf.asm"
		.notice "Plasma Beam Nerfed"
	.endif

	.ifdef startingItemsasm
		 .include "code/freespace/F_StartingItems.asm"
		 .notice "Starting Items"
	.endif

	.ifdef tractorBeamasm
		.include "code/freespace/F_TractorBeam.asm"
		.notice "Tractor beam"
	.endif
	
	.ifdef ledgeVaultasm
		.include "code/freespace/F_LedgeVault.asm"
		.notice "Ledge Vault"
	.endif

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

.notice "Freespace Loaded."
