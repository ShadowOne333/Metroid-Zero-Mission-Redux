; [ZM_U] Stops low health alarm in Metroid Zero Mission
;52888: 1D 2F -> 14 E0
removeHealthAlarm:
; For Zero Mission (U)
.org 0x8052888	; 1D 2F -> 14 E0
	b 0x80528B4
