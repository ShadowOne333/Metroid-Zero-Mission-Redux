/*
   TIMERS 
   SET HOW LONG IT TAKES FOR SOMETHING TO HAPPEN

   COOLDOWNS 
   SETS HOW LONG IT TAKES BEFORE ANOTHER SHOT CAN BE FIRED

   LIMITS 
   SETS THE LIMIT OF HOW MANY PROJECTILES MAY BE ON SCREEN AT ONCE

   SPAWNS
   SETS THE SPEED OF PROJECTILES IMMEDIATELY AFTER SHOOTING THEM

   SPEEDS 
   SETS THE VELOCITY OF PROJECTILES
*/

/* BEAMS */	
    /* Short */
	    /* Spawn */
		.org 0x8050bbc
			mov r1, 0x10	; (default: 10) short

		/* Speed */
		.org 0x8050b80
			mov r1, 0x14	; (default: 14) short

	    /* Range */
		.org 0x8050c46 
			cmp r0, 0x0c	; (default: 0C) short beam range timer
	
    /* Long */
	    /* Spawn */
		.org 0x8050cb4
			mov r1, 0x10	; (default: 10) long

		/* Speed */
		.org 0x8050c78
			mov r1, 0x18	; (default: 18) long

    
	/* Ice */
	    /* Spawn */
		.org 0x8050dbc
			mov r1, 0x10	; (default: 10) ice

		/* Speed */
		.org 0x8050d64
			mov r1, 0x1a	; (default: 1a) ice

	    /* Range */
		.org 0x8050e52 
			cmp r0, 0x0c	; (default: 0C) ice beam range timer

    
	/* Wave */
	    /* Spawn */
		.org 0x80510b6
			mov r1, 0x10	; (default: 10) wave

		/* Speed */
		.org 0x805107a
			mov r1, 0x1c	; (default: 1c) wave

	    /* Range */
		.org 0x805117c 
			cmp r0, 0x0c	; (default: 0C) wave beam range timer

    
	/* Plasma */
	    /* Spawn */
		.org 0x8051222
			mov r1, 0x10	; (default: 10) plasma

		/* Speed */
		.org 0x80511e4
			mov r1, 0x20	; (default: 20) plasma

	    /* Range */
		.org 0x8051340 
			cmp r0, 0x0c	; (default: 0C) plasma beam range timer
	
	
	/* Pistol */
	    /* Cooldown */
		.org 0x804f09a
			mov r0, 0x7	; (default: 7) pistol

		/* Charged Cooldown */
		.org 0x804ef8c
			mov r0, 0x7	; (default: 7) charged pistol

	    /* Recharge */
		.org 0x8007de4
			cmp r0, 0x6f	; (default: 6f) pistol recharge

	    /* Limit */
		.org 0x804f074
			mov r1, 0x6	; (default: 6) pistol

		/* Charged Limit */
		.org 0x804ef66
			mov r1, 0x2	; (default: 2) charged pistol

	    /* Spawn */
		.org 0x80513ac
			mov r1, 0x10	; (default: 10) pistol

	    /* Charged Spawn */
		.org 0x8051ae0
			mov r1, 0x10	; (default: 10) charged pistol

		/* Speed */
		.org 0x8051370
			mov r1, 0x16	; (default: 16) pistol

	    /* Charged Speed */
		.org 0x8051a98
			mov r1, 0x16	; (default: 16) charged pistol

	/* Damage */
	    /* Normal */
			/* Short */
			.org 0x804ffea
			    mov r3,0x2	; (default: 2) short

			/* Long */
			.org 0x804fffc
			    mov r3,0x3	; (default: 3) long

			/* Ice */
			.org 0x805002c
			    mov r3,0x3	; (default: 3) ice

			/* Long + Ice */
			.org 0x805001a
			    mov r3,0x4	; (default: 4) long ice

			/* Wave */
			.org 0x8050090
			    mov r3,0x3	; (default: 3) wave

			/* Long + Wave */
			.org 0x8050064
			    mov r3,0x4	; (default: 4) long wave

			/* Ice + Wave */
			.org 0x805007e
			    mov r3,0x4	; (default: 4) ice wave

			/* Long + Ice + Wave */
			.org 0x8050052
			    mov r3,0x5	; (default: 5) long ice wave

			/* Plasma */
			.org 0x8050138
			    mov r3,0x3	; (default: 3) plasma

			/* Long/Wave + Plasma */
			.org 0x8050126
			    mov r3,0x4	; (default: 4) long/wave plasma

			/* Ice + Plasma */
			.org 0x805010c
			    mov r3,0x4	; (default: 4) ice plasma

			/* Long/Wave + Ice + Plasma */
			.org 0x80500fa
			    mov r3,0x5	; (default: 5) ice long/wave plasma

			/* Long + Wave + Plasma */
			.org 0x80500d8
			    mov r3,0x5	; (default: 5) long wave plasma

			/* Long + Ice + Wave + Plasma */
			.org 0x80500be
			    mov r3,0x6	; (default: 6) long ice wave plasma

		/* Charged */
			/* Pistol */
			.org 0x80502f8	; (default: 0C) charged pistol (uncharged does no damage)
			    mov r3,0x0c			

			/* Short */
			.org 0x805015c
			    mov r3,0x8	; (default: 8) charged short

			/* Long */
			.org 0x8050174
			    mov r3,0x0c	; (default: 0c) charged long

			/* Ice */
			.org 0x80501a4
			    mov r3,0x0c	; (default: 0c) charged ice

			/* Long + Ice */
			.org 0x8050192
			    mov r3,0x10	; (default: 10) charged long ice

			/* Wave */
			.org 0x8050208
			    mov r3,0x0c	; (default: 0c) charged wave

			/* Long + Wave */
			.org 0x80501dc
			    mov r3,0x10	; (default: 10) charged long wave

			/* Ice + Wave */
			.org 0x80501f6
			    mov r3,0x10	; (default: 10) charged ice wave

			/* Long + Ice + Wave */
			.org 0x80501ca
			    mov r3,0x14	; (default: 14) charged long ice wave

			/* Plasma */
			.org 0x80502b6
			    mov r3,0x0c	; (default: 0c) charged plasma

			/* Long/Wave + Plasma */
			.org 0x80502a4
			    mov r3,0x10	; (default: 10) charged long/wave plasma

			/* Ice + Plasma */
			.org 0x805028a
			    mov r3,0x10	; (default: 10) charged ice plasma

			/* Long/Wave + Ice + Plasma */
			.org 0x8050278
			    mov r3,0x14	; (default: 14) charged long/wave ice plasma

			/* Long + Wave + Plasma */
			.org 0x8050256
			    mov r3,0x14	; (default: 14) charged long wave plasma

			/* Long + Ice + Wave + Plasma */
			.org 0x805023c
			    mov r3,0x18	; (default: 18) charged long ice wave plasma

		/* 
		   Pseudo Screw 
		   THESE VALUES ARE SHIFTED LEFT, SO VALUE ?? WILL RESULT IN (??(4)) DAMAGE BEING DEALT. DAMAGE IS A SUM OF EACH ACTIVE BEAM.
		*/
			/* Short */
			     .org 0x80105A4
			         mov r1,0x2   	; (default: 2)

			/* Long */
			     .org 0x80105B2
			         mov r1,0x3   	; (default: 3)

			/* Ice */
			     .org 0x80105BC
			         add r0,r1,0x1	; (default: +1)

			/* Wave */
			     .org 0x80105CA
			         add r0,r1,0x1	; (default: +1)

			/* Plasma */
			     .org 0x80105D8
			         add r0,r1,0x1	; (default: +1)


    /* Cooldown */
              .org 0x804f19c
		   mov r0, 0x7	; (default: 7) beams

	/* Limit */
	       /* Normal */
			.org 0x804f176
			    mov r1, 0x6	; (default: 6) beams
	       /* Charged */
			.org 0x804f066
			    mov r1, 0x2	; (default: 2) charged beam

	/* Thresholds */
		/* Charge Beam */
		 .definelabel threshold, 0x10	; <---- Edit these labels to change a shared value.
		 .definelabel maxcharge, 0x3F	; <---- Edit these labels to change a shared value.
		 .org 0x8007d8c
			 cmp r0, 0x19         		; (default: 19) how long beam must charge before releasing will fire a beam
		 .org 0x8007d84
			 cmp r0, maxcharge    		; (default: 3f) how long beam must charge before releasing will fire a charged beam

		        .org 0x804eec4
		            cmp r0, threshold		; (default: 10) EFFECTS: threshold to spawn charge beam particle
		        .org 0x805511e
		            cmp r1, threshold - 1	; (default: 0F) EFFECTS: threshold to despawn charge beam particle
		        .org 0x80551b6
		            cmp r0, maxcharge    	; (default: 3f) EFFECTS: how long it takes to get fully charged particle

