*-----------------------------------------------------------
* Title      : LAND MANAGEMENT
* Written by : MAURICI RUIZ PLAZA
* Date       : 16/12/2020
* Description: ALL ABOUT THE LAND GENERATION
*-----------------------------------------------------------
;-----------------------------------------------------------

STNEINIT
; CREATE LAND
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
           
            MOVEM.L D0-D4/A1-A3,-(A7)
            
            MOVE.W  #NROWBLKS,D4
            MOVE.W  #BLOCID,D0
            LEA     BLOCINIT,A1
            LEA     BLOCUPD,A2
            LEA     BLOCPLOT,A3
            MOVE.W  #STNINITX, D1
            MOVE.W  #STNINITY, D2
            MOVE.L  #STNFCOL, D3

.LOOPS      JSR     AGLADD
            ADD.W  #BLOCSIZE, D1
            DBRA.W  D4,.LOOPS
            
            MOVEM.L (A7)+,D0-D4/A1-A3
            RTS



;-----------------------------------------------------------
DIRTINIT
; CREATE BASELAND OF STONES
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            
            MOVEM.L D0-D4/A1-A3,-(A7)
            
            MOVE.W  #NROWBLKS,D4
            MOVE.W  #BLOCID,D0
            LEA     BLOCINIT,A1
            LEA     BLOCUPD,A2
            LEA     BLOCPLOT,A3
            MOVE.W  #STNINITX, D1
            MOVE.W  #STNINITY-BLOCSIZE, D2
            MOVE.L  #DIRTFCOL, D3

.LOOPS      JSR     AGLADD
            ADD.W  #BLOCSIZE, D1
            DBRA.W  D4,.LOOPS
            
            MOVEM.L (A7)+,D0-D4/A1-A3
            RTS


            
;-----------------------------------------------------------                      
GRASINIT
; INITIALIZE BASELAND OF DIRT 
; INPUT	- D1.W  DIRT PLACE COORDINATE 
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            
            MOVEM.L D0-D4/A1-A3,-(A7)
            
            MOVE.W  #NROWBLKS,D4
            MOVE.W  #BLOCID,D0
            LEA     BLOCINIT,A1
            LEA     BLOCUPD,A2
            LEA     BLOCPLOT,A3
            MOVE.W  #GRASINTX, D1
            MOVE.W  #GRASINTY, D2
            MOVE.L  #GRASFCOL, D3

.LOOPG      JSR     AGLADD
            ADD.W  #BLOCSIZE, D1
            DBRA.W  D4,.LOOPG
            
            MOVEM.L (A7)+,D0-D4/A1-A3
            RTS
 
          








*~Font name~Courier New~
*~Font size~12~
*~Tab type~0~
*~Tab size~4~
