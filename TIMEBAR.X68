*-----------------------------------------------------------
* Title      : TIMEBAR MANAGEMENT
* Written by : MAURICI RUIZ PLAZA
* Date       : 14/01/2021
* Description: ALL ABOUT THE TIME BAR BEHAVIOR AND CONTROL
*-----------------------------------------------------------


;-----------------------------------------------------------
TIMEINIT
; INITIALIZE PLAYER
; INPUT	-   - NONE
; OUTPUT	- NONE  
; MODIFIES	- NONE	
;-----------------------------------------------------------
           ;  INITIAL VALUE OF TIME BAR (FULLY CHARGED)             
            
            MOVE.W  #TIMEINWD, TIMEX  
            RTS



;-----------------------------------------------------------
;-----------------------------------------------------------
TIMEUPD
; UPDATE PLAYER
; INPUT	    - NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            MOVEM.L D0, -(A7)	; STACK REGISTER

            
            ;---- DICREASE TIME CONTSTANTLY----------
            CMP.W   #0, DMNFOUND
            BGT .INCRTME
            CMP.W   #TIMEINX-45,(TIMEX)     ; IF THERE IS NO TIME
                                            ; LEFT END GAME
            BLT .END
            SUB.W   #1, (TIMEX)
            BRA .END
            
.INCRTME                            ; WHEN PICKING A DIAMOND
                                    ; INCREASING TIME
            MOVE.W  (TIMEX),D0
            ADD.W   #50, D0
            CMP.W   #TIMEINWD, D0
            BGT .BOUND
            ADD.W   #50, (TIMEX)            
            BRA .END
            
.BOUND                              ; MAX INCREASING UNTILL LIMIT
                                    ; TIME BAR WIDTH
            MOVE.W  (TIMEX),D0
            SUB.W   #TIMEINWD, D0
            NOT.W   D0
            ADD.W   D0, (TIMEX)
            
.END        
            MOVE.W  #0, DMNFOUND
            MOVEM.L (A7)+, D0 	; RESTORE REGISTERS       
            RTS



;-----------------------------------------------------------
;------------------------------------------------------------------------------------------------------
TIMEPLOT
; PLOT PLAYER
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            
            MOVEM.L D0-D4, -(A7)	; STACK REGISTER
	        MOVE.B	#80, D0	; SET PEN COLOR TASK
	        MOVE.L	#ORIPCOL, D1	; BLOCK COLOR
	        TRAP #15	; SET PEN COLOR
	       	        
	        MOVE.B	#81, D0	; SET FILL COLOR TASK
	        MOVE.L	#TMECOLOU,D1	; BLOCK COLOR
	        TRAP #15	; SET FILL COLOR
	        
	        
	        MOVE.W	#TIMEPOSX,D1	; D1:=XCENTER
	        MOVE.W	#TIMEPOSY,D2	; D2:=YCENTER
	        MOVE.W	D1, D3	; D3:=XFINAL
	        MOVE.W	D2, D4	; D4:=YFINAL
	
	        ADD.W	#TIMEWDTH, D3	; D3:=XRIGHT
	        ADD.W	#TIMEHEIG, D4	; D4:=YBOTTOM
	        MOVE.B	#87, D0
	        TRAP	#15	; DRAW BLOCK
	        
	        ;---- DRAWING THE TIME BAR INSIDE WHICH IS GOING TO
	        ;---- BE REDUCED-----------------------------------
	        
	        MOVE.B	#80, D0	; SET PEN COLOR TASK
	        MOVE.L	#ORIPCOL, D1	; BLOCK COLOR
	        TRAP #15	; SET PEN COLOR
	        MOVE.B	#93, D0	; SET WITDH PEN COLOR TASK
	        MOVE.B  #3, D1
	        TRAP    #15     ; TIME BAR SURROUNDIN
	        
	        MOVE.B	#81, D0	; SET FILL COLOR TASK
	        MOVE.L	#ORIPCOL,D1	; BLOCK COLOR
	        TRAP #15	; SET FILL COLOR
	        
	        
	        MOVE.W	#TIMEINX,D1	; D1:=XCENTER
	        MOVE.W	#TIMEINY,D2	; D2:=YCENTER
	        MOVE.W	D1, D3	; D3:=XFINAL
	        MOVE.W	D2, D4	; D4:=YFINAL
	
	        ADD.W	(TIMEX),D3	; D3:=XRIGHT
	        ADD.W	#TIMEINHG, D4	; D4:=YBOTTOM
	        MOVE.B	#87, D0
	        TRAP	#15	; DRAW BLOCK
	        
	        
	
	        MOVEM.L (A7)+, D0-D4 	; RESTORE REGISTERS
	        RTS

            RTS


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
