include io.h
 
stacksg segment 
 dw 1000h dup(?)
stacksg ends

datasg segment 
   a dw (?)
   b dw (?)
   c dw (?)
   d dw (?)
   e dw (?)
   string db 20 dup(?)
   ms1 db "Enter First Number",0
   ms2 db 10,13,"Enter Second Number: ",0
   ms3 db 10,13,"Enter Third Number: ",0
   ms4 db 10,13,"Enter Fourth Number: ",0
   ms5 db 10,13,"Enter Fifth Number: ",0
   ms6 db 10,13,"AVG is:",0
   avg dw 20 dup(?)
   sum dw 20 dup(?)
   

datasg ends

codesg segment 
 assume cs:codesg, ds:datasg   
    start:
		 mov ax,seg datasg
		 mov ds,ax
		 output ms1
		 inputs string,20
		 atoi string
		 mov a,ax
		 
		 output ms2
		 inputs string,20
		 atoi string
		 mov b,ax
		 
		 output ms3
		 inputs string,20
		 atoi string
		 mov c,ax
		 
		 output ms4
		 inputs string,20
		 atoi string
		 mov d,ax
		 
		 output ms5
		 inputs string,20
		 atoi string
		 mov e,ax
		 
		 add ax,a
		 add ax,b
		 add ax,c
		 add ax,d
		 mov sum,ax
		 mov cl,5
		 idiv cl
		 itoa string,ax
		 output ms6
		 output string
		 
		 mov ax, 4c00h
		 int 21h
		codesg ends
		end start
		 
		 
		 