*-----------------------------------------------------------
* Title      : LAND MANAGEMENT
* Written by : MAURICI RUIZ PLAZA
* Date       : 16/12/2020
* Description: ALL ABOUT THE LAND GENERATION
*-----------------------------------------------------------
;-----------------------------------------------------------

DIRTINIT
; CREATE LAND
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            MOVEM.L D0-D5, -(A7)	; STACK REGISTER
            MOVEM.L A1-A3, -(A7)
            
            
            MOVE.W  #3, D4  ; NUMBER OF STONE BLOCKS
            MOVE.W  #STNINITX, D5                     
            
            MOVE.W  #BLOCID, D0
            LEA	BLOCINIT, A1
            LEA     BLOCUPD, A2
            LEA     BLOCPLOT, A3
            MOVE.W  #STNINITY, D2
            MOVE.L  #STNFCOL, D3                           
            
            MOVE.W  D5, D1                       
.LOOPCOL    JSR     AGLADD
            SUB.W   #BLOCSIZE, D2
            DBRA.W  D4, .LOOPCOL
            
            MOVEM.L (A7)+, A1-A3
            MOVEM.L (A7)+, D0-D5 	; RESTORE REGISTERS
            RTS





;-----------------------------------------------------------
STNEINIT
; CREATE BASELAND OF STONES
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            
            MOVEM.L D0-D5, -(A7)	; STACK REGISTER
            MOVEM.L A1-A3, -(A7)
            
            
            MOVE.W  #SCRWIDTH/BLOCSIZE, D4  ; NUMBER OF STONE BLOCKS
            MOVE.W  #STNINITX, D5                     
            
            MOVE.W  #BLOCID, D0
            LEA	 BLOCINIT, A1
            LEA     BLOCUPD, A2
            LEA     BLOCPLOT, A3
            MOVE.W  #STNINITY, D2
            MOVE.L  #STNFCOL, D3                           
            
.LOOPS      MOVE.W  D5, D1                       
            JSR     AGLADD
            ADD.W   #BLOCSIZE, D5
            DBRA.W  D4, .LOOPS
            
            MOVEM.L (A7)+, A1-A3
            MOVEM.L (A7)+, D0-D5 	; RESTORE REGISTERS
            RTS

            
;-----------------------------------------------------------                      
LANDINIT
; INITIALIZE BASELAND  
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            MOVEM.L D0-D5, -(A7)	; STACK REGISTER
            MOVEM.L A1-A3, -(A7)
            
            
            MOVE.W  #SCRWIDTH/BLOCSIZE, D5  ; NUMBER OF COLUMNS                     
            
            MOVE.W  #BLOCID, D0              ; INITIALIZE BLOCK
            LEA	BLOCINIT, A1
            LEA     BLOCUPD, A2
            LEA     BLOCPLOT, A3
            MOVE.W  #STNINITY, D2
                                      
            
            MOVE.W  #STNINITX, D1                       
.LOOPCOL    
            MOVE.L  #STNFCOL, D3            ; STONE
            JSR     GETRDIRT
            MOVE.W  D0, D4                  ; NUMBER OF DIRT BLOCKS FROM ARRAY OF RANDOM
            JSR     AGLADD
            SUB.W   #BLOCSIZE, D2
            MOVE.L  #DIRTFCOL, D3
            
.LOOPDIR    JSR     AGLADD 
            SUB.W   #BLOCSIZE, D2                       
            DBRA.W  D4, .LOOPDIR
            
            MOVE.L  #GRASFCOL, D3
            JSR     AGLADD
            
            ADD.W   #BLOCSIZE, D1
            MOVE.W  #STNINITY, D2
            DBRA.W  D5, .LOOPCOL

            
            MOVEM.L (A7)+, A1-A3
            MOVEM.L (A7)+, D0-D5 	; RESTORE REGISTERS
            RTS            
;-----------------------------------------------------------                      










*~Font name~Courier New~
*~Font size~12~
*~Tab type~0~
*~Tab size~4~
