; =============================================================================
; TITLE    : GAME VARIABLES
; AUTHOR   : MAURICI RUIZ
; HISTORY  : 15/12/2020  - CREATION
; =============================================================================


;---- BLOCK RELATED VARIABLES -------------------------------------------------

BLOCKX	    DS.W	    1	; BLOCK X COORDINATE (XCENTER)
BLOCKY	    DS.W	    1	; BLOCK Y COORDINATE (XCENTER)


; --- RANDOM NUMBER GENERATOR VARIABLES ---------------------------------------

RNDINDEX	DS.B	    1	; RANDOM INDEX
	        DS.W	    0
	        
; --- PLAYER RELATED VARIABLES ------------------------------------------------

PLAYERX     DS.W    1                       ; PAD X COORDINATE (XCENTER)
PLAYERY     DS.W    1                       ; PAD X COORDINATE (XCENTER)

PLYERSEG    DS.W    1                       ; SCREEN SEGMENT WHERE IS LOCATED THE PLAYER

TOPOFSEG    DS.W    1                       ; NUMBER OF BLOCKS IN COLUMN UNDER PLAYER


; --- LAND RELATED VARIABLES --------------------------------------------------

RANDIRT     DC.B    6  , 7  , 7  , 8  , 9  , 10  , 10  , 9 
            DC.B    8  , 7  , 6  , 6  , 7  , 8   , 9   , 9 
            DC.B    10 , 9  , 8  , 8  , 9  , 10  , 10  , 9 
            DC.B    8  , 7  , 7  , 6  , 7  , 8   , 9   , 10
            DS.W    0 


LANDHEIG    DC.B    8  ,  8 ,  9 , 10  , 11  , 12  , 12  , 11 
            DC.B    10 ,  9 ,  8 ,  8  ,  9  , 10  , 11  , 11 
            DC.B    12 , 11 , 10 , 10  , 11  , 12  , 12  , 11 
            DC.B    10 ,  9 ,  9 ,  8  ,  9  , 10  , 11  , 12
            DS.W    0 


*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
