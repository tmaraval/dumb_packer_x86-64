section .text
  global _start

_start:
  ;; save cpu state
  push rax
  push rdi
  push rsi
  push rdx

  ;; write msg to stdout
  mov rax,1                     ; [1] - sys_write
  mov rdi,1                     ; 0 = stdin / 1 = stdout / 2 = stderr
  lea rsi,[rel msg]             ; pointer(mem address) to msg (*char[])
  mov rdx, msg_end - msg        ; msg size
  syscall                       ; calls the function stored in rax

  ;; restore cpu state
  pop rdx
  pop rsi
  pop rdi
  pop rax

  ;; jump to _main
  mov rax, 0x1111111111111111   ; address changed during injection
  jmp rax

align 8
  msg     db 'Payload has been injected!',0xa,0
  msg_end db 0x0
