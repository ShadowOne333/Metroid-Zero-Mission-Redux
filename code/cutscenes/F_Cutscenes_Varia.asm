MotherBrainCloseUp:
	ldr r0,=Equipment
	ldrb r0,[r0,#0xF]
	mov r1,#0x10
	and r0,r1
	beq @@NoVaria

	ldr r5,=0x8376284
	ldr r6,=MotherBrainCloseUpVariaGfx
	ldr r7,=MotherBrainCloseUpVariaTileTable

	b @@Return

@@NoVaria:

	ldr r5,=0x83761e4
	ldr r6,=0x837b404
	ldr r7,=0x8382434

@@Return:
	; Palette
	ldr r4,=DmaTransfer
	mov r0,#0x10
	str r0,[sp,#0x0]
	mov r1,r5
	ldr r2,=0x50000A0
	mov r3,#0xA0
	mov r0,#0x3
	bl CallR4

	; Graphics
	ldr r3,=CallLz77Uncomp
	ldr r5,=0x8375d20
	mov r1,r5
	add r1,#0x20
	ldrb r1,[r1,#0x0]
	lsl r1,r1,#0xE
	mov r4,#0xC0
	lsl r4,r4,#0x13
	add r1,r1,r4
	mov r0,r6
	bl CallR3

	; Tile table
	mov r0,r7
	mov r1,r5
	add r1,#0x21
	ldrb r1,[r1,#0x0]
	lsl r1,r1,#0xB
	add r1,r1,r4
	ldr r3,=CallLz77Uncomp
	bl CallR3

	ldr r0,=0x80630ac
	mov pc,r0
	.pool

KraidRising:
	ldr r0,=Equipment
	ldrb r0,[r0,#0xF]
	mov r1,#0x10
	and r0,r1
	beq @@NoVaria

	ldr r4,=0x836c0d8
	ldr r5,=KraidRisingVariaGfx

	b @@Return

@@NoVaria:
	ldr r4,=0x836c098
	ldr r5,=0x836f214

@@Return:
	mov r1,r4
	ldr r2,=0x5000200
	mov r0,#0x10
	str r0,[sp,#0x0]
	mov r0,#0x3
	mov r3,#0x20

	ldr r4,=DmaTransfer
	bl CallR4

	mov r0,r5
	ldr r1,=0x6010000
	ldr r3,=CallLz77Uncomp
	bl CallR3

	ldr r0,=0x8062a0e
	mov pc,r0
	.pool

RidleySpawning:
	strh r0,[r4,#0x0]

	ldr r0,=Equipment
	ldrb r0,[r0,#0xF]
	mov r1,#0x10
	and r0,r1
	beq @@NoVaria

	ldr r0,=RidleySpawnVariaGfx

	b @@Return

@@noVaria:

	ldr r0,=0x83b8ccc

@@Return:
	ldr r1,=0x6010000
	ldr r3,=CallLz77Uncomp
	bl CallR3

	ldr r0,=0x8065752
	mov pc,r0
	.pool

TourianEscape:
	ldr r0,=Equipment
	ldrb r0,[r0,#0xF]
	mov r1,#0x10
	and r0,r1
	beq @@NoVaria

	ldr r3,=TourianEscapeVariaGfx
	ldr r4,=TourianEscapeVariaTileTable

	b @@Return

@@NoVaria:
	ldr r3,=0x8481ccc
	ldr r4,=0x8484d5c

@@Return:
	mov r0,r3
	mov r1,#0xC0
	lsl r1,r1,#0x13
	ldr r3,=CallLz77Uncomp
	bl CallR3

	mov r0,r4
	ldr r1,=0x6007000
	ldr r3,=CallLz77Uncomp
	bl CallR3

	ldr r0,=0x80828be
	mov pc,r0
	.pool

CallR4:
	mov pc,r4
CallR3:
	mov pc,r3

	.align 4,0

MotherBrainCloseUpVariaGfx:
	.import "code/cutscenes/MBSamusGFX.bin"
	.align 4,0
MotherBrainCloseUpVariaTileTable:
	.import "code/cutscenes/MBSamusTileTable.bin"
	.align 4,0

KraidRisingVariaGfx:
	.import "code/cutscenes/KraidSamusGFX.bin"

RidleySpawnVariaGfx:
	.import "code/cutscenes/RidleySamusGFX.bin"

TourianEscapeVariaGfx:
	.import "code/cutscenes/TourianEscapeSamusGFX.bin"
	.align 4,0
TourianEscapeVariaTileTable:
	.import "code/cutscenes/TourianEscapeSamusTileTable.bin"
	.align 4,0
