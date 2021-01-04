*-----------------------------------------------------------
* Title      : PLAYER MANAGEMENT
* Written by : MAURICI RUIZ PLAZA
* Date       : 20/12/2020
* Description: ALL ABOUT THE PLAYER BEHAVIOR AND CONTROL
*-----------------------------------------------------------


;-----------------------------------------------------------
PLYRINIT
; INITIALIZE PLAYER
; INPUT	-   - NONE 
; OUTPUT	- NONE  
; MODIFIES	- NONE	
;-----------------------------------------------------------
                       
            MOVE.W  #55,(PLAYERX)
	        MOVE.W  #50,(PLAYERY)
            MOVE.W  #0, (PLYERORI)
            
	        RTS


;-----------------------------------------------------------
PLYRUPDX
; UPDATE PLAYER
; INPUT	    - NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
	        BTST.B  #KBDBITLF,(KBDVAL)      ; LEFT KEY PRESSED?
            BNE     .MOVEL                  ; YES: MOVE LEFT
            BTST.B  #KBDBITRT,(KBDVAL)      ; RIGHT KEY PRESSED?
            BNE     .MOVER                  ; YES: MOVE RIGHT
            RTS
.MOVEL      MOVE.W  #1, (PLYERORI)
            CMP.W   #BLOCSIZE/2,(PLAYERX)      ; BELOW LEFT BOUNDARY?
            BGT     .DOL                    ; NO: MOVE
            RTS                             ; YES: END
.DOL        SUB.W   #PLYSPEED,(PLAYERX)        ; MOVE LEFT
            RTS
.MOVER      MOVE.W  #0, (PLYERORI)
            CMP.W   #SCRWIDTH-1-BLOCSIZE/2,(PLAYERX) ; HIGHER THAN RIGHT BOUNDARY?
            BLT     .DOR                    ; NO: MOVE
            RTS                             ; YES: END
.DOR        ADD.W   #PLYSPEED,(PLAYERX)        ; MOVE RIGHT
            RTS
            

;-----------------------------------------------------------
PLYRUPDY
; UPDATE PLAYER
; INPUT	    - NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
	        
            BTST.B  #KBDBITUP,(KBDVAL)      ; UP KEY PRESSED?
            BNE     .MOVEU                  ; YES: MOVE UP
            BTST.B  #KBDBITDN,(KBDVAL)      ; DOWN KEY PRESSED?
            BNE     .MOVED                  ; YES: MOVE DOWN
            RTS
            
      
            
.MOVEU      MOVE.W  #3, (PLYERORI)
            CMP.W   #BLOCSIZE/2,(PLAYERY)      ; ABOVE UP BOUNDARY?
            BGT     .DOU                    ; NO: MOVE
            RTS                             ; YES: END
.DOU        SUB.W   #PLYSPEED,(PLAYERY)        ; MOVE UP
            RTS
.MOVED      MOVE.W  #2, (PLYERORI)
            CMP.W   #SCRHEIGH-BLOCSIZE/2,(PLAYERY) ; HIGHER THAN DOWN BOUNDARY?
            BLT     .DOD                    ; NO: MOVE
            RTS                             ; YES: END
.DOD        ADD.W   #PLYSPEED,(PLAYERY)        ; MOVE DOWN
            RTS



;-----------------------------------------------------------
;-----------------------------------------------------------
PLYRUPD
; UPDATE PLAYER
; INPUT	    - NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
	        
            BTST.B  #KBDBITLF,(KBDVAL)      ; LEFT KEY PRESSED?
            BNE     .MOVEL                  ; YES: MOVE LEFT
            BTST.B  #KBDBITRT,(KBDVAL)      ; RIGHT KEY PRESSED?
            BNE     .MOVER                  ; YES: MOVE RIGHT
            

            BTST.B  #KBDBITUP,(KBDVAL)      ; UP KEY PRESSED?
            BNE     .MOVEU                  ; YES: MOVE UP
            BTST.B  #KBDBITDN,(KBDVAL)      ; DOWN KEY PRESSED?
            BNE     .MOVED                  ; YES: MOVE DOWN
            RTS
            
            
.MOVEL      MOVE.W  #1, (PLYERORI)
            CMP.W   #BLOCSIZE/2,(PLAYERX)      ; BELOW LEFT BOUNDARY?
            BGT     .DOL                    ; NO: MOVE
            RTS                             ; YES: END
.DOL        SUB.W   #PLYSPEED,(PLAYERX)        ; MOVE LEFT
            RTS
.MOVER      MOVE.W  #0, (PLYERORI)
            CMP.W   #SCRWIDTH-1-BLOCSIZE/2,(PLAYERX) ; HIGHER THAN RIGHT BOUNDARY?
            BLT     .DOR                    ; NO: MOVE
            RTS                             ; YES: END
.DOR        ADD.W   #PLYSPEED,(PLAYERX)        ; MOVE RIGHT
            RTS
      
            
