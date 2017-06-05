
.model small                                 ; khai bao kieu chuong trinh (small->exe 
                                             ; ma lenh o 1 segment, data thuoc 1 segment)

.stack 100h                                  ; khai bao kich thuoc stack
.data
s1    DB "Hello!$"                           ;khai bao bien
s2    DB 10,13,"Day la truong HUTECH$"       ; tenbien kieudulieu giatrikhoitao(=? neu khong khoitao gia tri)
s3    DB 10,13,"Mon hoc Kien truc may tinh$"   
.code
mov AX,@data
mov DS,AX
mov AH,9h
mov DX, offset s1
int 21h          
mov DX, offset s2
int 21h         
lea DX, s3
int 21h 
mov AX,4c00h
int 21h
end