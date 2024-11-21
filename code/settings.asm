;.definelabel Color1,		0x7DBF		;
;.definelabel Color2,		0x7E5F 		; Adjustable colors for 4th animated minimap palette
;.definelabel Color3,		0x7EFF 		; minimapColors.asm uses the 7th slot at $32BA68 for a 4th minimap color. (Pink per my default)
;.definelabel Color4,		0x7E5F 		; $4113E0 for map screen 4th color (static) and $3FD2D0 for the dimmed version (also static)
;.definelabel Color5,		0x7DBF 		;

.definelabel Color1,		0x7C1F
.definelabel Color2,		0x7CFF
.definelabel Color3,		0x7D1F
.definelabel Color4,		0x7CFF
.definelabel Color5,		0x7C1F

.definelabel minimapx,		0xC6
.definelabel minimapy,		0x02

.definelabel MaxPercent,	100 		; Change this line to number of items for scaling end percent asm

.definelabel BigSuit,		0x10 		; Change this line to the desired fully powered suit (ex: 10 for varia, 20 for gravity, 30 for both)

.definelabel EndOfROM,		0x87F8000	; Change this to desired location of end of ROM for freespace ASM (0x8A00000)
.notice "Settings Loaded."
