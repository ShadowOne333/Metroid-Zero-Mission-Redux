.definelabel NumberOfTracks,0x31

.org 0x807ADC4
	.word SoundIDs

.org 0x807AE68
	.word SoundIDs
	
.org 0x807AE7C
	cmp r0,NumberOfTracks-1

.org 0x807AEB8
	mov r0,NumberOfTracks
	
.org 0x807AF00
	.word SoundIDs
	
.org 0x807B028
	mov r0,NumberOfTracks

.org 0x807B08C
	.word SoundIDs

.org 0x8760BAC	;Old SoundID Offset
	.fill 0x30,0xFF
	
.org 0x8762260	;New SoundID Offset, *present in vanilla soundtest
SoundIDs:
	.halfword 0x0000	;None* (00)
	.halfword 0x0009	;File_Select* (01)
	.halfword 0x0004	;Intro (02)
	.halfword 0x0039	;Intro_Mother_Brain (03)
	.halfword 0x0002	;Title_Screen* (04)
	.halfword 0x0001	;Brinstar* (05)
	.halfword 0x0003	;Save_Elevator_Room (06)
	.halfword 0x000A	;Statue_Room* (07)
	.halfword 0x003C	;Worms_Battle* (08)
	.halfword 0x000C	;Map_Room* (09)
	.halfword 0x0006	;Norfair* (10)
	.halfword 0x0048	;Entering_Norfair_Cutscene (11)
	.halfword 0x0050	;Crateria (12)
	.halfword 0x000D	;Chozo_Ruins_Depth* (13)
	.halfword 0x000E	;Chozo_Ruins* (14)
	.halfword 0x000F	;Chozo_Ruins_Light (15)
	.halfword 0x0018	;Elevaor_Room (Boss_Statues) (16)
	.halfword 0x0007	;Kraid* (17)
	.halfword 0x004B	;Kraid_Battle* (18)
	.halfword 0x001C	;Statue_Room_Opened (19)
	.halfword 0x000B	;Boss_Killed (20)
	.halfword 0x0010	;Ridley_In_Space (21)
	.halfword 0x003E	;Catterpillars_Battle* (22)
	.halfword 0x003F	;Imago_Cocoon_Battle* (23)
	.halfword 0x0032	;Ridley* (24)
	.halfword 0x0011	;Ridley_Landing (25)
	.halfword 0x0040	;Imago_Battle* (26)
	.halfword 0x004C	;Ridley_Battle_2* (27)
	.halfword 0x003B	;Tourian* (28)
	.halfword 0x0044	;Entering_Tourian_Cutscene (29)
	.halfword 0x003D	;Mother_Brain_Battle (30)
	.halfword 0x0008	;Escape* (31)
	.halfword 0x0014	;Escaping_Zeres_Cutscene (32)
	.halfword 0x0046	;Stealth* (33)
	.halfword 0x0049	;Chozodia_Detected (34)
	.halfword 0x0045	;Alarm_Activated* (35)
	.halfword 0x0017	;Before_Ruins_Test_Room_2 (36)
	.halfword 0x0005	;Chozo_Statue_Hint (37)
	.halfword 0x004E	;Ruins_Test_Battle* (38)
	.halfword 0x0013	;Getting_Fully_Powered_Suit_Cutscene (39)
	.halfword 0x0019	;Brinstar_Remix (40)
	.halfword 0x004D	;Mecha_Ridley_Battle_2* (41)
	.halfword 0x001A	;Escape_Succesful (42)
	.halfword 0x001B	;Credits* (43)
	.halfword 0x0036	;Loading_jingle (44)
	.halfword 0x0037	;Getting_Item_Jingle (45)
	.halfword 0x003A	;Getting_Tank_Jingle (46)
	.halfword 0x0042	;Getting_Unknown_Item_Jingle (47)
	.halfword 0x004A	;Getting_Fully_Powered_Suit_Jingle (48)
	.halfword 0x0053	;Game_Over (49)

