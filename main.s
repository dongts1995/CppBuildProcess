	.file	"main.cpp"
	.text
	.section	.text$_Z6printfPKcz,"x"
	.linkonce discard
	.globl	_Z6printfPKcz
	.def	_Z6printfPKcz;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z6printfPKcz
_Z6printfPKcz:
.LFB10:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	32(%rbp), %rax
	movq	%rbx, %r8
	movq	%rax, %rdx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section	.text$_Z5twicei,"x"
	.linkonce discard
	.globl	_Z5twicei
	.def	_Z5twicei;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z5twicei
_Z5twicei:
.LFB46:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %edx
	movl	16(%rbp), %eax
	movl	%eax, %ecx
	call	_Z3addii
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Hello\12\0"
	.align 8
.LC1:
	.ascii "2 + 3 = %d, twice(4) = %d, 5 - 3 = %d\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB47:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	leaq	32(%rsp), %rbp
	.seh_setframe	%rbp, 32
	.seh_endprologue
	call	__main
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	_Z6printfPKcz
	movl	$3, %edx
	movl	$5, %ecx
	call	sub
	movl	%eax, %esi
	movl	$4, %ecx
	call	_Z5twicei
	movl	%eax, %ebx
	movl	$3, %edx
	movl	$2, %ecx
	call	_Z3addii
	movl	%esi, %r9d
	movl	%ebx, %r8d
	movl	%eax, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	_Z6printfPKcz
	movl	$0, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (MinGW-W64 x86_64-msvcrt-posix-seh, built by Brecht Sanders) 12.1.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	_Z3addii;	.scl	2;	.type	32;	.endef
	.def	sub;	.scl	2;	.type	32;	.endef
