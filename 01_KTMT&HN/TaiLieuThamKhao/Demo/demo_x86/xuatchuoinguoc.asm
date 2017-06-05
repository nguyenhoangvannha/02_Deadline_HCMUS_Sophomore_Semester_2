
.model small      
.stack 100h   
.data
s1    DB 10,13,"Nhap mang:$"
s2    DB 10,13,"Chuoi ky tu can xuat la:$"
arr   DB 10 dup(?)  

kytu  DB ?


.code
mov AX,@data
mov DS,AX


mov AH,9h
mov DX, offset s1
int 21h

mov SI,0
mov CX,10

lap:
nhapkytu:
mov AH,1h               ;AH=1 va goi ngat de cho nhap 1 ky tu
int 21h 
 
mov kytu,AL


;kiem tra ky tu in hoa tu A-Z (41h-5Ah)
cmp kytu,41h
jb nhapkytu
cmp kytu,5Ah
ja nhapkytu

mov arr[SI],AL
inc SI


loop lap


mov AH,9h
mov DX, offset s2
int 21h


;Xuat chuoi ky tu tu ky tu nguoc lai
mov CX,10
xuat:
dec SI
mov DL,arr[SI]          
mov AH,2h               
int 21h
  
loop xuat

           
mov AH,4ch
int 21h


end