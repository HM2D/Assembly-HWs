include io.h
stacksg segment stack
 db 1000h dup(?)
stacksg ends

data segment 
    array dw 20 dup(?)
	string dw 20 dup(?)
	nl db 10,13,0
	np db "not prime",0
	p db "prime",0
data ends

code segment
assume ds:data, cs:code
prime proc near
    push bp
	mov bp,sp
	mov ax,[bp+6]
	mov bx,[bp+4]
	cmp bx,1
	je prime1
	mov cx,ax
	cwd
	div bx
	cmp dx,0
	je notprime
	push cx
    dec bx
    push bx
   call prime	
	jmp exit
prime1:
    mov ax,1
    jmp exit
notprime:
    mov ax,0
exit:
    pop bp
    ret 4	
 prime endp
start:
	mov ax, seg data
	mov ds, ax

    mov ax,10
	push ax
	dec ax
	push ax
  call prime
    cmp ax,0
	je no
    cmp ax,1
	je yes 
no:
    output 	np
	jmp endpro
yes:
    output p
endpro:

	mov ax, 4C00h
	int 21h

code ends

end start