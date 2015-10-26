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
	mov	eax, edx
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
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
	mov	DWORD PTR [rsp-24], edx
	lea	edx, [rcx-1]
	mov	QWORD PTR [rsp-88], rsi
	mov	DWORD PTR [rsp-44], edx
	cmp	edx, 1
	jle	.L1
	movsx	rbx, eax
	mov	r10, rdi
	mov	r12, rdi
	movss	xmm3, DWORD PTR .LC0[rip]
	lea	r14, [0+rbx*4]
	movaps	xmm5, XMMWORD PTR .LC1[rip]
	mov	r15, rbx
	mov	QWORD PTR [rsp-40], rbx
	lea	ecx, [rax-1]
	mov	QWORD PTR [rsp-32], rbx
	movaps	xmm4, xmm3
	movaps	xmm2, xmm3
	lea	r8, [rdi+r14]
	mov	edi, eax
	mov	DWORD PTR [rsp-92], ecx
	xor	ecx, ecx
	lea	eax, [rax+2+rax]
	mov	r11d, edi
	mov	DWORD PTR [rsp-100], 2
	lea	edx, [rdi-2]
	cdqe
	sub	r11d, 3
	mov	QWORD PTR [rsp-56], 0
	lea	r9, [r10+rax*4]
	mov	eax, edi
	add	r11, 1
	mov	DWORD PTR [rsp-108], edx
	mov	QWORD PTR [rsp], r9
	lea	r13, [r8+r14]
	add	eax, eax
	xor	r9d, r9d
	lea	rbp, [rsi+r14]
	cdqe
	mov	QWORD PTR [rsp-8], r11
	mov	QWORD PTR [rsp-16], rax
	.p2align 4,,10
	.p2align 3
.L3:
	cmp	DWORD PTR [rsp-92], 1
	jle	.L86
	mov	eax, DWORD PTR [rsp-24]
	lea	rdi, [rbp+20]
	mov	r11d, DWORD PTR [rsp-100]
	lea	rbx, [r14+r9]
	mov	QWORD PTR [rsp-120], rbx
	lea	edx, [rcx+rax]
	add	eax, edx
	mov	DWORD PTR [rsp-96], r11d
	cmp	r8, rdi
	lea	r11, [rbp+4]
	mov	DWORD PTR [rsp-104], eax
	setae	sil
	lea	rax, [r8+24]
	cmp	r11, rax
	lea	rax, [r10+20+r9]
	setae	bl
	or	esi, ebx
	cmp	r11, rax
	lea	rax, [r10+4+r9]
	setae	bl
	cmp	rdi, rax
	setbe	al
	or	eax, ebx
	and	esi, eax
	cmp	DWORD PTR [rsp-108], 6
	seta	bl
	test	sil, bl
	je	.L16
	lea	rsi, [r13+20]
	lea	rax, [r13+4]
	cmp	r11, rsi
	setae	r11b
	cmp	rdi, rax
	setbe	dil
	or	r11b, dil
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
	addss	xmm0, DWORD PTR [r12+4]
	addss	xmm0, DWORD PTR [r13+4]
	mulss	xmm0, xmm4
	movss	DWORD PTR [rbp+4], xmm0
	cmp	r11d, 1
	je	.L6
	mov	rsi, QWORD PTR [rsp]
	mov	eax, 3
	movss	xmm1, DWORD PTR [r8+4]
	addss	xmm1, DWORD PTR [r8+12]
	addss	xmm1, DWORD PTR [r12+8]
	addss	xmm1, DWORD PTR [rsi+r9]
	mulss	xmm1, xmm4
	movss	DWORD PTR [rbp+8], xmm1
	cmp	r11d, 3
	jne	.L6
	movss	xmm6, DWORD PTR [r8+8]
	mov	al, 4
	addss	xmm6, DWORD PTR [r8+16]
	addss	xmm6, DWORD PTR [r12+12]
	addss	xmm6, DWORD PTR [r13+12]
	mulss	xmm6, xmm4
	movss	DWORD PTR [rbp+12], xmm6
