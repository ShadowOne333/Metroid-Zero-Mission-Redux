lowHealthasm:

.org 0x8052844
	mov		r15,r1
.org 0x80528a8
;.word 0x832fec8
.word hijack


.org 0x8052872
	mov		r15,r1
.org 0x80528B0
;.word 0x832fec8
.word hijack2


;fix only changed digits being written ones place
.org 0x8052862
nop
;fix only changed digits being written tens place
.org 0x8052834
nop