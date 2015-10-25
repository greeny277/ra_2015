	.file	"JacobiVanilla.c"
	.intel_syntax noprefix
	.section	.text.unlikely,"ax",@progbits
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	jacobiVanilla
	.type	jacobiVanilla, @function
jacobiVanilla:
.LFB11:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	mov	r10, rdi
	mov	eax, edx
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	lea	edi, [rcx-1]
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 32
	.cfi_def_cfa_offset 88
	mov	QWORD PTR [rsp-88], rsi
	mov	DWORD PTR [rsp-24], edx
	mov	DWORD PTR [rsp-44], edi
	cmp	edi, 1
	jle	.L1
	movsx	rcx, eax
	movaps	xmm5, XMMWORD PTR .LC1[rip]
	mov	r12, r10
	xor	edi, edi
	lea	r14, [0+rcx*4]
	mov	r15, rcx
	mov	QWORD PTR [rsp-40], rcx
	movss	xmm3, DWORD PTR .LC0[rip]
	lea	rbp, [rsi+r14]
	mov	esi, eax
	mov	QWORD PTR [rsp-32], rcx
	lea	eax, [rax+2+rax]
	mov	r11d, esi
	mov	DWORD PTR [rsp-100], 2
	movaps	xmm4, xmm3
	cdqe
	sub	r11d, 3
	movaps	xmm2, xmm3
	mov	QWORD PTR [rsp-56], 0
	lea	r9, [r10+rax*4]
	mov	eax, esi
	add	r11, 1
	lea	edx, [rdx-1]
	add	eax, eax
	mov	QWORD PTR [rsp], r9
	xor	r9d, r9d
	mov	DWORD PTR [rsp-92], edx
	lea	r8, [r10+r14]
	cdqe
	lea	edx, [rsi-2]
	mov	QWORD PTR [rsp-16], rax
	lea	r13, [r8+r14]
	mov	DWORD PTR [rsp-108], edx
	mov	QWORD PTR [rsp-8], r11
	.p2align 4,,10
	.p2align 3
.L3:
	cmp	DWORD PTR [rsp-92], 1
	jle	.L86
	mov	eax, DWORD PTR [rsp-24]
	lea	rsi, [rbp+20]
	mov	r11d, DWORD PTR [rsp-100]
	lea	rcx, [r14+r9]
	lea	rbx, [r8+24]
	mov	QWORD PTR [rsp-120], rcx
	lea	edx, [rdi+rax]
	add	eax, edx
	mov	DWORD PTR [rsp-96], r11d
	cmp	r8, rsi
	lea	r11, [rbp+4]
	setae	cl
	mov	DWORD PTR [rsp-104], eax
	cmp	r11, rbx
	lea	rbx, [r10+20+r9]
	setae	al
	or	ecx, eax
	cmp	r11, rbx
	lea	rax, [r10+4+r9]
	setae	bl
	cmp	rsi, rax
	setbe	al
	or	eax, ebx
	and	ecx, eax
	cmp	DWORD PTR [rsp-108], 6
	seta	bl
	test	cl, bl
	je	.L16
	lea	rcx, [r13+20]
	lea	rax, [r13+4]
	cmp	r11, rcx
	setae	r11b
	cmp	rsi, rax
	setbe	sil
	or	r11b, sil
	je	.L16
	mov	r11, r8
	mov	ebx, DWORD PTR [rsp-108]
	mov	eax, 1
	and	r11d, 15
	shr	r11, 2
	neg	r11
	and	r11d, 3
	cmp	ebx, r11d
	cmovbe	r11d, ebx
	test	r11d, r11d
	je	.L6
	movss	xmm0, DWORD PTR [r8]
	mov	al, 2
	addss	xmm0, DWORD PTR [r8+8]
	addss	xmm0, DWORD PTR [r13+4]
	addss	xmm0, DWORD PTR [r12+4]
	mulss	xmm0, xmm4
	movss	DWORD PTR [rbp+4], xmm0
	cmp	r11d, 1
	je	.L6
	mov	rcx, QWORD PTR [rsp]
	mov	eax, 3
	movss	xmm1, DWORD PTR [r8+4]
	addss	xmm1, DWORD PTR [r8+12]
	addss	xmm1, DWORD PTR [rcx+r9]
	addss	xmm1, DWORD PTR [r12+8]
	mulss	xmm1, xmm4
	movss	DWORD PTR [rbp+8], xmm1
	cmp	r11d, 3
	jne	.L6
	movss	xmm6, DWORD PTR [r8+8]
	mov	al, 4
	addss	xmm6, DWORD PTR [r8+16]
	addss	xmm6, DWORD PTR [r13+12]
	addss	xmm6, DWORD PTR [r12+12]
	mulss	xmm6, xmm4
	movss	DWORD PTR [rbp+12], xmm6
