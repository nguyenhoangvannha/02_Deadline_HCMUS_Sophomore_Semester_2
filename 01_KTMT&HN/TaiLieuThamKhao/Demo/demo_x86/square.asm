.model small                                 ; khai bao kieu chuong trinh (small->exe 
                                             ; ma lenh o 1 segment, data thuoc 1 segment)

.stack 100h                                  ; khai bao kich thuoc stack
.data
size  DW 10
s1    DB "Nhap do dai canh:$"  
;kytu1  DB '*'
;kytu2  DB ' '
border  DB  '**********',0DH,0AH,'$'
content  DB '*        *',0DH,0AH,'$'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS
     MOV DS, AX

     ;LEA DX, SQUARE               ; load the string
     

   mov BX,2
   mov CX,size
   sub CX,2
   
   jmp print_border
   
    print_border:        
                                             
    LEA DX, border               ; load the string
    MOV AH, 9  
    
     INT 21H                      ; display the string
     
     dec BX 
  cmp BX,0
  je endline
  
  
  LEA DX, content               ; load the string
    MOV AH, 9
  
  Dieukien:
  cmp CX,0
  je print_border
  jne print_content
    
      
   print_content:
     INT 21H 
   loop print_content
   jmp Dieukien
       
   endline:
   
     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN