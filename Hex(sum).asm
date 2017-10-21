include io.h
;hoooman malekzadeh 
data segment 
    string2 db 20 dup(?)
	string db 20 dup(?)
	string3 db "00000",0
	test1 db 20 dup(?)
	msg1 db "Enter Base Address: ",0
	msg2 db "Enter Offset: ",0
	msg3 db "Physical address: ",0
	hex db "0123456789ABCDEF",0
	nl db 10,13,0
	a db (?)
	b db (?)
data ends

code segment

start:
	assume ds:data, cs:code
	mov ax, seg data
	mov ds, ax
    mov ah,0
    output msg1
    inputs string,6
	output msg2
	inputs string2,6
	mov di,0
	mov ah,0
	mov cx,4
count:	
    dec cx
	mov si,cx
	lea bx,string
	mov al,[bx+si]
	mov bx,0
	mov di,0
again:
    lea bx,hex
    cmp al,[bx+di]
	je gotnum
	inc di
	jmp again
	
gotnum: 
      mov ax,di
	  mov a,al
	  lea bx,string2
      cmp si,0
      jle print	  
	  mov al,[bx+si-1]
	  mov di,0
	  jmp again2
setsi:
      mov al,[bx+si]	  
 again2:   
    lea bx,hex
	cmp al,[bx+di]
	je gotnum2
	inc di
	jmp again2
gotnum2:
      mov ax,di
	  add al,a
	  cmp al,16
	  jl print
	  ;cmp cx,0
	  ;jl print
	  
	      sub ax,16 
	      lea bx,hex
		  mov di,ax 		  
          mov al,[bx+di]
		  lea bx,string
		  mov si,cx
		  mov [bx+si],al
		  mov al,[bx+si-1]
		  jmp again5
print:
     mov ah,0
     mov si,ax
	 lea bx,hex
	 mov al,[bx+si]
	 lea bx,string
	 mov si,cx
     mov [bx+si],al
	 cmp cx,0
	 jg count
	 lea bx,string2
	 mov al,[bx+3]
	 lea bx,string
	 mov [bx+4],al
	 output msg3
     output string
     output nl
     jmp endpro	 

again5:   
    lea bx,hex
	cmp al,[bx+di]
	je gotnum3
	inc di
	jmp again5
gotnum3:
      lea bx,hex
	  inc di
	  cmp di,16
	  jge addnum
	  mov al,[bx+di]
	  lea bx,string
	  mov [bx+si-1],al
	  jmp count
addnum:
          mov ax,di
          sub ax,16 
	      lea bx,hex
		  mov di,ax 		  
          mov al,[bx+di]
		  lea bx,string
		  mov si,cx
		  mov [bx+si],al
		  mov al,[bx+si-2]
again6:   
    lea bx,hex
	cmp al,[bx+di]
	je gotnum4
	inc di
	jmp again6
gotnum4:
      lea bx,hex
	  inc di
	  mov al,[bx+di]
	  lea bx,string
	  mov [bx+si-2],al
	  jmp count
endpro:	
	mov ax, 4C00h
	int 21h

code ends

end start