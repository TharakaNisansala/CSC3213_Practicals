.model small
.stack 100h
.data
  msg1 db "Enter the number : $"
  h db 0
  t db 0
  o db 0
  n1 db 0
  d db 0
  r1 db 0
  r2 db 0
  
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
  
  mov h,al
  
  mov ah,01h
  int 21h
  sub al,48
  
  mov t,al
  
  mov ah,01h
  int 21h
  sub al,48
  
  mov o,al
  
  mov al,h
  mov bl,100
  mul bl
  mov n1,al
  mov al,t
  mov bl,10
  mul bl
  add al,n1
  add al,o

  mov d,al
  
  mov dl,10
  mov ah,02h
  int 21h
  
  mov ah,00
  mov al,d
  mov bl,100
  div bl
  mov r1,ah
  mov dl,al
  add dl,48
  mov ah,02h
  int 21h
  
  mov ah,00
  mov al,r1
  mov bl,10
  div bl
  mov r2,ah
  mov dl,al
  add dl,48
  mov ah,02h
  int 21h
  
  mov dl,r2
  add dl,48
  mov ah,02h
  int 21h
  
  ;exit code
  mov ax,4c00h
  int 21h
  
end start