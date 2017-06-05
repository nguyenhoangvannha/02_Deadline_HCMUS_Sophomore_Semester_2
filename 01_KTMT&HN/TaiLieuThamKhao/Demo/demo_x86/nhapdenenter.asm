
.model small      
.stack 100h   
.data
s1    DB 10,13,"Nhap ky tu:$"
;s2    DB 10,13,"Chuoi ky tu can xuat la:$" 
;s3    DB 10,13,"Ky tu lien sau la:$" 


.code
mov AX,@data
mov DS,AX

mov AH,9h
mov DX, offset s1
int 21h

nhapkytu:
mov AH,1h               ;AH=1 va goi ngat de cho nhap 1 ky tu
int 21h 
;kiem tra ky tu enter(=13d=0Dh)
cmp AL,0Dh
jnz nhapkytu


exit:           
mov AH,4ch
int 21h
end