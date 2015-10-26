	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 13.1.3.192 Build 2013060";
# mark_description "7";
# mark_description "-c -std=c99 -Wall -D_XOPEN_SOURCE=700 -masm=intel -save-temps -O3 -xHost -vec-report3";
	.intel_syntax noprefix
	.file "JacobiVanilla.c"
	.text
..TXTST0:
L__routine_start_jacobiVanilla_0:
# -- Begin  jacobiVanilla
# mark_begin;
       .align    16,0x90
	.globl jacobiVanilla
jacobiVanilla:
# parameter 1(oldGrid): rdi
# parameter 2(newGrid): rsi
# parameter 3(width): edx
# parameter 4(height): ecx
..B1.1:                         # Preds ..B1.0
..___tag_value_jacobiVanilla.1:                                 #7.76
..LN0:
  .file   1 "JacobiVanilla.c"
   .loc    1  7  is_stmt 1
        push      r15                                           #7.76
..___tag_value_jacobiVanilla.3:                                 #
..LN1:
        push      rbx                                           #7.76
..___tag_value_jacobiVanilla.5:                                 #
..LN2:
        push      rbp                                           #7.76
..___tag_value_jacobiVanilla.7:                                 #
..LN3:
   .loc    1  8  is_stmt 1
        lea       r11d, DWORD PTR [-1+rcx]                      #8.28
..LN4:
        xor       r9d, r9d                                      #8.2
..LN5:
   .loc    1  7  is_stmt 1
        mov       rax, rsi                                      #7.76
..LN6:
        movsxd    r8, edx                                       #
        xor       r10d, r10d                                    #
..LN7:
   .loc    1  8  is_stmt 1
        cmp       r11d, 1                                       #8.28
..LN8:
        jle       ..B1.12       # Prob 10%                      #8.28
..LN9:
                                # LOE rax rdi r8 r12 r13 r14 edx ecx r9d r10d
..B1.2:                         # Preds ..B1.1
..LN10:
   .loc    1  10  is_stmt 1
        movss     xmm0, DWORD PTR .L_2il0floatpacket.4[rip]     #10.137
..LN11:
   .loc    1  9  is_stmt 1
        lea       r15d, DWORD PTR [-2+rdx]                      #9.3
        mov       ebx, r15d                                     #
..LN12:
        lea       r11d, DWORD PTR [-1+rdx]                      #9.28
        shr       ebx, 31                                       #
..LN13:
   .loc    1  8  is_stmt 1
        add       ecx, -2                                       #8.28
        mov       QWORD PTR [-32+rsp], r12                      #
..___tag_value_jacobiVanilla.9:                                 #
..LN14:
   .loc    1  10  is_stmt 1
        lea       rbp, QWORD PTR [rdi+r8*4]                     #10.28
        mov       QWORD PTR [-24+rsp], r13                      #
        mov       QWORD PTR [-16+rsp], r14                      #
        lea       esi, DWORD PTR [-2+rbx+rdx]                   #
        sar       esi, 1                                        #
..___tag_value_jacobiVanilla.10:                                #
..LN15:
        lea       rbx, QWORD PTR [rax+r8*4]                     #10.4
        lea       eax, DWORD PTR [rdx+rdx]                      #
        movsxd    rax, eax                                      #
..LN16:
                                # LOE rax rbx rbp rdi r8 edx ecx esi r9d r10d r11d r15d xmm0
..B1.3:                         # Preds ..B1.10 ..B1.2
..LN17:
   .loc    1  9  is_stmt 1
        cmp       r11d, 1                                       #9.28
..LN18:
        jle       ..B1.10       # Prob 50%                      #9.28
..LN19:
                                # LOE rax rbx rbp rdi r8 edx ecx esi r9d r10d r11d r15d xmm0
..B1.4:                         # Preds ..B1.3
..LN20:
        mov       r14d, 1                                       #9.3
..LN21:
        xor       r13d, r13d                                    #9.3
..LN22:
        test      esi, esi                                      #9.3
..LN23:
        jbe       ..B1.8        # Prob 10%                      #9.3
..LN24:
                                # LOE rax rbx rbp rdi r8 edx ecx esi r9d r10d r11d r13d r14d r15d xmm0
..B1.5:                         # Preds ..B1.4
..LN25:
   .loc    1  10  is_stmt 1
        mov       DWORD PTR [-8+rsp], edx                       #10.109
..LN26:
        lea       r12d, DWORD PTR [r10+rdx*2]                   #10.109
        .align    16,0x90
..LN27:
                                # LOE rax rbx rbp rdi r8 ecx esi r9d r10d r11d r12d r13d r15d xmm0
..B1.6:                         # Preds ..B1.6 ..B1.5
..LN28:
        lea       edx, DWORD PTR [r10+r13*2]                    #10.82
..LN29:
        movsxd    rdx, edx                                      #10.28
..LN30:
        lea       r14d, DWORD PTR [r12+r13*2]                   #10.109
..LN31:
        movsxd    r14, r14d                                     #10.109
..LN32:
   .loc    1  9  is_stmt 1
        inc       r13d                                          #9.3
..LN33:
   .loc    1  10  is_stmt 1
        movss     xmm1, DWORD PTR [rbp+rdx*4]                   #10.28
