char:

.print_new_line:
  mov rax, 1		; valor da syscall write
  mov rdi, 1		; define a saída em stdout
  mov rsi, 10		; valor de '\n'
  rdx, 1		; tamanho de '\n'
  syscall		; executa a syscall
  ret
