; Remove all of the Chozo Hint statues from the game
removeChozoHints:
.org 0x8013E00
	and r4, r0
	lsr r1, r0, #0x20
	.skip 4		; Skip 4 bytes
	and r4, r0
	lsr r1, r0, #0x20
	.skip 4		; Skip 4 bytes
	and r4, r0
	lsr r1, r0, #0x20
	.skip 4		; Skip 4 bytes
	and r4, r0
	lsr r1, r0, #0x20
	.skip 4		; Skip 4 bytes
	and r4, r0
	lsr r1, r0, #0x20
	.skip 4		; Skip 4 bytes
	and r4, r0
	lsr r1, r0, #0x20
	.skip 4		; Skip 4 bytes
	and r4, r0
	lsr r1, r0, #0x20
	.skip 4		; Skip 4 bytes
	and r4, r0
	lsr r1, r0, #0x20
