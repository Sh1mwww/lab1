	.file	"lab1.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	count_leading_zeros
	.type	count_leading_zeros, @function
count_leading_zeros:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,1
	ld	a4,-24(s0)
	or	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,2
	ld	a4,-24(s0)
	or	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,4
	ld	a4,-24(s0)
	or	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,8
	ld	a4,-24(s0)
	or	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,16
	ld	a4,-24(s0)
	or	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,32
	ld	a4,-24(s0)
	or	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a4,a5,1
	lui	a5,%hi(.LC1)
	ld	a5,%lo(.LC1)(a5)
	and	a5,a4,a5
	ld	a4,-24(s0)
	sub	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a4,a5,2
	lui	a5,%hi(.LC2)
	ld	a5,%lo(.LC2)(a5)
	and	a4,a4,a5
	ld	a3,-24(s0)
	lui	a5,%hi(.LC2)
	ld	a5,%lo(.LC2)(a5)
	and	a5,a3,a5
	add	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a4,a5,4
	ld	a5,-24(s0)
	add	a4,a4,a5
	lui	a5,%hi(.LC3)
	ld	a5,%lo(.LC3)(a5)
	and	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,8
	ld	a4,-24(s0)
	add	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,16
	ld	a4,-24(s0)
	add	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	srli	a5,a5,32
	ld	a4,-24(s0)
	add	a5,a4,a5
	sd	a5,-24(s0)
	ld	a5,-24(s0)
	slli	a5,a5,48
	srli	a5,a5,48
	andi	a5,a5,127
	slli	a5,a5,48
	srli	a5,a5,48
	li	a4,64
	subw	a5,a4,a5
	slli	a5,a5,48
	srli	a5,a5,48
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	count_leading_zeros, .-count_leading_zeros
	.align	1
	.globl	swap
	.type	swap, @function
swap:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	ld	a5,-40(s0)
	lw	a5,0(a5)
	sw	a5,-20(s0)
	ld	a5,-48(s0)
	lw	a4,0(a5)
	ld	a5,-40(s0)
	sw	a4,0(a5)
	ld	a5,-48(s0)
	lw	a4,-20(s0)
	sw	a4,0(a5)
	nop
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	swap, .-swap
	.align	1
	.globl	quickSort
	.type	quickSort, @function
quickSort:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	addi	s0,sp,64
	sd	a0,-56(s0)
	mv	a5,a1
	mv	a4,a2
	sw	a5,-60(s0)
	mv	a5,a4
	sw	a5,-64(s0)
	j	.L5
.L13:
	lw	a5,-60(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-44(s0)
	lw	a5,-60(s0)
	sw	a5,-36(s0)
	lw	a5,-64(s0)
	sw	a5,-40(s0)
	j	.L6
.L8:
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L7:
	lw	a5,-36(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a0,a5
	call	count_leading_zeros
	mv	a5,a0
	mv	s1,a5
	lw	a5,-44(s0)
	mv	a0,a5
	call	count_leading_zeros
	mv	a5,a0
	sext.w	a4,s1
	sext.w	a5,a5
	bgtu	a4,a5,.L8
	j	.L9
.L10:
	lw	a5,-40(s0)
	addiw	a5,a5,-1
	sw	a5,-40(s0)
.L9:
	lw	a5,-40(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a0,a5
	call	count_leading_zeros
	mv	a5,a0
	mv	s1,a5
	lw	a5,-44(s0)
	mv	a0,a5
	call	count_leading_zeros
	mv	a5,a0
	sext.w	a4,s1
	sext.w	a5,a5
	bltu	a4,a5,.L10
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bgt	a4,a5,.L6
	lw	a5,-36(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a3,a4,a5
	lw	a5,-40(s0)
	slli	a5,a5,2
	ld	a4,-56(s0)
	add	a5,a4,a5
	mv	a1,a5
	mv	a0,a3
	call	swap
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
	lw	a5,-40(s0)
	addiw	a5,a5,-1
	sw	a5,-40(s0)
.L6:
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L7
	lw	a4,-60(s0)
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L12
	lw	a4,-40(s0)
	lw	a5,-60(s0)
	mv	a2,a4
	mv	a1,a5
	ld	a0,-56(s0)
	call	quickSort
.L12:
	lw	a5,-36(s0)
	sw	a5,-60(s0)
.L5:
	lw	a4,-60(s0)
	lw	a5,-64(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L13
	nop
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	addi	sp,sp,64
	jr	ra
	.size	quickSort, .-quickSort
	.section	.rodata
	.align	3
.LC4:
	.string	"\305\305\320\362\272\363\265\304\312\375\327\351\243\272"
	.align	3
.LC5:
	.string	"%d "
	.align	3
.LC6:
	.string	"pause"
	.align	3
.LC0:
	.word	25
	.word	8
	.word	4
	.word	11
	.word	32
	.word	2
	.word	19
	.word	51
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	ld	a2,0(a5)
	ld	a3,8(a5)
	ld	a4,16(a5)
	ld	a5,24(a5)
	sd	a2,-56(s0)
	sd	a3,-48(s0)
	sd	a4,-40(s0)
	sd	a5,-32(s0)
	li	a5,8
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	addiw	a5,a5,-1
	sext.w	a4,a5
	addi	a5,s0,-56
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	quickSort
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	puts
	sw	zero,-20(s0)
	j	.L15
.L16:
	lw	a5,-20(s0)
	slli	a5,a5,2
	addi	a4,s0,-16
	add	a5,a4,a5
	lw	a5,-40(a5)
	mv	a1,a5
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	printf
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L15:
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L16
	li	a0,10
	call	putchar
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	system
	li	a5,0
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra
	.size	main, .-main
	.section	.rodata
	.align	3
.LC1:
	.dword	6148914691236517205
	.align	3
.LC2:
	.dword	3689348814741910323
	.align	3
.LC3:
	.dword	1085102592571150095
	.ident	"GCC: (SiFive GCC 8.3.0-2020.04.1) 8.3.0"
