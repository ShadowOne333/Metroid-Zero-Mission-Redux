ledgeVaultasm:

.org 0x8005900 ; Side block detected
	ldrh r3,[r6,#0x12] ; Need pevious position
	strh r0,[r6,#0x12]
	ldr r0,=FreeSpaceLedge
	mov pc,r0
.pool
