.module print

.globl imprimirmatriz
.globl programa

leer	   .equ 0xFF02
pantalla   .equ 0xFF00
fin	   .equ 0xFF01

contador10: .byte 0
contador11: .byte 0
variable:   .byte 0

imprimirmatriz:
	
	ldb #3
	stb contador10
	
	
	lda #'\n
	sta pantalla
	
	lda #' 
	sta pantalla
	
	sta pantalla
	 
imprimir1:
             
      
        lda ,-x 
        
        cmpa #'f
        beq retimprimir

        ; primera cifra
        ldb #'0
        cmpa #100
        blo Menor100
        suba #100
        incb
        cmpa #100
        blo Menor200
        incb
        suba #100
Menor100:
Menor200:
        stb pantalla

        ; segunda cifra.  En A quedan las dos Ultimas cifras
        ldb #80
        stb variable
        clrb

bucle:  lslb
        cmpa variable
        blo Menor
        incb
        suba variable
Menor:  tfr d,y
        lda variable
        lsra
        sta variable
        cmpa #10
        tfr y,d
        bhs bucle

        addb #'0
        stb pantalla
        adda #'0
        sta pantalla
        
        
        lda #' 
	sta pantalla
        
        ldb contador10
        decb 
        beq imprimirmatriz 
        stb contador10
        
        bra imprimir1    
        
retimprimir:
	
	lda #'\n
	sta pantalla
	rts 
