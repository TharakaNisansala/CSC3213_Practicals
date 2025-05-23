;Given three numbers determine the which one is greater than and display the message
.model small
.stack 100h
.data
	msg1 db "Enter Number1: $"
	msg2 db "Enter Number2: $"
	msg3 db "Enter Number3: $"
	n1 db 0
	n2 db 0
	n3 db 0
	greater db "Greaterst Number is $ "


.code
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov n1,al
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov dx,offset msg2
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov n2,al
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov dx,offset msg3
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov n3,al
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov al,n2
	cmp n1,al
	jge max1
	jl max2
	
	max1:
		mov al,n3
		cmp n1,al
		jge max11
		jl max12
		
		max11:
			mov dx,offset greater
			mov ah,09h
			int 21h
			
			mov al,n1
			add al,48
			mov ah,02h
			int 21h
			
			jmp endn
		max12:
			mov dx,offset greater
			mov ah,09h
			int 21h
			
			;mov al,n3
			add al,48
			mov ah,02h
			int 21h
			
			jmp endn
	max2:
		mov al,n3
		cmp n2,al
		jge max21
		jl max22
		
		max21:
			mov dx,offset greater
			mov ah,09h
			int 21h
			
			mov al,n2
			add al,48
			mov ah,02h
			int 21h
			
			jmp endn
		max22:
			mov dx,offset greater
			mov ah,09h
			int 21h
			
			mov al,n3
			add al,48
			mov ah,02h
			int 21h
	
	endn:
		mov ax,4c00h
		int 21h
end start