	.file	"task2.c"
	.intel_syntax noprefix
	.text
	.globl	change_chars
	.type	change_chars, @function
change_chars:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 176
	mov	QWORD PTR -168[rbp], rdi
	mov	QWORD PTR -176[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	DWORD PTR -128[rbp], 65
	mov	DWORD PTR -124[rbp], 69
	mov	DWORD PTR -120[rbp], 73
	mov	DWORD PTR -116[rbp], 79
	mov	DWORD PTR -112[rbp], 85
	mov	DWORD PTR -108[rbp], 89
	mov	DWORD PTR -104[rbp], 97
	mov	DWORD PTR -100[rbp], 101
	mov	DWORD PTR -96[rbp], 105
	mov	DWORD PTR -92[rbp], 111
	mov	DWORD PTR -88[rbp], 117
	mov	DWORD PTR -84[rbp], 121
	mov	DWORD PTR -80[rbp], 48
	mov	DWORD PTR -76[rbp], 49
	mov	DWORD PTR -72[rbp], 50
	mov	DWORD PTR -68[rbp], 51
	mov	DWORD PTR -64[rbp], 52
	mov	DWORD PTR -60[rbp], 53
	mov	DWORD PTR -56[rbp], 54
	mov	DWORD PTR -52[rbp], 55
	mov	DWORD PTR -48[rbp], 56
	mov	DWORD PTR -44[rbp], 57
	mov	DWORD PTR -40[rbp], 65
	mov	DWORD PTR -36[rbp], 66
	mov	DWORD PTR -32[rbp], 67
	mov	DWORD PTR -28[rbp], 68
	mov	DWORD PTR -24[rbp], 69
	mov	DWORD PTR -20[rbp], 70
	lea	rax, -128[rbp]
	mov	QWORD PTR -144[rbp], rax
	lea	rax, -128[rbp]
	add	rax, 48
	mov	QWORD PTR -136[rbp], rax
	mov	DWORD PTR -160[rbp], 0
	mov	DWORD PTR -156[rbp], 0
	jmp	.L2
.L8:
	mov	eax, DWORD PTR -156[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -168[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	DWORD PTR -152[rbp], eax
	lea	rax, -128[rbp]
	mov	QWORD PTR -144[rbp], rax
	jmp	.L3
.L5:
	add	QWORD PTR -144[rbp], 4
.L3:
	mov	rax, QWORD PTR -144[rbp]
	cmp	rax, QWORD PTR -136[rbp]
	jnb	.L4
	mov	rax, QWORD PTR -144[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR -152[rbp], eax
	jne	.L5
.L4:
	mov	rax, QWORD PTR -144[rbp]
	cmp	rax, QWORD PTR -136[rbp]
	jne	.L6
	mov	eax, DWORD PTR -160[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -160[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -176[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -152[rbp]
	mov	BYTE PTR [rax], dl
	jmp	.L7
.L6:
	mov	eax, DWORD PTR -160[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -160[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -176[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 48
	mov	eax, DWORD PTR -160[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -160[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -176[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 120
	mov	eax, DWORD PTR -152[rbp]
	cdq
	shr	edx, 28
	add	eax, edx
	and	eax, 15
	sub	eax, edx
	mov	DWORD PTR -148[rbp], eax
	mov	eax, DWORD PTR -152[rbp]
	lea	edx, 15[rax]
	test	eax, eax
	cmovs	eax, edx
	sar	eax, 4
	lea	ecx, 48[rax]
	mov	eax, DWORD PTR -160[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -160[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -176[rbp]
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	mov	eax, DWORD PTR -148[rbp]
	cdqe
	mov	ecx, DWORD PTR -80[rbp+rax*4]
	mov	eax, DWORD PTR -160[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -160[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -176[rbp]
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
.L7:
	add	DWORD PTR -156[rbp], 1
.L2:
	mov	eax, DWORD PTR -156[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -168[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L8
	mov	eax, DWORD PTR -160[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -176[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	ret
	.size	change_chars, .-change_chars
	.globl	input
	.type	input, @function
input:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -8[rbp], 0
.L12:
	mov	rax, QWORD PTR stdin[rip]
	mov	rdi, rax
	call	fgetc@PLT
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -8[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -8[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -4[rbp]
	mov	BYTE PTR [rax], dl
	cmp	DWORD PTR -4[rbp], -1
	je	.L11
	cmp	DWORD PTR -8[rbp], 99999
	jle	.L12
.L11:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	nop
	leave
	ret
	.size	input, .-input
	.globl	output
	.type	output, @function
output:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -4[rbp], 0
	jmp	.L14
.L15:
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -4[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	edi, eax
	call	putchar@PLT
.L14:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L15
	mov	edi, 10
	call	putchar@PLT
	nop
	leave
	ret
	.size	output, .-output
	.section	.rodata
.LC0:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\202\320\265\320\272\321\201\321\202:"
	.align 8
.LC1:
	.string	"\320\230\320\267\320\274\320\265\320\275\320\265\320\275\320\275\321\213\320\271 \321\202\320\265\320\272\321\201\321\202:"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	edi, 100000
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	input
	mov	edi, 400000
	call	malloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	change_chars
	mov	edi, 10
	call	putchar@PLT
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	output
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
