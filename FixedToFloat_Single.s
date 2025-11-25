.text
.global _start
_start:
	movia r16, n        #get input's address, storage in r16
	movia r17, r        #get output's address, storage in r17
	ldw   r15, (r16)    #get input value=r15, const
	mov   r4, r15       #r4=r15
	movi  r3, 1	    #r3=1
	slli  r3, r3, 31    #shift left 31bits r3=2^31, to find first bit 1
	movi  r6, 32        #r6=32, loop variable, to find first bit 1
	movi  r9, 16        #r9=16, to calculate exponent
	movi  r14, 32       #r14=32, const
#Get S
	and   r2, r15, r3   #r2=r15&r3, check 31st bit
	beq   r2, r0, PN    #if r2=0, 31st bit=0, jump PN
	sub   r4, r0, r4    #r4=(-) -> (+), when r2=1, 31st bit=1
PN:
	mov   r5, r2        #r5<-s, r5: result
#Get place to put comma     
L:  #Find the first bit 1
	beq   r6, r0, EL    #r6=r0 -> EL, loop var=0
	subi  r6, r6, 1     #r6=r6-1
	and   r8, r4, r3    #r8=r4&r3
	beq   r8, r3, EL    #r8=r3 -> EL, detect bit 1
	srli  r3, r3, 1     #shift right r3 1 bit
	br    L             #jump L
EL: #End find, r6: place to put comma, not direction
	sub   r10, r6, r9   #r10=r6-r9=x-127(exponent, x not r6, 127 not r9)
	sub   r11, r14, r6  #r11: place to put, from left(31st bit)
#Get fraction
	sll   r12, r4, r11  #shilf left r11 bit, clear first bit 1 
	srli  r12, r12, 9   #shift and get r12=fraction
#Get exponent 
	addi  r10, r10, 127 #calculate exponent
	slli  r10, r10, 23  #shift left and get r10=exponent
#Get result
	add   r5, r5, r10   #r5=r5+r10, r5<-s_exponent
	add   r5, r5, r12   #r5=r5+r12, r5<-s_exponent_fraction
#Storage result
	stw   r5, (r16)     #storage result in r16
stop:
	br stop             #end
.data
	n: .word 0x00006000 #input:n=-11.5625 fixed point 32bits
	r: .word 0   	    #output:r=0 (result)
.end