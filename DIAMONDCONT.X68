*-----------------------------------------------------------
* Title      : DIAMOND COUNTER MANAGEMENT
* Written by : MAURICI RUIZ PLAZA
* Date       : 10/01/2021
* Description: ALL ABOUT THE COUNT OF THE DIAMONDS
*-----------------------------------------------------------


;-----------------------------------------------------------
CONTINIT
; INITIALIZE DIAMOND COUNTER

; INPUT	-   - NONE
; OUTPUT	- NONE  
; MODIFIES	- NONE	
;-----------------------------------------------------------
           
             
            RTS



;-----------------------------------------------------------
;-----------------------------------------------------------
CONTUPD
; UPDATE DIAMOND COUNTER

; INPUT	    - NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            MOVEM.L D0, -(A7)	; STACK REGISTER
             
            
            MOVEM.L (A7)+, D0 	; RESTORE REGISTERS       
            RTS



;-----------------------------------------------------------
;------------------------------------------------------------------------------------------------------
CONTPLOT
; PLOT DIAMOND COUNTER
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
                 
            MOVEM.L D0-D4, -(A7)	; STACK REGISTER
            MOVEM.L A1-A2, -(A7)	; STACK REGISTER
            
            MOVE.B  #81, D0
            MOVE.L  #TMECOLOU, D1
            TRAP    #15
            
            MOVE.W  #CONTDMNX-50, D1                
            MOVE.W  #CONTDMNY-20, D2     
            LEA  .STRDMND, A1
            MOVE.W  #95, D0  ; TASK NUMBER     
            TRAP    #15

	        
            LEA .NUMDMND, A1
            MOVE.W  CONTDMND, D0
            MULU.W  #4, D0            
            	        
            MOVE.W  #CONTDMNX, D1                
            MOVE.W  #CONTDMNY, D2     
            ADDA.W  D0, A1
            MOVE.W  #95, D0  ; TASK NUMBER     
            TRAP    #15
            	        
	        	        
	         
	        MOVEM.L (A7)+, A1-A2	; RESTORE REGISTERS
	        MOVEM.L (A7)+, D0-D4 	; RESTORE REGISTERS
	        RTS


.NUMDMND    DC.W    '0/8','1/8','2/8','3/8','4/8','5/8','6/8','7/8','8/8',0
.STRDMND    DC.B     'NUMBER OF DIAMONDS:', 0
            DS.W    0
           



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
