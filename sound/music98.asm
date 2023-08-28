Snd_Minib_SK_Header:
	smpsHeaderVoice     Snd_Minib_SK_Voices
	smpsHeaderChan      $06, $03
	smpsHeaderTempo     $01, $00

	smpsHeaderDAC       Snd_Minib_SK_DAC,	$00, $0C
	smpsHeaderFM        Snd_Minib_SK_FM1,	$00, $0C
	smpsHeaderFM        Snd_Minib_SK_FM2,	$00, $0C
	smpsHeaderFM        Snd_Minib_SK_FM3,	$00, $0C
	smpsHeaderFM        Snd_Minib_SK_FM4,	$00, $0C
	smpsHeaderFM        Snd_Minib_SK_FM5,	$00, $0E
	smpsHeaderPSG       Snd_Minib_SK_PSG1,	$DC, $02, $00, $00
	smpsHeaderPSG       Snd_Minib_SK_PSG2,	$DC, $02, $00, $00
	smpsHeaderPSG       Snd_Minib_SK_PSG3,	$DC, $02, $00, $00

; FM1 Data
Snd_Minib_SK_FM1:
	smpsSetvoice        $00
	smpsModSet          $0D, $01, $02, $06
	smpsPan             panCenter, $00
	dc.b	nE5, $06, nE5, nE5, nRst, $12, nE5, $06, nE5, nE5, nRst, $2A

Snd_Minib_SK_Loop0E:
	smpsSetvoice        $00
	dc.b	nE5, $54, nF5, $60, nFs5, nF5, $6C
	smpsLoop            $00, $02, Snd_Minib_SK_Loop0E
	smpsSetvoice        $03
	dc.b	nRst, $18, nA4, nG5, nF5, $0C, nE5, $24, nD5, $18, nF5, nE5
	dc.b	$0C, nC5, $3C, nRst, $0C, nD5, nC5, nE5, $6C, nRst, $18, nA4
	dc.b	nG5, nF5, $0C, nE5, $24, nD5, $18, nF5, nE5, $0C, nC5, $60
	dc.b	nA5, $54, nRst, $18
	smpsJump            Snd_Minib_SK_Loop0E

; FM2 Data
Snd_Minib_SK_FM2:
	smpsSetvoice        $01
	smpsModSet          $0D, $01, $02, $06
	smpsPan             panCenter, $00
	dc.b	nE2, $06, nE2, nE2, $0C, nRst, nE2, $06, nE2, nE2, $0C, nRst
	dc.b	$24

Snd_Minib_SK_Loop0D:
	smpsSetvoice        $01
	dc.b	nA2, $06, nA2, nA3, nA3, nA2, nA2, nA3, nA3, nA2, nA2, nA3
	dc.b	nA3, nA2, nA2, nA3, nA3
	smpsLoop            $00, $08, Snd_Minib_SK_Loop0D
	dc.b	nF2, $06, nF2, nF3, nF3, nF2, nF2, nF3, nF3, nF2, nF2, nF3
	dc.b	nF3, nF2, nF2, nF3, nF3, nG2, nG2, nG3, nG3, nG2, nG2, nG3
	dc.b	nG3, nG2, nG2, nG3, nG3, nG2, nG2, nG3, nG3, nA2, nA2, nA3
	dc.b	nA3, nA2, nA2, nA3, nA3, nA2, nA2, nA3, nA3, nA2, nA2, nA3
	dc.b	nA3, nA2, nA2, nA3, nA3, nA2, nA2, nA3, nA3, nG2, nG2, nG3
	dc.b	nG3, nG2, nG2, nG3, nG3, nF2, nF2, nF3, nF3, nF2, nF2, nF3
	dc.b	nF3, nF2, nF2, nF3, nF3, nF2, nF2, nF3, nF3, nG2, nG2, nG3
	dc.b	nG3, nG2, nG2, nG3, nG3, nG2, nG2, nG3, nG3, nG2, nG2, nG3
	dc.b	nG3, nA2, nA2, nA3, nA3, nA2, nA2, nA3, nA3, nA2, nA2, nA3
	dc.b	nA3, nA2, nA2, nA3, nA3, nA2, nA2, nA2, $0C, nRst, nA2, $06
	dc.b	nA2, nA2, $0C, nRst, $24
	smpsJump            Snd_Minib_SK_Loop0D

