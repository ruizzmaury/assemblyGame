; =============================================================================
; TITLE    : GAME CONSTANTS
; AUTHOR   : MAURICI RUIZ PLAZA
; HISTORY  : 15/12/2020  -  CREATION
; =============================================================================

; ---- BLOCK RELATED CONSTANTS-------------------------------------------------

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


; ---- TIME RELATED CONSTANTS-------------------------------------------------
TMECOLOU    EQU     $000A0A0A               ; FILLING THE TIME BAR 
TIMEPOSX    EQU	40                  ; TIME BAR OUTSIDE X	
TIMEPOSY    EQU	20                  ; TIME BAR OUTSIDE Y
TIMEWDTH    EQU	300                 ; TIME BAR OUTSIDE WIDTH	
TIMEHEIG    EQU	30                  ; TIME BAR OUTSIDE HEIGHT


TIMEINX     EQU	44                  ; TIME BAR INSIDE X	
TIMEINY     EQU	24                  ; TIME BAR INSIDE Y
TIMEINHG    EQU	22                  ; TIME BAR INSIDE HEIGHT	
TIMEINWD    EQU	292                  ; TIME BAR FULL CHARGED WIDTH	


; ---- PLAYER RELATED CONSTANTS--------------------------------------------------
PLYRWDTH    EQU	46                  ; PLAYER WIDTH	
PLYRHEIG    EQU	54                  ; PLAYER HEIGHT
PLYRCOL     EQU	 $000000FF          ; PLAYER COLOR
ORIPCOL     EQU	 $00FFEC00          ; ORIENTATION PLAYER COLOR 
PLYSPEED    EQU     10                 ; PLAYER SPEED



; ---- DIAMOND RELATED CONSTANTS--------------------------------------------------
DMNDID      EQU	 2                      ; DIAMOND IDENTIFIER
DMNDWDTH    EQU     40
DMNDHEIG    EQU     32         


; --- DIAMOND COUNTER RELATED CONSTANTS ---------------------------------------------

CONTDMNX     EQU     560                   ; COUNTER DIAMOND X
CONTDMNY     EQU     30                    ; COUNTER DIAMOND X


; --- STATE RELATED VARIABLES ------------------------------------

STAINT      EQU     0                       ; STATE 0

STAGAME     EQU     1                       ; STATE 1

STATOVER    EQU     2                       ; STATE 2
















*~Font name~Courier New~
*~Font size~12~
*~Tab type~0~
*~Tab size~4~
