.module leer
.globl leematriz

leer	  .equ 0xFF02
pantalla  .equ 0xFF00
fin	  .equ 0xFF01


filas:     .byte 0
columnas:  .byte 0
dim:       .word 0
contador:  .byte 0



        .globl programa

leematriz:

       lda #'  
       sta pantalla
       sta pantalla
       
       lda #3
       sta filas
       
       ldb #3
       stb columnas
       
       mul
       std dim
       
       lda #4
       sta contador
       
lee2:

       lda #'\n
       sta pantalla
       lda #'  
       sta pantalla
       sta pantalla
       
       lda contador
       deca 
       cmpa #0 
       beq retleer
       sta contador
       
       ldb #0
	
lee1:
	
	lda ,-x
	
vuelve:

	lda leer 
	
	suba #48
	
	cmpa #9
	bhi vuelve
	
	sta ,x
	
	incb 
	cmpb #3
	beq lee2
	
	jmp lee1
      
 

       
 
retleer:
 	
 	lda #'f
 	sta ,-x
 	
 	rts
 	




     

     