/* MISSILES */
    /* Normal */
		/* Damage */
		.org 0x8050a30
			mov r1, 0x14	; (default: 14) missile
		/* Cooldown */
		.org 0x804f1e0
			mov r0, 0x9	; (default: 9) missile
		/* Limit */
		.org 0x804f1be
			mov r1, 0x4	; (default: 4) missile
		/* Spawn */
		.org 0x8051c1c
			mov r1, 0x30	; (default: 30) missile
		/* Speed */
		.org 0x8051bc8
			add r1, 0x08	; (default: 8) missile
	
	/* Super */
		/* Damage */
		.org 0x8050acc
			mov r1, 0x64	; (default: 64) super
		/* Cooldown */
		.org 0x804f224
			mov r0, 0xb	; (default: 0b) super
		/* Limit */
		.org 0x804f202
			mov r1, 0x4	; (default: 4) super missile
		/* Spawn */
		.org 0x8051d6c
			mov r1, 0x30	; (default: 30) super missile
		/* Speed */
		.org 0x8051d18
			add r1, 0x0c	; (default: 0c) super

/* BOMBS */
    /* Normal */
		/* Damage */
		.org 0x8050b50
			mov r1, 0x08	; (default: 08) bomb
		/* Cooldown */
		.org 0x804f266
			mov r0, 0x7	; (default: 7) bombs
		/* Limit */
		.org 0x804f246
			mov r1, 0x4	; (default: 4) bombs
		/* Timer 1 */
		.org 0x805205c
			mov r0, 0x10	; (default: 10) bomb timer 1
		/* Timer 2 */
		.org 0x80521a2
			mov r0, 0x10	; (default: 10) bomb timer 2 (rapid flashing)
	
	
	/* Power */
		/* Damage 1 */
		.org 0x805052a
			cmp r0, 0x32	; (default: 32) power bomb 1 (enemy hp instant kill threshold)
		/* Damage 2 */
		.org 0x805052e
			sub r0, 0x32	; (default: 32) power bomb 2 (damage)
		/* Cooldown */
		.org 0x804f29e
			mov r0, 0x5	; (default: 5) power bombs
		/* Limit */
		.org 0x804f276
			mov r1, 0x1	; (default: 1) power bombs
		/* Timer 1 */
		.org 0x8052250
			mov r0, 0x36	; (default: 36) power bomb timer 1
		/* Timer 2 */
		.org 0x80522c6
			mov r0, 0x28	; (default: 28) power bomb timer 2 (rapid movement)


