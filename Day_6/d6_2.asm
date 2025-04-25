;write the assembly program to input a single digit number and check if it is even or odd
.model small
.stack 100h
.data
	msg1 db "Enter the number : $"
	n db 0
	msg2 db "The number is Even $"
	msg3 db "The number is Odd $"
	rem db 0
	n1 db 2
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
	mov n,dl
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov ah,00
	mov al,n
	div n1
	mov rem,ah
	
	mov ah,02h
	int 21h
	
	cmp rem,0
	je m1
	jne m2
	
	m1:
	mov dx,offset msg2 
	mov ah,09h
	int 21h
	jmp endn
	
	m2:
	mov dx,offset msg3 
	mov ah,09h
	int 21h
	
	endn:
	mov ax,4c00h
	int 21h
	
end start