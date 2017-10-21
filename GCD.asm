include io.h

stacks segment 
	dw 1000h dup(?)
stacks ends
datasg segment
    a dw 20 dup(?)
	b dw 20 dup(?)
	string dw 20 dup(?)
	msg1 db "Enter First number: ",0
	msg2 db 10,13,"Enter Second Number: ",0
	msg3 db "GCD: ",0
datasg ends     
codesg segment
start:
	assume ds:datasg, cs:codesg
	mov ax, seg datasg
	mov ds, ax
    mov cx,0
	mov dx,0
	output msg1
	inputs string,20
	atoi string
	mov a,ax

	output msg2
	inputs string,20
	atoi string
	mov bx,ax
	
	cmp bx,0
	je print
	mov ax,a
again:
	 div bx	
	 cmp dx,0
	 je print
	 mov ax,bx 
	 mov bx,dx
	 
	jmp again
	
	
    	


	
print:
    mov ax,bx

    output	msg3
	itoa string,ax
	output string
	
	
	mov ax, 4C00h
	int 21h

codesg ends

end start