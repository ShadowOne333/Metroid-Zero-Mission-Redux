; This ASM can be used to change the area, room, and position in which the game begins.
; Original patch by Biospark, modified by SpineShark to play the intro fanfare.

;.gba
;.open "ZM_U.gba","ZM_U_StartingRoomWithFanfare.gba",0x8000000

/* ===== Instructions =====
- On line 17, you can choose between 7 areas:
    0 = Brinstar, 1 = Kraid, 2 = Norfair, 3 = Ridley, 4 = Tourian, 5 = Crateria, 6 = Chozodia
- Set the ID of the starting room on line 18, this is needed to trigger the fanfare.
- In MAGE's object editing mode, add a 1x1 door, and hover your mouse over it. The "Current Door:" ID is what you use on line 19.
- The player will start in the room the specified door is placed, precisely where it is.
- On line 20, you can set the music track for the first room. Use the wiki link to find what you want.
    https://wiki.metroidconstruction.com/doku.php?id=zero_mission:locations:soundtrack
*/

; Debug tests for UnkItems
; Area 5, Room 0x00, Door 0x38 for Normal landing site for Redux
; Area 0, Room 0x00, Door 0x00 for vanilla Brinstar starting room
; Area 0, Room 0x17, Door 0x33 for Varia Suit
; Area 5, Room 0x09, Door 0x25 for Plasma Beam
; Area 1, Room 0x21, Door 0x50 for Space Jump
; Area 3, Room 0x0D, Door 0x1F for Gravity Suit
; Area 6, Room 0x29, Door 0x58 for Charlie Fight (Needs Suitless Samus)

@StartingArea equ 5         ;\
@StartingRoom equ 0         ; } Set the desired starting area, room, door and music here
@StartingDoor equ 0x38      ; |
@StartingMusic equ 0xE      ;/

;.definelabel DisablePauseFlag, 0x3000049
.definelabel ShipLandingFlag, 0x300004B
;.definelabel AreaID, 0x3000054
.definelabel GameModeSub3, 0x3000C75
.definelabel PreventMovementTimer, 0x3001606

.include "code/asm/GunshipDelayHatchOpening.asm"

;If you want to remove the footstep sounds before the fanfare, use this: 21971A: BD -> B1
 .org 0x821971A ; Cut-off footsteps SFX on Gunship landing intro sequence
	.byte 0xB1

;If your starting room has animated backgrounds that don't animate during the fanfare (like rain), try this tweak: 56EA0 : 01 -> 00 (credits to Yohann)
.org 0x8056EA0
    ;.byte 0x00

; In the InGameCutsceneSamusCloseUp function
.org 0x805F95C
.area 20, 0
    ldr     r0,=PreventMovementTimer
    ldrh    r0,[r0]
    cmp     r0,0x32 :: bhi @@Return
    mov     r0,13                   ; Skip to cutscene stage 13
    strb    r0,[r2,2]               ; r2 = InGameCutsceneData address
@@Return:
    b       0x805FD3E
    .pool
.endarea

.org 0x805FD34
    mov     r0,0
    ldr     r1,=DisablePauseFlag
    strb    r0,[r1]
    strb    r0,[r1,1]               ; Unset the HideHud flag

.org 0x805FD54 
.area 4
    .pool
.endarea


; In the InGameCutsceneCheckPlayOnTransition function
.org 0x80605F8
    mov     r0,@StartingMusic       ; Set music track to play

.org 0x806060E
    b       0x80606AA               ; Skip most of the initialization for the close up cutscene          


; In the InGameCutsceneTryQueue function (checks if a specific cutscene can be queued)
.org 0x8060780
    cmp     r0,@StartingRoom        ; Check current room

.org 0x8060788
    cmp     r0,@StartingDoor        ; Check last door used


; In the CutsceneEnd function
.org 0x8060F5C                      ; Handle the end of the intro text cutscene
    ldr     r0,=AreaID
    mov     r1,@StartingArea
    strb    r1,[r0]
    mov     r1,@StartingDoor
    strb    r1,[r0,2h]
    ldr     r0,=ShipLandingFlag
    mov     r1,0
    strb    r1,[r0]
    ldr     r0,=GameModeSub3
    strb    r1,[r0]
    b       0x8060FDA
    .pool


; In the InGameCutsceneData array
.org 0x8360309
    .byte @StartingArea             ; Set the area in which the close up cutscene plays


;.close

