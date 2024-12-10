smProjectilesasm:

.org 0x804F9E4
	mov 	r0,r4
	ldrh	r0,[r0,2h]

; Supers
.org 0x8051D6A 
    bl      ImNotAWrapper  
.org 0x8051d18
    bl      ImNotAWrapper  

; Pistol
.org 0x805136E 
    bl      ImNotAWrapper  
.org 0x80513AA
    bl      ImNotAWrapper  

; Charged Pistol
.org 0x8051A96 
    bl      ImNotAWrapper  
.org 0x8051ADE
    bl      ImNotAWrapper  

; short
.org 0x8050B7E 
    bl      ImNotAWrapper  
.org 0x8050BBA
    bl      ImNotAWrapper  

; charged short
.org 0x805145A  
    bl      ImNotAWrapper  
.org 0x8051496
    bl      ImNotAWrapper  

; Charged Long
.org 0x8051552  
    bl      ImNotAWrapper  
.org 0x805159A 
    bl      ImNotAWrapper  

; Ice
.org 0x8050DBA 
    bl      ImNotAWrapper  
.org 0x8050D62
    bl      ImNotAWrapper  

; Charged Ice
.org 0x805164A 
    bl      ImNotAWrapper  
.org 0x80516B2
    bl      ImNotAWrapper  

 ; Wave
.org 0x8051078
    bl      ImNotAWrapper  
.org 0x80510B4
    bl      ImNotAWrapper  

; Charged Wave
.org 0x8051774 
    bl      ImNotAWrapper  
.org 0x80517BE
    bl      ImNotAWrapper  

; Plasma
.org 0x80511E2
    bl      ImNotAWrapper  
.org 0x8051224
    bl      ImNotAWrapper  

; Charged Plasma
.org 0x80518EA
    bl      ImNotAWrapper  
.org 0x805194A
    bl      ImNotAWrapper  

; Long beam Speed
.org 0x8050C76        
    bl      ImNotAWrapper
.org 0x8050CB2
	bl      ImNotAWrapper

;Missile Speed
.org 0x8051BC8
	bl      ImNotAWrapper
.org 0x8051C1A
	bl      ImNotAWrapper