*-----------------------------------------------------------
* Title      : LAND MANAGEMENT
* Written by : MAURICI RUIZ PLAZA
* Date       : 16/12/2020
* Description: ALL ABOUT THE LAND GENERATION
*-----------------------------------------------------------                 


;-----------------------------------------------------------                      
LANDCRTE
; INITIALIZE BASELAND  
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            MOVEM.L D0-D5, -(A7)	; STACK REGISTER
            MOVEM.L A1-A3, -(A7)
            
            ;---------INITIALIZING DIAMONDS --------
           
            JSR     SETDMNDS
            
            
            ;--------- INITIALIZING LAND -----------

            
            MOVE.W  #SCRWIDTH/BLOCSIZE, D5  ; NUMBER OF COLUMNS 
            MOVE.W  #BLOCID, D0              ; INITIALIZE BLOCK
            LEA	 BLOCINIT, A1
            LEA     BLOCUPD, A2
            LEA     BLOCPLOT, A3           
            MOVE.W  #STNINITX, D1             
                                               
.LOOPL      
            MOVE.W  #STNINITY, D2
            JSR GETRDIRT
            MOVE.W D0, D4
            MOVE.L  #STNFCOL, D3     
            JSR AGLADD
            SUB.W   #2, D4
            SUB.W   #BLOCSIZE, D2
            MOVE.L  #DIRTFCOL, D3 
.LOOPD      
            JSR AGLADD
            SUB.W   #BLOCSIZE, D2
            DBRA.W  D4, .LOOPD
            
            MOVE.L  #GRASFCOL, D3
            JSR     AGLADD
            
            ADD.W   #BLOCSIZE, D1
            DBRA.W  D5, .LOOPL      

           
                       
            MOVEM.L (A7)+, A1-A3
            MOVEM.L (A7)+, D0-D5 	; RESTORE REGISTERS
            RTS            
;-----------------------------------------------------------                      

SETDMNDS    

            MOVEM.L D0-D4, -(A7)	; STACK REGISTER
            MOVEM.L A0-A5, -(A7)
            
            MOVE.B  #7, D4
            LEA     DMNDINIT, A1
            LEA     DMNDUPD,  A2
            LEA     DMNDPLT, A3
            MOVE.W  #DMNDID, D0
            LEA  DMNDPOSX, A4
            LEA  DMNDPOSY, A5
            
.PRINTD                             
            MOVE.W  (A4),D1
            ;CMP.W     #0, D1
            ;BEQ     .END
            MOVE.W  (A5),D2
                        
            JSR     AGLADD
            
            ADDA.L  #2,A4
            ADDA.L  #2,A5
            
            DBRA    D4, .PRINTD             

.END
            MOVEM.L (A7)+, A0-A5
            MOVEM.L (A7)+, D0-D4	; RESTORE REGISTERS
            RTS    
           
;-----------------------------------------------------------               

            








*~Font name~Courier New~
*~Font size~12~
*~Tab type~0~
*~Tab size~4~
