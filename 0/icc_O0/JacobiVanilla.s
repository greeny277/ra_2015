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
        sub       rsp, 64                                       #7.76
        mov       QWORD PTR [-40+rbp], rdi                      #7.76
        mov       QWORD PTR [-32+rbp], rsi                      #7.76
        mov       DWORD PTR [-24+rbp], edx                      #7.76
        mov       DWORD PTR [-16+rbp], ecx                      #7.76
        mov       DWORD PTR [-64+rbp], 1                        #9.12
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.3 ..B1.1
        mov       eax, DWORD PTR [-64+rbp]                      #9.17
        mov       edx, -1                                       #9.2
        add       edx, DWORD PTR [-16+rbp]                      #9.28
        cmp       eax, edx                                      #9.28
        jl        ..B1.4        # Prob 50%                      #9.28
        jmp       ..B1.7        # Prob 100%                     #9.28
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.5
        mov       eax, 1                                        #9.31
        add       eax, DWORD PTR [-64+rbp]                      #9.31
        mov       DWORD PTR [-64+rbp], eax                      #9.31
        jmp       ..B1.2        # Prob 100%                     #9.31
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.4:                         # Preds ..B1.2
        mov       DWORD PTR [-60+rbp], 1                        #10.13
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.5:                         # Preds ..B1.6 ..B1.4
        mov       eax, DWORD PTR [-60+rbp]                      #10.18
        mov       edx, -1                                       #10.3
        add       edx, DWORD PTR [-24+rbp]                      #10.28
        cmp       eax, edx                                      #10.28
        jge       ..B1.3        # Prob 50%                      #10.28
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.6:                         # Preds ..B1.5
        mov       eax, DWORD PTR [-24+rbp]                      #11.21
        imul      eax, DWORD PTR [-64+rbp]                      #11.21
        mov       edx, -1                                       #11.4
        add       edx, DWORD PTR [-60+rbp]                      #11.32
        add       eax, edx                                      #11.32
        movsxd    rax, eax                                      #11.11
        imul      rax, rax, 4                                   #11.11
        add       rax, QWORD PTR [-40+rbp]                      #11.11
        movss     xmm0, DWORD PTR [rax]                         #11.11
        movss     DWORD PTR [-56+rbp], xmm0                     #11.4
        mov       eax, DWORD PTR [-24+rbp]                      #12.22
        imul      eax, DWORD PTR [-64+rbp]                      #12.22
        mov       edx, 1                                        #12.4
        add       edx, DWORD PTR [-60+rbp]                      #12.33
        add       eax, edx                                      #12.33
        movsxd    rax, eax                                      #12.12
        imul      rax, rax, 4                                   #12.12
        add       rax, QWORD PTR [-40+rbp]                      #12.12
        movss     xmm0, DWORD PTR [rax]                         #12.12
        movss     DWORD PTR [-52+rbp], xmm0                     #12.4
        mov       eax, -1                                       #13.4
        add       eax, DWORD PTR [-64+rbp]                      #13.20
        imul      eax, DWORD PTR [-24+rbp]                      #13.23
        add       eax, DWORD PTR [-60+rbp]                      #13.31
        movsxd    rax, eax                                      #13.9
        imul      rax, rax, 4                                   #13.9
        add       rax, QWORD PTR [-40+rbp]                      #13.9
        movss     xmm0, DWORD PTR [rax]                         #13.9
        movss     DWORD PTR [-48+rbp], xmm0                     #13.4
        mov       eax, 1                                        #14.4
        add       eax, DWORD PTR [-64+rbp]                      #14.22
        imul      eax, DWORD PTR [-24+rbp]                      #14.25
        add       eax, DWORD PTR [-60+rbp]                      #14.33
        movsxd    rax, eax                                      #14.11
        imul      rax, rax, 4                                   #14.11
        add       rax, QWORD PTR [-40+rbp]                      #14.11
        movss     xmm0, DWORD PTR [rax]                         #14.11
        movss     DWORD PTR [-44+rbp], xmm0                     #14.4
        movss     xmm0, DWORD PTR [-56+rbp]                     #15.28
        movss     xmm1, DWORD PTR [-52+rbp]                     #15.35
        addss     xmm0, xmm1                                    #15.35
        movss     xmm1, DWORD PTR [-44+rbp]                     #15.43
        addss     xmm0, xmm1                                    #15.43
        movss     xmm1, DWORD PTR [-48+rbp]                     #15.50
        addss     xmm0, xmm1                                    #15.50
        cvtss2sd  xmm0, xmm0                                    #15.50
        movsd     xmm1, QWORD PTR .L_2il0floatpacket.4[rip]     #15.56
        mulsd     xmm0, xmm1                                    #15.56
        cvtsd2ss  xmm0, xmm0                                    #15.56
        mov       eax, DWORD PTR [-24+rbp]                      #15.14
        imul      eax, DWORD PTR [-64+rbp]                      #15.14
        add       eax, DWORD PTR [-60+rbp]                      #15.22
        movsxd    rax, eax                                      #15.4
        imul      rax, rax, 4                                   #15.4
        add       rax, QWORD PTR [-32+rbp]                      #15.4
        movss     DWORD PTR [rax], xmm0                         #15.4
        mov       eax, 1                                        #10.31
        add       eax, DWORD PTR [-60+rbp]                      #10.31
        mov       DWORD PTR [-60+rbp], eax                      #10.31
        jmp       ..B1.5        # Prob 100%                     #10.31
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.7:                         # Preds ..B1.2
        leave                                                   #18.2
..___tag_value_jacobiVanilla.6:                                 #
        ret                                                     #18.2
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