.L6:
	mov	r9d, DWORD PTR [rsp-108]
	mov	ecx, r11d
	sub	r9d, r11d
	lea	esi, [r9-4]
	mov	DWORD PTR [rsp-20], r9d
	mov	r9, QWORD PTR [rsp-120]
	shr	esi, 2
	lea	r11d, [rsi+1]
	and	esi, 3
	lea	ebx, [0+r11*4]
	mov	DWORD PTR [rsp-48], r11d
	lea	r11, [r9+rcx*4]
	mov	DWORD PTR [rsp+8], ebx
	lea	r9, [rcx+2+r15]
	lea	rbx, [r10+r11]
	lea	r11, [r10+r9*4]
	mov	r9, QWORD PTR [rsp-16]
	mov	QWORD PTR [rsp-80], rbx
	mov	QWORD PTR [rsp-72], r11
	mov	r11, QWORD PTR [rsp-56]
	lea	rbx, [rcx+1+r11]
	lea	r11, [r11+1+r9]
	lea	rbx, [r10+rbx*4]
	add	r11, rcx
	lea	r9, [r10+r11*4]
	mov	r11, QWORD PTR [rsp-88]
	mov	QWORD PTR [rsp-64], r9
	mov	r9, QWORD PTR [rsp-72]
	lea	rcx, [rcx+1+r15]
	movups	xmm9, XMMWORD PTR [rbx]
	lea	r11, [r11+rcx*4]
	mov	rcx, QWORD PTR [rsp-80]
	movups	xmm7, XMMWORD PTR [r9]
	mov	r9, QWORD PTR [rsp-64]
	addps	xmm7, XMMWORD PTR [rcx]
	mov	ecx, 16
	movups	xmm8, XMMWORD PTR [r9]
	mov	r9d, 1
	addps	xmm7, xmm8
	addps	xmm7, xmm9
	mulps	xmm7, xmm5
	movups	XMMWORD PTR [r11], xmm7
	cmp	r9d, DWORD PTR [rsp-48]
	jae	.L79
	test	esi, esi
	je	.L83
	cmp	esi, 1
	je	.L64
	cmp	esi, 2
	je	.L65
	mov	rcx, QWORD PTR [rsp-80]
	mov	rsi, QWORD PTR [rsp-72]
	mov	r9, QWORD PTR [rsp-64]
	movups	xmm12, XMMWORD PTR [rbx+16]
	movups	xmm10, XMMWORD PTR [rsi+16]
	addps	xmm10, XMMWORD PTR [rcx+16]
	mov	ecx, 32
	movups	xmm11, XMMWORD PTR [r9+16]
	mov	r9d, 2
	addps	xmm10, xmm11
	addps	xmm10, xmm12
	mulps	xmm10, xmm5
	movups	XMMWORD PTR [r11+16], xmm10
.L65:
	mov	rsi, QWORD PTR [rsp-72]
	add	r9d, 1
	movups	xmm15, XMMWORD PTR [rbx+rcx]
	movups	xmm13, XMMWORD PTR [rsi+rcx]
	mov	rsi, QWORD PTR [rsp-80]
	addps	xmm13, XMMWORD PTR [rsi+rcx]
	mov	rsi, QWORD PTR [rsp-64]
	movups	xmm14, XMMWORD PTR [rsi+rcx]
	addps	xmm13, xmm14
	addps	xmm13, xmm15
	mulps	xmm13, xmm5
	movups	XMMWORD PTR [r11+rcx], xmm13
	add	rcx, 16
.L64:
	mov	rsi, QWORD PTR [rsp-72]
	add	r9d, 1
	movups	xmm6, XMMWORD PTR [rbx+rcx]
	movups	xmm0, XMMWORD PTR [rsi+rcx]
	mov	rsi, QWORD PTR [rsp-80]
	addps	xmm0, XMMWORD PTR [rsi+rcx]
	mov	rsi, QWORD PTR [rsp-64]
	movups	xmm1, XMMWORD PTR [rsi+rcx]
	addps	xmm0, xmm1
	addps	xmm0, xmm6
	mulps	xmm0, xmm5
	movups	XMMWORD PTR [r11+rcx], xmm0
	add	rcx, 16
	cmp	r9d, DWORD PTR [rsp-48]
	jae	.L79
