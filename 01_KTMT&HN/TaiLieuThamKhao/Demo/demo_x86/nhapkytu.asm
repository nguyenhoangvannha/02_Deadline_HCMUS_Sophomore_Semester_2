
.model small      
.stack 100h   
.data
s1    DB "Nhap ky tu:$"
s2    DB 10,13,"Ky tu vua nhap la:$"
kytu  DB ?


.code
mov AX,@data
mov DS,AX

mov AH,9h
mov DX, offset s1
int 21h

mov AH,1h               ;AH=1 va goi ngat de cho nhap 1 ky tu
int 21h 
 
mov kytu,AL
      
mov AH,9h
mov DX,offset s2
int 21h  

mov DL,kytu               ;ky tu can xuat phai luu trong thanh ghi DL
mov AH,2h               ;AH=2 va goi ngat de cho nhap 1 ky tu
int 21h  

mov AH,4ch
int 21h
end