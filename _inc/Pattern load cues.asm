; ---------------------------------------------------------------------------
; Pattern load cues - index
; ---------------------------------------------------------------------------
	dc.w PLC_Main-ArtLoadCues, PLC_Main2-ArtLoadCues
	dc.w PLC_Explode-ArtLoadCues, PLC_GameOver-ArtLoadCues
	dc.w PLC_GHZ-ArtLoadCues, PLC_GHZ2-ArtLoadCues
	dc.w PLC_LZ-ArtLoadCues, PLC_LZ2-ArtLoadCues
	dc.w PLC_MZ-ArtLoadCues, PLC_MZ2-ArtLoadCues
	dc.w PLC_SLZ-ArtLoadCues, PLC_SLZ2-ArtLoadCues
	dc.w PLC_SYZ-ArtLoadCues, PLC_SYZ2-ArtLoadCues
	dc.w PLC_SBZ-ArtLoadCues, PLC_SBZ2-ArtLoadCues
	dc.w PLC_TitleCard-ArtLoadCues,	PLC_Boss-ArtLoadCues
	dc.w PLC_Signpost-ArtLoadCues, PLC_Warp-ArtLoadCues
	dc.w PLC_SpeStage-ArtLoadCues, PLC_GHZAnimals-ArtLoadCues
	dc.w PLC_LZAnimals-ArtLoadCues,	PLC_MZAnimals-ArtLoadCues
	dc.w PLC_SLZAnimals-ArtLoadCues, PLC_SYZAnimals-ArtLoadCues
	dc.w PLC_SBZAnimals-ArtLoadCues, PLC_SpeStResult-ArtLoadCues
	dc.w PLC_Ending-ArtLoadCues, PLC_TryAgain-ArtLoadCues
	dc.w PLC_EggmanSBZ2-ArtLoadCues, PLC_FZBoss-ArtLoadCues
; ---------------------------------------------------------------------------
; Pattern load cues - standard block 1
; ---------------------------------------------------------------------------

PLC_Main:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - standard block 2
; ---------------------------------------------------------------------------

PLC_Main2:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - explosion
; ---------------------------------------------------------------------------

PLC_Explode:
		dc.w 1
		dc.l Nem_Explode				; explosion
		dc.w $B400
		dc.l Nem_Hud				; HUD
		dc.w $D940
; ---------------------------------------------------------------------------
; Pattern load cues - game/time	over
; ---------------------------------------------------------------------------
PLC_GameOver:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - Green Hill
; ---------------------------------------------------------------------------

PLC_GHZ:
		dc.w 7
		dc.l Nem_RobotnikShipCrane	; Robotnik crane
		dc.w $7000
		dc.l Nem_Ball				; Giant ball
		dc.w $7540
		dc.l Nem_Eggman				; Eggman main patterns
		dc.w $8000
		dc.l Nem_Buzz				; Buzz bomber enemy
		dc.w $9000
		dc.l Nem_RobotnikRun		; Robotnik run
		dc.w $9800
		dc.l Nem_SlzSpike				; Spikeball (SLZ boss)
		dc.w $A300
		dc.l Nem_RobotnikLives		; Hud robotnik and ball
		dc.w $D000
		dc.l Nem_BallAim				; Targetting sensor for ball
		dc.w $D400
PLC_GHZ2:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - Labyrinth
; ---------------------------------------------------------------------------
PLC_LZ:
		dc.w $FFFF
PLC_LZ2:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - Marble
; ---------------------------------------------------------------------------
PLC_MZ:
		dc.w $FFFF
PLC_MZ2:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - Star Light
; ---------------------------------------------------------------------------

PLC_SLZ:
		dc.w $FFFF
PLC_SLZ2:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - Spring Yard
; ---------------------------------------------------------------------------

PLC_SYZ:
		dc.w $FFFF
PLC_SYZ2:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - Scrap Brain
; ---------------------------------------------------------------------------
PLC_SBZ:
		dc.w $FFFF
PLC_SBZ2:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - title card
; ---------------------------------------------------------------------------
PLC_TitleCard:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - act 3 boss
; ---------------------------------------------------------------------------
PLC_Boss:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - act 1/2 signpost
; ---------------------------------------------------------------------------
PLC_Signpost:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - beta special stage warp effect
; ---------------------------------------------------------------------------
PLC_Warp:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - special stage
; ---------------------------------------------------------------------------
PLC_SpeStage:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - GHZ animals
; ---------------------------------------------------------------------------
PLC_GHZAnimals:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - LZ animals
; ---------------------------------------------------------------------------
PLC_LZAnimals:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - MZ animals
; ---------------------------------------------------------------------------
PLC_MZAnimals:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - SLZ animals
; ---------------------------------------------------------------------------
PLC_SLZAnimals:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - SYZ animals
; ---------------------------------------------------------------------------
PLC_SYZAnimals:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - SBZ animals
; ---------------------------------------------------------------------------
PLC_SBZAnimals:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - special stage results screen
; ---------------------------------------------------------------------------
PLC_SpeStResult:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - ending sequence
; ---------------------------------------------------------------------------

PLC_Ending:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - "TRY AGAIN" and "END" screens
; ---------------------------------------------------------------------------
PLC_TryAgain:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - Eggman on SBZ 2
; ---------------------------------------------------------------------------
PLC_EggmanSBZ2:
		dc.w $FFFF
; ---------------------------------------------------------------------------
; Pattern load cues - final boss
; ---------------------------------------------------------------------------

PLC_FZBoss:
		dc.w $FFFF