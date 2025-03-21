;write an assembly program to add two numbers and display the result
;Number 01:2
;Number 02:3
;Addition of num1 and num2:5

.model small
.stack 100h

.data
num1 db 2
num2 db 3
msg db "Addition of num1 and num2: $"
result db 0

.code
start:

mov ax,@data
mov ds,ax

mov ah, 09h
lea dx, msg
int 21h

mov al,num1
add al,num2
add al,30h
mov dl,al
mov ah,02h
int 21h

mov ax,4c00h
int 21h

end start