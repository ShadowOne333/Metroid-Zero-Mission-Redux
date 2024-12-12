.definelabel Division,0x808AC34

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; beam GFX

singleWaveBeamasm:
;;;;;;;;;;wave GP's
.org 0x8329C6C ;wave horizontal GP
	.word 	0x08329734
	.word	0x00000003
	.word	0x0832973C
	.word	0x00000002
	.word	0x00000000
	.word	0x00000000
.org 0x8329CAC ;wave diagonal GP
	.word 	0x083297BA
	.word	0x00000003
	.word 	0x083297C2
	.word   0x00000002
	.word	0x00000000
	.word	0x00000000
.org 0x8329CEC ;wave Vertical GP
	.word 	0x08329840
	.word	0x00000003
	.word 	0x08329848
	.word   0x00000002
	.word	0x00000000
	.word	0x00000000
;;;;;;;;;;Wave Frames
.org	0x0832973C ; horizontal
	.word	0x40FC0001
	.word	0x20A001FB
.org 	0x083297C2 ; diagonal
	.word 	0x00F90001
	.word	0x20C241F9
.org 	0x08329848 ; vertical
	.word	0x80FB0001
	.word	0x20C601FC



;;;;;;;;;;Charged Wave GP's

.org 0x8329DEC ;Charged wave horizontal GP
	.word 	0x08329A94
	.word	0x00000003
	.word 	0x08329A9C
	.word   0x00000002
	.word	0x00000000
	.word	0x00000000
.org 0x8329E2C ;Charged wave diagonal GP
	.word 	0x08329B02
	.word	0x00000003
	.word 	0x08329B10
	.word   0x00000002
	.word	0x00000000
	.word	0x00000000
.org 0x8329E6C ;Charged wave vertical GP
	.word 	0x08329BD0
	.word	0x00000003
	.word 	0x08329BD8
	.word   0x00000002
	.word	0x00000000
	.word	0x00000000
;;;;;;;;;; charged wave frames
.org 	0x08329A9C
	.word 	0x40f80001
	.word  	0x208381F9


.org 	0x08329B10
	.word	0x00f90002
	.word	0x20C841F9
	.word	0x00040004
	.dh		0x20E7
.org 	0x08329BD8
	.word 	0x80F90001
	.word	0x208C81F8


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; beam hitboxes
;;;;;;;;;;Normal
.org	0x8051108
	.word	0x0000FFEC
	.word	0x0000FFEC
.org	0x080510F8
	.byte	0x14
.org 	0x08051100
	.byte	0x14

.org	0x08051134
	.word	0x0000FFEC
.org	0x08051128
	.byte	0x14

.org 	0x805118C
	.word	0x0000FFEC
.org	0x08051140
	.byte	0x14

;;;;;;;;;;Charged
.org 0x8051800
	.byte	0x18
.org	0x8051808
	.byte	0x18
.org 	0x8051810
	.word	0x0000FFE8
	.word	0x0000FFE8

.org 	0x8051828
	.byte	0x18
.org	0x8051830
	.byte	0x18
.org	0x8051838
	.word	0x0000FFE8
	.word	0x0000FFE8

.org	0x8051848
	.byte	0x18
.org 	0x8051850
	.byte	0x18
.org	0x8051894
	.word	0x0000FFE8
	.word	0x0000FFE8



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Projectile movement
;;;;;spawn hijack
.org 0x0804EE26
	ldr 	r0,=spawnhijack
	mov 	r15,r0
.pool

;;;;;wave hijack
.org 0x8051082
	mov 	r15,r0
.org 0x805109C
	.word	wavebeamhijack

;;;;;chargedwave hijack
.org 0x805177E
	mov 	r15,r0
.org 0x805179C
	.word	wavebeamhijack
	

;clearprojectile1
.org 0x0804EE36
	strh 	r2,[r3]

;spawn 2 charged beams
.org 0804F17Ch
	push 	r0
	ldr 	r0,=spawn2charges
	mov 	r15,r0
.pool

;-------------------------------------

