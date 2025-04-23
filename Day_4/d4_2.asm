.model small
.stack 100h
.data
  msg1 db "Enter the number : $"
  t db 0
  o db 0
  dig db 0
  r db 0
  
.code
start:
  mov ax,@data
  mov ds,ax
  
  ;Print the msg1
  mov dx,offset msg1 
  mov ah,09h
  int 21h
  
  ;read first digit
  mov ah,01h
  int 21h
  
  ;add ascii
  sub al,48
  
  ;move it to t(tens),because we need to use al(register) again to read second digit
  
  mov t,al
  
  ;read second digit
  mov ah,01h
  int 21h
  sub al,48
  
  ;move second digit to o(one)
  mov o,al
  
  ;al=t=1
  mov al,t
  
  ;bl=10
  mov bl,10
  
  ;al=al*10(al=t*10)=20
  mul bl
  
  ;al=al+one = 20+3
  add al,o
  
  ;moving the total dig(dig=(t*10)+0=23)
  mov dig,al
  
  ;printing the new line
  mov dl,10
  mov ah,02h
  int 21h
  
  ;clearing ah to use for reminder
  mov ah,00
  
  ;moving dig to al,al=dig..>al=23
  mov al,dig
  
  ;bl=10
  mov bl,10
  
  ;al/bl..>23/10..>al=2(quotient) and ah=3(reminder)
  div bl
  
  ;moving reminder to r
  mov r,ah
  
  ;to print the quotient(al) we move al to dl..>2
  mov dl,al
  add dl,48
  mov ah,02h
  
  ;now the ah has been changed to 02h that mean ah=2 (not reminder)
  int 21h
  
  ;to print the reminder
  mov dl,r
  add dl,48
  mov ah,02h
  int 21h
  
  ;exit code
  mov ax,4c00h
  int 21h
  
end start