; =============================================================================
; TITLE    : GAME CONSTANTS
; AUTHOR   : MAURICI RUIZ PLAZA
; HISTORY  : 15/12/2020  -  CREATION
; =============================================================================

; ----BLOCK RELATED CONSTANTS--------------------------------------------------

BLOCSIZE    EQU	40                  ; BLOCK WIDTH	

; ---- BLOCK TYPES - 00BBGGRR -----------------------

BLOCPCOL    EQU      $00000000               ; PEN COLOR

; STONE
STNID       EQU	  1                 ; STONE IDENTIFIER
STNINITX    EQU     BLOCSIZE/2              ; INITIALX STONES
STNINITY    EQU     SCRHEIGH-BLOCSIZE/2     ; INITIALY STONES                                  	
STNFCOL     EQU	 $00676767          ; FILL STONE COLOR

; DIRT
DIRTID      EQU	  2                 ; DIRT IDENTIFIER
DRTINITX    EQU     BLOCSIZE/2              ; INITIALX DIRT
DRTINITY    EQU     SCRHEIGH-BLOCSIZE       ; INITIALY DIRT	
DIRTFCOL    EQU	 $00002850              ; FILL DIRT COLOR 

; GRASS
GRASSID     EQU	 3                 ; GRASS IDENTIFIER	
GRASFCOL    EQU	 $00008C50         ; FILL GRASS COLOR	







*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~0~
*~Tab size~4~
