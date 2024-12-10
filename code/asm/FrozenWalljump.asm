frozenWallJumpasm:
;You can walk jump on the side of frozen sprite
;可以在冰冻或者属性为1(无伤)的敌人的侧面蹬墙跳
;by-jumzhu.diwa

.org 0x8008F92
	bl CheckSpritesWallJump

.org 0x8008FC8
	bl CheckBlockWallAndSpriteWall