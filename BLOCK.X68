*-----------------------------------------------------------
* Title      : BLOCK MANAGEMENT
* Written by : MAURICI RUIZ PLAZA
* Date       : 15/12/2020
* Description: ALL ABOUT THE BLOCK BEHAVIOR
*-----------------------------------------------------------

;-----------------------------------------------------------
BLOCINIT
; INITIALIZE BLOCK
; INPUT	- D1.W  X PLACE COORDINATE
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
BLOCUPD
; UPDATE BLOCK
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            MOVEM.L D0-D4, -(A7)	; STACK REGISTER
            
            CLR D0
            CLR D1
            
            JSR     BREAKBLOC
          
            ; CHECK BOTTOM'S PLAYER WITH TOP'S BLOCK
            MOVE.W  (PLAYERY),D0            
            ADD.W   #BLOCSIZE/2, D0         ; BOTTOM OF PLAYER
            
            MOVE.W  2(A0),D1
            SUB.W   #BLOCSIZE/2, D1         ; TOP OF BLOCK

            CMP.W   D1, D0
            BGT     .CHKB
            BRA     .END
            
.CHKB       SUB.W  #BLOCSIZE, D0            ; TOP OF PLAYER             
            ADD.W  #BLOCSIZE-8, D1            ; BOTTOM OF BLOCK

            CMP.W  D1, D0
            BLT    .CHKPRHT 
            
            ; CHECK IF PLAYER COLLISION WITH BOTTOM OF BLOCK
            
                        
            MOVE.W  (PLAYERX),D0
            MOVE.W  (A0),D1
            SUB.W   #10, D1
            CMP.W   D1, D0
            BLT     .ENDF
            ADD.W   #20, D1
            CMP.W   D1, D0
            BGT     .ENDF
            MOVE.W  (PLAYERY), D0
            SUB.W   #BLOCSIZE/2, D0         ; TOP OF PLAYER
            MOVE.W  2(A0), D1
            ADD.W   #BLOCSIZE/2, D1         ; BOT OF BLOCK
            CMP.W   D1, D0
            BLE     .BLOCKB
            
            
            BRA     .ENDF
                     
            
.CHKPRHT    
            ; CHECK RIGHT'S PLAYER WITH LEFT'S BLOCK
            MOVE.W  (PLAYERX),D0            
            ADD.W   #BLOCSIZE/2, D0         ; RIGHT OF PLAYER
            
            MOVE.W  (A0),D1                 ; BLOCKX 
            
            CMP.W   D1, D0
            BLT     .CHKPINL
            
            
            ; CHECK LEFT'S PLAYER WITH RIGHT'S BLOCK
            
.CHKPLFT    SUB.W   #BLOCSIZE, D0           ; LEFT OF PLAYER
                        
            CMP.W   D1, D0
            BGT     .CHKPINR
            
            BRA .END
            
            
.CHKPINL    
            SUB.W #BLOCSIZE/2, D1               ; LEFT SIDE OF BLOCK 
                                            
            CMP.W   D1, D0
            BGE     .BLOCKL
            
            ADD.W   #BLOCSIZE/2, D1           ; BLOCKX            
            BRA .CHKPLFT
            

.CHKPINR      
            ADD.W #BLOCSIZE/2, D1           ; THE RIGHT SIDE OF THE BLOCK
            CMP.W   D1, D0
            BLT     .BLOCKR
            BRA .END
           
            
.END        ; CHECK BOTTOM'S PLAYER WITH TOP'S BLOCK

            CLR D0
            CLR D1
          
            ; CHECK BOTTOM'S PLAYER WITH TOP'S BLOCK
            MOVE.W  (PLAYERY),D0            
            ADD.W   #BLOCSIZE/2, D0         ; BOTTOM OF PLAYER
            
            MOVE.W  2(A0),D1
            SUB.W   #BLOCSIZE/2, D1         ; TOP OF BLOCK

            CMP.W   D1, D0
            BLE     .ENDF


            MOVE.W  (PLAYERX),D0            
            ADD.W   #BLOCSIZE/2, D0         ; RIGHT OF PLAYER
            
            MOVE.W  (A0),D1
            SUB.W   #BLOCSIZE/2, D1         ; LEFT OF BLOCK
            
            CMP.W   D1, D0
            BGT     .CHKPINT
     
            
.ENDF       MOVEM.L (A7)+, D0-D4
            RTS
            
            
.BLOCKL     
            MOVE.W (A0),D4
            SUB.W   #BLOCSIZE, D4
            MOVE.W D4, (PLAYERX)
            BRA .END