/* 
SOUNDS CHEATSHEET
----
 9F pistol shot
 A0 charged pistol shot
----
 F8 missile shot
 F9 missile thrust
 FB super shot
 FC super thrust
----
 C8 short shot
 C9 long shot
 CA ice shot
 CB ice long shot
 CC wave shot
 CD wave long shot
 CE ice wave shot
 CF ice wave long shot
 D0 plasma shot
 D1 plasma long shot
 D2 plasma ice shot
 D3 plasma long ice shot
 D4 plasma wave shot
 D5 plasma long wave shot
 D6 plasma ice wave shot
 D7 plasma long ice wave shot
 ----
 D8 short charge init
 D9 short charge loop
 DA long charge init
 DB long charge loop
 DC wave charge init
 DD wave charge loop
 DE wave long charge init
 DF wave long charge loop
 E0 plasma charge init
 E1 plasma charge loop
 E2 plasma long charge init
 E3 plasma long charge loop
 E4 ice charge init
 E5 ice charge loop
 E6 ice long charge init
 E7 ice long charge loop
----
 E8 charge shot
 E9 long charge shot
 EA ice charge shot
 EB long ice charge shot
 EC wave charge shot
 ED long wave charge shot
 EE wave ice charge shot
 EF long wave ice charge shot
 F0 plasma charge shot
 F1 long plasma charge shot
 F2 plasma ice charge shot
 F3 long plasma ice charge shot
 F4 plasma wave charge shot
 F5 long plasma wave charge shot
 F6 plasma ice wave charge shot
 F7 long plasma ice wave charge shot
----
 FE placing bomb
 FF bomb explosion
 100 placing power bomb
 101 power bomb explosion
 ----
 102 short beam impact
 103 long beam impact
 104 ice beam impact
 105 wave beam impact
 106 plasma beam impact
 107 invincible enemy impact
*/