.L83:
	mov	DWORD PTR [rsp+12], eax
	mov	rax, QWORD PTR [rsp-72]
	mov	DWORD PTR [rsp+16], edi
	mov	rdi, QWORD PTR [rsp-64]
	mov	DWORD PTR [rsp+20], edx
	mov	rdx, QWORD PTR [rsp-80]
.L8:
	movups	xmm7, XMMWORD PTR [rax+rcx]
	add	r9d, 4
	addps	xmm7, XMMWORD PTR [rdx+rcx]
	movups	xmm8, XMMWORD PTR [rdi+rcx]
	movups	xmm9, XMMWORD PTR [rbx+rcx]
	addps	xmm7, xmm8
	addps	xmm9, xmm7
	mulps	xmm9, xmm5
	movups	XMMWORD PTR [r11+rcx], xmm9
	movups	xmm10, XMMWORD PTR [rax+16+rcx]
	addps	xmm10, XMMWORD PTR [rdx+16+rcx]
	movups	xmm11, XMMWORD PTR [rdi+16+rcx]
	movups	xmm12, XMMWORD PTR [rbx+16+rcx]
	addps	xmm10, xmm11
	addps	xmm12, xmm10
	mulps	xmm12, xmm5
	movups	XMMWORD PTR [r11+16+rcx], xmm12
	movups	xmm13, XMMWORD PTR [rax+32+rcx]
	addps	xmm13, XMMWORD PTR [rdx+32+rcx]
	movups	xmm14, XMMWORD PTR [rdi+32+rcx]
	movups	xmm15, XMMWORD PTR [rbx+32+rcx]
	addps	xmm13, xmm14
	addps	xmm15, xmm13
	mulps	xmm15, xmm5
	movups	XMMWORD PTR [r11+32+rcx], xmm15
	movups	xmm1, XMMWORD PTR [rax+48+rcx]
	addps	xmm1, XMMWORD PTR [rdx+48+rcx]
	movups	xmm0, XMMWORD PTR [rdi+48+rcx]
	movups	xmm6, XMMWORD PTR [rbx+48+rcx]
	addps	xmm1, xmm0
	addps	xmm6, xmm1
	mulps	xmm6, xmm5
	movups	XMMWORD PTR [r11+48+rcx], xmm6
	add	rcx, 64
	cmp	r9d, DWORD PTR [rsp-48]
	jb	.L8
	mov	eax, DWORD PTR [rsp+12]
	mov	edi, DWORD PTR [rsp+16]
	mov	edx, DWORD PTR [rsp+20]
	.p2align 4,,10
	.p2align 3
.L79:
	mov	ebx, DWORD PTR [rsp+8]
	add	eax, ebx
	cmp	DWORD PTR [rsp-20], ebx
	je	.L13
	lea	esi, [rax+1]
	lea	r11d, [rsi+rdx]
	lea	ecx, [rax+rdx]
	movsx	r9, r11d
	lea	r11d, [rax-1+rdx]
	movsx	rbx, ecx
	movsx	rcx, r11d
	mov	r11d, DWORD PTR [rsp-104]
	movss	xmm7, DWORD PTR [r10+rcx*4]
	addss	xmm7, DWORD PTR [r10+r9*4]
	add	r11d, eax
	movsx	rcx, r11d
	lea	r11d, [rdi+rax]
	addss	xmm7, DWORD PTR [r10+rcx*4]
	movsx	rcx, r11d
	mov	r11, QWORD PTR [rsp-88]
	addss	xmm7, DWORD PTR [r10+rcx*4]
	mulss	xmm7, xmm3
	movss	DWORD PTR [r11+rbx*4], xmm7
	cmp	esi, DWORD PTR [rsp-92]
	jge	.L13
	movss	xmm8, DWORD PTR [r10+rbx*4]
	mov	ebx, DWORD PTR [rsp-104]
	lea	ecx, [rax+2]
	lea	r11d, [rcx+rdx]
	movsx	r11, r11d
	addss	xmm8, DWORD PTR [r10+r11*4]
	add	ebx, esi
	add	esi, edi
	movsx	rbx, ebx
	movsx	rsi, esi
	addss	xmm8, DWORD PTR [r10+rbx*4]
	addss	xmm8, DWORD PTR [r10+rsi*4]
	mov	rbx, QWORD PTR [rsp-88]
	mulss	xmm8, xmm3
	movss	DWORD PTR [rbx+r9*4], xmm8
	cmp	DWORD PTR [rsp-92], ecx
	jle	.L13
	movss	xmm9, DWORD PTR [r10+r9*4]
	lea	eax, [rax+3+rdx]
	mov	r9, QWORD PTR [rsp-88]
	cdqe
	addss	xmm9, DWORD PTR [r10+rax*4]
	mov	eax, DWORD PTR [rsp-104]
	add	eax, ecx
	add	ecx, edi
	cdqe
	movsx	rdi, ecx
	addss	xmm9, DWORD PTR [r10+rax*4]
	addss	xmm9, DWORD PTR [r10+rdi*4]
	mulss	xmm9, xmm3
	movss	DWORD PTR [r9+r11*4], xmm9
