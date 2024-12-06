.org 0x807A118	; 01 D0 -> 00 00
	mov r0,r0
.org 0x807A048	; 00 -> 03 	; Unlock both time attack records
	mov r3,3h

.org 0x807A0A6	; 3A D0 -> 00 00	; Unlock gallery
	mov r0,0h
.org 0x807A0B0	; 3A D0 -> 00 00	; Golden Gallery text
	mov r0,0h
	
.org 0x807A0FA	; 10 D0 -> 00 00	; Unlock fusion gallery
	mov r0,r0
.org 0x807BAAE	; 09 D0 -> 00 00
	mov r0,r0

; fix wrong tile colour in Gallery Image #1
; 0x3D92 -> 0x4D10
.org 0x854A942
	.halfword 0x4D10

; fix for area message corner not being flipped
; .org 0x82f8081
; .byte 0x10
; .org 0x82f80b9
; .byte 0x10
; .org 0x82f812f
; .byte 0x10
; .org 0x82f8167
; .byte 0x10
; .org 0x82f819f
; .byte 0x10
; .org 0x82f81d1
; .byte 0x10
; .org 0x82f820f
; .byte 0x10

; make ballspark delay the same as shinespark delay
.org 0x8009E3A
	cmp r0,1Ah ; 2+2+10+6 of regular shinespark delay
.org 0x8007418
	mov r0,8Eh ; change sfx from ballspark to shinespark
.org 0x800EFD8
	mov r0,8Eh ; change sfx from ballspark to shinespark

.org 0x80597B4 ; Reveal blocks with missiles and super missiles. (as well as the usual bombs and power bombs)
	.byte 0x03, 0xD0, 0x09, 0x29, 0x01, 0xD0, 0x0A, 0x29

.org 0x8055156 ; Charge particle visible when spinjumping
	mov r0,r0
	
.org 0x8239064 ; Fix space jump arm cannon position for above tweak
	.byte 0xC8, 0x51, 0x23, 0x08, 0x88, 0x51, 0x23, 0x08

; Faster door transitions
.org 0x805CE36
	add r0,12h ; Default 6h
.org 0x805CE54
	sub r0,12h ; Default 6h

; Back out of status screen by pressing START (raygun)
.org 0x8071830
	.byte 0Ah
/*  */
; Back out of sleep screen by pressing START (raygun)
.org 0x8072064
	.byte 0Ah
	
; Back out of world map screen by pressing START (raygun)
.org 0x806E1AA
	.byte 0Bh

; Press any button to close save station messages (raygun)
.org 0x801B9E8
	mov r0,r1
	nop

; Shift down Ridley 2x2 map icon by 2 tiles (somerando)
.org 0x840D212
	.byte 8h

	
; Walljump animation frame timers. adjusting these can reduce or lengthen WJ delay (raygun)
.org 0x8250174 ; Power Suit
.byte 1 ; Frame 1. Default 2h
.org 0x8250184
.byte 2 ; Frame 2. Default 2h
.org 0x8250194
.byte 0 ; Frame 3. Default 2h

.org 0x829F984 ; Zero Suit
.byte 1 ; Frame 1. Default 2h
.org 0x829F994
.byte 2 ; Frame 1. Default 2h
.org 0x829F9A4
.byte 0 ; Frame 1. Default 2h

; Press B to skip elevator/boss intro cutscenes. 	(somerando/yohann)
.org 0x806136C
	mov r0,r0
; Replace track of statue activation cutscene (use this in conjunction with the cutscene skip, or else the music loops!)
.org 0x805CB14
	mov r1,0Ah

; Enable walljumping with space jump (jumzhu.diwa)
.org 0x8006138
	.halfword 0x61D0
.org 0x8008F72
	bgt 8008F92h
.org 0x8008F90
	nop

; Enable speedball jumping (captain glitch)
.org 0x8006B48
	b 8006B50h
.org 0x80095D0
	add r1,6Ah

;Time Attack is available at the file select screen without a button combination (biospark)
.org 0x807DACC
	b 807DAD8h

; Hard difficulty can be selected for any new game (biospark)
.org 0x807DE0E
	bne 807DE34h

; faster spark impacts
.org 0x8009DE0 ; pose 23 = shinespark
	cmp r0,8h ;check if animation counter = 8 frames
.org 0x8009F3C ; pose 27 = ballspark
	cmp r0,8h ;check if animation counter = 8 frames


; Shinespark in 2 block tall passages	(kiliwily)
.org 0x800870A ;D1 0B -> C0 46
	;.halfword 0xC046
	nop
