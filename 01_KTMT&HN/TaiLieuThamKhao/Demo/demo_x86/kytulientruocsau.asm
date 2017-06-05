
.model small      
.stack 100h   
.data
s1    DB "Nhap ky tu:$"
s2    DB 10,13,"Ky tu lien truoc la:$" 
s3    DB 10,13,"Ky tu lien sau la:$" 
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
mov DX,offset s2         ;ky tu lien truoc
int 21h  

mov DL,kytu          
dec DL                  ;giam gia tri trong thanh ghi DL=DL-1h
mov AH,2h               
int 21h  
           
           
           
mov AH,9h
mov DX,offset s3        ;ky tu lien sau
int 21h  

mov DL,kytu              
inc DL                  ;tang gia tri trong thanh ghi DL=DL+1h
mov AH,2h               
int 21h  
           
mov AH,4ch
int 21h
end