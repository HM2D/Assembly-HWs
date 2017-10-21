include io.h

stacksg segment 
 db 1000h dup(?)
 
stacksg ends

datasg segment

  n dw  (?)
  ms db "Enter you number: ",0
  string dw 20 dup(?)
  star db "* ",0
  space db "  ",0
  starend db "*",13,10,0
  s dw 200 dup(?)
  i dw (?)
  j dw (?)

  datasg ends

codesg segment 
  assume cs:codesg, ds:datasg
start:
   mov  ax,seg datasg
   mov  ds,ax
   output  ms
   inputs s,200
   atoi s
   mov n,ax
   mov i,ax
   sub i,1
   mov bx,0
   mov cx,0
 
startagain:
   cmp bx,i
   je newline
   cmp bx,1
   jge spaceornot
   output star
   cmp n,1
   je finish
   inc bx
   jmp startagain   
   
   
newline:
    output starend
	mov bx,0
    inc cx
	cmp cx,n
	je finish
    jmp startagain
	
spaceornot:
     cmp cx,i
	 je printstar
     cmp cx,1
	 jge spaceornot2
	 output star
	 inc bx
	 jmp startagain

printstar:
     output star
	 inc bx
	 cmp bx,n
	 je finish
	 jmp startagain
   
spaceornot2:
   cmp cx,i
   jle printspace
   output star
   inc bx
   jmp startagain
   
   
printspace:
   output space
   inc bx
   jmp startagain
 
 
 finish:
 
   mov ax,4c00h
   int 21h
   
 codesg ends
   end start