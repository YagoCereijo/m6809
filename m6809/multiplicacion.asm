.module multi

.globl multi
.globl programa


acumula:   .word 0                       
c:         .byte 0                       
contador4: .byte 3
contador5: .byte 3


multi:
         jmp bucle1                   

inicio2:
 
  	lda #3
  	sta contador4
  	
  	dec contador5
  	beq retmulti
  	
  	leax -3,x
  	       
        leay 3,y

bucle1:
	
        clr     acumula        
        clr     acumula+1

        lda     #3              
        sta     c


bucle0:
       
        lda     ,x              ; leer dato de la fila en primera matriz
        ldb     ,y              ; leer dato de la columna en segunda matriz
	
	
	
        mul                     

        addd    acumula
        
               
        std     acumula        

	
        leax    -1,x             ; apuntamos a siguiente dato en fila
        leay    -3,y             ; apuntamos a siguiente dato en columna
;
        dec     c               ; repetimos
        bne     bucle0
;
        stb     ,-u             ; guardar resultado
;
        leax    3,x            ; volvemos a la fila
        leay    8,y            ; pasamos a la segunda columna
;	
	
	dec contador4
        bne bucle1
        beq inicio2          ; ver si has acabado
;	
retmulti:
       
        ldb #'f
        stb ,-u
      	rts


        
