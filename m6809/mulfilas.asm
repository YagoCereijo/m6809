.module mulfilas

.globl mulfil
.globl programa

leer	   .equ 0xFF02
pantalla   .equ 0xFF00
fin	   .equ 0xFF01


acumula1:   .word 0                                              
contador7:  .byte 3 ;Numero de columnas -2
contador6:  .byte 0
num:        .word 0


mulfil:

	ldb #' 
        stb pantalla
        stb pantalla
        
	ldb #'0
        stb pantalla
        ldb #'x
        stb pantalla
	
	lda ,-x
	ldb ,-x
	
	mul
	
	lda ,-x
	
	mul
	
	


        ; imprimamos 0x
       
        
        adda #48 
	sta pantalla
	clra 
	
	tfr b,a 
	clrb
	
        ; primero imprimamos la primera cifra hexadecimal
        tfr a,b
        lsrb
        lsrb
        lsrb
        lsrb ; en B estA la primera cifra, de 0 a 15
        cmpb #10
        blo no1
	addb #'A-'9-1
no1:    addb #'0
        stb pantalla

        ; ahora imprimimos la segunda cifra hexadecimal
        tfr a,b
        lslb
        lslb
        lslb
        lslb
        lsrb
        lsrb
        lsrb
        lsrb ; en B estA la segunda cifra, de 0 a 15
        cmpb #10
        blo no2
        addb #'A-'9-1
no2:    addb #'0
        stb pantalla

        ; imprimamos un salto de lInea al final
        ldb #'\n
        stb pantalla
	
	
	dec contador7
	bne mulfil 


 
  	
;	
retmulfil:
       
      	rts


