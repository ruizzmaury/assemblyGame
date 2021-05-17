; =============================================================================
; TITLE    : CRAZY MINER
; AUTHOR   : MAURICI RUIZ PLAZA
; CREATION : 16-01-2020
; =============================================================================

; -----------------------------------------------------------------------------
STAINIT
; INITALIZES THE STATE MANAGER
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVE.W  #-1,(STACUR)            ; INVALID STATE, JUST TO FORCE INIT
            MOVE.W  #0,(STANEXT)            ; INITIAL STATE
            RTS

; -----------------------------------------------------------------------------
STAUPD
; PERFORMS STATE UPDATE AND INIT IF NECESSARY
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVEM.L D0/A0,-(A7)
            CLR.L   D0
            MOVE.W  (STANEXT),D0
            CMP.W   (STACUR),D0
            BEQ     .DOUPD
            MOVE.W  D0,(STACUR)             ; IF STATE CHANGED, DO INIT
            LSL.L   #2,D0
            MOVE.L  D0,A0
            MOVE.L  .INITBL(A0),A0
            JSR     (A0)
.DOUPD      CLR.L   D0                      ; IN ANY CASE, DO UPDATE
            MOVE.W  (STACUR),D0
            LSL.L   #2,D0
            MOVE.L  D0,A0
            MOVE.L  .UPDTBL(A0),A0
            JSR     (A0)
            MOVEM.L (A7)+,D0/A0
            RTS
.INITBL     DC.L    STAINTIN,STAPLAYI,STAOVIN
.UPDTBL     DC.L    STAINTUP,STAPLAYU,STAOVUP

; -----------------------------------------------------------------------------
STAPLOT
; PERFORMS STATE PLOT
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVEM.L D0/A0,-(A7)
            CLR.L   D0
            MOVE.W  (STACUR),D0
            LSL.L   #2,D0
            MOVE.L  D0,A0
            MOVE.L  .PLTTBL(A0),A0
            JSR     (A0)
            MOVEM.L (A7)+,D0/A0
            RTS
.PLTTBL     DC.L    STAINTPL,STAPLAYP,STAOVPL

; -----------------------------------------------------------------------------
STAEMPTY
; EMPTY SUBROUTINE FOR CASES WITH NOTHING TO DO
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; NOTE     - JUST A PLACEHOLDER. NOTHING TO DO.
; -----------------------------------------------------------------------------
            RTS
            

STAINTIN    EQU     STAEMPTY     
; GAME INTRO INITIALIZATION
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            

            ;RTS

; -----------------------------------------------------------------------------

STAINTUP
; GAME INTRO UPDATE
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------

            BTST.B  #KBDBITF1,(KBDEDGE)
            BEQ     .END
            MOVE.W  #STAGAME,(STANEXT)
.END        RTS

            RTS
; -----------------------------------------------------------------------------

STAINTPL
; GAME INTRO PLOT
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVEM.L D0-D1/A1,-(A7)          ; STACK REGISTERS
            
            
            
            MOVE.W  #((160-12)/2)<<8|27,D1   ; FIRST TEXT COORDINATES
            MOVE.B  #11,D0
            TRAP    #15                     ; LOCATE TEXT CURSOR
            LEA     .STR0,A1                ; STRING POINTER
            MOVE.B  #13,D0                  ; PRINT STRING TASK
            TRAP    #15                     ; DO IT
            
            MOVE.W  #((160-30)/2)<<8|29,D1   ; FIRST TEXT COORDINATES
            MOVE.B  #11,D0
            TRAP    #15                     ; LOCATE TEXT CURSOR
            LEA     .STR1,A1                ; STRING POINTER
            MOVE.B  #13,D0                  ; PRINT STRING TASK
            TRAP    #15                     ; DO IT
            
            
            MOVE.W  #((160-26)/2)<<8|35,D1   ; FIRST TEXT COORDINATES
            MOVE.B  #11,D0
            TRAP    #15                     ; LOCATE TEXT CURSOR
            LEA     .STR3,A1                ; STRING POINTER
            MOVE.B  #13,D0                  ; PRINT STRING TASK
            TRAP    #15
            
            
            MOVE.W  #((160-22)/2)<<8|37,D1   ; FIRST TEXT COORDINATES
            MOVE.B  #11,D0
            TRAP    #15                     ; LOCATE TEXT CURSOR
            LEA     .STR4,A1                ; STRING POINTER
            MOVE.B  #13,D0                  ; PRINT STRING TASK
            TRAP    #15
            
            
            BTST.B  #3,(SCRCYCCT)
            BEQ     .END
    
            MOVE.W  #((160-20)/2)<<8|39,D1   ; FIRST TEXT COORDINATES
            MOVE.B  #11,D0
            TRAP    #15                     ; LOCATE TEXT CURSOR
            LEA     .STR2,A1                ; STRING POINTER
            MOVE.B  #13,D0                  ; PRINT STRING TASK
            TRAP    #15                     ; DO IT
            
.END        
            JSR GINITPLT              
            MOVEM.L (A7)+,D0-D1/A1
            RTS
