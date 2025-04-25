;write the assembly program to check if a number is equal to 5. display "Hi" if equal, else "Bye"
.model small
.stack 100h
.data
	msg1 db "Enter the number : $"
	n db 0
	msg2 db "Hi $"
	msg3 db "Bye $"
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
	
	cmp n,5
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