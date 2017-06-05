
.model small      
.stack 100h   
.data
s1    DB 10,13,"Nhap ky tu:$"
s2    DB 10,13,"Chuoi ky tu can xuat la:$" 
;s3    DB 10,13,"Ky tu lien sau la:$" 
kytu  DB ?


.code
mov AX,@data
mov DS,AX

nhapkytu:
mov AH,9h
mov DX, offset s1
int 21h


mov AH,1h               ;AH=1 va goi ngat de cho nhap 1 ky tu
int 21h 
 
mov kytu,AL


;kiem tra ky tu in hoa tu A-Z (41h-5Ah)
cmp kytu,41h
jb nhapkytu
cmp kytu,5Ah
ja nhapkytu


mov AH,9h
mov DX, offset s2
int 21h

mov DL,kytu
;Xuat chuoi ky tu tu ky tu <x>-Z
xuat:
          
mov AH,2h               
int 21h
inc DL                  ;tang gia tri trong thanh ghi DL=DL+1h
cmp DL,5Ah  
jbe xuat
           
mov AH,4ch
int 21h
end