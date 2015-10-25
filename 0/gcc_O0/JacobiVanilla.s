	.file	"JacobiVanilla.c"
	.intel_syntax noprefix
	.text
	.globl	jacobiVanilla
	.type	jacobiVanilla, @function
jacobiVanilla:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR [rbp-40], rdi
	mov	QWORD PTR [rbp-48], rsi
	mov	DWORD PTR [rbp-52], edx
	mov	DWORD PTR [rbp-56], ecx
	mov	DWORD PTR [rbp-4], 1
	jmp	.L2
.L5:
	mov	DWORD PTR [rbp-8], 1
	jmp	.L3
.L4:
	mov	eax, DWORD PTR [rbp-4]
	imul	eax, DWORD PTR [rbp-52]
	mov	edx, DWORD PTR [rbp-8]
	sub	edx, 1
	add	eax, edx
	cdqe
	lea	rdx, [0+rax*4]
	mov	rax, QWORD PTR [rbp-40]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rbp-12], eax
	mov	eax, DWORD PTR [rbp-4]
	imul	eax, DWORD PTR [rbp-52]
	mov	edx, DWORD PTR [rbp-8]
	add	edx, 1
	add	eax, edx
	cdqe
	lea	rdx, [0+rax*4]
	mov	rax, QWORD PTR [rbp-40]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rbp-16], eax
	mov	eax, DWORD PTR [rbp-4]
	sub	eax, 1
	imul	eax, DWORD PTR [rbp-52]
	mov	edx, eax
	mov	eax, DWORD PTR [rbp-8]
	add	eax, edx
	cdqe
	lea	rdx, [0+rax*4]
	mov	rax, QWORD PTR [rbp-40]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rbp-20], eax
	mov	eax, DWORD PTR [rbp-4]
	add	eax, 1
	imul	eax, DWORD PTR [rbp-52]
	mov	edx, eax
	mov	eax, DWORD PTR [rbp-8]
	add	eax, edx
	cdqe
	lea	rdx, [0+rax*4]
	mov	rax, QWORD PTR [rbp-40]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rbp-24], eax
	mov	eax, DWORD PTR [rbp-4]
	imul	eax, DWORD PTR [rbp-52]
	mov	edx, eax
	mov	eax, DWORD PTR [rbp-8]
	add	eax, edx
	cdqe
	lea	rdx, [0+rax*4]
	mov	rax, QWORD PTR [rbp-48]
	add	rdx, rax
	mov	eax, DWORD PTR [rbp-12]
	movd	xmm1, eax
	addss	xmm1, DWORD PTR [rbp-16]
	movd	eax, xmm1
	movd	xmm2, eax
	addss	xmm2, DWORD PTR [rbp-24]
	movd	eax, xmm2
	movd	xmm0, eax
	addss	xmm0, DWORD PTR [rbp-20]
	mov	eax, DWORD PTR .LC0[rip]
	movd	xmm3, eax
	mulss	xmm3, xmm0
	movd	eax, xmm3
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR [rbp-8], 1
.L3:
	mov	eax, DWORD PTR [rbp-52]
	sub	eax, 1
	cmp	eax, DWORD PTR [rbp-8]
	jg	.L4
	add	DWORD PTR [rbp-4], 1
.L2:
	mov	eax, DWORD PTR [rbp-56]
	sub	eax, 1
	cmp	eax, DWORD PTR [rbp-4]
	jg	.L5
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	jacobiVanilla, .-jacobiVanilla
	.section	.rodata
	.align 4
.LC0:
	.long	1048576000
	.ident	"GCC: (GNU) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
