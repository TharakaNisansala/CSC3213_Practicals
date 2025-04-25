;write the assembly program to input two single digit numbers and compare which number is greater
.model small
.stack 100h
.data
	msg1 db "Enter the number1 : $"
	n1 db 0
	msg2 db "Enter the number2 : $"
	n2 db 0
	msg db "The Greatest Number is $"
.code
start:
	mov ax,@data
	mov ds,ax
  
	mov dx,offset msg1 
	mov ah,09h
	int 21h
  
	mov ah,01h
	int 21h
	
	mov dl,al
	sub dl,48
	mov n1,dl
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov dx,offset msg2 
	mov ah,09h
	int 21h
  
	mov ah,01h
	int 21h
	
	mov dl,al
	sub dl,48
	mov n2,dl
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov bl,n1
	cmp bl,n2
	jg m1
	jng m2
	
	m1:
	mov dx,offset msg 
	mov ah,09h
	int 21h
	
	mov al,n1
	mov dl,al
	
	add dl,48 
	mov ah,02h
	int 21h
	jmp endn
	
	m2:
	mov dx,offset msg
	mov ah,09h
	int 21h
	
	mov al,n2
	mov dl,al
	
	add dl,48 
	mov ah,02h
	int 21h
	
	endn:
	mov ax,4c00h
	int 21h
end start