.L13:
	mov	edi, edx
	add	r8, r14
	mov	rdx, QWORD PTR [rsp-32]
	add	r12, r14
	add	DWORD PTR [rsp-100], 1
	add	r13, r14
	add	rbp, r14
	mov	r9, QWORD PTR [rsp-120]
	add	r15, QWORD PTR [rsp-40]
	add	QWORD PTR [rsp-56], rdx
	mov	ebx, DWORD PTR [rsp-96]
	cmp	DWORD PTR [rsp-44], ebx
	jg	.L3
.L1:
	add	rsp, 32
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	.cfi_restore_state
	movss	xmm10, DWORD PTR [r8]
	mov	ebx, 1
	addss	xmm10, DWORD PTR [r8+8]
	addss	xmm10, DWORD PTR [r13+4]
	addss	xmm10, DWORD PTR [r12+4]
	mov	r11, QWORD PTR [rsp-8]
	mulss	xmm10, xmm2
	lea	rsi, [r11-1]
	and	esi, 7
	movss	DWORD PTR [rbp+4], xmm10
	cmp	rbx, r11
	je	.L13
	test	rsi, rsi
	je	.L4
	cmp	rsi, 1
	je	.L58
	cmp	rsi, 2
	je	.L59
	cmp	rsi, 3
	je	.L60
	cmp	rsi, 4
	je	.L61
	cmp	rsi, 5
	je	.L62
	cmp	rsi, 6
	je	.L63
	movss	xmm11, DWORD PTR [r8+4]
	mov	ebx, 2
	addss	xmm11, DWORD PTR [r8+12]
	addss	xmm11, DWORD PTR [r13+8]
	addss	xmm11, DWORD PTR [r12+8]
	mulss	xmm11, xmm2
	movss	DWORD PTR [rbp+8], xmm11
.L63:
	movss	xmm12, DWORD PTR [r8+rbx*4]
	addss	xmm12, DWORD PTR [r8+8+rbx*4]
	addss	xmm12, DWORD PTR [r13+4+rbx*4]
	addss	xmm12, DWORD PTR [r12+4+rbx*4]
	mulss	xmm12, xmm2
	movss	DWORD PTR [rbp+4+rbx*4], xmm12
	add	rbx, 1
.L62:
	movss	xmm13, DWORD PTR [r8+rbx*4]
	addss	xmm13, DWORD PTR [r8+8+rbx*4]
	addss	xmm13, DWORD PTR [r13+4+rbx*4]
	addss	xmm13, DWORD PTR [r12+4+rbx*4]
	mulss	xmm13, xmm2
	movss	DWORD PTR [rbp+4+rbx*4], xmm13
	add	rbx, 1
.L61:
	movss	xmm14, DWORD PTR [r8+rbx*4]
	addss	xmm14, DWORD PTR [r8+8+rbx*4]
	addss	xmm14, DWORD PTR [r13+4+rbx*4]
	addss	xmm14, DWORD PTR [r12+4+rbx*4]
	mulss	xmm14, xmm2
	movss	DWORD PTR [rbp+4+rbx*4], xmm14
	add	rbx, 1
.L60:
	movss	xmm15, DWORD PTR [r8+rbx*4]
	addss	xmm15, DWORD PTR [r8+8+rbx*4]
	addss	xmm15, DWORD PTR [r13+4+rbx*4]
	addss	xmm15, DWORD PTR [r12+4+rbx*4]
	mulss	xmm15, xmm2
	movss	DWORD PTR [rbp+4+rbx*4], xmm15
	add	rbx, 1
.L59:
	movss	xmm1, DWORD PTR [r8+rbx*4]
	addss	xmm1, DWORD PTR [r8+8+rbx*4]
	addss	xmm1, DWORD PTR [r13+4+rbx*4]
	addss	xmm1, DWORD PTR [r12+4+rbx*4]
	mulss	xmm1, xmm2
	movss	DWORD PTR [rbp+4+rbx*4], xmm1
	add	rbx, 1
