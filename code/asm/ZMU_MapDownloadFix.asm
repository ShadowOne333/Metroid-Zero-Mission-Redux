; Fixes broken graphics when downloading a map with transparent tiles
; Original patch by Raygun, this version by SpineShark

;.gba
;.open "ZM_U.gba","MapDownloadFix.gba",0x8000000

.definelabel gCurrentSprite, 0x3000738
.definelabel gPauseScreenFlag, 0x3000BF0
.definelabel MapStationDownloading, 0x801F5E0
.definelabel sMapStationOam_Retracting, 0x82D3778

.org MapStationDownloading
.area 0x4C,0
	push	r4-r7,lr
	add 	r7,=@@Data		;\
	ldmia 	r7!,r1-r7		; } Load all data at once to save ldr instructions
	ldrb	r0,[r1,0x1C]	;\
	sub 	r0,1			; } work0--, strb delayed to save one instruction
	beq 	@@Zero			; Sub can set zero flag, saves a cmp
	cmp 	r0,10
	beq		@@Ten
@@Return:
	strb 	r0,[r1,0x1C]	; Store work0
	pop		r4-r7,pc

@@Zero:		; r0 = work0 == 0
	strh 	r0,[r1,6]		; currentAnimationFrame
	strb 	r0,[r1,0xC]		; animationDurationCounter
	str 	r2,[r1,8]		; pOam
	mov 	r2,0x27
	strb 	r2,[r1,0x14]	; pose
	mov 	r0,10			; work0
	b		@@Return

@@Ten:		; r0 = work0 == 10
	push 	r5				;\
	mov 	r5,sp			; } Setup DMA fill from fixed address on stack
	add 	sp,4			; |
	stmia 	r4!,r5-r7		;/
	mov 	r2,5
	strb 	r2,[r3]			; Set gPauseScreenFlag
	b		@@Return

.align 4
@@Data:
	.dw gCurrentSprite + 0x10 ; 0x10 offset so we can access all needed struct members with immediate offset loads
	.dw sMapStationOam_Retracting
	.dw gPauseScreenFlag
	.dw 0x40000D4
	.dw 0xEEEEEEEE
	.dw 0x600C000
	.dw 0x85000150
.endarea


;.close

