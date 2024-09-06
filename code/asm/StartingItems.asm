startingItemsasm:

.org 0x800BD78	;hijack point, accessed only on start game, do not change
	ldr r5,=startingItems
	mov r15,r5
.pool
