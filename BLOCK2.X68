*-----------------------------------------------------------
* Title      : BLOCK MANAGEMENT
* Written by : MAURICI RUIZ PLAZA
* Date       : 28/12/2020
* Description: ALL ABOUT THE TIME BLOCK BEHAVIOR AND CONTROL
*-----------------------------------------------------------
;-----------------------------------------------------------
BLOCINIT
; INITIALIZE BLOCK
; INPUT	-   D1.W  X PLACE COORDINATE
;          - D2.W  Y PLACE COORDINATE 
;          - D3.L  BLOCK COLOR
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
                       
    MOVE.W	D1, (A0)
	MOVE.W	D2, 2(A0)
	MOVE.L	D3, 4(A0)
	
	
	RTS


;-----------------------------------------------------------
;-----------------------------------------------------------
BLOCUPD
; UPDATE BLOCK
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            MOVEM.L D0-D7, -(A7)	; STACK REGISTER
            
            CLR D0
            CLR D1
            
            
            

            MOVE.W  (PLAYERX),D0  ; PLAYER X
            MOVE.W  (PLAYERY),D1  ; PLAYER Y
            
            MOVE.W   (A0),D2  ; BLOCK X
            MOVE.W  2(A0),D3  ; BLOCK Y
            
            
            
;---------- CHECK IF PLAYER IN LEFT SIDE OF BLOCK------------

            ADD.W   #50, D1     ; BOT OF PLAYER                 
            SUB.W   #BLOCSIZE/2-15, D3      ; TOP OF BLOCK - 10
               
                       
            CMP.W   D3, D1
            BLT     .CPABOVE
            
            ADD.W   #BLOCSIZE-15, D3       ; BOT OF BLOCK
            ADD.W   #5, D1          ; TOP OF PLAYER 
            CMP.W   D3, D1              ; TOP PLAYER Y > BOT OF BLOCK-10? YES: JUMP
            BGT .CPUNDER
            
            ADD.W   #22, D0     ; CENTER OF PLAYER            
            CMP.W   D2, D0          ; CENTER PLAYER > BLOCKX? YES: JUMP
            BGT .CPINRHT
                               
 
            ADD.W   #18, D0       ; RIGHT OF PLAYER            
            SUB.W   #BLOCSIZE/2, D2       ; LEFT OF BLOCK
            CMP.W   D2, D0
            BGT .BLKLFT
            BRA .END
            
            ;---------- CHECK IF PLAYER IN RIGHT SIDE OF BLOCK------------
            
; 'CHECK IF PLAYER IN RIGHT'               
.CPINRHT    
            ; D0 PLAYER X
            ; D1 PLAYER Y 
            ; D2 BLOCK X
            ; D3 TOP OF BLOCK
            SUB.W   #25, D0     ; LEFT OF PLAYER
            ADD.W   #BLOCSIZE/2, D2     ; RIGHT OF BLOCK
            CMP.W   D2, D0              ; LEFT PLAYERX  > RIGHT OF BLOCK? YES: JUMP
            BGT     .END
            BRA .BLKRHT
            BRA .END
            
            
            ;---------- CHECK IF PLAYER ABOVE THE BLOCK------------
            ; WE ALREADY KNOW PLAYER IS ABOVE THE PLAYER
            ; NOW WE HAVE TO CHECK IF PLAYER IS IN THE SAME X ZONE OF THE BLOCK
            ; BOT OF PLAYER < TOP OF BLOCK

; 'CHECK IF PLAYER ABOVE'               
.CPABOVE            
            ; D0 PLAYER X
            ; D1 BOT OF PLAYER 
            ; D2 BLOCK X
            ; D3 TOP OF BLOCK - 10
            
            ; CHECK BOTTOM'S PLAYER WITH TOP'S BLOCK           
            SUB.W   #15, D3     ; TOP OF BLOCK
            CMP.W   D3, D1
            BLT .END            
                  
            SUB.W   #BLOCSIZE/2-5, D2 ; LEFT BLOCK
            ADD.W   #45, D0 ; RIGHT PLAYER
            CMP.W   D2, D0
            BGT .CHKXL
            BRA .END
