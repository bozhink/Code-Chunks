	.data
msg:
	.asciz "Hello, world!\n" # "asciz" will cause the assembler to append
	                         # the null byte that many C library routines
	                         # expect. The C library isn't being used in
	                         # the example.

MSGLEN	= . - msg # this will cause the assembler to count the number of bytes
	          # between the label "msg" and here. The number will be 16,
	          # as the null byte is included.
msg1:
	.asciz "dflkjg\nfdfdgidjfogddf"
M1LEN	= . - msg1

	.text

	.globl _start
_start:
	movl	$MSGLEN,%edx # argument 3 for write. Number of bytes to write.
		             # A macro is used, which means the MSGLEN will be
		             # replaced with the immediate value 0xf (15)
		             # during assembly. Compatible to C
		             # preprocessor macros.
	movl	$msg,%ecx # argument 2 for write. Pointer to data.
	movl	$1,%ebx # argument 1. File descriptor number.
		        # stdout=1, see article on file descriptors
	movl	$4,%eax # syscall number 4 = write(2)
	int	$0x80
	movl	$msg1,%ecx
	movl	$M1LEN,%edx
	movl	$4,%eax
	int	$0x80
#	xorl	%ebx,%ebx # argument for syscall. Exit code = 0
#		          # xor of a value with itself always equals 0
	movl	$1,%ebx
	movl	$1,%eax # syscall number 1 = exit(2)
	int	$0x80
