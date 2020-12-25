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
                       
            MOVE.W  #SCRWIDTH/2,(PLAYERX)
	        MOVE.W  #50,(PLAYERY)

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
            BNE     .MOVER                  ; YES: MOVE LEFT
            RTS
                       
.MOVEL      CMP.W   #BLOCSIZE/2,(PLAYERX)      ; BELOW LEFT BOUNDARY?
            BGT     .DOL                    ; NO: MOVE
            RTS                             ; YES: END
.DOL        SUB.W   #PLYSPEED,(PLAYERX)        ; MOVE LEFT
            RTS
.MOVER      CMP.W   #SCRWIDTH-1-BLOCSIZE/2,(PLAYERX) ; HIGHER THAN RIGHT BOUNDARY?
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
            
      
            
.MOVEU      CMP.W   #BLOCSIZE/2,(PLAYERY)      ; ABOVE UP BOUNDARY?
            BGT     .DOU                    ; NO: MOVE
            RTS                             ; YES: END
.DOU        SUB.W   #PLYSPEED,(PLAYERY)        ; MOVE UP
            RTS
.MOVED      CMP.W   #SCRHEIGH-BLOCSIZE/2,(PLAYERY) ; HIGHER THAN DOWN BOUNDARY?
            BLT     .DOD                    ; NO: MOVE
            RTS                             ; YES: END
.DOD        ADD.W   #PLYSPEED,(PLAYERY)        ; MOVE DOWN
            RTS



;-----------------------------------------------------------



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
	        MOVEM.L (A7)+, D0-D4 	; RESTORE REGISTERS
	        
	        RTS








*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