.CHKXL      ADD.W   #BLOCSIZE+10, D2   ; RIGHT OF BLOCK
            CMP.W   D2, D0
            BLT .BLKABVE        
           
            BRA .END

    
            
            ;---------- CHECK IF PLAYER UNDER THE BLOCK------------
            ; WE ALREADY KNOW PLAYER IS UNDER THE PLAYER
            ; NOW WE HAVE TO CHECK IF PLAYER IS IN THE SAME X ZONE OF THE BLOCK
            ; TOP OF PLAYER > BOT OF BLOCK

.CPUNDER    

            ; D0 PLAYER X
            ; D1 TOP OF PLAYER
            ; D2 BLOCK X
            ; D3 BOT OF BLOCK - 10 
            
            ; CHECK TOP OF PLAYER WITH BOT OF BLOCK
            
            ADD.W   #26, D1     ; PLAYER Y CENTER
            ADD.W   #65, D3     ; BOT OF BLOCK
            CMP.W   D3, D1      ;  PLAYER Y CENTER < BOT OF BLOCK? YES: CHECK X
            BGT .END              
                 
            SUB.W   #BLOCSIZE/2-5, D2 ; LEFT BLOCK
            ADD.W   #45, D0 ; RIGHT PLAYER
            CMP.W   D2, D0
            BLT .END
            ADD.W   #BLOCSIZE+10, D2   ; RIGHT OF BLOCK
            CMP.W   D2, D0
            BLT .BLKDWN
            BRA  .END       
                        
.BLKABVE      
            MOVE.W  2(A0),D5
            SUB.W   #75, D5
            MOVE.W  D5, (PLAYERY)            
            BRA .KILLB 
            
.BLKDWN     
            MOVE.W  2(A0),D5
            ADD.W   #5, D5
            MOVE.W  D5, (PLAYERY)            
            BRA .KILLB
            
.BLKLFT     
           
            MOVE.W  (A0),D5
            SUB.W   #65, D5
            MOVE.W  D5, (PLAYERX)                      
            BRA .KILLB
            
.BLKRHT 
            MOVE.W  (A0),D5
            ADD.W   #BLOCSIZE/2, D5
            MOVE.W  D5, (PLAYERX)
            



.KILLB      BTST.B  #KBDCHRMK,(KBDVAL)      ; M KEY PRESSED?
            BNE     .KILLF                 ; YES: BREAK?
            BRA .END
.KILLF      JSR     AGLKILL
                            
                                    
.END        
            MOVEM.L (A7)+, D0-D7
            RTS
;-----------------------------------------------------------

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


;-----------------SUBRUTINE TO CHECK COLLISIONS----------------
; CHECK COLLISIONS
; INPUT	-   D0.W - PLAYER COORDINATE X
;           D1.W - PLAYER COORDINATE Y
;           D2.W - BLOCK COORDINATE X 
;           D3.W - BLOCK COORDINATE Y
;
; OUTPUT	-   D0.W :    0 --> IF THERE IS NOT A COLLISION
;           D0.W :    1 --> IF THERE IS A COLLISION
;           
; MODIFIES	- NONE	
;-----------------------------------------------------------
CHEKSIDE
        ;------ CHECK INFERIOR PART X ------------------------
        SUB.W   #BLOCSIZE/2+10, D2
        CMP.W   D2, D0
        BLT .END
        ;------ CHECK SUPERIOR PART X ------------------------
        ADD.W   #BLOCSIZE+20, D2
        CMP.W   D2, D0
        BGT .END
        
        ;------ CHECK INFERIOR PART Y ------------------------
        SUB.W   #BLOCSIZE/2+10, D2
        CMP.W   D2, D0
        BLT .END
        ;------ CHECK SUPERIOR PART Y ------------------------
        ADD.W   #BLOCSIZE+20, D2
        CMP.W   D2, D0
        BGT .END

             
            
            
.END    MOVE.W  #0, D0
        RTS




















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