.L6:
	mov	r9d, DWORD PTR [rsp-108]
	mov	esi, r11d
	sub	r9d, r11d
	lea	edi, [r9-4]
	mov	DWORD PTR [rsp-20], r9d
	mov	r9, QWORD PTR [rsp-120]
	shr	edi, 2
	lea	r11d, [rdi+1]
	and	edi, 3
	lea	ebx, [0+r11*4]
	mov	DWORD PTR [rsp-48], r11d
	lea	r11, [r9+rsi*4]
	mov	DWORD PTR [rsp+8], ebx
	lea	r9, [rsi+2+r15]
	lea	rbx, [r10+r11]
	lea	r11, [r10+r9*4]
	mov	QWORD PTR [rsp-80], rbx
	mov	QWORD PTR [rsp-72], r11
	mov	r11, QWORD PTR [rsp-56]
	lea	rbx, [rsi+1+r11]
	lea	r9, [r10+rbx*4]
	mov	rbx, QWORD PTR [rsp-16]
	mov	QWORD PTR [rsp-64], r9
	mov	r9, QWORD PTR [rsp-88]
	lea	r11, [r11+1+rbx]
	add	r11, rsi
	lea	rsi, [rsi+1+r15]
	lea	rbx, [r10+r11*4]
	lea	r11, [r9+rsi*4]
	mov	rsi, QWORD PTR [rsp-72]
	mov	r9, QWORD PTR [rsp-80]
	movups	xmm9, XMMWORD PTR [rbx]
	movups	xmm7, XMMWORD PTR [rsi]
	mov	rsi, QWORD PTR [rsp-64]
	addps	xmm7, XMMWORD PTR [r9]
	mov	r9d, 1
	movups	xmm8, XMMWORD PTR [rsi]
	mov	esi, 16
	addps	xmm7, xmm8
	addps	xmm7, xmm9
	mulps	xmm7, xmm5
	movups	XMMWORD PTR [r11], xmm7
	cmp	r9d, DWORD PTR [rsp-48]
	jae	.L79
	test	edi, edi
	je	.L83
	cmp	edi, 1
	je	.L64
	cmp	edi, 2
	je	.L65
	mov	r9, QWORD PTR [rsp-80]
	mov	rdi, QWORD PTR [rsp-72]
	mov	rsi, QWORD PTR [rsp-64]
	movups	xmm12, XMMWORD PTR [rbx+16]
	movups	xmm10, XMMWORD PTR [rdi+16]
	addps	xmm10, XMMWORD PTR [r9+16]
	mov	r9d, 2
	movups	xmm11, XMMWORD PTR [rsi+16]
	mov	esi, 32
	addps	xmm10, xmm11
	addps	xmm10, xmm12
	mulps	xmm10, xmm5
	movups	XMMWORD PTR [r11+16], xmm10
.L65:
	mov	rdi, QWORD PTR [rsp-72]
	add	r9d, 1
	movups	xmm15, XMMWORD PTR [rbx+rsi]
	movups	xmm13, XMMWORD PTR [rdi+rsi]
	mov	rdi, QWORD PTR [rsp-80]
	addps	xmm13, XMMWORD PTR [rdi+rsi]
	mov	rdi, QWORD PTR [rsp-64]
	movups	xmm14, XMMWORD PTR [rdi+rsi]
	addps	xmm13, xmm14
	addps	xmm13, xmm15
	mulps	xmm13, xmm5
	movups	XMMWORD PTR [r11+rsi], xmm13
	add	rsi, 16
.L64:
	mov	rdi, QWORD PTR [rsp-72]
	add	r9d, 1
	movups	xmm6, XMMWORD PTR [rbx+rsi]
	movups	xmm0, XMMWORD PTR [rdi+rsi]
	mov	rdi, QWORD PTR [rsp-80]
	addps	xmm0, XMMWORD PTR [rdi+rsi]
	mov	rdi, QWORD PTR [rsp-64]
	movups	xmm1, XMMWORD PTR [rdi+rsi]
	addps	xmm0, xmm1
	addps	xmm0, xmm6
	mulps	xmm0, xmm5
	movups	XMMWORD PTR [r11+rsi], xmm0
	add	rsi, 16
	cmp	r9d, DWORD PTR [rsp-48]
	jae	.L79
.L83:
	mov	DWORD PTR [rsp+12], eax
	mov	rax, QWORD PTR [rsp-72]
	mov	DWORD PTR [rsp+16], ecx
	mov	rcx, QWORD PTR [rsp-64]
	mov	DWORD PTR [rsp+20], edx
	mov	rdx, QWORD PTR [rsp-80]
