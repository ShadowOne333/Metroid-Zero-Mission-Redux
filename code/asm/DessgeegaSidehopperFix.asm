;Dessgeega:
.org 0x8023BD8
	mov r0,0Eh	; set pose to Init_Idle instead of Idle
	
;.org 0x80246EC
;	.dw Case09D
	
.org 0x8024700
	.dw Case0ED
	
.org 0x8024704
	.dw Case0FD

.org 0x8024744
	.dw Case1FD
	
.org 0x8024754
	.dw Case23D
	
.org 0x802475C
	.dw Case25D
	
.org 0x80247AE	; put case Init_Idle in AI (make space by optimizing pool use)
Case09D:	;80246EC
	ldr  r0,=3000738h
	ldrh r1,[r0]     
	mov  r0,80h      
	lsl  r0,r0,1h    
	and  r0,r1       
	cmp  r0,0h       
	beq  Down09D
	bl   8023E28h
	b    8024836h
Down09D:
	bl   8023DCCh
	b    8024836h

Case23D:	;8024754
	ldr  r0,=3000738h
	ldrh r1,[r0]     
	mov  r0,80h      
	lsl  r0,r0,1h    
	and  r0,r1       
	cmp  r0,0h       
	beq  Down23D
	bl   8024024h
	b    8024836h
Down23D:
	bl   8023E3Ch
	b    8024836h

Case25D:	;802475C
	bl   8024220h
	b    8024836h

Case0ED:	;8024700
	bl   8023D34h

Case0FD:	;8024704
	ldr  r0,=3000738h
	ldrh r1,[r0]     
	mov  r0,80h      
	lsl  r0,r0,1h    
	and  r0,r1       
	cmp  r0,0h       
	beq  Down0FD
	bl   8024418h
	b    8024836h
Down0FD:
	bl   8024380h
	b    8024836h

Case1FD:	;8024744
	ldr  r0,=3000738h
	ldrh r1,[r0]     
	mov  r0,80h      
	lsl  r0,r0,1h    
	and  r0,r1       
	cmp  r0,0h       
	beq  Down1FD
	bl   80242D8h
	b    8024836h
Down1FD:	
	bl   8024234h
	b    8024836h
	
	.pool
	.dw 0x00000000	;padding
	.dw 0x00000000	;padding
	
	
;Sidehopper
.org 0x803F6DC
	mov r0,0Eh	; set pose to Init_Idle instead of Idle
	
.org 0x803F6E2
	add r0,0F2h
	
;.org 0x804006C
;	.dw Case09S
	
.org 0x8040080
	.dw Case0ES
	
.org 0x8040084
	.dw Case0FS

.org 0x80400C4
	.dw Case1FS
	
.org 0x80400D4
	.dw Case23S
	
.org 0x80400DC
	.dw Case25S
	
.org 0x80400EA	; put case Init_Idle in AI (make space by optimizing pool use)
Case09S:	;804006C
	ldr  r0,=3000738h
	ldrh r1,[r0]     
	mov  r0,80h      
	lsl  r0,r0,1h    
	and  r0,r1       
	cmp  r0,0h       
	beq  Down09S
	bl   803F958h
	b    8040172h
Down09S:
	bl   803F8FCh
	b    8040172h

Case23S:	;80400D4
	ldr  r0,=3000738h
	ldrh r1,[r0]     
	mov  r0,80h      
	lsl  r0,r0,1h    
	and  r0,r1       
	cmp  r0,0h       
	beq  Down23S
	bl   803FB54h
	b    8040172h
Down23S:
	bl   803F96Ch
	b    8040172h

Case25S:	;80400DC
	bl   803FD50h
	b    8040172h
	
Case0ES:	;8040080
	bl   803F864h
	
Case0FS:	;8040084
	ldr  r0,=3000738h
	ldrh r1,[r0]     
	mov  r0,80h      
	lsl  r0,r0,1h    
	and  r0,r1       
	cmp  r0,0h       
	beq  Down0FS
	bl   803FF4Ch
	b    8040172h
Down0FS:
	bl   803FEB0h
	b    8040172h

Case1FS:	;80400C4
	ldr  r0,=3000738h
	ldrh r1,[r0]     
	mov  r0,80h      
	lsl  r0,r0,1h    
	and  r0,r1       
	cmp  r0,0h       
	beq  Down1FS
	bl   803FE08h
	b    8040172h
Down1FS:
	bl   803FD64h
	b    8040172h
	
	.pool
	.dw 0x00000000	;padding
	.dw 0x00000000	;padding
