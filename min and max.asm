include io.h
stacksg segment
dw  1000h dup(?)
stacksg ends

datasg segment
    max dw 10 dup(?)
	min dw 10 dup(?)
	msg1 db "Enter number: ",0
	string dw 10 dup(?)
	msg2  db "Max is: ",0
	msg3  db 10,13,"Min is: ",0
	
datasg ends

codesg segment
  start:
  
       assume cs:codesg,ds:datasg
	   mov ax, seg datasg
	   mov ds,ax 
	   mov max,0
	   mov min,0
	 
      output msg1
	  inputs string,6
	   atoi  string 
	   mov max,ax
	   mov min,ax
again:	
       output msg1    
	   inputs string,6
	   atoi string
	   cmp ax,0
	   je print
	   cmp ax,max
	   jge setmax
	   cmp ax,min
	   jle setmin
	   jmp again
	   
setmin:
      mov min,ax
      jmp again	  
setmax:
      mov max,ax
      jmp again 	  
print: 
      output msg2	  
	  itoa string,max
      output string
      output msg3
      itoa string,min
      output string
	  
      mov ax,4c00h
	  int 21h
codesg ends
end start	  