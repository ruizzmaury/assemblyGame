*-----------------------------------------------------------
* Title      : LAND MANAGEMENT
* Written by : MAURICI RUIZ PLAZA
* Date       : 16/12/2020
* Description: ALL ABOUT THE LAND GENERATION
*-----------------------------------------------------------

;-----------------------------------------------------------
STNEINIT
; CREATE BASELAND OF STONES
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            
            MOVEM.L D0-D3, -(A7)	; STACK REGISTER
            MOVEM.L A1-A3, -(A7)
            
            
            MOVE.B  #SCRWIDTH/BLOCWDTH, D2  ; NUMBER OF STONE BLOCKS
            MOVE.W  #STNINITX, D3                     
            
            MOVE.W  #BLOCID, D0
            LEA	BLOCINIT, A1
            LEA     BLOCUPD, A2
            LEA     BLOCPLOT, A3                                      
            
.LOOPS      MOVE.W  D3, D1            
            JSR     AGLADD
            ADD.W   #BLOCWDTH, D3
            DBRA.W  D2, .LOOPS
            
            MOVEM.L (A7)+, A1-A3
            MOVEM.L (A7)+, D0-D3 	; RESTORE REGISTERS
            RTS
            
                      
DIRTINIT
; INITIALIZE BASELAND OF DIRT 
; INPUT	- D1.W  DIRT PLACE COORDINATE 
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            
            MOVEM.L D0-D3, -(A7)	; STACK REGISTER
            MOVEM.L A1-A3, -(A7)
            
            
            MOVE.B  #SCRWIDTH/BLOCWDTH, D2  ; NUMBER OF STONE BLOCKS
            MOVE.W  #STNINITX, D3                     
            
            MOVE.W  #BLOCID, D0
            LEA	BLOCINIT, A1
            LEA     BLOCUPD, A2
            LEA     BLOCPLOT, A3                                      
            
.ROWDIRT    MOVE.W  D3, D1            
            JSR     AGLADD
            ADD.W   #BLOCWDTH, D3
            DBRA.W  D2, .ROWDIRT    
            
            MOVEM.L (A7)+, A1-A3
            MOVEM.L (A7)+, D0-D3 	; RESTORE REGISTERS
            RTS




 
          

*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~0~
*~Tab size~4~
