.module final



leer	  .equ 0xFF02
pantalla  .equ 0xFF00
fin	  .equ 0xFF01

matz1    .equ 0xF000
matz2    .equ 0xF100
matz3    .equ 0xF200
vect1    .equ 0xF300



        .globl programa
        .globl leematriz
	.globl imprimirmatriz
	.globl media
	.globl multi
	.globl mulfil
	.globl menu
	
	
programa:
        
        jsr menu
        
opcion: 
	
                
        lda leer 
       
        ldb #'\n
        stb pantalla
        clrb
        
        cmpa #'1
        beq opcion1
        
        cmpa #'6
        lbeq opcion6
        
        bra programa



opciona:

	jsr menu
	
	clra
	lda leer
	 
	cmpa #'1
        beq opcion1
        
        cmpa #'2
        beq opcion2
        
        cmpa #'3
        beq opcion3
        
        cmpa #'4
        beq opcion4
        
        cmpa #'5
        beq opcion5
        
        cmpa #'6
        beq opcion6
        
        bne opciona
   
opcion1: 
 	
   	lds #0xE000
       
        ldx #matz1
	jsr leematriz	
 	
 	ldx #matz2
	jsr leematriz
	
	ldb #'\n
        stb pantalla
	
	jmp opciona
        
opcion2:
	
	ldb #'\n
        stb pantalla
        
	ldx #matz1 
        jsr imprimirmatriz     
        	
 	ldx #matz2
        jsr imprimirmatriz
        
        ldb #'\n
        stb pantalla
	
        jmp opciona        
        
opcion3:

	ldb #'\n
        stb pantalla
        
	ldx #matz1
        ldu #vect1
        jsr mulfil
        
        ldb #'\n
        stb pantalla
        
        jmp opciona
        
opcion4: 
        
        ldx #matz1
	jsr media
	
	ldb #'\n
        stb pantalla
	
	jmp opciona
        
opcion5: 
	
	ldx #matz1        
        leax -1,x        
        ldy #matz2        
        leay -1,y        
        ldu #matz3                  
        jsr multi
        
        ldx #matz3
        jsr imprimirmatriz
        
        ldb #'\n
        stb pantalla
        
        jmp opciona
      
        
opcion6:
                         
        clra
        sta fin
	.area	FIJA (ABS)
	.org 	0xFFFE	; vector de RESET
       
