*-----------------------------------------------------------
* Title      : BLOCK MANAGEMENT
* Written by : MAURICI RUIZ PLAZA
* Date       : 15/12/2020
* Description: ALL ABOUT THE BLOCK BEHAVIOR
*-----------------------------------------------------------

COLORB      DC.L    0

;-----------------------------------------------------------
BLOCINIT
; INITIALIZE BLOCK
; INPUT	- D1.W  STONE PLACE COORDINATE 
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
                       
            MOVE.W	D1, (A0)
	 MOVE.W	D2, 2(A0)
	 MOVE.L	D3, 4(A0)
	
	
	RTS


;-----------------------------------------------------------
BLOCUPD
; UPDATE BLOCK
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
	RTS



;-----------------------------------------------------------
BLOCPLOT
; PLOT BLOCK
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
	MOVEM.L D0-D4, -(A7)	; STACK REGISTER
	MOVE.B	#80, D0	; SET PEN COLOR TASK
	MOVE.L	#BLOCPCOL, D1	; BLOCK COLOR
	TRAP #15	; SET PEN COLOR
	MOVE.B	#81, D0	; SET FILL COLOR TASK
	MOVE.L	4(A0),D1	; BLOCK COLOR
	TRAP #15	; SET FILL COLOR
	
	MOVE.W	(A0),D1	; D1:=XCENTER
	MOVE.W	2(A0),D2	; D2:=YCENTER
	MOVE.W	D1, D3	; D3:=XCENTER
	MOVE.W	D2, D4	; D4:=YCENTER
	
	SUB.W	#BLOCSIZE/2, D1	; D1:=XLEFT
	SUB.W	#BLOCSIZE/2, D2	; D2:=YTOP
	ADD.W	#BLOCSIZE/2, D3	; D3:=XRIGHT
	ADD.W	#BLOCSIZE/2, D4	; D4:=YBOTTOM
	MOVE.B	#87, D0
	TRAP	#15	; DRAW BLOCK
	MOVEM.L (A7)+, D0-D4 	; RESTORE REGISTERS
	RTS






*~Font name~Courier New~
*~Font size~12~
*~Tab type~0~
*~Tab size~4~