.L58:
	movss	xmm0, DWORD PTR [r8+rbx*4]
	addss	xmm0, DWORD PTR [r8+8+rbx*4]
	addss	xmm0, DWORD PTR [r13+4+rbx*4]
	addss	xmm0, DWORD PTR [r12+4+rbx*4]
	mulss	xmm0, xmm2
	movss	DWORD PTR [rbp+4+rbx*4], xmm0
	add	rbx, 1
	cmp	rbx, QWORD PTR [rsp-8]
	je	.L13
.L4:
	movss	xmm6, DWORD PTR [r8+rbx*4]
	addss	xmm6, DWORD PTR [r8+8+rbx*4]
	lea	rax, [rbx+1]
	addss	xmm6, DWORD PTR [r13+4+rbx*4]
	lea	rdi, [rbx+2]
	addss	xmm6, DWORD PTR [r12+4+rbx*4]
	lea	r9, [rbx+3]
	lea	r11, [rbx+4]
	lea	rcx, [rbx+5]
	mulss	xmm6, xmm2
	lea	rsi, [rbx+6]
	movss	DWORD PTR [rbp+4+rbx*4], xmm6
	movss	xmm7, DWORD PTR [r8+rax*4]
	addss	xmm7, DWORD PTR [r8+8+rax*4]
	addss	xmm7, DWORD PTR [r13+4+rax*4]
	addss	xmm7, DWORD PTR [r12+4+rax*4]
	mulss	xmm7, xmm2
	movss	DWORD PTR [rbp+4+rax*4], xmm7
	movss	xmm8, DWORD PTR [r8+rdi*4]
	lea	rax, [rbx+7]
	add	rbx, 8
	addss	xmm8, DWORD PTR [r8+8+rdi*4]
	addss	xmm8, DWORD PTR [r13+4+rdi*4]
	addss	xmm8, DWORD PTR [r12+4+rdi*4]
	mulss	xmm8, xmm2
	movss	DWORD PTR [rbp+4+rdi*4], xmm8
	movss	xmm9, DWORD PTR [r8+r9*4]
	addss	xmm9, DWORD PTR [r8+8+r9*4]
	addss	xmm9, DWORD PTR [r13+4+r9*4]
	addss	xmm9, DWORD PTR [r12+4+r9*4]
	mulss	xmm9, xmm2
	movss	DWORD PTR [rbp+4+r9*4], xmm9
	movss	xmm10, DWORD PTR [r8+r11*4]
	addss	xmm10, DWORD PTR [r8+8+r11*4]
	addss	xmm10, DWORD PTR [r13+4+r11*4]
	addss	xmm10, DWORD PTR [r12+4+r11*4]
	mulss	xmm10, xmm2
	movss	DWORD PTR [rbp+4+r11*4], xmm10
	movss	xmm11, DWORD PTR [r8+rcx*4]
	addss	xmm11, DWORD PTR [r8+8+rcx*4]
	addss	xmm11, DWORD PTR [r13+4+rcx*4]
	addss	xmm11, DWORD PTR [r12+4+rcx*4]
	mulss	xmm11, xmm2
	movss	DWORD PTR [rbp+4+rcx*4], xmm11
	movss	xmm12, DWORD PTR [r8+rsi*4]
	addss	xmm12, DWORD PTR [r8+8+rsi*4]
	addss	xmm12, DWORD PTR [r13+4+rsi*4]
	addss	xmm12, DWORD PTR [r12+4+rsi*4]
	mulss	xmm12, xmm2
	movss	DWORD PTR [rbp+4+rsi*4], xmm12
	movss	xmm13, DWORD PTR [r8+rax*4]
	addss	xmm13, DWORD PTR [r8+8+rax*4]
	addss	xmm13, DWORD PTR [r13+4+rax*4]
	addss	xmm13, DWORD PTR [r12+4+rax*4]
	mulss	xmm13, xmm2
	movss	DWORD PTR [rbp+4+rax*4], xmm13
	cmp	rbx, QWORD PTR [rsp-8]
	jne	.L4
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L86:
	mov	ecx, DWORD PTR [rsp-100]
	lea	rbx, [r9+r14]
	mov	esi, DWORD PTR [rsp-24]
	mov	QWORD PTR [rsp-120], rbx
	mov	DWORD PTR [rsp-96], ecx
	lea	edx, [rdi+rsi]
	jmp	.L13
	.cfi_endproc
.LFE11:
	.size	jacobiVanilla, .-jacobiVanilla
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1048576000
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	1048576000
	.long	1048576000
	.long	1048576000
	.long	1048576000
	.ident	"GCC: (GNU) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