.BLOCKR     
            MOVE.W (A0),D4
            ADD.W   #BLOCSIZE, D4
            MOVE.W D4, (PLAYERX)
            BRA .END 

.BLOCKT     
            MOVE.W  2(A0),D4
            SUB.W   #BLOCSIZE, D4
            MOVE.W D4, (PLAYERY)
            
            BRA .ENDF  


.BLOCKB     
            MOVE.W  2(A0),D4
            ADD.W   #BLOCSIZE, D4
            MOVE.W D4, (PLAYERY)
            
            BRA .ENDF 


.CHKPINT    
            ADD.W   #BLOCSIZE, D1           ; RIGHT SIDE OF BLOCK
            CMP.W   D1, D0
            BLT     .BLOCKT
            
            SUB.W   #BLOCSIZE, D0           ; LEFT OF PLAYER
            CMP.W   D1, D0
            BLT     .BLOCKT
            
            BRA .ENDF     
            

;-----------------------------------------------------------
BREAKBLOC
; BREAK BLOCK IN FRONT OF PLAYER WHEN SPACEKEY IS PRESSED
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
            MOVEM.L D0-D4, -(A7)	; STACK REGISTER
            
            BTST.B  #KBDCHRMK,(KBDVAL)      ; M KEY PRESSED?
            BNE     .BREAK                  ; YES: BREAK?
            BRA     .END
            
            
.BREAK      
            CMP.W   #2, (PLYERORI)          ; ORIPLAYER LEFT OR RIGHT?
            BLT     .RORL                   ; YES: JUMP
                                            ; NO : THEN BOT OR TOP
.BORT       MOVE.W  (PLAYERX),D0            
            MOVE.W  (A0),D1
            SUB.W   #10, D1
            MOVE.W  #2, D2
            MOVE.W  #3, D3

            BRA     .CHKZNE
            
.RORL       MOVE.W  (PLAYERY),D0            
            MOVE.W  2(A0),D1
            SUB.W   #10, D1
            MOVE.W  #0, D2
            MOVE.W  #1, D3
            
                                            ; SIMILAR IN OPPOSITE CASE WITH Y
.CHKZNE     CMP.W   D1, D0                  ; PLAYERX > BLOCKX-10?
            BLT     .END                    ; NO: JUMP
            ADD.W   #20, D1                 
            CMP.W   D1, D0                  ; PLAYERX < BLOCKX +10 ?
            BGT     .END                    ; NO: JUMP
                                    
            
            
            CMP.W   #1, (PLYERORI)          ; ORIPLAYER == 1? 
            BEQ     .ORIONE                ; YES: JUMP TO PLAYER ORI TOP
            
            CMP.W   #0, (PLYERORI)          ; ORIPLAYER == 1? 
            BEQ     .ORIZERO                ; NO: JUMP TO PLAYER ORI TOP
            
            CMP.W   #3, (PLYERORI)          ; ORIPLAYER == 1? 
            BEQ     .ORITRI                ; NO: JUMP TO PLAYER ORI TOP
            
            CMP.W   #2, (PLYERORI)          ; ORIPLAYER == 1? 
            BEQ     .ORITWO
            BRA     .END
                                                           
.ORIONE    MOVE.W  (PLAYERX),D0
            MOVE.W  (A0),D1
            BRA     .ONECHK
            
            
.ORITRI     MOVE.W  (PLAYERY),D0
            MOVE.W  2(A0),D1
            
.ONECHK    ADD.W   #BLOCSIZE+5, D1
            
            CMP.W   D1, D0                  ; PX/PY < BX/BY-BLOCSIZE-5
            BGT     .END                    ; NO: JUMP
            SUB.W   #25, D1
            CMP.W   D1, D0
            BLT     .END
            BRA     .KILLB
            

.ORIZERO     MOVE.W  (PLAYERX),D0
            MOVE.W  (A0),D1
            BRA     .ZEROCHK
            
            
.ORITWO     MOVE.W  (PLAYERY),D0
            MOVE.W  2(A0),D1            
            

.ZEROCHK     SUB.W   #BLOCSIZE+5, D1
            
            CMP.W   D1, D0                  ; PX/PY > BX/BY-BLOCSIZE-5
            BLT     .END                    ; NO: JUMP
            ADD.W   #25, D1
            CMP.W   D1, D0
            BGT     .END
            BRA     .KILLB
            
                                                
                                         
.END        MOVEM.L (A7)+, D0-D4 	; RESTORE REGISTERS
            RTS


.KILLB        
            JSR     AGLKILL
            BRA     .END  

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
