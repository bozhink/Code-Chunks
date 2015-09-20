	.data

	.text
	.globl _start
_start:
	movl	$3,%eax
	movl	$0,%ebx
	int	$0x80
	movl	$4,%eax
	movl	$1,%ebx
	int	$0x80
	xorl	%ebx,%ebx
	movl	$1,%eax
	int	$0x80
