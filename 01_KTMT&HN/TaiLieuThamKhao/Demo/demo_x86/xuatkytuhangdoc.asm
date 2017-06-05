include 'emu8086.inc'
.model small      
.stack 100h   
.data
;s1    DB 10,13,"Nhap mang:$"
;s2    DB 10,13,"Chuoi ky tu can xuat la:$"
;arr   DB 'M','I','S','S' 
arr    DB  "MISS"

;kytu  DB ?


.code
mov AX,@data
mov DS,AX       

mov SI,0
mov CX,0


;vong lap xuat tung ky tu cua chuoi
lap:                       
;dem so ky tu chuoi (chieu dai chuoi)

;Xuat ky tu thu SI trong chuoi arr
mov DL,arr[SI]
mov AH,2h
int 21h  

;Xuat ky tu xuong dong, ve dau dong
mov DL,10
int 21h  

mov DL,13
int 21h

inc CX

cmp arr[SI],0h
je exit


inc SI
       

loop lap



;ket thuc chuong trinh
exit:
mov AX,CX
call print_num
ret

mov AH,4ch
int 21h


end