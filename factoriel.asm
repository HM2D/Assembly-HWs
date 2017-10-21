include io.h

stacksg segment
 dw 1000h dup(?)

stacksg ends


datasg segment 
   num1   dw (?)
   string db 200 dup(?)
   ms1 db "Enter Number: ",0
   ms2  db "1",0
   m   db 20 dup(?)
   
datasg ends

codesg segment 
 assume cs:codesg, ds:datasg   
    start:
		 mov ax,seg datasg
		 mov ds,ax
         
		 
		 output ms1
		 inputs string,200
		 atoi string
		 mov bx,ax	   
		 
		then:
		   dec bx
		   mul  bx
		   cmp bx,1
		   jg then
		   
		 cmp ax,0
		  je print1
		  
		  
		  print: 
		   itoa string,ax
           output string
           jmp endi
		 print1:
		 output ms2
            

         endi:
		 
		 mov ax,4c00h
		 int 21h
		 
codesg ends
   end start
   
		 