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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel3
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	ldr	r3, [r3]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	ldr	ip, [r3]
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	ldrh	r3, [ip, r1]
	tst	r0, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r1]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	push	{r4, lr}
	mov	lr, #0
	ldr	r4, .L18
	add	r3, r1, r3
	rsb	ip, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r4]
	add	ip, r0, ip, lsl #4
	add	r0, r0, r1, lsl #4
	ldr	r1, [r4, #4]
	orr	r2, r2, #-2130706432
	add	ip, r3, ip, lsl #1
	add	r0, r3, r0, lsl #1
.L12:
	add	r3, sp, #8
	str	lr, [r1, #44]
	str	r3, [r1, #36]
	str	r0, [r1, #40]
	add	r0, r0, #480
	cmp	r0, ip
	str	r2, [r1, #44]
	bne	.L12
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #20
	ldrb	ip, [sp, #56]	@ zero_extendqisi2
	ldrb	lr, [sp, #56]	@ zero_extendqisi2
	cmp	r3, #0
	orr	ip, ip, lr, lsl #8
	strh	ip, [sp, #14]	@ movhi
	ble	.L20
	sub	lr, r2, #2
	sub	fp, r2, #1
	asr	lr, lr, #1
	add	r3, r3, r1
	add	r9, r0, r2
	orr	lr, lr, #-2130706432
	ldr	ip, .L37
	add	r7, r2, r2, lsr #31
	asr	r5, fp, #1
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	asr	r7, r7, #1
	sub	r9, r9, #1
	str	lr, [sp, #4]
	orr	lr, r5, #-2130706432
	add	r3, r0, r3, lsl #4
	add	r1, r0, r1, lsl #4
	ldm	ip, {r4, ip}
	str	lr, [sp]
	orr	r7, r7, #-2130706432
	and	r9, r9, #1
	and	r0, r0, #1
	and	r8, r2, #1
	add	r10, sp, #14
	b	.L33
.L22:
	cmp	r8, #0
	beq	.L28
	cmp	r2, #1
	ble	.L36
	mov	r5, #0
	add	lr, r1, #1
	add	lr, lr, lr, lsr #31
	bic	lr, lr, #1
	add	lr, r4, lr
	str	r5, [ip, #44]
	str	r10, [ip, #36]
	str	lr, [ip, #40]
	ldr	lr, [sp]
	str	lr, [ip, #44]
.L36:
	add	lr, r1, r1, lsr #31
	bic	lr, lr, #1
	ldrb	r5, [r4, lr]	@ zero_extendqisi2
	ldrb	r6, [sp, #56]	@ zero_extendqisi2
	orr	r5, r5, r6, lsl #8
	strh	r5, [r4, lr]	@ movhi
.L24:
	add	r1, r1, #240
	cmp	r1, r3
	beq	.L20
.L33:
	cmp	r0, #0
	bne	.L22
	cmp	r8, #0
	bne	.L23
	add	lr, r1, r1, lsr #31
	bic	lr, lr, #1
	add	r1, r1, #240
	add	lr, r4, lr
	cmp	r1, r3
	str	r8, [ip, #44]
	str	r10, [ip, #36]
	str	lr, [ip, #40]
	str	r7, [ip, #44]
	bne	.L33
.L20:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L23:
	cmp	r2, #1
	ble	.L25
	add	lr, r1, r1, lsr #31
	bic	lr, lr, #1
	add	lr, r4, lr
	str	r0, [ip, #44]
	str	r10, [ip, #36]
	str	lr, [ip, #40]
	ldr	lr, [sp]
	str	lr, [ip, #44]
.L25:
	add	lr, fp, r1
	add	lr, lr, lr, lsr #31
	bic	lr, lr, #1
	ldrh	r6, [r4, lr]
	ldrb	r5, [sp, #56]	@ zero_extendqisi2
	cmp	r9, #0
	and	r5, r5, #255
	andne	r6, r6, #255
	andeq	r6, r6, #65280
	orrne	r6, r6, r5, lsl #8
	orreq	r6, r6, r5
	strh	r6, [r4, lr]	@ movhi
	b	.L24
.L28:
	cmp	r2, #2
	ble	.L30
	add	lr, r1, #1
	add	lr, lr, lr, lsr #31
	bic	lr, lr, #1
	add	lr, r4, lr
	str	r8, [ip, #44]
	str	r10, [ip, #36]
	str	lr, [ip, #40]
	ldr	lr, [sp, #4]
	str	lr, [ip, #44]
.L30:
	add	lr, fp, r1
	add	lr, lr, lr, lsr #31
	bic	lr, lr, #1
	ldrh	r6, [r4, lr]
	ldrb	r5, [sp, #56]	@ zero_extendqisi2
	cmp	r9, #0
	and	r5, r5, #255
	andne	r6, r6, #255
	andeq	r6, r6, #65280
	orrne	r6, r6, r5, lsl #8
	orreq	r6, r6, r5
	strh	r6, [r4, lr]	@ movhi
	b	.L36
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	sub	sp, sp, #8
	ldr	r1, .L41
	add	r2, sp, #8
	strh	r0, [r2, #-2]!	@ movhi
	ldm	r1, {r0, r3}
	ldr	r1, .L41+4
	str	ip, [r3, #44]
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L42:
	.align	2
.L41:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	sub	sp, sp, #16
	strb	r0, [sp, #7]
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	ldr	r1, .L45
	add	r2, sp, #16
	orr	r3, r3, r0, lsl #8
	strh	r3, [r2, #-2]!	@ movhi
	ldm	r1, {r0, r3}
	ldr	r1, .L45+4
	str	ip, [r3, #44]
	str	r2, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #16
	@ sp needed
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	r4, #0
	ldr	r5, .L55
	rsb	r0, r0, r0, lsl #4
	add	lr, r1, r0, lsl #4
	ldr	r1, [r5]
	add	r2, lr, r2
	ldr	ip, [sp, #12]
	ldr	r0, [r5, #4]
	add	r2, r1, r2, lsl #1
	add	r1, r1, lr, lsl #1
	orr	lr, r3, #-2147483648
	lsl	r3, r3, #1
.L49:
	str	r4, [r0, #44]
	str	ip, [r0, #36]
	str	r1, [r0, #40]
	add	r1, r1, #2
	cmp	r1, r2
	str	lr, [r0, #44]
	add	ip, ip, r3
	bne	.L49
	pop	{r4, r5, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	cmp	r3, #0
	ldr	r6, [sp, #24]
	ble	.L57
	mov	ip, #0
	mov	r8, ip
	ldr	lr, .L62
	add	r4, r1, r3
	add	r5, r2, r2, lsr #31
	rsb	r4, r4, r4, lsl #4
	rsb	r1, r1, r1, lsl #4
	asr	r5, r5, #1
	ldm	lr, {r7, lr}
	add	r4, r0, r4, lsl #4
	orr	r5, r5, #-2147483648
	add	r0, r0, r1, lsl #4
.L59:
	add	r1, ip, ip, lsr #31
	add	r3, r0, r0, lsr #31
	bic	r1, r1, #1
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r1, r6, r1
	add	r3, r7, r3
	cmp	r4, r0
	str	r8, [lr, #44]
	add	ip, ip, r2
	str	r1, [lr, #36]
	str	r3, [lr, #40]
	str	r5, [lr, #44]
	bne	.L59
.L57:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L65
	ldr	r1, .L65+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L66:
	.align	2
.L65:
	.word	.LANCHOR0
	.word	-2147445248
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L68
	ldr	r1, .L68+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L69:
	.align	2
.L68:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L71:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L71
	mov	r2, #67108864
.L72:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L72
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r3, [r3]
	tst	r3, #16
	moveq	r1, #100663296
	ldrne	r2, .L79
	ldreq	r2, .L79
	ldrne	r1, .L79+4
	str	r1, [r2]
	mov	r2, #67108864
	eor	r3, r3, #16
	strh	r3, [r2]	@ movhi
	bx	lr
.L80:
	.align	2
.L79:
	.word	.LANCHOR0
	.word	100704256
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L83
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip, #4]
	lsl	r0, r0, #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L84:
	.align	2
.L83:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	hideSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #512
	ldr	r3, .L89
	add	r2, r3, #1024
.L86:
	strh	r1, [r3], #8	@ movhi
	cmp	r3, r2
	bne	.L86
	bx	lr
.L90:
	.align	2
.L89:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	sub	ip, ip, #1
	cmp	ip, r1
	ble	.L95
	add	r1, r1, r3
	sub	r1, r1, #1
	cmp	r1, lr
	bgt	.L97
.L95:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L97:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	sub	r3, r3, #1
	cmp	r3, r0
	ble	.L95
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	sub	r0, r0, #1
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 47) 7.1.0"