.org 0x8008992 ;D1 0B -> C0 46
	;.halfword 0xC046
	nop

; Getting damaged no longer resets shinespark timer	(captain glitch)
.org 0x8007024 ; 20 72 to C0 46
	nop
	
; Screw attack and speed booster reveal hidden tanks (kiliwily)
.org 0x8059280 
	mov r0,0BFh
	
; Screw attack breaks bomb chain blocks (kiliwily)
;.org 0x8345ACC
;	.byte 0x92,0x10
;	.byte 0x92,0x10
;	.byte 0x92,0x10
;	.byte 0x92,0x10
;	.byte 0x92,0x10
;	.byte 0x92,0x10
;	.byte 0x92,0x10
;	.byte 0x92,0x10
;	.byte 0x92,0x10

; Fight Ridley before getting Gravity Suit (luce seyfarth)
.org 0x80322D2
	b 80322D8h

; Space Jump in liquids without the gravity suit (captain glitch)
.org 0x8008F50
	b 8008F5Ah

; Bomb Jump in liquids without the gravity suit (somerando)
.org 0x8007956
	nop

; Black Pirates made weak to all beams (biospark)
.org 0x802CC16
	b 802CC36h

; Lets you stay Power Gripped to ledges During a Super Missile/PB explosion (captain glitch)
.org 0x8009608
	b 800961Ch
.org 0x800979C
	b 80097ACh
.org 0x80098BC
	b 80098CCh
	
; Imago's Doors will Unlock As Soon As He Dies (captain glitch)
;.org 0x8043178
;	b 804318Ch

; Imago pseudo-screw softlock fix
.org 0x80105F4
	mov r0,62h
	
; Deorem (King Worm/Charge Beam Worm) won't run away (captain glitch)
;.org 0x8023158
;	b 8023164h

;.org 0x80002D4 ; Skip boot intros (captain glitch)
;	.byte 0x2
	
 .org 0x8062E5C ; No sounds after landing ship in intro
;118 = Just ship opening noise
;36 = appearance
 	.halfword 36h
	
; No chozo hints (Makes all statues sit)
;.org 0x8013E00
;	.halfword 0x4004
;.org 0x8013E08
;	.halfword 0x4004
;.org 0x8013E10
;	.halfword 0x4004
;.org 0x8013E18
;	.halfword 0x4004
;.org 0x8013E20
;	.halfword 0x4004
;.org 0x8013E28
;	.halfword 0x4004
;.org 0x8013E30
;	.halfword 0x4004
;.org 0x8013E38
;	.halfword 0x4004
; [No chozo hints] fixes room with first chozo statue
;.org 0x8340B4D
;	.byte 0
;.org 0x8340B54
;	.word 0x8364F4C

; Remove minimap 
;.org 0x8052570
;	b 8052644h

; Add minimap tiles (biospark)
;.org 0x806A61A
;	mov r3,80h
;.org 0x806A61C
;	lsl r3,r3,7h

; Add elevators (+ Remove cutscenes) (Do not use for vanilla) (biospark)
;.org 0x80580FC
;	b 805812Ch
;.org 0x8058126
;	b 805812Ch

; Add elevators (Keep cutscenes) (biospark)
;.org 0x8058126
;	b 805812Ch
	
; Samus will no longer glow when leaving morph ball mode
;.org 0x800951E
;	.byte 0x0
;.org 0x8009572
;	.byte 0x0

; Samus' Ship will no longer refill energy or ammunition (captain glitch)
;.org 0x8045132
;	b 8045212h
;.org 0x804521A
;	mov r0,0h
;.org 0x8045228
;	mov r1,16h
;.org 0x8045236
;	b 804523Eh
	
; No more beeping when samus is below 30 energy
;.org 0x8052888
;	b 80528B4h

; A in the pause menu no longer opens a worldmap (captain glitch)
;.org 0x806E1AA
;	mov r0,2h

; New Game+ Item collection & timer is always on. (biospark)
.org 0x806896C
	b 806897Ah	
	
; ; The Chozodia/Mothership tube can be destroyed at any time (biospark)
; .org 0x8046476
;	.halfword 0xE004

; ; All hatches with more than one hit's worth of “health” will flash.
; 0x5E793 = 0D to 0E
; ; Amount of hits required to open hatches: (Maximum is Fh times)
; .org 0x8345CB2	; Blue, 0h default
	; .byte 0h
; .org 0x8345CB6	; Red, 0h default
	; .byte 3h