/* SOUNDS */
.org 0x804f0a6
    mov r0,0x9f	; (default: 9F) pistol shot			 
.org 0x804ef98
    mov r0,0xa0	; (default: A0) charged pistol shot            


.org 0x804f1e4
    mov r0,0xf8	; (default: F8) missile shot			
.org 0x804f1ea
    mov r0,0xf9	; (default: F9) missile thrust
.org 0x8054dca
    mov r0,0xf9	; (default: F9) missile release
.org 0x8054dd0
    mov r0,0xfa	; (default: FA) missile explosion
		  
.org 0x804f228
    mov r0,0xfb	; (default: FB) super shot			  
.org 0x804f22e
    mov r0,0xfc	; (default: FC) super thrust			
.org 0x8054e0a
    mov r0,0xfc	; (default: FC) super release
.org 0x8054e10			
    mov r0,0xfd	; (default: FD) super explosion



.org 0x8054c28
 .word 0x103	; (default: 103) long beam impact

.org 0x8054ca4
 .word 0x105	; (default: 105) wave beam impact

.org 0x8054bde    	; Short beam impact
    mov r0,0x81   	; (default: 81)
.org 0x8054be0    	;
    lsl r0,r0,0x1 	; (default: 1)

.org 0x8054c5a    	; Ice beam impact
    mov r0,0x82   	; (default: 82)
.org 0x8054c5c    	;
    lsl r0,r0,0x1 	; (default: 1)

.org 0x8054d12    	; Plasma beam impact
    mov r0,0x83   	; (default: 83)
.org 0x8054d14    	;
    lsl r0,r0,0x1 	; (default: 1)

.org 0x8054cd6    	; Full beam no plasma impact (Ice beam sound)
    mov r0,0x82   	; (default: 82)
.org 0x8054cd8    	;
    lsl r0,r0,0x1 	; (default: 1)

.org 0x8054d4e    	; Full beam impact (Ice beam sound)
    mov r0,0x82   	; (default: 82)
.org 0x8054d50    	;
    lsl r0,r0,0x1 	; (default: 1)

.org 0x8054d98
 .word 0x107		; (default: 107) invincible impact sound



.org 0x804f172
    mov r5,0xc8	; (default: C8) short shot			  
.org 0x804f16c
    mov r5,0xc9	; (default: C9) long shot			   
.org 0x804f158
    mov r5,0xca	; (default: CA) ice shot			    
.org 0x804f15e
    mov r5,0xcb	; (default: CB) ice long shot		   
.org 0x804f140
    mov r5,0xcc	; (default: CC) wave shot			   
.org 0x804f132
    mov r5,0xcd	; (default: CD) wave long shot		  
.org 0x804f146
    mov r5,0xce	; (default: CE) ice wave shot		   
.org 0x804f138
    mov r5,0xcf	; (default: CF) ice wave long shot             
.org 0x804f112
    mov r5,0xd0	; (default: D0) plasma shot			 
.org 0x804f104
    mov r5,0xd1	; (default: D1) plasma long shot		
.org 0x804f118
    mov r5,0xd2	; (default: D2) plasma ice shot		 
.org 0x804f10a
    mov r5,0xd3	; (default: D3) plasma long ice shot           
.org 0x804f0ee
    mov r5,0xd4	; (default: D4) plasma wave shot		
.org 0x804f0e0
    mov r5,0xd5	; (default: D5) plasma long wave shot          
