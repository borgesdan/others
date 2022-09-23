section .data
codes:
	db '0123456789ABCDEF'
endline:
	db 10

section .text
global _start

_start:
	; número em formato hexadecimal
	mov rax, 0x1122334455667788
	
	mov rdi, 1
	mov rdx, 1
	mov rcx, 64
	; cada 4 (ou 8)  bits devem ser exibidos como um dígito hexadecimal
	; use o deslocamento (shift) e a operação bit a bit AND para  isolá-los
	; o resultado é o offset no array 'codes'

.loop:
	push rax
	sub rcx, 8	; quantidade de bit a ser subtraído de rcx (4 ou 8)
	; se 4 bits exibe 1122334455667788, se 8 bits 12345678
	; cl é um registrador, a parte menor de rcx
	; rax -- eax -- ax -- ah + al
	; rcx -- ecx -- cx -- ch + cl
	sar rax, cl
	and rax, 0xf

	lea rsi, [codes + rax]
	mov rax, 1
	
	; sycall deixa rcx e r11 alterados
	push rcx
	syscall
	pop rcx

	pop rax

	; test pode ser usado para uma verificação mais rápida do tipo 'é um zero?'
	test rcx, rcx
	jnz .loop

	mov rax, 1	;syscall para colocar um endline '\n'
	mov rdi, 1
	mov rsi, endline
	mov rdx, 1
	syscall

	mov rax, 60
	xor rdi, rdi
	syscall
