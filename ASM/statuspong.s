	.text
	.globl _start
_start:
	movl	$1,%edx
	movl	%eax,%ecx
	movl	$1,%ebx
	movl	$4,%eax
	int	$0x80
	xorl	%ebx,%ebx
	movl	$1,%eax
	int	$0x80
