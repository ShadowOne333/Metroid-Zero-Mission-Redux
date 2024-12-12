; Samus can now use the morphball to begin speed boosting.

speedBallasm:

.org 0x80093BE            ;routine run when moving in ball form
    bl MorphSpeed
.org 0x8009460
    b 8009464h        ;skips a routine related to keeping speed under cap