; FM3 Data
Snd_Minib_SK_FM3:
	smpsSetvoice        $00
	smpsModSet          $0D, $01, $02, $06
	smpsPan             panRight, $00
	dc.b	nB4, $06, nB4, nB4, nRst, $12, nB4, $06, nB4, nB4, nRst, $2A

Snd_Minib_SK_Loop0C:
	smpsSetvoice        $00
	dc.b	nC5, $54, nC5, $60, nC5, nC5, $6C
	smpsLoop            $00, $02, Snd_Minib_SK_Loop0C
	smpsSetvoice        $04
	dc.b	nC5, $54, nB4, $3C, nD5, $24, nE5, $7F, smpsNoAttack, nE5, $1D, nD5
	dc.b	$30, nC5, $54, nB4, $3C, nD5, $24, nE5, $6C, nRst, $60
	smpsJump            Snd_Minib_SK_Loop0C

; FM4 Data
Snd_Minib_SK_FM4:
	smpsModSet          $0D, $01, $02, $06
	smpsPan             panLeft, $00
	dc.b	nRst, $60

Snd_Minib_SK_Loop04:
	smpsSetvoice        $02
	dc.b	nA4, $06, nC5, nE5, nC5
	smpsLoop            $00, $04, Snd_Minib_SK_Loop04

Snd_Minib_SK_Loop05:
	dc.b	nA4, $06, nC5, nF5, nC5
	smpsLoop            $00, $04, Snd_Minib_SK_Loop05

Snd_Minib_SK_Loop06:
	dc.b	nA4, $06, nC5, nFs5, nC5
	smpsLoop            $00, $04, Snd_Minib_SK_Loop06

Snd_Minib_SK_Loop07:
	dc.b	nA4, $06, nC5, nF5, nC5
	smpsLoop            $00, $04, Snd_Minib_SK_Loop07

Snd_Minib_SK_Loop08:
	dc.b	nA4, $06, nC5, nE5, nC5
	smpsLoop            $00, $04, Snd_Minib_SK_Loop08

Snd_Minib_SK_Loop09:
	dc.b	nA4, $06, nC5, nF5, nC5
	smpsLoop            $00, $04, Snd_Minib_SK_Loop09

Snd_Minib_SK_Loop0A:
	dc.b	nA4, $06, nC5, nFs5, nC5
	smpsLoop            $00, $04, Snd_Minib_SK_Loop0A

Snd_Minib_SK_Loop0B:
	dc.b	nA4, $06, nC5, nF5, nC5
	smpsLoop            $00, $04, Snd_Minib_SK_Loop0B
	dc.b	nF4, $0C, nA4, nC5, nF5, $3C, nG4, $0C, nB4, nD5, nG5, $3C
	dc.b	nA4, $0C, nC5, nE5, nA5, $3C, nA4, $0C, nC5, nE5, nA5, nG4
	dc.b	nB4, nD5, nG5, nF4, nA4, nC5, nF5, $3C, nG4, $0C, nB4, nD5
	dc.b	nG5, $3C, nA4, $0C, nC5, nE5, nA5, $3C, nRst, $60
	smpsJump            Snd_Minib_SK_Loop04

; FM5 Data
Snd_Minib_SK_FM5:
	dc.b	nRst, $10
	smpsSetvoice        $00
	smpsModSet          $0D, $01, $02, $06
	smpsPan             panCenter, $00
	smpsFMAlterVol      $0C
	dc.b	nE5, $06, nE5, nE5, nRst, $12, nE5, $06, nE5, nE5, nRst, $2A
	smpsFMAlterVol      $F4

