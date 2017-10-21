;				In the name of Allah
;	Amir Hossein Ansari 9133750   Hw4  Fibonacci recursive

include io.h

stacksg segment stack
	dw 100 dup(?)
stacksg ends

data segment 
	msg db 6 dup(?),'  ',0
data ends

code segment
	assume cs:code , ds:data , ss:stacksg
	
	;--------------------------------------	
	; this function will calculate the Nth number of Fibonacci series : 1,1,2,3,4,5,6
	; it will put the answer in bx ( bx=Fibo(n) )
	;--------------------------------------
fibo proc near
	push bp
	mov bp,sp
	push ax
	push cx
	push dx
	mov ax,[bp+4]
	cmp ax,1
	je base1
	cmp ax,2
	je base2
	;	so ax>2
	dec ax
	push ax
	call fibo ; fibo(n-1) 
	mov cx,bx ; cx=fibo(n-1)
	dec ax
	push ax
	call fibo ; fibo(n-2) 
	mov dx,bx ; dx=fibo(n-2)
	add bx,cx ; bx=fibo(n)=fibo(n-1)+fibo(n-2)=cx+dx

	jmp exit
	base1:
	mov bx,1
	
	jmp exit
	base2:
	mov bx,1

	exit:
	pop dx
	pop cx
	pop ax
	pop bp
	ret 2
fibo endp
	
	start:
	mov ax,seg data
	mov ds,ax
	
	mov ax,7
	push ax
	call fibo
	
	itoa msg,bx
	output msg
	
	mov ax,4c00h
	int 21h
code ends
	end start
	
	
	
	
	
	
	