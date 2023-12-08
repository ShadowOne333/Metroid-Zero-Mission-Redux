; [ZM_U] Stops low health alarm in Metroid Fusion
;52888: 1D 2E -> 14 E0

; For Zero Mission (U)
.org 0x8052888	; 1D 2F -> 14 E0
	b 0x807247A