; .org 0x8345CBA	; Green, 0h default
	; .byte 0h
; .org 0x8345CBE	; Yellow, 0h default
	; .byte 0h

; [MF_U] -- In-Game Timer increments a second every 60 frames, instead of every 64.
; Editing in no$gba: 08068678:  3F  >>  3B
; Editing in HxD: 00068678:  3F  >>  3B
; Side Effects: None~!
;Now made my Zero Mission (ZM_U) version! Head over to address 080579D0. The ME_E, MF_J and MF_C  versions are still WIP.
.org 0x080579D0
	.db 0x3B	; 3F

; ; Separates missile/super missile vulnerabilities. Something weak to missiles probably won't be weak to supers, and vice-versa. (captain glitch)
; .org 0x8050AC2
	; .byte 0x4 ;sprite missile vulnerability only includes normal missiles
; .org 0x8345CB4
	; .byte 0x4 ;missile doors only open with normal missiles
; .org 0x8345ABC
	; .byte 0x4 ;super missiles can't break never reform missile blocks
; .org 0x8345ABE
	; .byte 0x4 ;super missiles can't break no reform missile blocks

; ;PSEUDO SCREW ATTACK DAMAGE VALUES (raygun)
; ;short damage
; .org 0x80105A4     
	; mov     r1,2h
; ;long damage
; .org 0x80105B2     
	; mov     r1,3h
; ;ice damage
; .org 0x80105BC     
	; add     r0,r1,1
; ;wave damage
; .org 0x80105CA     
	; add     r0,r1,1
; ;plasma damage
; .org 0x80105D8     
	; add     r0,r1,1

; ; BEAM DAMAGE VALUES (raygun)
; ; .org 0x804FFEA 
	; ; mov     r3,2h          ; short_________________Default 2h
; ; .org 0x804FFFC 
	; ; mov     r3,3h          ; long__________________Default 3h
; ; .org 0x805001A 
	; ; mov     r3,4h          ; long Ice______________Default 4h
; ; .org 0x805002C 
	; ; mov     r3,3h          ; Ice___________________Default 3h
; ; .org 0x8050052 
	; ; mov     r3,5h          ; Long Ice wave_________Default 5h
; ; .org 0x8050064 
	; ; mov     r3,4h          ; Long Wave_____________Default 4h
; ; .org 0x805007E 
	; ; mov     r3,4h          ; Ice Wave______________Default 4h
; ; .org 0x8050090 
	; ; mov     r3,3h          ; Wave__________________Default 3h
.ifdef unkItemsasm
.org 0x80500BE 
	mov     r3,6h          ; Long Ice Wave Plasma,___Default 6h
.org 0x80500D8 
	mov     r3,5h          ; Long wave Plasma,_______Default 5h
.org 0x80500FA 
	mov     r3,5h          ; Ice Long/Wave Plasma,___Default 5h
.org 0x805010C 
	mov     r3,4h          ; Ice Plasma,_____________Default 4h
.org 0x8050126 
	mov     r3,4h          ; Long/Wave Plasma,_______Default 4h
.org 0x8050138 
	mov     r3,3h          ; Plasma,_________________Default 3h
.endif
.org 0x805015C 
	mov     r3,10h          ; Charged Short_________Default 8h
.org 0x8050174 
	mov     r3,18h         ; Charged Long__________Default Ch
.org 0x8050192 
	mov     r3,20h         ; Charged Long Ice______Default 10h
.org 0x80501A4 
	mov     r3,18h         ; Charged Ice___________Default Ch
.org 0x80501CA 
	mov     r3,28h         ; Charged Long Ice Wave_Default 14h
.org 0x80501DC 
	mov     r3,20h         ; Charged Long Wave_____Default 10h
.org 0x80501F6 
	mov     r3,20h         ; Charged Ice Wave______Default 10h
.org 0x8050208 
	mov     r3,18h         ; Charged Wave__________Default Ch
.ifdef unkItemsasm
.org 0x805023C
	mov     r3,30h         ; Charged Long Ice Wave Plasma,__Default 18h
.org 0x8050256 
	mov     r3,28h         ; Charged Long Wave Plasma,______Default 14h
.org 0x8050278 
	mov     r3,28h         ; Charged Long/Wave Ice Plasma,__Default 14h
.org 0x805028A 
	mov     r3,20h         ; Charged Ice Plasma,_____________Default 10h
.org 0x80502A4 
	mov     r3,20h         ; Charged Long/Wave Plasma,_______Default 10h
