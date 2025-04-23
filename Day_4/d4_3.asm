.model small
.stack 100h
.data
  msg1 db "Enter the first number : $"
  msg2 db "Enter the second number : $"
  msg3 db "The multiplication is : $"
  n1 db 0
  n2 db 0
.code
start:
  mov ax,@data
  mov ds,ax
  
  mov dx,offset msg1 ;Print the msg1
  mov ah,09h
  int 21h
  
  mov ah,01h ;Read input number1
  int 21h
  sub al,48
  mov n1,al
  
  mov dl,0ah ;nextline(can use 10 or 0ah)
  mov ah,02h
  int 21h
  
  mov dx,offset msg2 ;Print the msg2
  mov ah,09h
  int 21h
  
  mov ah,01h ;Read input number2
  int 21h
  sub al,48
  mov n2,al
  
  mov dl,0ah ;nextline(can use 10 or 0ah)
  mov ah,02h
  int 21h
  
  mov dx,offset msg3 ;Print the msg3
  mov ah,09h
  int 21h
  
  mov al,n1
  mul n2
  mov dl,al ;get multiplication
  
  add dl,48 ; print multiplication
  mov ah,02h
  int 21h
  
  mov ax,4c00h
  int 21h
  
end start