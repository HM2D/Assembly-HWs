include io.h
stacksg segment stack
 db 1000h dup(?)
stacksg ends

data segment 
    array dw 20 dup(?)
	string dw 20 dup(?)
	nl db 10,13,0
data ends

code segment
	assume ds:data, cs:code
pow proc near
   push bp
   mov bp,sp
   mov ax,[bp+6]
   mov bx,[bp+4]
   cmp bx,1
   je exit
   push ax
   dec bx
   push bx
   call pow
   mov bx,[bp+6]
   mul bx
   
exit:
    pop bp
	ret 4
 pow endp 
start:
	mov ax, seg data
	mov ds, ax
    mov ax,5
	mov bx,3
	push ax
	push bx
	call pow
   itoa string,ax
   output string
   



	
	mov ax, 4C00h
	int 21h

code ends

end start