.L8:
	movups	xmm7, XMMWORD PTR [rax+rsi]
	add	r9d, 4
	addps	xmm7, XMMWORD PTR [rdx+rsi]
	movups	xmm8, XMMWORD PTR [rcx+rsi]
	movups	xmm9, XMMWORD PTR [rbx+rsi]
	addps	xmm7, xmm8
	addps	xmm9, xmm7
	mulps	xmm9, xmm5
	movups	XMMWORD PTR [r11+rsi], xmm9
	movups	xmm10, XMMWORD PTR [rax+16+rsi]
	addps	xmm10, XMMWORD PTR [rdx+16+rsi]
	movups	xmm11, XMMWORD PTR [rcx+16+rsi]
	movups	xmm12, XMMWORD PTR [rbx+16+rsi]
	addps	xmm10, xmm11
	addps	xmm12, xmm10
	mulps	xmm12, xmm5
	movups	XMMWORD PTR [r11+16+rsi], xmm12
	movups	xmm13, XMMWORD PTR [rax+32+rsi]
	addps	xmm13, XMMWORD PTR [rdx+32+rsi]
	movups	xmm14, XMMWORD PTR [rcx+32+rsi]
	movups	xmm15, XMMWORD PTR [rbx+32+rsi]
	addps	xmm13, xmm14
	addps	xmm15, xmm13
	mulps	xmm15, xmm5
	movups	XMMWORD PTR [r11+32+rsi], xmm15
	movups	xmm1, XMMWORD PTR [rax+48+rsi]
	addps	xmm1, XMMWORD PTR [rdx+48+rsi]
	movups	xmm0, XMMWORD PTR [rcx+48+rsi]
	movups	xmm6, XMMWORD PTR [rbx+48+rsi]
	addps	xmm1, xmm0
	addps	xmm6, xmm1
	mulps	xmm6, xmm5
	movups	XMMWORD PTR [r11+48+rsi], xmm6
	add	rsi, 64
	cmp	r9d, DWORD PTR [rsp-48]
	jb	.L8
	mov	eax, DWORD PTR [rsp+12]
	mov	ecx, DWORD PTR [rsp+16]
	mov	edx, DWORD PTR [rsp+20]
	.p2align 4,,10
	.p2align 3
.L79:
	mov	ebx, DWORD PTR [rsp+8]
	add	eax, ebx
	cmp	DWORD PTR [rsp-20], ebx
	je	.L13
	lea	edi, [rax+1]
	lea	r11d, [rdi+rdx]
	lea	esi, [rax+rdx]
	movsx	r9, r11d
	lea	r11d, [rax-1+rdx]
	movsx	rbx, esi
	movsx	rsi, r11d
	lea	r11d, [rcx+rax]
	movss	xmm7, DWORD PTR [r10+rsi*4]
	movsx	rsi, r11d
	mov	r11d, DWORD PTR [rsp-104]
	addss	xmm7, DWORD PTR [r10+r9*4]
	addss	xmm7, DWORD PTR [r10+rsi*4]
	add	r11d, eax
	movsx	rsi, r11d
	mov	r11, QWORD PTR [rsp-88]
	addss	xmm7, DWORD PTR [r10+rsi*4]
	mulss	xmm7, xmm3
	movss	DWORD PTR [r11+rbx*4], xmm7
	cmp	edi, DWORD PTR [rsp-92]
	jge	.L13
	movss	xmm8, DWORD PTR [r10+rbx*4]
	lea	ebx, [rdi+rcx]
	add	edi, DWORD PTR [rsp-104]
	movsx	rbx, ebx
	lea	esi, [rax+2]
	lea	r11d, [rsi+rdx]
	movsx	r11, r11d
	movsx	rdi, edi
	addss	xmm8, DWORD PTR [r10+r11*4]
	addss	xmm8, DWORD PTR [r10+rbx*4]
	addss	xmm8, DWORD PTR [r10+rdi*4]
	mov	rbx, QWORD PTR [rsp-88]
	mulss	xmm8, xmm3
	movss	DWORD PTR [rbx+r9*4], xmm8
	cmp	DWORD PTR [rsp-92], esi
	jle	.L13
	add	ecx, esi
	add	esi, DWORD PTR [rsp-104]
	movss	xmm9, DWORD PTR [r10+r9*4]
	movsx	rcx, ecx
	lea	eax, [rax+3+rdx]
	cdqe
	movsx	r9, esi
	addss	xmm9, DWORD PTR [r10+rax*4]
	addss	xmm9, DWORD PTR [r10+rcx*4]
	addss	xmm9, DWORD PTR [r10+r9*4]
	mov	rsi, QWORD PTR [rsp-88]
	mulss	xmm9, xmm3
	movss	DWORD PTR [rsi+r11*4], xmm9
