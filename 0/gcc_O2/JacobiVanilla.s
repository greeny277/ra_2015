	.file	"JacobiVanilla.c"
	.intel_syntax noprefix
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	jacobiVanilla
	.type	jacobiVanilla, @function
jacobiVanilla:
.LFB11:
	.cfi_startproc
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	lea	r12d, [rcx-1]
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	cmp	r12d, 1
	jle	.L1
	lea	ebp, [rdx+rdx]
	movsx	rax, edx
	movss	xmm1, DWORD PTR .LC0[rip]
	mov	r10d, 2
	lea	r11, [0+rax*4]
	mov	r13, rax
	movsx	rbp, ebp
	neg	r13
	sub	rbp, rax
	add	rsi, r11
	lea	r9d, [rdx-3]
	sal	r13, 2
	lea	rcx, [rdi+r11]
	sal	rbp, 2
	add	r9, 1
	.p2align 4,,10
	.p2align 3
.L3:
	lea	r8, [rcx+r13]
	mov	ebx, r10d
	xor	eax, eax
	lea	rdi, [rcx+rbp]
	cmp	edx, 2
	jle	.L6
	.p2align 4,,10
	.p2align 3
.L4:
	movss	xmm0, DWORD PTR [rcx+rax*4]
	addss	xmm0, DWORD PTR [rcx+8+rax*4]
	addss	xmm0, DWORD PTR [r8+4+rax*4]
	addss	xmm0, DWORD PTR [rdi+4+rax*4]
	mulss	xmm0, xmm1
	movss	DWORD PTR [rsi+4+rax*4], xmm0
	add	rax, 1
	cmp	rax, r9
	jne	.L4
.L6:
	add	r10d, 1
	add	rcx, r11
	add	rsi, r11
	cmp	r12d, ebx
	jg	.L3
.L1:
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE11:
	.size	jacobiVanilla, .-jacobiVanilla
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1048576000
	.ident	"GCC: (GNU) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
