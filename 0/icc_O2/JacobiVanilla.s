# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 13.1.3.192 Build 2013060";
# mark_description "7";
# mark_description "-c -std=c99 -Wall -D_XOPEN_SOURCE=700 -masm=intel -save-temps -O2 -xHost";
	.intel_syntax noprefix
	.file "JacobiVanilla.c"
	.text
..TXTST0:
# -- Begin  jacobiVanilla
# mark_begin;
       .align    16,0x90
	.globl jacobiVanilla
jacobiVanilla:
# parameter 1: rdi
# parameter 2: rsi
# parameter 3: edx
# parameter 4: ecx
..B1.1:                         # Preds ..B1.0
..___tag_value_jacobiVanilla.1:                                 #7.76
        push      r15                                           #7.76
..___tag_value_jacobiVanilla.3:                                 #
        push      rbx                                           #7.76
..___tag_value_jacobiVanilla.5:                                 #
        push      rbp                                           #7.76
..___tag_value_jacobiVanilla.7:                                 #
        lea       r11d, DWORD PTR [-1+rcx]                      #9.28
        xor       r9d, r9d                                      #9.2
        mov       rax, rsi                                      #7.76
        movsxd    r8, edx                                       #
        xor       r10d, r10d                                    #
        cmp       r11d, 1                                       #9.28
        jle       ..B1.12       # Prob 10%                      #9.28
                                # LOE rax rdi r8 r12 r13 r14 edx ecx r9d r10d
..B1.2:                         # Preds ..B1.1
        movss     xmm0, DWORD PTR .L_2il0floatpacket.4[rip]     #15.56
        lea       r15d, DWORD PTR [-2+rdx]                      #10.3
        mov       ebx, r15d                                     #
        lea       r11d, DWORD PTR [-1+rdx]                      #10.28
        shr       ebx, 31                                       #
        add       ecx, -2                                       #9.28
        mov       QWORD PTR [-32+rsp], r12                      #
..___tag_value_jacobiVanilla.9:                                 #
        lea       rbp, QWORD PTR [rdi+r8*4]                     #11.11
        mov       QWORD PTR [-24+rsp], r13                      #
        mov       QWORD PTR [-16+rsp], r14                      #
        lea       esi, DWORD PTR [-2+rbx+rdx]                   #
        sar       esi, 1                                        #
..___tag_value_jacobiVanilla.10:                                #
        lea       rbx, QWORD PTR [rax+r8*4]                     #15.4
        lea       eax, DWORD PTR [rdx+rdx]                      #
        movsxd    rax, eax                                      #
                                # LOE rax rbx rbp rdi r8 edx ecx esi r9d r10d r11d r15d xmm0
..B1.3:                         # Preds ..B1.10 ..B1.2
        cmp       r11d, 1                                       #10.28
        jle       ..B1.10       # Prob 50%                      #10.28
                                # LOE rax rbx rbp rdi r8 edx ecx esi r9d r10d r11d r15d xmm0
..B1.4:                         # Preds ..B1.3
        mov       r14d, 1                                       #10.3
        xor       r13d, r13d                                    #10.3
        test      esi, esi                                      #10.3
        jbe       ..B1.8        # Prob 10%                      #10.3
                                # LOE rax rbx rbp rdi r8 edx ecx esi r9d r10d r11d r13d r14d r15d xmm0
..B1.5:                         # Preds ..B1.4
        mov       DWORD PTR [-8+rsp], edx                       #14.11
        lea       r12d, DWORD PTR [r10+rdx*2]                   #14.11
        .align    16,0x90
                                # LOE rax rbx rbp rdi r8 ecx esi r9d r10d r11d r12d r13d r15d xmm0
..B1.6:                         # Preds ..B1.6 ..B1.5
        lea       r14d, DWORD PTR [r10+r13*2]                   #13.9
        movsxd    r14, r14d                                     #11.11
        lea       edx, DWORD PTR [r12+r13*2]                    #14.11
        movsxd    rdx, edx                                      #14.11
        inc       r13d                                          #10.3
        movss     xmm1, DWORD PTR [rbp+r14*4]                   #11.11
        addss     xmm1, DWORD PTR [8+rbp+r14*4]                 #15.35
        addss     xmm1, DWORD PTR [4+rdi+rdx*4]                 #15.43
        addss     xmm1, DWORD PTR [4+rdi+r14*4]                 #15.50
        mulss     xmm1, xmm0                                    #15.56
        movss     DWORD PTR [4+rbx+r14*4], xmm1                 #15.4
        movss     xmm2, DWORD PTR [4+rbp+r14*4]                 #11.11
        addss     xmm2, DWORD PTR [12+rbp+r14*4]                #15.35
        addss     xmm2, DWORD PTR [8+rdi+rdx*4]                 #15.43
        addss     xmm2, DWORD PTR [8+rdi+r14*4]                 #15.50
        mulss     xmm2, xmm0                                    #15.56
        movss     DWORD PTR [8+rbx+r14*4], xmm2                 #15.4
        cmp       r13d, esi                                     #10.3
        jb        ..B1.6        # Prob 64%                      #10.3
                                # LOE rax rbx rbp rdi r8 ecx esi r9d r10d r11d r12d r13d r15d xmm0
