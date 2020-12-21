; =============================================================================
; TITLE    : GAME CONSTANTS
; AUTHOR   : MAURICI RUIZ PLAZA
; HISTORY  : 15/12/2020  -  CREATION
; =============================================================================

; ----BLOCK RELATED CONSTANTS--------------------------------------------------

BLOCSIZE    EQU	40                  ; BLOCK WIDTH	

; ---- BLOCK TYPES - 00BBGGRR -----------------------

BLOCPCOL    EQU     $00000000               ; PEN COLOR
BLOCID      EQU	  1                      ; STONE IDENTIFIER
NROWBLKS    EQU     SCRWIDTH/BLOCSIZE       ; NUMBER OF BLOCKS PER ROW TO PAINT
NCOLBLKS    EQU     SCRHEIGH/BLOCSIZE       ; NUMBER OF BLOCKS PER COLUMN TO PAINT


; STONE
NUMSTN      EQU     SCRHEIGH/BLOCSIZE       ; NUMBER OF STONES TO PAINT
STNINITX    EQU     BLOCSIZE/2              ; INITIALX STONES
STNINITY    EQU     SCRHEIGH-BLOCSIZE/2     ; INITIALY STONES                                  	
STNFCOL     EQU	 $00676767          ; FILL STONE COLOR

; DIRT
DRTINITX    EQU     BLOCSIZE/2              ; INITIALX DIRT
DRTINITY    EQU     SCRHEIGH-BLOCSIZE     ; INITIALY DIRT	
DIRTFCOL    EQU	 $00002850              ; FILL DIRT COLOR 

; GRASS
GRASINTX    EQU     BLOCSIZE/2              ; INITIALX DIRT
GRASINTY    EQU     SCRHEIGH-3*BLOCSIZE+BLOCSIZE/2      ; INITIALY DIRT
GRASFCOL    EQU	 $00008C50         ; FILL GRASS COLOR	









*~Font name~Courier New~
*~Font size~12~
*~Tab type~0~
*~Tab size~4~