.org 0x804f0f4
    mov r5,0xd6	; (default: D6) plasma ice wave shot           
.org 0x804f0e6
    mov r5,0xd7	; (default: D7) plasma long ice wave shot      
.org 0x8054fec
    mov r0,0xd8	; (default: D8) short charge init
.org 0x8055074
    mov r0,0xd8	; (default: D8) short charge stop
.org 0x80550fc
    mov r0,0xd9	; (default: D9) short charge loop
.org 0x8054fe4
    mov r0,0xda	; (default: DA) long charge init
.org 0x805506c
    mov r0,0xda	; (default: DA) long charge stop
.org 0x80550f4
    mov r0,0xdb	; (default: DB) long charge loop
.org 0x8054fd4
    mov r0,0xdc	; (default: DC) wave charge init
.org 0x805505c
    mov r0,0xdc	; (default: DC) wave charge stop
.org 0x80550e4
    mov r0,0xdd	; (default: DD) wave charge loop
.org 0x8054fcc
    mov r0,0xde	; (default: DE) wave long charge init
.org 0x8055054
    mov r0,0xde	; (default: DE) long wave charge stop
.org 0x80550dc
    mov r0,0xdf	; (default: DF) wave long charge loop
.org 0x8054fb4
    mov r0,0xe0	; (default: E0) plasma charge init
.org 0x805503c
    mov r0,0xe0	; (default: E0) plasma charge stop
.org 0x80550c4
    mov r0,0xe1	; (default: E1) plasma charge loop
.org 0x8054fac
    mov r0,0xe2	; (default: E2) plasma long charge init
.org 0x8055034
    mov r0,0xe2	; (default: E2) plasma long charge stop
.org 0x80550bc
    mov r0,0xe3	; (default: E3) plasma long charge loop
.org 0x8054f94
    mov r0,0xe4	; (default: E4) ice charge init
.org 0x805501c
    mov r0,0xe4	; (default: E4) ice charge stop
.org 0x80550a4
    mov r0,0xe5	; (default: E5) ice charge loop
.org 0x8054f88
    mov r0,0xe6	; (default: E6) ice long charge init
.org 0x8055010
    mov r0,0xe6	; (default: E6) ice long charge stop
.org 0x8055098
    mov r0,0xe7	; (default: E7) ice long charge loop
.org 0x804f062
    mov r5,0xe8	; (default: E8) charge shot			 
.org 0x804f05c
    mov r5,0xe9	; (default: E9) long charge shot		
.org 0x804f048
    mov r5,0xea	; (default: EA) ice charge shot		 
.org 0x804f04e
    mov r5,0xeb	; (default: EB) long ice charge shot           
.org 0x804f030
    mov r5,0xec	; (default: EC) wave charge shot		
.org 0x804f022
    mov r5,0xed	; (default: ED) long wave charge shot          
.org 0x804f036
    mov r5,0xee	; (default: EE) wave ice charge shot           
.org 0x804f028
    mov r5,0xef	; (default: EF) long wave ice charge shot      
.org 0x804f002
    mov r5,0xf0	; (default: F0) plasma charge shot             
.org 0x804eff4
    mov r5,0xf1	; (default: F1) long plasma charge shot        
.org 0x804f008
    mov r5,0xf2	; (default: F2) plasma ice charge shot         
.org 0x804effa
    mov r5,0xf3	; (default: F3) long plasma ice charge shot    
.org 0x804efde
    mov r5,0xf4	; (default: F4) plasma wave charge shot        
.org 0x804efd0
    mov r5,0xf5	; (default: F5) long plasma wave charge shot   
.org 0x804efe4
    mov r5,0xf6	; (default: F6) plasma ice wave charge shot    
.org 0x804efd6
    mov r5,0xf7	; (default: F7) long plasma ice wave charge shot


.org 0x8052066
    mov r0,0xfe; (default: FE) placing bomb
.org 0x80546BA
    mov r0,0xff; (default: FF) bomb explosion

.org 0x8052288;
    mov r0,0x80;
.org 0x805228a;
    lsl r0,r0,0x1; (default: 80 lsl by 1 = 100) placing power bomb (i know its gross)

.org 0x80577B4;
 .word 0x101; (default: 101) power bomb explosion

