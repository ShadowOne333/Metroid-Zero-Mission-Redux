weaponToggleOnDeathasm:

; No weapon toggle when samus is not alive
.org 0x80080A4
	bl WeaponToggle
