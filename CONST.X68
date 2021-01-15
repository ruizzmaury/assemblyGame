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


; ---- PLAYER RELATED CONSTANTS--------------------------------------------------
PLYRWDTH    EQU	46                  ; PLAYER WIDTH	
PLYRHEIG    EQU	54                  ; PLAYER HEIGHT
PLYRCOL     EQU	 $000000FF          ; PLAYER COLOR
ORIPCOL     EQU	 $00FFEC00          ; ORIENTATION PLAYER COLOR 
PLYSPEED    EQU     10                 ; PLAYER SPEED



; ---- DIAMOND RELATED CONSTANTS--------------------------------------------------
DMNDID      EQU	 2                      ; DIAMOND IDENTIFIER
DMNDCOL     EQU	 $00FFFF99          ; DIAMOND COLOR          



; --- EXPLOSION RELATED CONSTANTS ---------------------------------------------

EXPGORE     EQU     10                      ; NUMBER OF BLOOD DROPS



; --- AGENT DATABLOCK OFFSETS -------------------------------------------------

; OFFSETS TO AGENT VARIABLES

AGNFRAOF    EQU     0                       ; BASE FRAME
AGNPOXOF    EQU     2                       ; X COORD
AGNPOYOF    EQU     4                       ; Y COORD
AGNSPYOF    EQU     8                       ; Y SPEED

; OFFSETS TO AGENT COMMANDS

AGNMOTOF    EQU     12                      ; DESIRED MOTION

; OFFSET TO AGENT PARAMETERS

AGNTYPOF    EQU     13                      ; TYPE
AGNFRMOF    EQU     14                      ; FRAMES FOR LEFT AND RIGHT
AGNSPXOF    EQU     18                      ; X SPEED












*~Font name~Courier New~
*~Font size~12~
*~Tab type~0~
*~Tab size~4~
