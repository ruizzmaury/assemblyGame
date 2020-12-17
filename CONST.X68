; =============================================================================
; TITLE    : GAME CONSTANTS
; AUTHOR   : MAURICI RUIZ PLAZA
; HISTORY  : 15/12/2020  -  CREATION
; =============================================================================

; ----BLOCK RELATED CONSTANTS--------------------------------------------------

BLOCWDTH    EQU	40                  ; BLOCK WIDTH	
BLOCHEIG    EQU	40                  ; BLOCK HEIGHT

; ---- BLOCK TYPES - 00BBGGRR -----------------------
BLOCID      EQU	  1                 ; BLOCK IDENTIFIER

; STONE
STNINITX    EQU     BLOCWDTH/2              ; INITIALX STONES
STNINITY    EQU     SCRHEIGH-BLOCWDTH/2     ; INITIALY STONES                                  
BLOCPCOL    EQU     $00A7A7AD               ; PEN COLOR	
BLOCFCOL    EQU	 $00676767          ; FILL COLOR

; DIRT
DRTINITX    EQU     BLOCWDTH/2              ; INITIALX DIRT
DRTINITY    EQU     SCRHEIGH-BLOCWDTH       ; INITIALY DIRT
DIRTPCOL    EQU	 $00A7A7AD               ; PEN COLOR	
DIRTFCOL    EQU	 $00676767               ; FILL COLOR

; GRASS
GRASPCOL    EQU	 $00A7A7AD         ; PEN COLOR	
GRASFCOL    EQU	 $00676767         ; FILL COLOR	


*~Font name~Fixedsys~
*~Font size~18~
*~Tab type~0~
*~Tab size~4~
