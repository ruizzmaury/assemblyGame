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
	        
; --- DIAMOND RELATED VARIABLES --------------------------------------------------

DMNDIDX 	 DC.W	 0	; DIAMOND INDEX
DMNDPOSX     DC.W    40  , 450  , 800  , 708  , 920  , 100  , 210  , 329 , 0   
DMNDPOSY     DC.W    400  , 450  , 600  , 520 , 360  , 400  , 390  , 500, 0 
	        
; --- PLAYER RELATED VARIABLES ------------------------------------------------

PLAYERX     DS.W    1                       ; PAD X COORDINATE (XCENTER)
PLAYERY     DS.W    1                       ; PAD X COORDINATE (YCENTER)

PLYERORI    DS.W    1                       ; PLAYER ORIENTATION
PLYRUPDW    DS.W    1  

; --- LAND RELATED VARIABLES --------------------------------------------------

RANDIRT     DC.B    6  , 7  , 7  , 8  , 9  , 10  , 10  , 9 
            DC.B    8  , 7  , 6  , 6  , 7  , 8   , 9   , 9 
            DC.B    10 , 9  , 8  , 8  , 9  , 10  , 10  , 9 
            DC.B    8  , 7  , 7  , 6  , 7  , 8   , 9   , 10
            DS.W    0 


LANDHEIG    DC.B    10  ,  10 ,  11 ,  12  ,  13  , 14  , 14  , 13 
            DC.B    12  ,  11 ,  10 ,  10  ,  11  , 12  , 13  , 13 
            DC.B    14  ,  13 ,  12 ,  12  ,  13  , 14  , 14  , 13 
            DC.B    12  ,  11 ,  11 ,  10  ,  11  , 12  , 11  , 10
            DS.W    0 
            

            
            













*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
