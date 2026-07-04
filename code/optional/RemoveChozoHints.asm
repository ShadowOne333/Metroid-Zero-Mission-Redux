; Remove all of the Chozo Hint statues from the game
removeChozoHints:
.org 0x8013E00
	.dw 0x8014004
	.skip 4		; Skip 4 bytes
	.dw 0x8014004
	.skip 4		; Skip 4 bytes
	.dw 0x8014004
	.skip 4		; Skip 4 bytes
	.dw 0x8014004
	.skip 4		; Skip 4 bytes
	.dw 0x8014004
	.skip 4		; Skip 4 bytes
	.dw 0x8014004
	.skip 4		; Skip 4 bytes
	.dw 0x8014004
	.skip 4		; Skip 4 bytes
	.dw 0x8014004