.STR0       DC.B    'CRAZY  MINER',0
.STR1       DC.B    '~ THE EIGHT SACRED DIAMONDS ~ ',0
.STR2       DC.B    'PUSH SPACE  TO PLAY!',0
.STR3       DC.B    'PRESS M KEY TO BREAK BLOCK',0
.STR4       DC.B    'Find all the diamonds!',0
            DS.W    0

            RTS

; -----------------------------------------------------------------------------



STAOVIN    EQU     STAEMPTY 
; GAME OVER INITIALIZATION
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            ;RTS

; -----------------------------------------------------------------------------

STAOVUP
; GAME OVER UPDATE
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------  

            BTST.B  #KBDBITF1,(KBDEDGE)
            BEQ     .END
            MOVE.W  #STAINT,(STANEXT)
.END        RTS

            RTS
; -----------------------------------------------------------------------------

STAOVPL
; GAME OVER PLOT
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; -----------------------------------------------------------------------------
            MOVEM.L D0-D1/A1,-(A7)          ; STACK REGISTERS
            
            MOVE.L  #TMECOLOU, D1
            MOVE.B  #81, D0
            TRAP #15

            CLR D1            
            
            MOVE.W  #((160-16)/2)<<8|35,D1   ; FIRST TEXT COORDINATES
            MOVE.B  #11,D0
            TRAP    #15                     ; LOCATE TEXT CURSOR
            LEA     .STR0,A1                ; STRING POINTER
            MOVE.B  #13,D0                  ; PRINT STRING TASK
            TRAP    #15                     ; DO IT
            
            CMP.W   #8, (CONTDMND)
            BEQ .WIN
            
            MOVE.W  #((160-24)/2)<<8|38,D1   ; SECOND TEXT COORDINATES
            MOVE.B  #11,D0
            TRAP    #15                     ; LOCATE TEXT CURSOR
            LEA     .STR1,A1                ; STRING POINTER
            MOVE.B  #13,D0                  ; PRINT STRING TASK
            TRAP    #15                     ; DO IT
            
            BRA .F
            
                       
            
.WIN        MOVE.W  #((160-30)/2)<<8|38,D1   ; SECOND TEXT COORDINATES
            MOVE.B  #11,D0
            TRAP    #15                     ; LOCATE TEXT CURSOR
            LEA     .STR3,A1                ; STRING POINTER
            MOVE.B  #13,D0                  ; PRINT STRING TASK
            TRAP    #15                     ; DO IT
            
.F          BTST.B  #3,(SCRCYCCT)
            BEQ     .END
    
            MOVE.W  #((160-14)/2)<<8|40,D1   ; THIRD TEXT COORDINATES
            MOVE.B  #11,D0
            TRAP    #15                     ; LOCATE TEXT CURSOR
            LEA     .STR2,A1                ; STRING POINTER
            MOVE.B  #13,D0                  ; PRINT STRING TASK
            TRAP    #15                     ; DO IT
.END        
            JSR GOVERPLT
            ;  INITIAL VALUE OF NUMBER OF DIAMONDS FOUND             
            ;MOVE.W  #0, CONTDMND
            MOVEM.L (A7)+,D0-D1/A1
            RTS
            
            
.STR0       DC.B    'END OF  THE GAME',0
.STR1       DC.B    'SORRY MINER! YOU FAILED!',0
.STR2       DC.B    'PUSH SPACE KEY',0
.STR3       DC.B    'YOU HAVE FOUND THEM ALL! NICE!',0
            DS.W    0

            


; -----------------------------------------------------------------------------


            

STAPLAYI
; GAME INIT
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; NOTE     - JUST A PLACEHOLDER. NOTHING TO DO.
; -----------------------------------------------------------------------------
            ;  INITIAL VALUE OF NUMBER OF DIAMONDS FOUND             
            MOVE.W  #0, CONTDMND


            JSR	  RNDINIT            
            
            ; PLACE PLAYER
            JSR     PLYRINIT 
            
            ; PLACE TIMEBAR
            JSR     TIMEINIT
            
            ; GENERATES LAND 
            JMP     LANDCRTE
            
          
            


STAPLAYU
; GAME UPDATE
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; NOTE     - JUST A PLACEHOLDER. NOTHING TO DO.
; -----------------------------------------------------------------------------
            JSR     PLYRUPDX               
            JSR     PLYRUPDY
            
            JSR     TIMEUPD             
            
            JSR	    AGLUPD
            
            CMP.W   #8,(CONTDMND)
            BEQ .GMEOVER
            CMP.W   #TIMEINX-45,(TIMEX)
            BEQ .GMEOVER
            BRA .END
      
.GMEOVER    MOVE.W  #STATOVER,(STANEXT)
.END        RTS


STAPLAYP
; GAME PLOT
; INPUT    - NONE
; OUTPUT   - NONE
; MODIFIES - NONE
; NOTE     - JUST A PLACEHOLDER. NOTHING TO DO.
; -----------------------------------------------------------------------------
            JSR     DRWPLYER
            JSR     TIMEPLOT
            JSR     CONTPLOT
            JMP     AGLPLOT
           









*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
