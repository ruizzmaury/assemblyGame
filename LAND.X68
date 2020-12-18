*-----------------------------------------------------------
* Title      : LAND MANAGEMENT
* Written by : MAURICI RUIZ PLAZA
* Date       : 16/12/2020
* Description: ALL ABOUT THE LAND GENERATION
*-----------------------------------------------------------
;-----------------------------------------------------------

LANDINIT
; CREATE LAND
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            MOVEM.L D0-D6, -(A7)	; STACK REGISTER
            MOVEM.L A1-A3, -(A7)
            
            
            MOVE.W  #32, D6                 ; NUMBER OF COLUMNS == 32 
                        
            MOVE.W  #STNID, D0             ; CREATING FIRST STONE BLOCK
            LEA	BLOCINIT, A1
            LEA     BLOCUPD, A2
            LEA     BLOCPLOT, A3
            MOVE.W  #STNINITX, D1           ; COORDINATE X STONE  
            MOVE.W  #STNINITY, D2           ; COORDINATE Y FIRST STONE
            
                
            
;.COLOOP                 
            JSR     AGLADD
                        
            
            MOVEM.L (A7)+, A1-A3            ; RESTORE REGISTERS
            MOVEM.L (A7)+, D0-D6 	
            RTS


;-----------------------------------------------------------
STNEINIT
; CREATE BASELAND OF STONES
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            
            MOVEM.L D0-D4, -(A7)	; STACK REGISTER
            MOVEM.L A1-A3, -(A7)
            
            
            MOVE.W  #SCRHEIGH/BLOCSIZE, D4  ; NUMBER OF STONE BLOCKS
            MOVE.W  #STNINITX, D5                     
            
            MOVE.W  #STNID, D0
            LEA	BLOCINIT, A1
            LEA     BLOCUPD, A2
            LEA     BLOCPLOT, A3
            MOVE.W  #STNINITY, D2
            MOVE.L  #STNFCOL, D3                           
            
.LOOPS      MOVE.W  D5, D1                       
            JSR     AGLADD
            ADD.W   #BLOCSIZE, D5
            DBRA.W  D4, .LOOPS
            
            MOVEM.L (A7)+, A1-A3
            MOVEM.L (A7)+, D0-D4 	; RESTORE REGISTERS
            RTS

            
;-----------------------------------------------------------                      
DIRTINIT
; INITIALIZE BASELAND OF DIRT 
; INPUT	- D1.W  DIRT PLACE COORDINATE 
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            
            
 
          






*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~0~
*~Tab size~4~
