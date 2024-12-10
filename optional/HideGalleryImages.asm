; Hide back all the Gallery images so the player can unlock them themselves
hideGalleryImages:
.org 0x807A0B0	; 3A D0 -> 00 00	; Hide Golden Gallery text
	.halfword 0xD135	; beq #0x78
.org 0x80876AE	; 00 D9 -> 00 00 	; Hide all gallery images
	.halfword 0xD900	; bls #0x4
