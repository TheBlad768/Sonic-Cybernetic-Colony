; ---------------------------------------------------------------------------
; Sprite mappings - SCORE, TIME, RINGS
; ---------------------------------------------------------------------------
		dc.w byte_1C5BC-Map_obj21	; 0
		dc.w byte_1C5C2-Map_obj21	; 1
		dc.w byte_1C68C-Map_obj21	; 2
		dc.w byte_1C6AC-Map_obj21	; 3
byte_1C5BC:
		dc.b 2
		dc.b $A0, 5, $A0, 0, 0
		dc.b $A0, 9, $80, $30, $18
byte_1C5C2:
		dc.b 1
		dc.b $A0, 9, $80, $30, $18
byte_1C68C:
		dc.b 2
		dc.b $40, 5, 0, 0, $10
		dc.b $40, $D, 0, 4, $20
byte_1C6AC:
		dc.b 2
		dc.b $40, 5, 0, $C, $10
		dc.b $40, $D, 0, $10, $20
	even