..LN34:
        addss     xmm1, DWORD PTR [8+rbp+rdx*4]                 #10.55
..LN35:
        addss     xmm1, DWORD PTR [4+rdi+rdx*4]                 #10.82
..LN36:
        addss     xmm1, DWORD PTR [4+rdi+r14*4]                 #10.109
..LN37:
        mulss     xmm1, xmm0                                    #10.137
..LN38:
        movss     DWORD PTR [4+rbx+rdx*4], xmm1                 #10.4
..LN39:
        movss     xmm2, DWORD PTR [4+rbp+rdx*4]                 #10.28
..LN40:
        addss     xmm2, DWORD PTR [12+rbp+rdx*4]                #10.55
..LN41:
        addss     xmm2, DWORD PTR [8+rdi+rdx*4]                 #10.82
..LN42:
        addss     xmm2, DWORD PTR [8+rdi+r14*4]                 #10.109
..LN43:
        mulss     xmm2, xmm0                                    #10.137
..LN44:
        movss     DWORD PTR [8+rbx+rdx*4], xmm2                 #10.4
..LN45:
   .loc    1  9  is_stmt 1
        cmp       r13d, esi                                     #9.3
..LN46:
        jb        ..B1.6        # Prob 64%                      #9.3
..LN47:
                                # LOE rax rbx rbp rdi r8 ecx esi r9d r10d r11d r12d r13d r15d xmm0
..B1.7:                         # Preds ..B1.6
        mov       edx, DWORD PTR [-8+rsp]                       #
..LN48:
        lea       r14d, DWORD PTR [1+r13+r13]                   #9.3
..LN49:
                                # LOE rax rbx rbp rdi r8 edx ecx esi r9d r10d r11d r14d r15d xmm0
..B1.8:                         # Preds ..B1.7 ..B1.4
..LN50:
        lea       r12d, DWORD PTR [-1+r14]                      #9.3
..LN51:
        cmp       r15d, r12d                                    #9.3
..LN52:
        jbe       ..B1.10       # Prob 10%                      #9.3
..LN53:
                                # LOE rax rbx rbp rdi r8 edx ecx esi r9d r10d r11d r14d r15d xmm0
..B1.9:                         # Preds ..B1.8
..LN54:
   .loc    1  10  is_stmt 1
        movsxd    r14, r14d                                     #10.28
..LN55:
        movsxd    r12, r10d                                     #10.82
..LN56:
        add       r12, r14                                      #10.82
..LN57:
        add       r14, rax                                      #10.109
..LN58:
        movss     xmm1, DWORD PTR [-4+rbp+r12*4]                #10.28
..LN59:
        addss     xmm1, DWORD PTR [4+rbp+r12*4]                 #10.55
..LN60:
        addss     xmm1, DWORD PTR [rdi+r12*4]                   #10.82
..LN61:
        addss     xmm1, DWORD PTR [rdi+r14*4]                   #10.109
..LN62:
        mulss     xmm1, xmm0                                    #10.137
..LN63:
        movss     DWORD PTR [rbx+r12*4], xmm1                   #10.4
..LN64:
                                # LOE rax rbx rbp rdi r8 edx ecx esi r9d r10d r11d r15d xmm0
..B1.10:                        # Preds ..B1.8 ..B1.3 ..B1.9
..LN65:
   .loc    1  8  is_stmt 1
        inc       r9d                                           #8.2
..LN66:
        add       rax, r8                                       #8.2
..LN67:
        add       r10d, edx                                     #8.2
..LN68:
        cmp       r9d, ecx                                      #8.2
..LN69:
        jb        ..B1.3        # Prob 82%                      #8.2
..LN70:
                                # LOE rax rbx rbp rdi r8 edx ecx esi r9d r10d r11d r15d xmm0
..B1.11:                        # Preds ..B1.10
        mov       r12, QWORD PTR [-32+rsp]                      #
..___tag_value_jacobiVanilla.12:                                #
        mov       r13, QWORD PTR [-24+rsp]                      #
..___tag_value_jacobiVanilla.13:                                #
        mov       r14, QWORD PTR [-16+rsp]                      #
..___tag_value_jacobiVanilla.14:                                #
..LN71:
                                # LOE r12 r13 r14
..B1.12:                        # Preds ..B1.11 ..B1.1
..___tag_value_jacobiVanilla.15:                                #13.2
..LN72:
   .loc    1  13  is_stmt 1
        pop       rbp                                           #13.2
..___tag_value_jacobiVanilla.16:                                #
..LN73:
        pop       rbx                                           #13.2
..___tag_value_jacobiVanilla.18:                                #
..LN74:
        pop       r15                                           #13.2
..___tag_value_jacobiVanilla.20:                                #
..LN75:
        ret                                                     #13.2
        .align    16,0x90
..___tag_value_jacobiVanilla.21:                                #
..LN76:
                                # LOE
..LN77:
# mark_end;
	.type	jacobiVanilla,@function
	.size	jacobiVanilla,.-jacobiVanilla
..LNjacobiVanilla.78:
.LNjacobiVanilla:
	.data
# -- End  jacobiVanilla
	.section .rodata, "a"
	.align 4
.L_2il0floatpacket.4:
	.long	0x3e800000
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,4
	.data
	.section .note.GNU-stack, ""
# End
