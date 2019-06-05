	.file	"io.c"
	.text
	.section	.rodata
.LC0:
	.string	"/tmp/file"
.LC1:
	.string	"io.c"
.LC2:
	.string	"fd >= 0"
.LC3:
	.string	"rc == strlen(buffer)"
.LC4:
	.string	"wrote %d bytes\n"
	.text
	.globl	do_work
	.type	do_work, @function
do_work:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$384, %edx
	movl	$577, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	open
	movl	%eax, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jns	.L2
	movl	$__PRETTY_FUNCTION__.3233, %ecx
	movl	$11, %edx
	movl	$.LC1, %esi
	movl	$.LC2, %edi
	call	__assert_fail
.L2:
	leaq	-48(%rbp), %rax
	movabsq	$8031924123371070824, %rbx
	movq	%rbx, (%rax)
	movl	$174353522, 8(%rax)
	movb	$0, 12(%rax)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	leaq	-48(%rbp), %rcx
	movl	-56(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write
	movl	%eax, -52(%rbp)
	movl	-52(%rbp), %eax
	movslq	%eax, %rbx
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	cmpq	%rax, %rbx
	je	.L3
	movl	$__PRETTY_FUNCTION__.3233, %ecx
	movl	$15, %edx
	movl	$.LC1, %esi
	movl	$.LC3, %edi
	call	__assert_fail
.L3:
	movl	-52(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	-56(%rbp), %eax
	movl	%eax, %edi
	call	fsync
	movl	-56(%rbp), %eax
	movl	%eax, %edi
	call	close
	nop
	movq	-24(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L4
	call	__stack_chk_fail
.L4:
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	do_work, .-do_work
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$0, %eax
	call	do_work
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.3233, @object
	.size	__PRETTY_FUNCTION__.3233, 8
__PRETTY_FUNCTION__.3233:
	.string	"do_work"
	.ident	"GCC: (Ubuntu 7.3.0-23ubuntu2~16.04.york0) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
