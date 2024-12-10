newPhysicsasm:

;remove in air deceleration while exiting spin/morphing
.org 0x8006A5A
	nop
.org 0x8008DAA
	nop
.org 0x8008DBA
	nop
.org 0x8008538
add r0,3Fh
.org 0x800853E
cmp r0,7Eh


;Speedball jumping 
.org 0x8006B48
	.halfword 0xE002
.org 0x80095D0
	.byte	0x6A

;part of keeping speed when landing from a jump
.org 0x8006E50
	.byte 0

.org 0x8007504	;preserves value used to check reset condition
	nop	
.org 0x80075BE ;slightly rewrites original function to have a hijack
	ldr		r2,=BetterPhysic + 1
	bl		BXR2
	cmp		r1,0h
	beq		@@Return
	mov		r1,r2     
	ldmia   [r1]!,r4-r6 
	stmia   [r0]!,r4-r6 
	ldmia   [r1]!,r4-r6 
	stmia   [r0]!,r4-r6 
	ldmia   [r1]!,r4,r5 
	stmia   [r0]!,r4,r5 
	ldrb    r0,[r2,3h]  
	cmp     r0,0h       
	beq     @@ResetFlags    
	ldrh    r0,[r2,0Eh] 
	mov    	r1,30h      
	eor    	r0,r1       
	mov    	r1,0h       
	strh    r0,[r2,0Eh] 
	strb    r1,[r2,3h]
@@ResetFlags:	
	mov    	r0,0h       
	strb    r0,[r2,2h]    
	strb    r0,[r2,4h]    
	strb    r0,[r2,5h]    
	strb    r0,[r2,7h]    
	strb    r0,[r2,0Ah]   
	mov    	r1,0h         
	strh    r0,[r2,0Ch]   
	strh    r0,[r2,10h]   
	strh    r0,[r2,16h]   
	strh    r0,[r2,18h]   
	strb    r1,[r2,1Ch]   
	strb    r1,[r2,1Dh]   
	ldrb    r0,[r2,8h]    
	cmp     r0,0B4h     
	beq     @@ZeroFlags   
	strb    r1,[r3]
@@ZeroFlags:	
	strb    r1,[r3,1h]  
	strb    r1,[r3,2h]
@@Return:	
	pop     r4-r6       
	pop     r0          
	bx      r0 
.pool