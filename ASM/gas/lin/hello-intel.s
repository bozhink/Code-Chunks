.intel_syntax
.data
msg:
	.ascii "Hello, world!\n"
	len = . - msg

.text
	.global	_start
_start:
	mov	%eax, 4
	mov	%ebx, 1
	mov	%ecx, OFFSET FLAT:msg
	mov	%edx, len
	int	0x80

	mov	%eax, 1
	xor	%ebx, %ebx
	int	0x80