.MOVEU      MOVE.W  #3, (PLYERORI)
            CMP.W   #BLOCSIZE/2,(PLAYERY)      ; ABOVE UP BOUNDARY?
            BGT     .DOU                    ; NO: MOVE
            RTS                             ; YES: END
.DOU        SUB.W   #PLYSPEED,(PLAYERY)        ; MOVE UP
            RTS
.MOVED      MOVE.W  #2, (PLYERORI)
            CMP.W   #SCRHEIGH-BLOCSIZE/2,(PLAYERY) ; HIGHER THAN DOWN BOUNDARY?
            BLT     .DOD                    ; NO: MOVE
            RTS                             ; YES: END
.DOD        ADD.W   #PLYSPEED,(PLAYERY)        ; MOVE DOWN
            RTS



;-----------------------------------------------------------
;------------------------------------------------------------------------------------------------------


PLYRPLOT
; PLOT PLAYER
; INPUT	- NONE
; OUTPUT	- NONE
; MODIFIES	- NONE	
;-----------------------------------------------------------
	        MOVEM.L D0-D4, -(A7)	; STACK REGISTER
	        MOVE.B	#80, D0	; SET PEN COLOR TASK
	        MOVE.L	#PLYRCOL, D1	; PLAYER COLOR
	        TRAP #15	; SET PEN COLOR
	        MOVE.B	#81, D0	; SET FILL COLOR TASK
	        MOVE.L	#PLYRCOL,D1	; BLOCK COLOR
	        TRAP #15	; SET FILL COLOR
	
	        MOVE.W	(PLAYERX),D1	; D1:=XCENTER
	        MOVE.W	(PLAYERY),D2	; D2:=YCENTER
	        MOVE.W	D1, D3	; D3:=XCENTER
	        MOVE.W	D2, D4	; D4:=YCENTER
	
	        SUB.W	#BLOCSIZE/2, D1	; D1:=XLEFT
	        SUB.W	#BLOCSIZE/2, D2	; D2:=YTOP
	        ADD.W	#BLOCSIZE/2, D3	; D3:=XRIGHT
	        ADD.W	#BLOCSIZE/2, D4	; D4:=YBOTTOM
	        MOVE.B	#87, D0
	        TRAP	#15	; DRAW PLAYER
	        
	        
	        ; DRAW ORIENTATION OF PLAYER
	        
	        MOVE.B	#80, D0	; SET PEN COLOR TASK
	        MOVE.L	#PLYRCOL, D1	; PLAYER COLOR
	        TRAP #15	; SET PEN COLOR
	        MOVE.B	#81, D0	; SET FILL COLOR TASK
	        MOVE.L	#ORIPCOL, D1	; BLOCK COLOR
	        TRAP #15	; SET FILL COLOR
	        
	        MOVE.W	(PLAYERX),D1	; D1:=XCENTER
	        MOVE.W	(PLAYERY),D2	; D2:=YCENTER
	        MOVE.W	D1, D3	; D3:=XCENTER
	        MOVE.W	D2, D4	; D4:=YCENTER
	        
	        CMP.W   #3, (PLYERORI)
	        BEQ .ORIT
	        CMP.W   #2, (PLYERORI)
	        BEQ .ORIB
            CMP.W   #1, (PLYERORI)
	        BEQ .ORIL           	        

	        
	        ; ORIENTATION RIGHT
	        
.ORIR       
	        ADD.W	#BLOCSIZE/2-10, D1	; D1:=XLEFT
	        SUB.W	#5, D2	; D2:=YTOP
	        ADD.W	#BLOCSIZE/2, D3	; D3:=XRIGHT
	        ADD.W	#5, D4	; D4:=YBOTTOM
	        BRA .PAINT
	        
	        ; ORIENTATION BOTTOM
	        
.ORIB       
	        SUB.W	#5, D1	; D1:=XLEFT
	        ADD.W	#BLOCSIZE/2-10, D2	; D2:=YTOP
	        ADD.W	#5, D3	; D3:=XRIGHT
	        ADD.W	#BLOCSIZE/2, D4	; D4:=YBOTTOM
	        BRA .PAINT
	        
	        ; ORIENTATION LEFT
	        
.ORIL       
	        SUB.W	#BLOCSIZE/2, D1	; D1:=XLEFT
	        SUB.W	#5, D2	; D2:=YTOP
	        SUB.W	#BLOCSIZE/2-10, D3	; D3:=XRIGHT
	        ADD.W	#5, D4	; D4:=YBOTTOM
	        BRA .PAINT
   
	        
	        ; ORIENTATION TOP
	        
.ORIT       	
	        SUB.W	#5, D1	; D1:=XLEFT
	        SUB.W	#BLOCSIZE/2, D2	; D2:=YTOP
	        ADD.W	#5, D3	; D3:=XRIGHT
	        SUB.W	#BLOCSIZE/2-10, D4	; D4:=YBOTTOM
	        
	        
	        
	        
.PAINT      MOVE.B	#87, D0
	        TRAP	#15	; DRAW PLAYER
	        
	        
	        
	        
	        MOVEM.L (A7)+, D0-D4 	; RESTORE REGISTERS
	        
	        RTS















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