Snd_Minib_SK_Loop03:
	smpsSetvoice        $00
	dc.b	nE5, $54, nF5, $60, nFs5, nF5, $6C
	smpsLoop            $00, $02, Snd_Minib_SK_Loop03
	smpsSetvoice        $03
	dc.b	nRst, $18, nA4, nG5, nF5, $0C, nE5, $24, nD5, $18, nF5, nE5
	dc.b	$0C, nC5, $3C, nRst, $0C, nD5, nC5, nE5, $6C, nRst, $18, nA4
	dc.b	nG5, nF5, $0C, nE5, $24, nD5, $18, nF5, nE5, $0C, nC5, $60
	dc.b	nA5, $54, nRst, $18
	smpsJump            Snd_Minib_SK_Loop03

; DAC Data
Snd_Minib_SK_DAC:
	dc.b	dSnare, $06, dSnare, dSnare, $18, dSnare, $06, dSnare, dSnare, $18, dSnare, $06
	dc.b	dSnare, dSnare, dSnare

Snd_Minib_SK_Loop00:
	dc.b	dKick, $18, dKick, dKick, dKick
	smpsLoop            $00, $07, Snd_Minib_SK_Loop00

Snd_Minib_SK_Loop01:
	dc.b	dKick, $18, dKick, dKick, $0C, dSnare, dSnare, $06, dSnare, dSnare, $0C
	smpsLoop            $00, $03, Snd_Minib_SK_Loop01

Snd_Minib_SK_Loop02:
	dc.b	dKick, $0C, dKick, dSnare, dKick, dKick, $06, dKick, dKick, $0C, dSnare, dKick
	smpsLoop            $00, $04, Snd_Minib_SK_Loop02
	dc.b	dKick, $0C, dKick, dSnare, dKick, dKick, $06, dKick, dKick, $0C, dSnare, $06
	dc.b	dSnare, dSnare, dSnare, dSnare, dSnare, dSnare, $18, dSnare, $06, dSnare, dSnare, $18
	dc.b	dSnare, $06, dSnare, dSnare, dSnare
	smpsJump            Snd_Minib_SK_Loop00

; PSG1 Data
Snd_Minib_SK_PSG1:
; PSG2 Data
Snd_Minib_SK_PSG2:
; PSG3 Data
Snd_Minib_SK_PSG3:
	smpsStop

Snd_Minib_SK_Voices:
;	Voice $00
	dc.b	$3D
	dc.b	$41, $10, $72, $61, 	$0F, $14, $53, $14, 	$04, $06, $06, $03
	dc.b	$00, $0F, $00, $00, 	$1F, $3F, $5F, $1F, 	$1A, $8A, $8A, $8A
;	Voice $01
	dc.b	$08
	dc.b	$07, $70, $30, $00, 	$9F, $9F, $9F, $9F, 	$12, $0E, $0A, $0A
	dc.b	$00, $04, $04, $03, 	$28, $25, $25, $25, 	$1F, $2B, $11, $81
;	Voice $02
	dc.b	$04
	dc.b	$75, $11, $31, $71, 	$1F, $1F, $1F, $1F, 	$08, $05, $0C, $09
	dc.b	$00, $00, $00, $00, 	$FF, $FF, $FF, $FF, 	$1E, $86, $22, $8D
;	Voice $03
	dc.b	$29
	dc.b	$20, $31, $51, $71, 	$0E, $11, $12, $17, 	$00, $00, $00, $00
	dc.b	$08, $00, $09, $00, 	$89, $F8, $F9, $F8, 	$20, $20, $10, $88
;	Voice $04
	dc.b	$3D
	dc.b	$31, $50, $21, $41, 	$0D, $13, $13, $14, 	$03, $01, $06, $05
	dc.b	$05, $01, $05, $01, 	$FF, $FF, $FF, $FF, 	$1D, $8A, $88, $87
		even