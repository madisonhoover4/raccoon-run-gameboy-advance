	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVeggie.part.1, %function
drawVeggie.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, [r0, #4]
	ldr	r4, [r0, #44]
	ldr	r1, [r0, #56]
	ldr	r2, [r0, #36]
	ldr	ip, .L4
	lsl	r3, r3, #23
	ldrb	lr, [r0]	@ zero_extendqisi2
	lsl	r1, r1, #3
	add	r2, r2, r4, lsl #5
	lsr	r3, r3, #23
	add	r0, ip, r1
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	strh	lr, [ip, r1]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	shadowOAM
	.size	drawVeggie.part.1, .-drawVeggie.part.1
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L22
	ldr	r1, [ip]
	cmp	r1, #256
	push	{r4, r5, r6, r7, r8, lr}
	ble	.L7
	ldr	r2, .L22+4
	ldr	r0, [r2]
	sub	r1, r1, #256
	add	r0, r0, #1
	ldr	r3, .L22+8
	str	r1, [ip]
	str	r0, [r2]
	add	r5, r3, #1280
.L8:
	ldr	r2, [r3, #12]
	sub	r2, r2, #256
	str	r2, [r3, #12]
	add	r3, r3, #64
	cmp	r3, r5
	bne	.L8
.L20:
	mov	r2, #67108864
	lsl	r3, r0, #24
	orr	r3, r3, #1073741824
	lsr	r3, r3, #16
	strh	r3, [r2, #8]	@ movhi
.L9:
	mov	r0, #67108864
	ldr	r2, .L22+12
	ldrh	lr, [ip, #4]
	ldr	r3, [r2, #4]
	lsl	r1, r1, #16
	lsr	r1, r1, #16
	strh	r1, [r0, #16]	@ movhi
	lsl	r3, r3, #23
	strh	lr, [r0, #18]	@ movhi
	ldr	lr, .L22+16
	ldr	r6, .L22+20
	lsr	r3, r3, #23
	orr	r3, r3, lr
	ldr	r4, [r2, #44]
	strh	r3, [r6, #2]	@ movhi
	ldr	r3, [r2, #36]
	ldrb	r0, [r2]	@ zero_extendqisi2
	ldr	ip, .L22+24
	add	r3, r3, r4, lsl #5
	lsl	r3, r3, #2
	ldr	r2, [ip, #56]
	ldr	r8, [ip, #44]
	strh	r0, [r6]	@ movhi
	strh	r3, [r6, #4]	@ movhi
	ldr	r0, [ip, #36]
	ldr	r3, [ip]
	ldr	r1, .L22+28
	lsl	r2, r2, #3
	orr	r3, r3, #16384
	add	r0, r0, r8, lsl #4
	strh	r3, [r6, r2]	@ movhi
	ldr	r4, [ip, #4]
	add	r2, r6, r2
	lsl	r0, r0, #2
	ldr	r3, [r1, #56]
	strh	r0, [r2, #4]	@ movhi
	ldr	r0, [r1, #4]
	orr	ip, r4, lr
	strh	ip, [r2, #2]	@ movhi
	orr	lr, r0, lr
	ldr	ip, [r1, #44]
	ldr	r2, [r1, #36]
	ldr	r0, [r1]
	lsl	r3, r3, #3
	add	r2, r2, ip, lsl #4
	orr	r1, r0, #16384
	strh	r1, [r6, r3]	@ movhi
	lsl	r2, r2, #2
	add	r3, r6, r3
	mov	r7, #512
	strh	lr, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	ldr	r4, .L22+8
	b	.L13
.L11:
	ldr	r3, [r4, #56]
	add	r4, r4, #64
	lsl	r3, r3, #3
	cmp	r5, r4
	strh	r7, [r6, r3]	@ movhi
	beq	.L21
.L13:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L11
	mov	r0, r4
	add	r4, r4, #64
	bl	drawVeggie.part.1
	cmp	r5, r4
	bne	.L13
.L21:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L7:
	cmp	r1, #0
	ldrge	r5, .L22+32
	bge	.L9
	ldr	r2, .L22+4
	ldr	r0, [r2]
	add	r1, r1, #256
	sub	r0, r0, #1
	ldr	r3, .L22+8
	str	r1, [ip]
	str	r0, [r2]
	add	r5, r3, #1280
.L10:
	ldr	r2, [r3, #12]
	add	r2, r2, #256
	str	r2, [r3, #12]
	add	r3, r3, #64
	cmp	r3, r5
	bne	.L10
	b	.L20
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.word	screenBlock
	.word	vegetables
	.word	player
	.word	-32768
	.word	shadowOAM
	.word	healthBar
	.word	pizzaBar
	.word	vegetables+1280
	.size	drawGame, .-drawGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #0
	mov	lr, #1
	mov	r5, #3
	mov	r4, #20
	mov	ip, #32
	ldr	r3, .L26
	ldm	r3, {r0, r2}
	ldr	r3, .L26+4
	add	r2, r2, #64
	lsl	r2, r2, #8
	add	r0, r0, #104
	str	r5, [r3, #48]
	str	r4, [r3, #60]
	str	lr, [r3, #20]
	str	lr, [r3, #52]
	str	r2, [r3, #8]
	str	r0, [r3, #12]
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r1, [r3, #16]
	str	r1, [r3, #36]
	str	r1, [r3, #44]
	str	r1, [r3, #32]
	pop	{r4, r5, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #20
	mov	r6, #28
	ldr	ip, .L32
	ldr	lr, .L32+4
	ldr	r5, .L32+8
	mov	r3, #256
	ldr	r2, .L32+12
	ldr	r1, .L32+16
	mov	r0, #3
	str	r4, [ip, #4]
	str	r4, [ip]
	str	r6, [lr]
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	ldr	r2, .L32+20
	ldr	r1, .L32+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r6, #8
	bl	initPlayer
	mov	lr, r4
	mov	r1, #50
	mov	r0, #16
	mov	r4, #1
	mov	r2, #0
	mov	ip, #5
	ldr	r3, .L32+28
	add	r5, r3, #1280
.L29:
	str	r1, [r3, #56]
	str	r0, [r3, #28]
	str	r0, [r3, #24]
	str	r4, [r3, #16]
	str	r2, [r3, #20]
	str	r6, [r3, #36]
	str	r2, [r3, #44]
	str	r2, [r3, #52]
	str	ip, [r3, #48]
	str	lr, [r3, #60]
	add	r3, r3, #64
	cmp	r3, r5
	add	r1, r1, #1
	bne	.L29
	mov	r6, #205
	mov	r5, #4
	mov	r1, #32
	mov	lr, #6
	ldr	r3, .L32+32
	str	r6, [r3, #4]
	str	r4, [r3, #52]
	str	r5, [r3, #56]
	str	ip, [r3]
	str	r0, [r3, #28]
	str	ip, [r3, #36]
	str	r2, [r3, #44]
	str	r1, [r3, #24]
	ldr	r3, .L32+36
	str	r4, [r3, #52]
	str	lr, [r3, #36]
	str	r1, [r3, #24]
	str	ip, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #28]
	str	r2, [r3, #44]
	str	ip, [r3, #56]
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	.LANCHOR0
	.word	screenBlock
	.word	DMANow
	.word	83886592
	.word	spriteSheetPal
	.word	100728832
	.word	spriteSheetTiles
	.word	vegetables
	.word	healthBar
	.word	pizzaBar
	.size	initGame, .-initGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L35
	ldr	r3, [r1, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #44]
	ldr	r2, [r1, #36]
	ldr	r0, .L35+4
	ldrb	r1, [r1]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	lsl	r2, r2, #2
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L36:
	.align	2
.L35:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L68
	ldr	r3, .L68+4
	ldr	r5, [r4, #32]
	smull	r0, r1, r5, r3
	asr	r3, r5, #31
	rsb	r3, r3, r1, asr #3
	ldr	r6, [r4, #36]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #40]
	str	r2, [r4, #36]
	bne	.L38
	ldr	r0, [r4, #44]
	ldr	r3, .L68+8
	add	r0, r0, #1
	ldr	r1, [r4, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L38:
	ldr	r3, .L68+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L39
	ldr	r2, .L68+16
	ldr	r2, [r2, #8]
	cmp	r2, #0
	bne	.L40
	mov	r3, #3
	str	r3, [r4, #36]
.L39:
	ldr	r3, .L68+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L41
	ldr	r2, .L68+16
	ldr	r2, [r2, #8]
	cmp	r2, #0
	bne	.L49
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L46
.L43:
	ldr	r3, .L68+12
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L47
	ldr	r3, .L68+16
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L51
.L47:
	ldr	r3, [r4, #36]
	cmp	r3, #4
	bne	.L44
	mov	r2, #0
	mov	r3, #1
	str	r6, [r4, #36]
	str	r2, [r4, #44]
	str	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L41:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L43
	ldr	r3, .L68+16
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L45
.L46:
	ldr	r3, .L68+12
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L47
.L51:
	mov	r3, #2
	str	r3, [r4, #36]
.L44:
	add	r5, r5, #1
	str	r5, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L40:
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L67
.L49:
	mov	r3, #7
	ldr	r2, .L68+12
	ldrh	r2, [r2, #48]
	tst	r2, #16
	str	r3, [r4, #36]
	bne	.L43
.L45:
	mov	r2, #1
	ldr	r3, .L68+12
	str	r2, [r4, #36]
	ldrh	r3, [r3, #48]
	b	.L44
.L67:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L45
	b	.L43
.L69:
	.align	2
.L68:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.word	.LANCHOR0
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	lr, .L117
	ldr	r3, [lr, #8]
	cmp	r3, #0
	movne	r2, #1
	moveq	r2, #2
	ldr	r3, .L117+4
	str	r2, [r3, #36]
	ldr	r2, [lr, #12]
	cmp	r2, #0
	ldr	r5, [r3, #60]
	ldr	r2, [r3, #12]
	beq	.L73
	ldr	r1, [lr, #16]
	add	r1, r2, r1
	cmp	r1, #924
	blt	.L73
	mov	r1, #1
	mov	r6, #20
	mov	r8, #0
	mov	r0, #32
	mov	r2, #124
	ldr	r7, [r3, #24]
	ldr	ip, .L117+8
	add	r7, r7, r7, lsr #31
	ldrh	ip, [ip, #48]
	asr	r7, r7, r1
	rsb	r7, r7, #100
	lsl	r7, r7, #8
	tst	ip, #32
	str	r6, [lr]
	str	r7, [r3, #8]
	str	r6, [lr, #4]
	str	r1, [lr, #20]
	str	r8, [lr, #16]
	str	r0, [r3, #28]
	str	r2, [r3, #12]
	bne	.L75
	ldr	r4, [r3, #4]
	cmp	r4, #0
	ble	.L113
.L77:
	asr	ip, r7, #8
	sub	r1, r2, #2
	add	r8, r1, ip, lsl #10
	ldr	r6, .L117+12
	lsl	r8, r8, #1
	ldrh	r8, [r6, r8]
	cmp	r8, #0
	beq	.L113
	add	ip, ip, r0
	sub	ip, ip, #1
	add	r1, r1, ip, lsl #10
	lsl	r1, r1, #1
	ldrh	r1, [r6, r1]
	cmp	r1, #0
	beq	.L113
	ldr	r1, .L117+16
	ldr	ip, [r1]
	cmp	ip, #27
	movgt	r1, #1
	movle	r1, #0
	cmp	r4, #119
	movgt	r1, #0
	cmp	r1, #0
	ldrne	r1, [lr]
	ldr	ip, [r3, #20]
	subne	r5, r5, #1
	sub	r2, r2, ip
	subne	r1, r1, #1
	str	r2, [r3, #12]
	ldr	r8, [lr, #16]
	ldr	r6, [lr, #4]
	strne	r5, [r3, #60]
	strne	r1, [lr]
	b	.L75
.L73:
	ldr	r1, .L117+8
	ldrh	r1, [r1, #48]
	tst	r1, #32
	ldr	r7, [r3, #8]
	ldr	r0, [r3, #28]
	beq	.L76
.L112:
	ldr	r8, [lr, #16]
	ldr	r6, [lr, #4]
.L75:
	ldr	r1, .L117+8
	ldrh	r1, [r1, #48]
	tst	r1, #16
	bne	.L80
	ldr	r1, [r3, #24]
	add	r1, r2, r1
	add	ip, r1, r8
	cmp	ip, #1024
	blt	.L115
.L80:
	ldr	r1, [r3, #16]
	add	r9, r1, r7
	add	ip, r9, r8
	add	ip, r0, ip, asr #8
	cmp	ip, #255
	bgt	.L81
	asr	r4, r9, #8
	add	ip, r4, r0
	sub	ip, ip, #1
	lsl	r0, ip, #10
	add	r10, r0, r2
	add	r10, r10, r8
	ldr	ip, .L117+12
	lsl	r10, r10, #1
	ldrh	r10, [ip, r10]
	cmp	r10, #0
	bne	.L116
.L81:
	mov	r0, #0
	mov	r1, r0
	str	r0, [r3, #16]
	asr	r4, r7, #8
.L82:
	cmp	r6, #95
	bgt	.L83
	ldr	r0, [r3]
	cmp	r0, #80
	addgt	r6, r6, #1
	strgt	r6, [lr, #4]
.L83:
	ldr	r0, .L117+20
	ldrh	ip, [r0]
	ldr	r0, [lr, #24]
	tst	ip, #1
	add	r0, r0, #1
	str	r0, [lr, #24]
	beq	.L84
	cmp	r0, #50
	movle	r0, #0
	movgt	r0, #1
	ldr	ip, .L117+24
	ldrh	ip, [ip]
	bics	r0, r0, ip
	movne	r0, #0
	subne	r1, r1, #1488
	strne	r0, [lr, #24]
	subne	r1, r1, #12
.L84:
	sub	r0, r4, r6
	sub	r2, r2, r5
	add	r1, r1, #100
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	str	r1, [r3, #16]
	stm	r3, {r0, r2}
	b	animatePlayer
.L76:
	cmp	r2, #0
	ble	.L112
	ldr	r4, [r3, #4]
	cmp	r4, #0
	bgt	.L77
.L113:
	ldr	r2, [r3, #12]
	b	.L112
.L116:
	ldr	r10, [r3, #24]
	add	r0, r0, r10
	add	r0, r0, r2
	add	r8, r0, r8
	lsl	r8, r8, #1
	ldrh	r0, [ip, r8]
	cmp	r0, #0
	strne	r9, [r3, #8]
	bne	.L82
	b	.L81
.L115:
	add	r1, r1, #1
	add	r1, r1, r8
	asr	ip, r7, #8
	add	r9, r1, ip, lsl #10
	ldr	r4, .L117+12
	lsl	r9, r9, #1
	ldrh	r9, [r4, r9]
	cmp	r9, #0
	beq	.L80
	add	ip, ip, r0
	sub	ip, ip, #1
	add	r1, r1, ip, lsl #10
	lsl	r1, r1, #1
	ldrh	r1, [r4, r1]
	cmp	r1, #0
	beq	.L80
	ldr	r1, .L117+16
	ldr	ip, [r1]
	ldr	r1, [r3, #20]
	cmp	ip, #30
	add	r2, r2, r1
	str	r2, [r3, #12]
	bgt	.L80
	ldr	r1, [lr]
	cmp	r1, #784
	bge	.L80
	ldr	ip, [r3, #4]
	cmp	ip, #120
	addgt	r1, r1, #1
	addgt	r5, r5, #1
	strgt	r1, [lr]
	strgt	r5, [r3, #60]
	b	.L80
.L118:
	.align	2
.L117:
	.word	.LANCHOR0
	.word	player
	.word	67109120
	.word	collisionMapBitmap
	.word	screenBlock
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	initVeggies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initVeggies, %function
initVeggies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #50
	mov	r0, #16
	mov	r6, #1
	mov	r2, #0
	mov	r5, #8
	mov	r4, #5
	mov	lr, #20
	ldr	r3, .L123
	add	ip, r3, #1280
.L120:
	str	r1, [r3, #56]
	str	r0, [r3, #28]
	str	r0, [r3, #24]
	str	r6, [r3, #16]
	str	r2, [r3, #20]
	str	r5, [r3, #36]
	str	r2, [r3, #44]
	str	r2, [r3, #52]
	str	r4, [r3, #48]
	str	lr, [r3, #60]
	add	r3, r3, #64
	cmp	r3, ip
	add	r1, r1, #1
	bne	.L120
	pop	{r4, r5, r6, lr}
	bx	lr
.L124:
	.align	2
.L123:
	.word	vegetables
	.size	initVeggies, .-initVeggies
	.align	2
	.global	fireVeggie
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireVeggie, %function
fireVeggie:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r8, r9, lr}
	ldr	r6, .L129
	mov	r4, r0
	mov	lr, pc
	bx	r6
	mov	r1, #10
	mov	r2, #1
	ldr	r3, .L129+4
	smull	r8, r9, r0, r3
	asr	r3, r0, #31
	add	ip, r0, r9
	rsb	r3, r3, ip, asr #7
	ldr	r5, .L129+8
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	ldr	r3, [r5, #28]
	cmp	r3, #0
	str	r0, [r4, #12]
	str	r1, [r4, #8]
	str	r2, [r4, #52]
	bne	.L126
	mov	r3, #4
	str	r2, [r5, #28]
	str	r3, [r4, #44]
	pop	{r4, r5, r6, r8, r9, lr}
	bx	lr
.L126:
	mov	lr, pc
	bx	r6
	ldr	r3, .L129+12
	ldr	r1, [r4, #48]
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r1, [r4, #44]
	str	r3, [r5, #28]
	pop	{r4, r5, r6, r8, r9, lr}
	bx	lr
.L130:
	.align	2
.L129:
	.word	rand
	.word	-2004318071
	.word	.LANCHOR0
	.word	__aeabi_idivmod
	.size	fireVeggie, .-fireVeggie
	.align	2
	.global	drawVeggie
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVeggie, %function
drawVeggie:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #52]
	cmp	r2, #0
	bne	.L133
	mov	r1, #512
	ldr	r3, [r0, #56]
	ldr	r2, .L134
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L133:
	b	drawVeggie.part.1
.L135:
	.align	2
.L134:
	.word	shadowOAM
	.size	drawVeggie, .-drawVeggie
	.align	2
	.global	updateVeggie
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateVeggie, %function
updateVeggie:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, [r0, #52]
	cmp	r3, #0
	sub	sp, sp, #16
	mov	r4, r0
	ldr	r3, [r0, #8]
	beq	.L159
	mov	r7, r2
	ldr	r2, [r0, #16]
	add	r3, r3, r2
	cmp	r3, #255
	movgt	r1, #0
	ldr	r5, .L162
	str	r3, [r0, #8]
	ldr	r2, [r5, #8]
	strgt	r1, [r0, #52]
	bgt	.L148
	cmp	r2, #0
	mov	r6, r1
	beq	.L146
	ldr	r2, [r0, #44]
	cmp	r2, #4
	beq	.L146
.L148:
	ldr	r2, [r4, #12]
.L138:
	ldm	r5, {r0, r1}
	sub	r2, r2, r0
	sub	r3, r3, r1
	str	r2, [r4, #4]
	str	r3, [r4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L159:
	ldr	r2, [r0, #12]
	ldr	r5, .L162
	b	.L138
.L146:
	ldr	r2, .L162+4
	add	r0, r2, #24
	ldm	r0, {r0, r1}
	ldr	lr, [r2]
	ldr	ip, [r2, #4]
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #24]
	str	r1, [sp, #12]
	ldr	r1, [r4]
	str	r0, [sp, #8]
	ldr	r8, .L162+8
	ldr	r0, [r4, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L143
	ldr	r3, [r4, #44]
	cmp	r3, #3
	ble	.L160
	cmp	r3, #4
	beq	.L161
.L143:
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	b	.L138
.L161:
	mov	r3, #0
	ldr	r2, .L162+12
	ldr	r1, .L162+16
	ldr	r0, .L162+20
	ldr	r6, .L162+24
	mov	lr, pc
	bx	r6
	mov	r2, #0
	ldr	r3, [r7, #44]
	cmp	r3, #2
	addle	r3, r3, #1
	str	r2, [r4, #52]
	str	r2, [r4, #12]
	str	r2, [r4, #4]
	strle	r3, [r7, #44]
	cmp	r3, #3
	moveq	r3, #1
	ldrne	r3, [r4, #8]
	streq	r3, [r5, #12]
	movne	r2, #0
	moveq	r2, #0
	ldreq	r3, [r4, #8]
	b	.L138
.L160:
	mov	r3, #0
	ldr	r2, .L162+12
	mov	r1, #14848
	ldr	r0, .L162+28
	ldr	r7, .L162+24
	mov	lr, pc
	bx	r7
	mov	r2, #0
	ldr	r0, .L162+32
	ldr	r3, [r6, #44]
	ldr	r1, [r0]
	add	r3, r3, #1
	sub	r1, r1, #1
	str	r2, [r4, #52]
	str	r2, [r4, #12]
	str	r1, [r0]
	str	r3, [r6, #44]
	ldr	r3, [r4, #8]
	b	.L138
.L163:
	.align	2
.L162:
	.word	.LANCHOR0
	.word	player
	.word	collision
	.word	11025
	.word	22050
	.word	MarioPowerup
	.word	playSoundB
	.word	Slap_SoundMaster13_49669815
	.word	.LANCHOR1
	.size	updateVeggie, .-updateVeggie
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r8, .L172
	bl	updatePlayer
	mov	r4, r8
	ldr	r7, .L172+4
	ldr	r6, .L172+8
	add	r5, r8, #1280
.L165:
	mov	r0, r4
	mov	r2, r7
	mov	r1, r6
	add	r4, r4, #64
	bl	updateVeggie
	cmp	r4, r5
	bne	.L165
	ldr	r4, .L172+12
	ldr	r3, [r4, #32]
	add	r3, r3, #1
	cmp	r3, #50
	strne	r3, [r4, #32]
	beq	.L171
.L164:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L171:
	mov	r2, #0
	ldr	r3, .L172+16
	str	r2, [r4, #32]
	mov	lr, pc
	bx	r3
	ldr	r3, .L172+20
	smull	r6, r7, r0, r3
	asr	r3, r0, #31
	rsb	r3, r3, r7, asr #3
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	add	r0, r8, r3, lsl #6
	ldr	r2, [r0, #52]
	cmp	r2, #0
	str	r3, [r4, #36]
	bne	.L164
	pop	{r4, r5, r6, r7, r8, lr}
	b	fireVeggie
.L173:
	.align	2
.L172:
	.word	vegetables
	.word	pizzaBar
	.word	healthBar
	.word	.LANCHOR0
	.word	rand
	.word	1717986919
	.size	updateGame, .-updateGame
	.align	2
	.global	initHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHealth, %function
initHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #5
	mov	r5, #205
	mov	r4, #32
	mov	lr, #16
	mov	ip, #0
	mov	r0, #1
	mov	r1, #4
	ldr	r3, .L176
	str	r5, [r3, #4]
	str	r4, [r3, #24]
	str	lr, [r3, #28]
	str	r2, [r3]
	str	r2, [r3, #36]
	str	ip, [r3, #44]
	str	r0, [r3, #52]
	str	r1, [r3, #56]
	pop	{r4, r5, lr}
	bx	lr
.L177:
	.align	2
.L176:
	.word	healthBar
	.size	initHealth, .-initHealth
	.align	2
	.global	drawHealthorPizza
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHealthorPizza, %function
drawHealthorPizza:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	push	{r4, lr}
	ldr	r1, [r0, #56]
	ldr	r4, [r0, #44]
	ldr	r3, [r0, #36]
	ldr	ip, [r0]
	ldr	lr, .L180
	lsl	r1, r1, #3
	add	r3, r3, r4, lsl #4
	orr	r0, ip, #16384
	lsl	r3, r3, #2
	add	ip, lr, r1
	strh	r0, [lr, r1]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	r3, [ip, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L181:
	.align	2
.L180:
	.word	shadowOAM
	.size	drawHealthorPizza, .-drawHealthorPizza
	.align	2
	.global	initPizzaBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPizzaBar, %function
initPizzaBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #5
	mov	r4, #32
	mov	lr, #16
	mov	ip, #6
	mov	r0, #0
	mov	r1, #1
	ldr	r3, .L184
	str	r4, [r3, #24]
	str	lr, [r3, #28]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #56]
	str	ip, [r3, #36]
	str	r0, [r3, #44]
	str	r1, [r3, #52]
	pop	{r4, lr}
	bx	lr
.L185:
	.align	2
.L184:
	.word	pizzaBar
	.size	initPizzaBar, .-initPizzaBar
	.global	jumpCount
	.global	frameCount
	.global	randPizzaIndex
	.global	randVeggieIndex
	.global	collisionAdjustment
	.global	hOff
	.global	vOff
	.comm	screenBlock,4,4
	.global	pizzaAchieved
	.global	cheatOn
	.global	inTheDumpster
	.global	livesRemaining
	.comm	pizzaBar,64,4
	.comm	healthBar,64,4
	.comm	vegetables,1280,4
	.comm	player,64,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	livesRemaining, %object
	.size	livesRemaining, 4
livesRemaining:
	.word	4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	cheatOn, %object
	.size	cheatOn, 4
cheatOn:
	.space	4
	.type	pizzaAchieved, %object
	.size	pizzaAchieved, 4
pizzaAchieved:
	.space	4
	.type	collisionAdjustment, %object
	.size	collisionAdjustment, 4
collisionAdjustment:
	.space	4
	.type	inTheDumpster, %object
	.size	inTheDumpster, 4
inTheDumpster:
	.space	4
	.type	jumpCount, %object
	.size	jumpCount, 4
jumpCount:
	.space	4
	.type	randPizzaIndex, %object
	.size	randPizzaIndex, 4
randPizzaIndex:
	.space	4
	.type	frameCount, %object
	.size	frameCount, 4
frameCount:
	.space	4
	.type	randVeggieIndex, %object
	.size	randVeggieIndex, 4
randVeggieIndex:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
