	.text
	.globl _start
_start:
	popl	%ecx # argc
lewp:
	popl	%ecx # argv
	test	%ecx,%ecx
	jz	exit

	movl	%ecx,%ebx
	xorl	%edx,%edx
strlen:
	movb	(%ebx),%al
	inc	%edx
	inc	%ebx
	test	%al,%al
	jnz	strlen
	movb	$10,-1(%ebx)
#	write(1,argv[i],strlen(argv[i]));
	movl	$4,%eax
	movl	$1,%ebx
	int	$0x80

	jmp	lewp
exit:
	movl	$1,%eax
	xorl	%ebx,%ebx
	int	$0x80
	ret
