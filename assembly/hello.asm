global _start

section .data
message: db "hello world!", 10

section .text
_start:
	mov rax, 1 		;o número de chamada de sistema deve ser armazenado em rax
				;0 = stdin, 1 = stdout, 2 = stderr

	mov rdi, 1		;argumento #1 em rdi: onde escrever (descritor)?
	mov rsi, message	;argumento #2 em rsi: onde começa a string?
	mov rdx, 14		;argumento #3 em rdx: quantos bytes devem ser escritos?
	syscall			;chamada de sistema
