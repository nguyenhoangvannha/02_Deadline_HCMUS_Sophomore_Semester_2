.model small                                 ; khai bao kieu chuong trinh (small->exe 
                                             ; ma lenh o 1 segment, data thuoc 1 segment)

.stack 100h                                  ; khai bao kich thuoc stack
.data
size  DB ?
s1    DB "Nhap do dai canh:$"  
kytu1  DB '*'
kytu2  DB ' '

.code
mov AX,@data
mov DS,AX


mov AH,9h
mov DX, offset s1
int 21h    

mov AH,1h               ;AH=1 va goi ngat de cho nhap 1 ky tu
int 21h 

sub AL,30h           
mov size,AL 

mov AH,0
mov BX,AX

mov AH,2h           
mov DL,0Dh
int 21h
mov DL,0Ah
int 21h


;mov CX,0
;mov CX,AX



Lap1:;outloop  
mov CX,BX
cmp BX,0
je endline


 

    
Lap2:;innerloop     
mov DL,kytu1
mov AH,2h
int 21h


loop  Lap2 

mov DL,0Dh
int 21h
mov DL,0Ah
int 21h

dec BX

 
loop  Lap1   


endline: 
 
mov AH,4Ch
int 21h   