.L13:
	mov	ecx, edx
	add	r8, r14
	mov	rdx, QWORD PTR [rsp-32]
	add	r12, r14
	add	DWORD PTR [rsp-100], 1
	add	r13, r14
	add	rbp, r14
	mov	r9, QWORD PTR [rsp-120]
	add	r15, QWORD PTR [rsp-40]
	add	QWORD PTR [rsp-56], rdx
	mov	eax, DWORD PTR [rsp-96]
	cmp	DWORD PTR [rsp-44], eax
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
	mov	eax, 1
	addss	xmm10, DWORD PTR [r8+8]
	addss	xmm10, DWORD PTR [r12+4]
	addss	xmm10, DWORD PTR [r13+4]
	mov	r11, QWORD PTR [rsp-8]
	mulss	xmm10, xmm2
	lea	rbx, [r11-1]
	and	ebx, 7
	movss	DWORD PTR [rbp+4], xmm10
	cmp	rax, r11
	je	.L13
	test	rbx, rbx
	je	.L4
	cmp	rbx, 1
	je	.L58
	cmp	rbx, 2
	je	.L59
	cmp	rbx, 3
	je	.L60
	cmp	rbx, 4
	je	.L61
	cmp	rbx, 5
	je	.L62
	cmp	rbx, 6
	je	.L63
	movss	xmm11, DWORD PTR [r8+4]
	mov	eax, 2
	addss	xmm11, DWORD PTR [r8+12]
	addss	xmm11, DWORD PTR [r12+8]
	addss	xmm11, DWORD PTR [r13+8]
	mulss	xmm11, xmm2
	movss	DWORD PTR [rbp+8], xmm11
.L63:
	movss	xmm12, DWORD PTR [r8+rax*4]
	addss	xmm12, DWORD PTR [r8+8+rax*4]
	addss	xmm12, DWORD PTR [r12+4+rax*4]
	addss	xmm12, DWORD PTR [r13+4+rax*4]
	mulss	xmm12, xmm2
	movss	DWORD PTR [rbp+4+rax*4], xmm12
	add	rax, 1
.L62:
	movss	xmm13, DWORD PTR [r8+rax*4]
	addss	xmm13, DWORD PTR [r8+8+rax*4]
	addss	xmm13, DWORD PTR [r12+4+rax*4]
	addss	xmm13, DWORD PTR [r13+4+rax*4]
	mulss	xmm13, xmm2
	movss	DWORD PTR [rbp+4+rax*4], xmm13
	add	rax, 1
.L61:
	movss	xmm14, DWORD PTR [r8+rax*4]
	addss	xmm14, DWORD PTR [r8+8+rax*4]
	addss	xmm14, DWORD PTR [r12+4+rax*4]
	addss	xmm14, DWORD PTR [r13+4+rax*4]
	mulss	xmm14, xmm2
	movss	DWORD PTR [rbp+4+rax*4], xmm14
	add	rax, 1
.L60:
	movss	xmm15, DWORD PTR [r8+rax*4]
	addss	xmm15, DWORD PTR [r8+8+rax*4]
	addss	xmm15, DWORD PTR [r12+4+rax*4]
	addss	xmm15, DWORD PTR [r13+4+rax*4]
	mulss	xmm15, xmm2
	movss	DWORD PTR [rbp+4+rax*4], xmm15
	add	rax, 1
.L59:
	movss	xmm1, DWORD PTR [r8+rax*4]
	addss	xmm1, DWORD PTR [r8+8+rax*4]
	addss	xmm1, DWORD PTR [r12+4+rax*4]
	addss	xmm1, DWORD PTR [r13+4+rax*4]
	mulss	xmm1, xmm2
	movss	DWORD PTR [rbp+4+rax*4], xmm1
	add	rax, 1
.L58:
	movss	xmm0, DWORD PTR [r8+rax*4]
	addss	xmm0, DWORD PTR [r8+8+rax*4]
	addss	xmm0, DWORD PTR [r12+4+rax*4]
	addss	xmm0, DWORD PTR [r13+4+rax*4]
	mulss	xmm0, xmm2
	movss	DWORD PTR [rbp+4+rax*4], xmm0
	add	rax, 1
	cmp	rax, QWORD PTR [rsp-8]
	je	.L13
.L4:
	movss	xmm6, DWORD PTR [r8+rax*4]
	addss	xmm6, DWORD PTR [r8+8+rax*4]
	lea	rcx, [rax+1]
	addss	xmm6, DWORD PTR [r12+4+rax*4]
	lea	r9, [rax+2]
	addss	xmm6, DWORD PTR [r13+4+rax*4]
	lea	rsi, [rax+3]
	lea	r11, [rax+4]
	lea	rdi, [rax+5]
	mulss	xmm6, xmm2
	lea	rbx, [rax+6]
	movss	DWORD PTR [rbp+4+rax*4], xmm6
	movss	xmm7, DWORD PTR [r8+rcx*4]
	addss	xmm7, DWORD PTR [r8+8+rcx*4]
	addss	xmm7, DWORD PTR [r12+4+rcx*4]
	addss	xmm7, DWORD PTR [r13+4+rcx*4]
	mulss	xmm7, xmm2
	movss	DWORD PTR [rbp+4+rcx*4], xmm7
	movss	xmm8, DWORD PTR [r8+r9*4]
	lea	rcx, [rax+7]
	add	rax, 8
	addss	xmm8, DWORD PTR [r8+8+r9*4]
	addss	xmm8, DWORD PTR [r12+4+r9*4]
	addss	xmm8, DWORD PTR [r13+4+r9*4]
	mulss	xmm8, xmm2
	movss	DWORD PTR [rbp+4+r9*4], xmm8
	movss	xmm9, DWORD PTR [r8+rsi*4]
	addss	xmm9, DWORD PTR [r8+8+rsi*4]
	addss	xmm9, DWORD PTR [r12+4+rsi*4]
	addss	xmm9, DWORD PTR [r13+4+rsi*4]
	mulss	xmm9, xmm2
	movss	DWORD PTR [rbp+4+rsi*4], xmm9
	movss	xmm10, DWORD PTR [r8+r11*4]
	addss	xmm10, DWORD PTR [r8+8+r11*4]
	addss	xmm10, DWORD PTR [r12+4+r11*4]
	addss	xmm10, DWORD PTR [r13+4+r11*4]
	mulss	xmm10, xmm2
	movss	DWORD PTR [rbp+4+r11*4], xmm10
	movss	xmm11, DWORD PTR [r8+rdi*4]
	addss	xmm11, DWORD PTR [r8+8+rdi*4]
	addss	xmm11, DWORD PTR [r12+4+rdi*4]
	addss	xmm11, DWORD PTR [r13+4+rdi*4]
	mulss	xmm11, xmm2
	movss	DWORD PTR [rbp+4+rdi*4], xmm11
	movss	xmm12, DWORD PTR [r8+rbx*4]
	addss	xmm12, DWORD PTR [r8+8+rbx*4]
	addss	xmm12, DWORD PTR [r12+4+rbx*4]
	addss	xmm12, DWORD PTR [r13+4+rbx*4]
	mulss	xmm12, xmm2
	movss	DWORD PTR [rbp+4+rbx*4], xmm12
	movss	xmm13, DWORD PTR [r8+rcx*4]
	addss	xmm13, DWORD PTR [r8+8+rcx*4]
	addss	xmm13, DWORD PTR [r12+4+rcx*4]
	addss	xmm13, DWORD PTR [r13+4+rcx*4]
	mulss	xmm13, xmm2
	movss	DWORD PTR [rbp+4+rcx*4], xmm13
	cmp	rax, QWORD PTR [rsp-8]
	jne	.L4
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L86:
	mov	ebx, DWORD PTR [rsp-100]
	lea	rsi, [r9+r14]
	mov	edi, DWORD PTR [rsp-24]
	mov	QWORD PTR [rsp-120], rsi
	mov	DWORD PTR [rsp-96], ebx
	lea	edx, [rcx+rdi]
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
