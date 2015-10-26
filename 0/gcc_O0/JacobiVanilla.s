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
	mov	QWORD PTR [rbp-24], rdi
	mov	QWORD PTR [rbp-32], rsi
	mov	DWORD PTR [rbp-36], edx
	mov	DWORD PTR [rbp-40], ecx
	mov	DWORD PTR [rbp-4], 1
	jmp	.L2
.L5:
	mov	DWORD PTR [rbp-8], 1
	jmp	.L3
.L4:
	mov	eax, DWORD PTR [rbp-4]
	imul	eax, DWORD PTR [rbp-36]
	mov	edx, eax
	mov	eax, DWORD PTR [rbp-8]
	add	eax, edx
	cdqe
	lea	rdx, [0+rax*4]
	mov	rax, QWORD PTR [rbp-32]
	lea	rcx, [rdx+rax]
	mov	eax, DWORD PTR [rbp-4]
	imul	eax, DWORD PTR [rbp-36]
	mov	edx, DWORD PTR [rbp-8]
	sub	edx, 1
	add	eax, edx
	cdqe
	lea	rdx, [0+rax*4]
	mov	rax, QWORD PTR [rbp-24]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR [rbp-4]
	imul	eax, DWORD PTR [rbp-36]
	mov	esi, DWORD PTR [rbp-8]
	add	esi, 1
	add	eax, esi
	cdqe
	lea	rsi, [0+rax*4]
	mov	rax, QWORD PTR [rbp-24]
	add	rax, rsi
	mov	eax, DWORD PTR [rax]
	movd	xmm0, edx
	movd	xmm2, eax
	addss	xmm0, xmm2
	mov	eax, DWORD PTR [rbp-4]
	sub	eax, 1
	imul	eax, DWORD PTR [rbp-36]
	mov	edx, eax
	mov	eax, DWORD PTR [rbp-8]
	add	eax, edx
	cdqe
	lea	rdx, [0+rax*4]
	mov	rax, QWORD PTR [rbp-24]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	movd	xmm3, eax
	addss	xmm0, xmm3
	mov	eax, DWORD PTR [rbp-4]
	add	eax, 1
	imul	eax, DWORD PTR [rbp-36]
	mov	edx, eax
	mov	eax, DWORD PTR [rbp-8]
	add	eax, edx
	cdqe
	lea	rdx, [0+rax*4]
	mov	rax, QWORD PTR [rbp-24]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	movd	xmm4, eax
	addss	xmm0, xmm4
	mov	eax, DWORD PTR .LC0[rip]
	movd	xmm1, eax
	mulss	xmm1, xmm0
	movd	eax, xmm1
	mov	DWORD PTR [rcx], eax
	add	DWORD PTR [rbp-8], 1
.L3:
	mov	eax, DWORD PTR [rbp-36]
	sub	eax, 1
	cmp	eax, DWORD PTR [rbp-8]
	jg	.L4
	add	DWORD PTR [rbp-4], 1
.L2:
	mov	eax, DWORD PTR [rbp-40]
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
