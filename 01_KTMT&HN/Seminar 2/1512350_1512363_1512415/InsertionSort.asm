#do an hop ngu MIPS

.data 
So0: .word 0
n: .word 0
a: .space 10000 #mang ki tu
c: .space 10000 # mang so

tam: .word 4
KiTu0: .asciiz "0"
min: .word

khoantrang: .asciiz" "
input: .asciiz "input.txt"
output: .asciiz "output.txt"


.text

.main
# tien hanh doc file ko dua tren" " hay "\m"
#mo file moi
li $v0,13   
la $a0,input	 #ten file
li $a1,0 	# che do doc/gi
li $a2,0 
syscall
move $s0,$v0 	# luu mo ta file vo $so
#doc file
li $v0,14
move $a0,$s0 	# su dung mo ta file de doc dc file
la $a1,a	 # doc vo n
li $a2,10000	# do dai cua ki tu tu file doc khi dc doc vao n
syscall
li   $v0, 16       # system call for close file
move $a0, $s6      # file descriptor to close
syscall          # close file
j xuly


## then:  viet cac ham su ly chuyen string -> int va cac ham sap xep
# a la chuoi string, b la mang so
xuly:

li $t0,0 #so n
li $t1,0 # TongSo son
li $t2,0 # So a
li $t3,10 # so 10
li $t4,0 #i=0 // dem dung khi in
la $t5,a # string a
la $t6,c # mang int c 
li $t7,0 # son*10


#vong lap in ra cac du lieu tu tring sang int theo tung char

lap1:
lb $a0,($t5)
beq $a0,'\r',GetN        # lay so phan tu n
beq $a0,' ',GetSo        # lay cac phan tu tru gia tri cuoi
beq $a0,'\0' ,GetSoCuoi  # lay phan tu cuoi
subi $a0,$a0,'0'
mult $t1,$t3
mflo $t1
add $t1,$t1,$a0
nhay:
addi $t5,$t5,1
lb $a0,($t5)
j lap1
# vong lap 2 de lay ra mang int

GetN:
sw $t1,n
addi $t5,$t5,1
li $t1,0
j nhay
# tien hanh dua cac phan tu vo mang
GetSo:
sw $t1,($t6)
addi $t6,$t6,4
li $t1,0
j nhay
GetSoCuoi:
sw $t1,($t6)
addi $t6,$t6,4
la $t6,c
lw $a1,n
j SapXep

# lay xong tat ca cac phan tu tap tin
exit:
li $v0,10
syscall
## tien hanh sap xep SelectionSort

SapXep:
li $t4,1 #i=1 // dem dung khi in
li $t2,0 # pos=0
li $t0,0 #a[j] hay a[i]
li $t1,0 #a[pos]
li $t5,0 # so luong byte dich vung nho cho phan tu j
li $t3,0 # gia tri x
li $t7,4 # 4 byte de thuc hien mult
li $t8,0 # luong byte can dich chon phan tu min
li $t9,0 # a[pos] -x
li $a2,0 # pos+1
li $a3,0 # a[pos+1]
j InsertionSort

InsertionSort:
la $t6,c
lw $a1,n
vong1:
beq $t4,$a1,ChuanHoa
subi $t2,$t4,1 # pos=i-1
#tinh a[i]
mult $t4,$t7 
mflo $t5 # vi tri i
add $t6,$t6,$t5
lw $t0,($t6) #a[i]
sub $t6,$t6,$t5
move $t3,$t0 #x= a[i]
vong2:
bgez $t2,go1
bltz $t2,Break
go1:
#tinh a[pos]
mult $t2,$t7
mflo $t8
add $t6,$t6,$t8
lw $t1,($t6) #a[pos]
sub $t6,$t6,$t8 # tra lai vi tri vung nho 
sub $t9,$t1,$t3
bgtz $t9,go2
blez $t9,Break
go2:
#tinh a[pos] cap nhat
mult $t2,$t7
mflo $t8
add $t6,$t6,$t8
lw $t1,($t6) #a[pos]
sub $t6,$t6,$t8 # tra lai vi tri vung nho 
# tim dia chi vung nho a[pos+1]
addi $a2,$t2,1
mult $a2,$t7
mflo $t5
add $t6,$t6,$t5
sw $t1,($t6) # luu gia tri cua tai vi tri pos vao vi tri pos +1
sub $t6,$t6,$t5
subi $t2,$t2,1
j vong2

Break:
addi $a2,$t2,1
mult $a2,$t7
mflo $t5
add $t6,$t6,$t5
sw $t3,($t6) # luu gia tri cua tai vi tri pos vao vi tri pos +1
sub $t6,$t6,$t5
addi $t4,$t4,1
j vong1

# xong thuat toan Insertionsort => sap xep thanh cong

# tien hanh chuan hoa int thanh char va dong thoi gi file tren tung char

ChuanHoa:
la $s0,c # mang int
la $s2,n
lw $s2,($s2)
li $t0,0 # bien dem
li $t8,10 #do doi byte
li $a2,0
MoFile:
li $v0,13   
la $a0,output 	#ten file
li $a1,1 	# che do doc/gi
li $a2,0 
syscall
 j TienHanh
TienHanh:   				
bge  $t0, $s2, exit	# neu n >= 0, exit 
li   $t6, 4		# 4 byte			
mult $t0, $t6		
mflo $t1		
add  $t2, $s0, $t1
lw   $t3,($t2) 	# load gia tri len $t3			
beq  $t3, 0, Gi0  # gi ki tu 0	
li $t4,1      	
SoChia:	# so chia 10^ de lay ki tu dau tien cua so
bgt  $t4, $t3,GiDuLieu  # neu $t4>$t3 thi tien hanh gi voi so chia
mult $t4, $t8  		
mflo $t4		# sochia = so chia *10			
j SoChia								
GiDuLieu:#tien hanh lay 1 so 0 cua so chia tu ben phai sang			
div  $t4, $t8					
mflo $t4		
beqz $t4,GiKhoanTrang	# neu $t4 = 0 tuc la da het so tren 1 phan tu mang -> se gi khoan trang	
j GiKiTu	# gi ki tu thong thuong	
										
GiKiTu:					
div $t3, $t4	#  thuc hien chia gia tri cho so chia de thu duoc so can gi			
mflo $t5					
mfhi $t3			
addi $t5, $t5, '0'  # chuyen so Int sang char
la  $t7, tam	# load dia chi bien tam	
sb  $t5, ($t7)	# luu len bien tam	
li   $v0, 15    # tien hanh gi file	
move $a0, $s1   # luu file mo ta		
move $a1,$t7		
li   $a2, 1    # mode=1		
syscall          					
j GiDuLieu 		
										
Gi0: # gi ki tu 0		
li   $v0, 15    		
move $a0, $s1  				
la   $a1, KiTu0  		
li   $a2, 1     				
syscall      													
GiKhoanTrang:			# gi ki tu khoan trang		
li   $v0, 15     		
move $a0, $s1    	
la   $a1,khoantrang			
li   $a2, 1    				
syscall 						 
addi $t0, $t0, 1 #nhay 1 byte de den vi tri tiep theo		
j TienHanh			
# tien hanh dong file
li   $v0, 16       		    	
move $a0, $s1     #luu file mo ta	    	
syscall  
j exit         	




