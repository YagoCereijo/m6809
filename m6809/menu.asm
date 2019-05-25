.module menu
.globl menu

leer	  .equ 0xFF02
pantalla  .equ 0xFF00
fin	  .equ 0xFF01


cadena:  .ascii " ============================================\n"
	 .ascii " |                                          |\n"
	 .ascii " | (1) INTRODUCIR MATRICES                  |\n"               
	 .ascii " | (2) MOSTRAR MATRICES                     |\n"
	 .ascii " | (3) MULTIPLICAR FILAS                    |\n"
	 .ascii " | (4) SUMAR Y CALCULAR MEDIA DE COLUMNAS   |\n"
	 .ascii " | (5) MULTIPLICAR MATRICES                 |\n"
	 .ascii " | (6) SALIR                                |\n"
	 .ascii " |                                          |\n"
	 .ascii " ============================================\n"
	 .ascii "\n INTRODUCE LA OPCION: "
	 .byte 0
	       


        .globl programa

menu:

	ldx #cadena
      
buce:  
	
 	lda ,x+
 	beq retmenu
        sta pantalla      ; salida por pantalla
        bra buce
        
retmenu:

	rts
