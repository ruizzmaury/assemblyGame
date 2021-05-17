*-----------------------------------------------------------
* Title      : GAME OVER IMAGE PRINT 
* Written by : MAURICI RUIZ PLAZA
* Date       : 14/01/2021
* Description: ALL ABOUT THE TIME BAR BEHAVIOR AND CONTROL
*-----------------------------------------------------------
 
;-----------------------------------------------------------
GOVERPLT
; PLOT BLOCK
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
	    MOVEM.L D0-D4, -(A7)	; STACK REGISTER
	    MOVEM.L A0-A4,-(A7)	; STACK REGISTER

	    LEA GOVERDRW,    A1  ; EA OF GAME OVER BGR
	    LEA GOVERX,      A2  ; X DRAW GAME OVER
	    LEA GOVERY,      A3  ; Y DRAW GAME OVER
    
.NXTCOL 
        MOVE.B  #80, D0     ; SET PEN COLOR TASK
        MOVE.L  (A1),D1
        TRAP    #15
        CMP.L   #$01234567, D1
        BEQ .END
    
        CLR.L   D0
        CLR.L   D1
        CLR.L   D2
	
	    MOVE.B  (A2),D1
	    ADD.W   #SCRWIDTH/2-125,D1     ; X PIXEL
	    MOVE.B  (A3),D2
	    ADD.W   #200,D2	; Y PIXEL
	    MOVE.B  #82, D0     ; SET DRAW PIXEL TASK
        TRAP    #15
	
	    ADDA.L  #4,A1
        ADDA.L  #1,A2
        ADDA.L  #1,A3
     
        BRA .NXTCOL
     
			
.END	MOVEM.L (A7)+, A0-A4
        MOVEM.L (A7)+, D0-D4 	; RESTORE REGISTERS
	    RTS


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
