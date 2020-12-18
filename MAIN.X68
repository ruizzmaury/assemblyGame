; =============================================================================
; TITLE    : EXAMPLE GAME (MAIN PROGRAM)
; AUTHOR   : ANTONI BURGUERA
; HISTORY  : 10-OCT-2020 - CREATION
;            11-OCT-2020 - MINOR CHANGES
; =============================================================================

            ORG     $1000

; --- CODE INCLUDES -----------------------------------------------------------

            INCLUDE "SYSCONST.X68"          ; SYSTEM CONSTANTS
            INCLUDE "SYSTEM.X68"            ; SYSTEM CODE
            INCLUDE "CONST.X68"	; GAME CONSTANTS
            INCLUDE "RANDOM.X68"	; RANDOM NUMBER GENERATOR
            INCLUDE "AGENTLST.X68"	; 
            INCLUDE "BLOCK.X68"	; BLOCK MANAGEMENT	
            INCLUDE "LAND.X68"              ; LAND CREATION			

; --- INITIALIZE --------------------------------------------------------------

START       JSR     SYSINIT                 ; INITIALIZE SYSTEM-RELATED STUFF
	 

            ; TO DO : ADD YOUR GAME INITIALIZATION HERE
            JSR	  RNDINIT
            

            
            ; GENERATES BASELAND OF STONES
                        
            JSR      LANDINIT

   
           

            
            


; --- UPDATE ------------------------------------------------------------------

.LOOP       TRAP    #KBDTRAP                ; READ KEYBOARD

            ; TO DO : ADD YOUR GAME UPDATE HERE
            JSR	 AGLUPD

; --- WAIT SYNCH --------------------------------------------------------------

.WINT       TST.B   (SCRINTCT)              ; WAIT FOR INTERRUPT
            BEQ     .WINT
            CLR.B   (SCRINTCT)

; --- PLOT --------------------------------------------------------------------

            ; TO DO : ADD YOUR GAME PLOT HERE           
            JSR     AGLPLOT

            TRAP    #SCRTRAP                ; SHOW GRAPHICS
            BRA     .LOOP                   ; MAIN LOOP
            SIMHALT

; --- VARIABLES ---------------------------------------------------------------

            INCLUDE "SYSVAR.X68"
            INCLUDE "VAR.X68"
            END    START






*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~0~
*~Tab size~4~