.org 0x80502B6 
	mov     r3,18h         ; Charged Plasma,_________________Default 0Ch
.endif

; Energy Tank Values
;.org 0x83459C4 ;Easy, 100 Default
;	.byte 0x64
;.org 0x83459C8 ;Normal, 100 Default
;	.byte 0x64
;.org 0x83459CC ;Hard, 50 Default
;	.byte 0x32

; Missile Tank Values
;.org 0x83459C5 ;Easy, 5 Default
;	.byte 0x05
;.org 0x83459C9 ;Normal, 5 Default
;	.byte 0x05
;.org 0x83459CD ;Hard, 2 Default
;	.byte 0x02

; Super Missile Tank Values
;.org 0x83459C6 ;Easy, 2 Default
;	.byte 0x02
;.org 0x83459CA ;Normal, 2 Default
;	.byte 0x02
;.org 0x83459CE ;Hard, 1 Default
;	.byte 0x01

; Power Bomb Tank Values
;.org 0x83459C7 ;Easy, 2 Default
;	.byte 0x02
;.org 0x83459CB ;Normal, 2 Default
;	.byte 0x02
;.org 0x83459CF ;Hard, 1 Default
;	.byte 0x01
	
; Starting Energy/Ammo (Deprecated by startingItems ASM)
;.org 0x83459C0
;	.byte 0x63 ;Energy, Default 99
;.org 0x83459C1
;	.byte 0x0 ;Missiles, Default 0
;.org 0x83459C2
;	.byte 0x0 ;Super Missiles, Default 0
;.org 0x83459C3
;	.byte 0x0 ;Power Bombs, Default 0
	
; Energy/Ammo Drops
;.org 0x8012F00
;	.byte 0x5 ;small energy drop value, default 5
;.org 0x8012F20
;	.byte 0x14 ;large energy drop value, default 0x14 = 20
;.org 0x8012F40
;	.byte 0x2 ;missile drop value, default 2
;.org 0x8012F60
;	.byte 0x2 ;super missile drop value, default 2
;.org 0x8012F80
;	.byte 0x1 ;power bomb drop value, default 1

;
; UNKNOWN ITEMS ENABLED = LESS PLASMA BEAM DAMAGE
;

;.org 0x805EF8A ; Instant room transitions (biospark)
;    b       0x805EF94

; Ridley aggro damage threshold
.org 0x8031DB6
	cmp r1, 28h ; Default: C8 = 200 damage = 10 missiles

; Mecha Ridley 100% mode check (biospark)
.org 0x804C038 ; main body
	cmp r0,3Bh	; default 64h
	ble 804C044h ; default bne
.org 0x804D188 ; part (glass cover)
	cmp r0,3Bh	; default 64h
	ble 804D194h ; default bne
	
; Kraid nails always shoot fast
.org 0x801b65A ;Nails rotation speed
	nop
	nop
.org 0x801a864 ;Nails velocity
	nop
	nop
	
; kraid gadora shoots (secondary sprite spawns incorrectly under it) (raygun)
.org 0x804a0d2
	nop
	nop

; Enemies do not experience stun on hardmode (captain glitch)
.org 0x801128A
	cmp r0,2h
.org 0x801128C
	beq 80112B6h

.ifdef knownItemsasm
.org 0x80500BE 
	mov     r3,2h          ; Long Ice Wave Plasma,__Default 6h
.org 0x80500D8 
	mov     r3,2h          ; Long wave Plasma,______Default 5h
.org 0x80500FA 
	mov     r3,2h          ; Ice Long/Wave Plasma,__Default 5h
.org 0x805010C 
	mov     r3,2h          ; Ice Plasma,____________Default 4h
.org 0x8050126 
	mov     r3,2h          ; Long/Wave Plasma,______Default 4h
.org 0x8050138 
	mov     r3,1h          ; Plasma,________________Default 3h

.org 0x805023C 
	mov     r3,18h         ; Charged Long Ice Wave Plasma,__Default 18h
.org 0x8050256 
	mov     r3,14h         ; Charged Long Wave Plasma,______Default 14h
.org 0x8050278 
	mov     r3,14h         ; Charged Long/Wave Ice Plasma,__Default 14h
.org 0x805028A 
	mov     r3,10h         ; Charged Ice Plasma,_____________Default 10h
.org 0x80502A4 
	mov     r3,10h         ; Charged Long/Wave Plasma,_______Default 10h
.org 0x80502B6 
	mov     r3,0Ch         ; Charged Plasma,_________________Default 0Ch
.endif

.notice "Tweaks Loaded."
