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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #512
	ldr	r4, .L4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #117440512
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+8
	mov	r2, #100663296
	ldr	r1, .L4+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	ldr	r1, .L4+24
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+36
	mov	r3, #1
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	ldr	r0, .L4+48
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L4+52
	ldr	r2, .L4+56
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	shadowOAM
	.word	6496
	.word	startScreenTiles
	.word	100720640
	.word	startScreenMap
	.word	startScreenPal
	.word	hideSprites
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	2510208
	.word	startMusic
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r1, #4352
	mov	r2, #23552
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	b	goToStart
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions.part.0, %function
instructions.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L10:
	.align	2
.L9:
	.word	buttons
	.size	instructions.part.0, .-instructions.part.0
	.set	lose.part.5,instructions.part.0
	.set	win.part.3,instructions.part.0
	.set	pause.part.2,instructions.part.0
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	ldr	r3, .L13
	ldr	r4, .L13+4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L13+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L13+12
	ldr	r1, .L13+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L13+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L13+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L13+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L14:
	.align	2
.L13:
	.word	6176
	.word	DMANow
	.word	instructionsScreenTiles
	.word	100720640
	.word	instructionsScreenMap
	.word	instructionsScreenPal
	.word	stopSound
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	push	{r4, lr}
	ldr	r1, .L18
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r4, .L18+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L18+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L18+12
	ldrh	r3, [r3]
	tst	r3, #4
	popne	{r4, lr}
	bne	instructions.part.0
.L15:
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.size	instructions, .-instructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #23552
	push	{r4, r5, r6, lr}
	ldr	r3, .L22
	ldr	r4, .L22+4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L22+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L22+12
	ldr	r1, .L22+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	ldr	r1, .L22+20
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L22+24
	mov	lr, pc
	bx	r3
	ldr	r5, .L22+28
	ldr	r2, .L22+32
	ldr	r1, .L22+36
	ldr	r0, .L22+40
	mov	r3, #1
	mov	lr, pc
	bx	r5
	ldr	r3, .L22+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L22+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L22+56
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
	.word	4528
	.word	DMANow
	.word	gameBackTiles
	.word	100720640
	.word	gameBackMap
	.word	gameBackPal
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	1524639
	.word	chaseMusic
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	push	{r4, r5, r6, lr}
	ldr	r4, .L36
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r3, [r4]
	ldr	r2, .L36+4
	add	r3, r3, #1
	str	r3, [r4]
	ldr	r5, .L36+8
	mov	lr, pc
	bx	r2
	ldr	r6, .L36+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L36+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r5, .L36+20
	mov	lr, pc
	bx	r5
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L25
	ldr	r2, .L36+24
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L34
.L25:
	tst	r3, #4
	beq	.L24
	ldr	r3, .L36+24
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L35
.L24:
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L34:
	ldr	r0, [r4]
	ldr	r3, .L36+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+32
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	bl	goToGame
	ldrh	r3, [r6]
	b	.L25
.L37:
	.align	2
.L36:
	.word	seed
	.word	waitForVBlank
	.word	DMANow
	.word	oldButtons
	.word	shadowOAM
	.word	hideSprites
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #1712
	ldr	r4, .L40
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L40+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L40+8
	ldr	r1, .L40+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	ldr	r1, .L40+16
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L40+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L40+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L40+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L41:
	.align	2
.L40:
	.word	DMANow
	.word	pauseScreenTiles
	.word	100720640
	.word	pauseScreenMap
	.word	pauseScreenPal
	.word	stopSound
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r3, #67108864
	push	{r4, lr}
	ldr	r1, .L50
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L50+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L50+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L50+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L50+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L50+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L43
	ldr	r2, .L50+24
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L49
.L43:
	tst	r3, #4
	popne	{r4, lr}
	bne	pause.part.2
.L42:
	pop	{r4, lr}
	bx	lr
.L49:
	pop	{r4, lr}
	b	goToGame
.L51:
	.align	2
.L50:
	.word	updatePause
	.word	drawAll
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, r5, r6, lr}
	ldr	r3, .L54
	ldr	r4, .L54+4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L54+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L54+12
	ldr	r1, .L54+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	ldr	r1, .L54+20
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L54+24
	mov	lr, pc
	bx	r3
	ldr	r5, .L54+28
	ldr	r2, .L54+32
	ldr	r1, .L54+36
	ldr	r0, .L54+40
	mov	r3, #0
	mov	lr, pc
	bx	r5
	ldr	r3, .L54+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L54+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L54+56
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L55:
	.align	2
