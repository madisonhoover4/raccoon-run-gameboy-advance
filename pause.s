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
	.file	"pause.c"
	.text
	.align	2
	.global	initPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPause, %function
initPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, #256
	ldr	r4, .L4
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r9, #104
	mov	r1, #32
	mov	r2, #0
	mov	r0, #64
	mov	r4, #4
	mov	lr, #1
	mov	ip, #8
	mov	r8, #100
	mov	r7, #101
	mov	r6, #144
	mov	r5, #102
	ldr	r3, .L4+20
	str	r9, [r3, #4]
	str	r8, [r3, #56]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r0, [r3]
	str	r2, [r3, #36]
	str	r2, [r3, #32]
	str	r4, [r3, #44]
	str	lr, [r3, #52]
	str	ip, [r3, #48]
	ldr	r3, .L4+24
	str	r0, [r3, #4]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r0, [r3]
	str	r2, [r3, #36]
	str	r4, [r3, #44]
	str	lr, [r3, #52]
	str	ip, [r3, #48]
	str	r2, [r3, #32]
	str	r7, [r3, #56]
	ldr	r3, .L4+28
	str	r0, [r3]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #36]
	str	r4, [r3, #44]
	str	lr, [r3, #52]
	str	ip, [r3, #48]
	str	r2, [r3, #32]
	str	r6, [r3, #4]
	str	r5, [r3, #56]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	83886592
	.word	spriteSheetPal
	.word	100728832
	.word	spriteSheetTiles
	.word	dancer1
	.word	dancer2
	.word	dancer3
	.size	initPause, .-initPause
	.align	2
	.global	initDancers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDancers, %function
initDancers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #1
	push	{r4, lr}
	beq	.L11
	cmp	r0, #2
	bne	.L9
	mov	r2, #64
	mov	r3, #101
	str	r2, [r1, #4]
	str	r3, [r1, #56]
.L8:
	mov	r2, #32
	mov	r4, #64
	mov	r3, #0
	mov	lr, #4
	mov	ip, #1
	mov	r0, #8
	str	r4, [r1]
	str	lr, [r1, #44]
	str	r2, [r1, #24]
	str	r2, [r1, #28]
	str	r3, [r1, #36]
	str	r3, [r1, #32]
	str	ip, [r1, #52]
	str	r0, [r1, #48]
	pop	{r4, lr}
	bx	lr
.L9:
	cmp	r0, #3
	moveq	r2, #144
	moveq	r3, #102
	streq	r2, [r1, #4]
	streq	r3, [r1, #56]
	b	.L8
.L11:
	mov	r2, #104
	mov	r3, #100
	str	r2, [r1, #4]
	str	r3, [r1, #56]
	b	.L8
	.size	initDancers, .-initDancers
	.align	2
	.global	drawAll
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAll, %function
drawAll:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L14
	ldr	r3, [r2, #56]
	push	{r4, r5, r6, lr}
	ldr	ip, [r2, #36]
	ldr	r4, [r2]
	ldr	r6, [r2, #44]
	ldr	lr, .L14+4
	ldr	r1, .L14+8
	lsl	r3, r3, #3
	ldr	r5, [r2, #4]
	add	ip, ip, r6, lsl #5
	ldr	r2, [lr, #56]
	strh	r4, [r1, r3]	@ movhi
	ldr	r4, .L14+12
	add	r3, r1, r3
	lsl	ip, ip, #2
	ldr	r6, [lr, #44]
	strh	ip, [r3, #4]	@ movhi
	orr	r5, r5, r4
	ldr	ip, [lr, #36]
	strh	r5, [r3, #2]	@ movhi
	ldr	r0, .L14+16
	ldr	r3, [lr]
	ldr	r5, [lr, #4]
	lsl	r2, r2, #3
	add	ip, ip, r6, lsl #5
	ldr	lr, [r0, #56]
	ldr	r6, [r0, #44]
	strh	r3, [r1, r2]	@ movhi
	orr	r5, r5, r4
	ldr	r3, [r0, #36]
	add	r2, r1, r2
	lsl	ip, ip, #2
	strh	r5, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	ldr	r2, [r0, #4]
	lsl	lr, lr, #3
	ldr	r0, [r0]
	add	r3, r3, r6, lsl #5
	orr	r4, r2, r4
	lsl	r3, r3, #2
	add	r2, r1, lr
	strh	r0, [r1, lr]	@ movhi
	strh	r4, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	dancer1
	.word	dancer2
	.word	shadowOAM
	.word	-32768
	.word	dancer3
	.size	drawAll, .-drawAll
	.align	2
	.global	drawDancer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDancer, %function
drawDancer:
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
	ldr	ip, .L18
	ldr	lr, [r0]
	lsl	r1, r1, #3
	add	r3, r3, r4, lsl #5
	add	r0, ip, r1
	lsl	r3, r3, #2
	strh	lr, [ip, r1]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	shadowOAM
	.size	drawDancer, .-drawDancer
	.global	__aeabi_idivmod
	.align	2
	.global	updatePause
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, .L25
	ldr	r3, .L25+4
	ldr	r4, [r7, #32]
	smull	r0, r1, r4, r3
	asr	r3, r4, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #1
	bne	.L21
	ldr	r0, [r7, #36]
	ldr	r3, .L25+8
	add	r0, r0, #1
	ldr	r1, [r7, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r7, #36]
.L21:
	ldr	r6, .L25+12
	ldr	r3, .L25+4
	ldr	r5, [r6, #32]
	smull	r0, r1, r5, r3
	asr	r3, r5, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	add	r4, r4, #1
	cmp	r5, r3, lsl #1
	str	r4, [r7, #32]
	bne	.L22
	ldr	r0, [r6, #36]
	ldr	r3, .L25+8
	add	r0, r0, #1
	ldr	r1, [r6, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r6, #36]
.L22:
	ldr	r7, .L25+16
	ldr	r3, .L25+4
	ldr	r4, [r7, #32]
	smull	r0, r1, r4, r3
	asr	r3, r4, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	add	r5, r5, #1
	cmp	r4, r3, lsl #1
	str	r5, [r6, #32]
	bne	.L23
	ldr	r0, [r7, #36]
	ldr	r3, .L25+8
	add	r0, r0, #1
	ldr	r1, [r7, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r7, #36]
.L23:
	add	r4, r4, #1
	str	r4, [r7, #32]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	dancer1
	.word	1717986919
	.word	__aeabi_idivmod
	.word	dancer2
	.word	dancer3
	.size	updatePause, .-updatePause
	.align	2
	.global	animateDancer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateDancer, %function
animateDancer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L30
	ldr	r4, [r0, #32]
	mov	r5, r0
	smull	r0, r1, r4, r3
	asr	r3, r4, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #1
	bne	.L28
	ldr	r0, [r5, #36]
	ldr	r3, .L30+4
	add	r0, r0, #1
	ldr	r1, [r5, #48]
	mov	lr, pc
	bx	r3
	str	r1, [r5, #36]
.L28:
	add	r4, r4, #1
	str	r4, [r5, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateDancer, .-animateDancer
	.comm	dancer3,60,4
	.comm	dancer2,60,4
	.comm	dancer1,60,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