..B1.7:                         # Preds ..B1.6
        mov       edx, DWORD PTR [-8+rsp]                       #
        lea       r14d, DWORD PTR [1+r13+r13]                   #10.3
                                # LOE rax rbx rbp rdi r8 edx ecx esi r9d r10d r11d r14d r15d xmm0
..B1.8:                         # Preds ..B1.7 ..B1.4
        lea       r12d, DWORD PTR [-1+r14]                      #10.3
        cmp       r15d, r12d                                    #10.3
        jbe       ..B1.10       # Prob 10%                      #10.3
                                # LOE rax rbx rbp rdi r8 edx ecx esi r9d r10d r11d r14d r15d xmm0
..B1.9:                         # Preds ..B1.8
        movsxd    r14, r14d                                     #11.11
        movsxd    r12, r10d                                     #13.9
        add       r12, r14                                      #13.9
        add       r14, rax                                      #14.11
        movss     xmm1, DWORD PTR [-4+rbp+r12*4]                #11.11
        addss     xmm1, DWORD PTR [4+rbp+r12*4]                 #15.35
        addss     xmm1, DWORD PTR [rdi+r14*4]                   #15.43
        addss     xmm1, DWORD PTR [rdi+r12*4]                   #15.50
        mulss     xmm1, xmm0                                    #15.56
        movss     DWORD PTR [rbx+r12*4], xmm1                   #15.4
                                # LOE rax rbx rbp rdi r8 edx ecx esi r9d r10d r11d r15d xmm0
..B1.10:                        # Preds ..B1.8 ..B1.3 ..B1.9
        inc       r9d                                           #9.2
        add       rax, r8                                       #9.2
        add       r10d, edx                                     #9.2
        cmp       r9d, ecx                                      #9.2
        jb        ..B1.3        # Prob 82%                      #9.2
                                # LOE rax rbx rbp rdi r8 edx ecx esi r9d r10d r11d r15d xmm0
..B1.11:                        # Preds ..B1.10
        mov       r12, QWORD PTR [-32+rsp]                      #
..___tag_value_jacobiVanilla.12:                                #
        mov       r13, QWORD PTR [-24+rsp]                      #
..___tag_value_jacobiVanilla.13:                                #
        mov       r14, QWORD PTR [-16+rsp]                      #
..___tag_value_jacobiVanilla.14:                                #
                                # LOE r12 r13 r14
..B1.12:                        # Preds ..B1.11 ..B1.1
..___tag_value_jacobiVanilla.15:                                #18.2
        pop       rbp                                           #18.2
..___tag_value_jacobiVanilla.16:                                #
        pop       rbx                                           #18.2
..___tag_value_jacobiVanilla.18:                                #
        pop       r15                                           #18.2
..___tag_value_jacobiVanilla.20:                                #
        ret                                                     #18.2
        .align    16,0x90
..___tag_value_jacobiVanilla.21:                                #
                                # LOE
# mark_end;
	.type	jacobiVanilla,@function
	.size	jacobiVanilla,.-jacobiVanilla
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
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
	.4byte 0x00000014
	.8byte 0x7801000100000000
	.8byte 0x0000019008070c10
	.4byte 0x00000000
	.4byte 0x00000074
	.4byte 0x0000001c
	.8byte ..___tag_value_jacobiVanilla.1
	.8byte ..___tag_value_jacobiVanilla.21-..___tag_value_jacobiVanilla.1
	.byte 0x04
	.4byte ..___tag_value_jacobiVanilla.3-..___tag_value_jacobiVanilla.1
	.4byte 0x028f100e
	.byte 0x04
	.4byte ..___tag_value_jacobiVanilla.5-..___tag_value_jacobiVanilla.3
	.4byte 0x0383180e
	.byte 0x04
	.4byte ..___tag_value_jacobiVanilla.7-..___tag_value_jacobiVanilla.5
	.4byte 0x0486200e
	.byte 0x04
	.4byte ..___tag_value_jacobiVanilla.9-..___tag_value_jacobiVanilla.7
	.2byte 0x088c
	.byte 0x04
	.4byte ..___tag_value_jacobiVanilla.10-..___tag_value_jacobiVanilla.9
	.4byte 0x068e078d
	.byte 0x04
	.4byte ..___tag_value_jacobiVanilla.12-..___tag_value_jacobiVanilla.10
	.2byte 0x04cc
	.4byte ..___tag_value_jacobiVanilla.13-..___tag_value_jacobiVanilla.12
	.2byte 0x04cd
	.4byte ..___tag_value_jacobiVanilla.14-..___tag_value_jacobiVanilla.13
	.2byte 0x04ce
	.4byte ..___tag_value_jacobiVanilla.15-..___tag_value_jacobiVanilla.14
	.2byte 0x04c6
	.4byte ..___tag_value_jacobiVanilla.16-..___tag_value_jacobiVanilla.15
	.4byte 0x04c3180e
	.4byte ..___tag_value_jacobiVanilla.18-..___tag_value_jacobiVanilla.16
	.4byte 0x04cf100e
	.4byte ..___tag_value_jacobiVanilla.20-..___tag_value_jacobiVanilla.18
	.8byte 0x000000000000080e
# End