.L54:
	.word	4976
	.word	DMANow
	.word	winScreenTiles
	.word	100720640
	.word	winScreenMap
	.word	winScreenPal
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	33408
	.word	mlg_airhorn
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #67108864
	mov	r4, #0
	ldr	r2, .L59
	strh	r4, [r3, #16]	@ movhi
	strh	r4, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r2, #4
	ldr	r3, .L59+4
	ldrh	ip, [r3]
	ldr	r0, .L59+8
	ldr	r1, .L59+12
	ldr	r3, .L59+16
	tst	ip, #4
	str	r4, [r0]
	str	r4, [r1]
	str	r2, [r3]
	popne	{r4, lr}
	bne	win.part.3
.L56:
	pop	{r4, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	waitForVBlank
	.word	oldButtons
	.word	inTheDumpster
	.word	pizzaAchieved
	.word	livesRemaining
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, r5, r6, lr}
	mov	r3, #3776
	ldr	r4, .L63
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L63+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L63+8
	ldr	r1, .L63+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	ldr	r1, .L63+16
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L63+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L63+24
	ldr	r2, .L63+28
	ldr	r1, .L63+32
	ldr	r0, .L63+36
	mov	r3, #0
	mov	lr, pc
	bx	r5
	ldr	r3, .L63+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L63+44
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L63+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #4
	mov	r2, #5
	ldr	r1, .L63+52
	ldr	r3, .L63+56
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	DMANow
	.word	loseScreenTiles
	.word	100720640
	.word	loseScreenMap
	.word	loseScreenPal
	.word	stopSound
	.word	playSoundB
	.word	11025
	.word	44753
	.word	OriginalGameMusic
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	livesRemaining
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L85
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L85+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L85+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L85+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L66
	ldr	r2, .L85+24
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L82
.L66:
	tst	r3, #2
	beq	.L67
	ldr	r3, .L85+24
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L67
	ldr	r2, .L85+28
	ldr	r1, [r2]
	cmp	r1, #0
	moveq	r3, #1
	str	r3, [r2]
.L65:
	pop	{r4, lr}
	bx	lr
.L67:
	ldr	r3, .L85+32
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L83
	ldr	r3, .L85+36
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L65
.L84:
	mov	r2, #0
	ldr	r3, .L85+28
	pop	{r4, lr}
	str	r2, [r3]
	b	goToWin
.L83:
	ldr	r2, .L85+28
	str	r3, [r2]
	bl	goToLose
	ldr	r3, .L85+36
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L65
	b	.L84
.L82:
	ldr	r3, .L85+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+44
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPause
.L86:
	.align	2
.L85:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	cheatOn
	.word	livesRemaining
	.word	inTheDumpster
	.word	hideSprites
	.word	initPause
	.size	game, .-game
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	push	{r4, lr}
	ldr	r1, .L90
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L90+4
	ldrh	r3, [r3]
	tst	r3, #4
	popne	{r4, lr}
	bne	lose.part.5
.L87:
	pop	{r4, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	waitForVBlank
	.word	oldButtons
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4352
	mov	r2, #23552
	mov	r3, #67108864
	push	{r4, r7, fp, lr}
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L105
	mov	lr, pc
	bx	r3
	ldr	r3, .L105+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L105+8
	mov	lr, pc
	bx	r3
	ldr	r6, .L105+12
	ldr	r7, .L105+16
	ldr	r5, .L105+20
	ldr	fp, .L105+24
	ldr	r10, .L105+28
	ldr	r9, .L105+32
	ldr	r8, .L105+36
	ldr	r4, .L105+40
.L93:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L94:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L94
.L96:
	.word	.L95
	.word	.L97
	.word	.L98
	.word	.L99
	.word	.L100
	.word	.L101
.L101:
	ldr	r3, .L105+44
	mov	lr, pc
	bx	r3
	b	.L93
.L100:
	ldr	r3, .L105+48
	mov	lr, pc
	bx	r3
	b	.L93
.L99:
	mov	lr, pc
	bx	r8
	b	.L93
.L98:
	mov	lr, pc
	bx	r10
	b	.L93
.L97:
	mov	lr, pc
	bx	r9
	b	.L93
.L95:
	mov	lr, pc
	bx	fp
	b	.L93
.L106:
	.align	2
.L105:
	.word	goToStart
	.word	setupSounds
	.word	setupInterrupts
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	instructions
	.word	pause
	.word	67109120
	.word	lose
	.word	win
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
