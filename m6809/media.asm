.module media

.globl media
.globl programa

leer	   .equ 0xFF02
pantalla   .equ 0xFF00
fin	   .equ 0xFF01


cociente:   .byte 0       
num1:   .byte 0    
resto:   .byte 0  
cont:   .byte 9
cont1:   .byte 3                                            

media:
	
	lda #'\n
  	sta pantalla
	
	lda ,-x
	ldb ,-x 
	
	sta num1
	addb num1
	
	lda ,-x
	
	sta num1
	addb num1
	
division:
	
	stb resto
	subb #3
	blo division1
	inc cociente
	jmp division

division1: 
	
	lda #' 
	sta pantalla
	sta pantalla
	lda cociente
	adda #'0
	sta pantalla
	lda cociente
	lda #',
	sta pantalla
	clr cociente
	lda #0
	sta cociente
	clrb
	clra
	ldb resto
	
resto1:  
	addb resto
	dec cont
	bne resto1
	
decimal:

	subb #3
	blo decimal1
	inc cociente
	jmp decimal
	
decimal1: 

	lda cociente
	adda #'0
	sta pantalla

term:

	dec cont1
	bne media	
  	
  	lda #'\n
  	sta pantalla
;	
retmedia:
       
      	rts
