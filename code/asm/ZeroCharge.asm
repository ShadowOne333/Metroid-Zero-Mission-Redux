zeroPistolCharge:

.org 0x804EECE		; Show charge animation for Zero Suit
	nop

.org 0x80523C4		; No more hud charge meter display
	b 0x8052474

.org 0x8007DE4		; Match charge counter to regular charge animation speed
	cmp    r0,0x40

;.org 0x8007D5E		; Auto charge
	;bne 0x8007D82

; Use power suit shooting logic for zero suit
.org 0x8007E34        ; Regular charge functionality
    b 0x8007EDE

; Because we're using the power suit shooting logic for zero suit, it has to handle zero suit exclusive poses too
.org 0x8007FC4        ; Entries in pose switch table
    .dw 0x8008000    ; Crouching to crawl suitless
    .dw 0x8008000    ; Crawling stopped
    .dw 0x8008000    ; Starting to crawl
    .dw 0x8008000    ; Crawling
    .dw 0x8008000    ; Uncrouching from crawling
    .dw 0x8008000    ; Turning around while crawling
    .dw 0x8008000    ; Shooting while crawling
    .dw 0x8008000    ; Uncrouching (suitless)
    .dw 0x8008000    ; Crouching suitless
    .dw 0x8008000    ; Grabbing ledge (suitless)

;.org 0x8055084        ; Pointless, crashes the game
;    mov    r15,r0

;.org 0x80551F2        ; Silent charge
;    nop
;    nop
