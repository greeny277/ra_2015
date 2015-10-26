# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 13.1.3.192 Build 2013060";
# mark_description "7";
# mark_description "-c -std=c99 -Wall -D_XOPEN_SOURCE=700 -masm=intel -save-temps -O0 -xHost";
	.intel_syntax noprefix
	.file "JacobiVanilla.c"
	.text
..TXTST0:
# -- Begin  jacobiVanilla
# mark_begin;
       .align    2,0x90
	.globl jacobiVanilla
jacobiVanilla:
# parameter 1: rdi
# parameter 2: rsi
# parameter 3: edx
# parameter 4: ecx
..B1.1:                         # Preds ..B1.0
..___tag_value_jacobiVanilla.1:                                 #7.76
        push      rbp                                           #7.76
..___tag_value_jacobiVanilla.3:                                 #
        mov       rbp, rsp                                      #7.76
..___tag_value_jacobiVanilla.4:                                 #
        sub       rsp, 48                                       #7.76
        mov       QWORD PTR [-40+rbp], rdi                      #7.76
        mov       QWORD PTR [-32+rbp], rsi                      #7.76
        mov       DWORD PTR [-24+rbp], edx                      #7.76
        mov       DWORD PTR [-16+rbp], ecx                      #7.76
        mov       DWORD PTR [-48+rbp], 1                        #8.12
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.3 ..B1.1
        mov       eax, DWORD PTR [-48+rbp]                      #8.17
        mov       edx, -1                                       #8.2
        add       edx, DWORD PTR [-16+rbp]                      #8.28
        cmp       eax, edx                                      #8.28
        jl        ..B1.4        # Prob 50%                      #8.28
        jmp       ..B1.7        # Prob 100%                     #8.28
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.5
        mov       eax, 1                                        #8.31
        add       eax, DWORD PTR [-48+rbp]                      #8.31
        mov       DWORD PTR [-48+rbp], eax                      #8.31
        jmp       ..B1.2        # Prob 100%                     #8.31
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.2
        mov       DWORD PTR [-44+rbp], 1                        #9.13
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.6 ..B1.4
        mov       eax, DWORD PTR [-44+rbp]                      #9.18
        mov       edx, -1                                       #9.3
        add       edx, DWORD PTR [-24+rbp]                      #9.28
        cmp       eax, edx                                      #9.28
        jge       ..B1.3        # Prob 50%                      #9.28
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.5
        mov       eax, DWORD PTR [-24+rbp]                      #10.38
        imul      eax, DWORD PTR [-48+rbp]                      #10.38
        mov       edx, -1                                       #10.4
        add       edx, DWORD PTR [-44+rbp]                      #10.49
        add       eax, edx                                      #10.49
        movsxd    rax, eax                                      #10.28
        imul      rax, rax, 4                                   #10.28
        add       rax, QWORD PTR [-40+rbp]                      #10.28
        mov       edx, DWORD PTR [-24+rbp]                      #10.65
        imul      edx, DWORD PTR [-48+rbp]                      #10.65
        mov       ecx, 1                                        #10.4
        add       ecx, DWORD PTR [-44+rbp]                      #10.76
        add       edx, ecx                                      #10.76
        movsxd    rdx, edx                                      #10.55
        imul      rdx, rdx, 4                                   #10.55
        add       rdx, QWORD PTR [-40+rbp]                      #10.55
        movss     xmm0, DWORD PTR [rax]                         #10.28
        movss     xmm1, DWORD PTR [rdx]                         #10.55
        addss     xmm0, xmm1                                    #10.55
        mov       eax, -1                                       #10.4
        add       eax, DWORD PTR [-48+rbp]                      #10.93
        imul      eax, DWORD PTR [-24+rbp]                      #10.96
        add       eax, DWORD PTR [-44+rbp]                      #10.104
        movsxd    rax, eax                                      #10.82
        imul      rax, rax, 4                                   #10.82
        add       rax, QWORD PTR [-40+rbp]                      #10.82
        movss     xmm1, DWORD PTR [rax]                         #10.82
        addss     xmm0, xmm1                                    #10.82
        mov       eax, 1                                        #10.4
        add       eax, DWORD PTR [-48+rbp]                      #10.120
        imul      eax, DWORD PTR [-24+rbp]                      #10.123
        add       eax, DWORD PTR [-44+rbp]                      #10.131
        movsxd    rax, eax                                      #10.109
        imul      rax, rax, 4                                   #10.109
        add       rax, QWORD PTR [-40+rbp]                      #10.109
        movss     xmm1, DWORD PTR [rax]                         #10.109
        addss     xmm0, xmm1                                    #10.109
        cvtss2sd  xmm0, xmm0                                    #10.109
        movsd     xmm1, QWORD PTR .L_2il0floatpacket.4[rip]     #10.137
        mulsd     xmm0, xmm1                                    #10.137
        cvtsd2ss  xmm0, xmm0                                    #10.137
        mov       eax, DWORD PTR [-24+rbp]                      #10.14
        imul      eax, DWORD PTR [-48+rbp]                      #10.14
        add       eax, DWORD PTR [-44+rbp]                      #10.22
        movsxd    rax, eax                                      #10.4
        imul      rax, rax, 4                                   #10.4
        add       rax, QWORD PTR [-32+rbp]                      #10.4
        movss     DWORD PTR [rax], xmm0                         #10.4
        mov       eax, 1                                        #9.31
        add       eax, DWORD PTR [-44+rbp]                      #9.31
        mov       DWORD PTR [-44+rbp], eax                      #9.31
        jmp       ..B1.5        # Prob 100%                     #9.31
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.2
        leave                                                   #13.2
..___tag_value_jacobiVanilla.6:                                 #
        ret                                                     #13.2
        .align    2,0x90
..___tag_value_jacobiVanilla.7:                                 #
                                # LOE
# mark_end;
	.type	jacobiVanilla,@function
	.size	jacobiVanilla,.-jacobiVanilla
	.data
# -- End  jacobiVanilla
	.section .rodata, "a"
	.align 8
.L_2il0floatpacket.4:
	.long	0x00000000,0x3fd00000
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,8
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
	.4byte 0x0000002c
	.4byte 0x0000001c
	.8byte ..___tag_value_jacobiVanilla.1
	.8byte ..___tag_value_jacobiVanilla.7-..___tag_value_jacobiVanilla.1
	.byte 0x04
	.4byte ..___tag_value_jacobiVanilla.3-..___tag_value_jacobiVanilla.1
	.2byte 0x100e
	.byte 0x04
	.4byte ..___tag_value_jacobiVanilla.4-..___tag_value_jacobiVanilla.3
	.4byte 0x8610060c
	.2byte 0x0402
	.4byte ..___tag_value_jacobiVanilla.6-..___tag_value_jacobiVanilla.4
	.2byte 0x00c6
# End
