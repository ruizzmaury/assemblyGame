*-----------------------------------------------------------
* Title      : BLOCK MANAGEMENT
* Written by : MAURICI RUIZ PLAZA
* Date       : 15/12/2020
* Description: ALL ABOUT THE BLOCK BEHAVIOR
*-----------------------------------------------------------

;-----------------------------------------------------------
DMNDINIT
; INITIALIZE BLOCK
; INPUT	- D1.W  X PLACE COORDINATE
;          - D2.W  Y PLACE COORDINATE 
;          - D3.L  BLOCK COLOR
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
                       
            MOVE.W	D1, (A0)
	        MOVE.W	D2, 2(A0)
	        
	
	
	        RTS


;-----------------------------------------------------------
DMNDUPD
; UPDATE BLOCK
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            MOVEM.L D0-D4, -(A7)	; STACK REGISTER
            
            CLR D0
            CLR D1         

            MOVE.W  (PLAYERX),D0  ; PLAYER X
            MOVE.W  (PLAYERY),D1  ; PLAYER Y
            
            MOVE.W   (A0),D2  ; LEFT OF DIAMOND
            MOVE.W  2(A0),D3  ; TOP OF DIAMOND
            
            ADD.W   #PLYRWDTH/2, D0 ; PLAYER X CENTER
            ADD.W   #PLYRHEIG/2, D1 ; PLAYER Y CENTER

            
            ADD.W   #DMNDWDTH/2, D2 ; DIAMOND X CENTER
            ADD.W   #DMNDHEIG/2, D3 ; DIAMOND Y CENTER
            
            
            SUB.W   D2, D0  ; PLAYER X - DIAMOND X
            SUB.W   D3, D1  ; PLAYER Y - DIAMOND Y
            
            CMP.W   #0, D0
            BGE .CHKX                       
            NOT.W   D0
.CHKX       CMP.W   #DMNDWDTH/2, D0
            BLT .CHKXY
            BRA .END
.CHKXY      CMP.W   #0, D1
            BGE .CHKY                       
            NOT.W   D1
.CHKY       CMP.W   #DMNDWDTH/2, D1
            BLT .KILLF
            BRA .END
            
            
.KILLF      JSR     AGLKILL
            MOVE.W   #1, DMNFOUND
            ADD.W   #1, CONTDMND    
                                    
.END                                            
            MOVEM.L (A7)+, D0-D4 	; RESTORE REGISTERS

            RTS     



;-----------------------------------------------------------
DMNDPLOT
; PLOT BLOCK
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
	MOVEM.L D0-D4, -(A7)	; STACK REGISTER
	MOVE.B	#80, D0	; SET PEN COLOR TASK
	;MOVE.L	#DMNDCOL, D1	; BLOCK COLOR
	TRAP #15	; SET PEN COLOR
	MOVE.B	#81, D0	; SET FILL COLOR TASK
	;MOVE.L	#DMNDCOL,D1	; BLOCK COLOR
	TRAP #15	; SET FILL COLOR
	
	MOVE.W	(A0),D1	; D1:=XCENTER
	MOVE.W	2(A0),D2	; D2:=YCENTER
	MOVE.W	D1, D3	; D3:=XCENTER
	MOVE.W	D2, D4	; D4:=YCENTER
	
	SUB.W	#BLOCSIZE/2, D1	; D1:=XLEFT
	SUB.W	#BLOCSIZE/2, D2	; D2:=YTOP
	ADD.W	#BLOCSIZE/2, D3	; D3:=XRIGHT
	ADD.W	#BLOCSIZE/2, D4	; D4:=YBOTTOM
	MOVE.B	#88, D0
	TRAP	#15	; DRAW BLOCK
	
			
	MOVEM.L (A7)+, D0-D4 	; RESTORE REGISTERS
	RTS


;-----------------------------------------------------------
DMNDPLT
; PLOT BLOCK
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
	    MOVEM.L D0-D4, -(A7)	; STACK REGISTER
	
	    LEA DMNDGFX,    A1  ; EA OF DIAMOND BGR
	    LEA DMNDX,      A2  ; X DRAW DIAMOND
	    LEA DMNDY,      A3  ; Y DRAW DIAMOND
    
.NXTCOL 
        MOVE.B  #80, D0     ; SET PEN COLOR TASK
        MOVE.L  (A1), D1
        TRAP    #15
        CMP.L   #$01234567, D1
        BEQ .END
    
        CLR.L   D0
        CLR.L   D1
        CLR.L   D2
	
	    MOVE.B  (A2),D1
	    ADD.W   (A0),D1     ; X PIXEL
	    MOVE.B  (A3),D2
	    ADD.W   2(A0),D2	; Y PIXEL
	    MOVE.B  #82, D0     ; SET DRAW PIXEL TASK
        TRAP    #15
	
	    ADDA.L  #4,A1
        ADDA.L  #1,A2
        ADDA.L  #1,A3
     
        BRA .NXTCOL
     
			
.END	MOVEM.L (A7)+, D0-D4 	; RESTORE REGISTERS
	    RTS















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
