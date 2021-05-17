; =============================================================================
; TITLE    : CRAZY MINER
; AUTHOR   : MAURICI RUIZ PLAZA
; CREATION : 16-01-2020
; =============================================================================

            ORG     $1000

; --- CODE INCLUDES -----------------------------------------------------------

            INCLUDE "SYSCONST.X68"               ; SYSTEM CONSTANTS-
            INCLUDE "SYSTEM.X68"                 ; SYSTEM CODE
            INCLUDE "CONST.X68"	        ; GAME CONSTANTS
            INCLUDE "STATES.X68"                 ; GAME STATES
            INCLUDE "RANDOM.X68"	        ; RANDOM NUMBER GENERATOR
            INCLUDE "AGENTLST.X68"	        ; AGENT MANAGEMENT
            INCLUDE "BLOCK2.X68"	        ; BLOCK MANAGEMENT	
            INCLUDE "LAND.X68"                   ; LAND CREATION
            INCLUDE "PLAYER.X68"                 ; PLAYER MANAGEMENT	
            INCLUDE "DIAMOND.X68"                ; DIAMOND MANAGEMENT
            INCLUDE "GFXDATA.X68"                ; PLAYER GFX
            INCLUDE "GFXDIAMOND.X68"             ; DIAMOND GFX
            INCLUDE "GFXGOVER.X68"               ; GAME OVER GFX
            INCLUDE "GFXGINIT.X68"               ; GAME INTRO GFX
            INCLUDE "TIMEBAR.X68"                ; TIME BAR MANAGEMENT
            INCLUDE "DIAMONDCONT.X68"            ; COUNTER DIAMOND MANAGEMENT
            INCLUDE "DRAWGAMEINIT.X68"           ; METHOD TO DRAW GFX OF GAME INTRO
            INCLUDE "DRAWGAMEOVER.X68"           ; METHOD TO DRAW GFX OF GAME OVER
            				
            
; --- INITIALIZE --------------------------------------------------------------

START       JSR     SYSINIT                 ; INITIALIZE SYSTEM-RELATED STUFF
	             
            
            JSR     STAINIT                 ; INITIALIZE STATES
            

; --- UPDATE ------------------------------------------------------------------

.LOOP       TRAP    #KBDTRAP                ; READ KEYBOARD
                        
            
            JSR     STAUPD                  ; UPDATE STATES


; --- WAIT SYNCH --------------------------------------------------------------

.WINT       TST.B   (SCRINTCT)              ; WAIT FOR INTERRUPT
            BEQ     .WINT
            CLR.B   (SCRINTCT)

; --- PLOT --------------------------------------------------------------------

            ; GAME PLOT           
                          
            JSR     STAPLOT                  ; PLOT STATES
            
            TRAP    #SCRTRAP                ; SHOW GRAPHICS
            BRA     .LOOP                   ; MAIN LOOP
            SIMHALT

; --- VARIABLES ---------------------------------------------------------------

            INCLUDE "SYSVAR.X68"
            INCLUDE "VAR.X68"
            END    START


































*~Font name~Courier New~
*~Font size~12~
*~Tab type~0~
*~Tab size~4~
