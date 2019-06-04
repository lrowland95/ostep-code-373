	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI0_0:
	.quad	4696837146684686336     ## double 1.0E+6
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_GetTime
	.p2align	4, 0x90
_GetTime:                               ## @GetTime
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi0:
	.cfi_def_cfa_offset 16
Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi2:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	leaq	-16(%rbp), %rdi
	xorl	%eax, %eax
	movl	%eax, %esi
	callq	_gettimeofday
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	sete	%cl
	xorb	$-1, %cl
	andb	$1, %cl
	movzbl	%cl, %eax
	movslq	%eax, %rsi
	cmpq	$0, %rsi
	je	LBB0_2
## BB#1:
	leaq	L___func__.GetTime(%rip), %rdi
	leaq	L_.str(%rip), %rsi
	movl	$11, %edx
	leaq	L_.str.1(%rip), %rcx
	callq	___assert_rtn
LBB0_2:
	jmp	LBB0_3
LBB0_3:
	movsd	LCPI0_0(%rip), %xmm0    ## xmm0 = mem[0],zero
	cvtsi2sdq	-16(%rbp), %xmm1
	cvtsi2sdl	-8(%rbp), %xmm2
	divsd	%xmm0, %xmm2
	addsd	%xmm2, %xmm1
	movaps	%xmm1, %xmm0
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_Spin
	.p2align	4, 0x90
_Spin:                                  ## @Spin
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi3:
	.cfi_def_cfa_offset 16
Lcfi4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi5:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	callq	_GetTime
	movsd	%xmm0, -16(%rbp)
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	callq	_GetTime
	subsd	-16(%rbp), %xmm0
	cvtsi2sdl	-4(%rbp), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	LBB1_3
## BB#2:                                ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_1
LBB1_3:
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Lcfi6:
	.cfi_def_cfa_offset 16
Lcfi7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Lcfi8:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$2, -8(%rbp)
	je	LBB2_2
## BB#1:
	leaq	L_.str.2(%rip), %rsi
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movb	$0, %al
	callq	_fprintf
	movl	$1, %edi
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	callq	_exit
LBB2_2:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
LBB2_3:                                 ## =>This Inner Loop Header: Depth=1
	leaq	L_.str.3(%rip), %rdi
	movq	-24(%rbp), %rsi
	movb	$0, %al
	callq	_printf
	movl	$1, %edi
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	callq	_Spin
	jmp	LBB2_3
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L___func__.GetTime:                     ## @__func__.GetTime
	.asciz	"GetTime"

L_.str:                                 ## @.str
	.asciz	"./common.h"

L_.str.1:                               ## @.str.1
	.asciz	"rc == 0"

L_.str.2:                               ## @.str.2
	.asciz	"usage: cpu <string>\n"

L_.str.3:                               ## @.str.3
	.asciz	"%s\n"


.subsections_via_symbols
