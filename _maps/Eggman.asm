SME_F9BLz:
		dc.w SME_F9BLz_1A-SME_F9BLz	; 0
		dc.w SME_F9BLz_2F-SME_F9BLz	; 1
		dc.w SME_F9BLz_3A-SME_F9BLz	; 2
		dc.w SME_F9BLz_45-SME_F9BLz	; 3
		dc.w SME_F9BLz_50-SME_F9BLz	; 4
		dc.w SME_F9BLz_5B-SME_F9BLz	; 5
		dc.w SME_F9BLz_66-SME_F9BLz	; 6
		dc.w SME_F9BLz_71-SME_F9BLz	; 7
		dc.w SME_F9BLz_7C-SME_F9BLz	; 8
		dc.w SME_F9BLz_82-SME_F9BLz	; 9
		dc.w SME_F9BLz_88-SME_F9BLz	; A
		dc.w SME_F9BLz_88-SME_F9BLz	; B
		dc.w SME_F9BLz_88-SME_F9BLz	; C
		dc.w SME_F9BLz_92-SME_F9BLz	; D
		dc.w SME_F9BLz_94-SME_F9BLz	; E
		dc.w SME_j77JA_9D-SME_F9BLz	; F
SME_F9BLz_1A:
		dc.b 4
		dc.b $EC, $F, $20, 0, $E0
		dc.b $EC, $F, $20, $10, $0
		dc.b $C, $D, $20, $20, $E0
		dc.b $C, $D, $20, $28, $0
SME_F9BLz_2F:
		dc.b 2
		dc.b $E0, $D, 0, $30, $EA
		dc.b $E0, 1, 0, $38, $A
SME_F9BLz_3A:
		dc.b 2
		dc.b $E0, $D, 0, $3A, $EA
		dc.b $E0, 1, 0, $42, $A
SME_F9BLz_45:
		dc.b 2
		dc.b $E0, $D, 0, $44, $EA
		dc.b $E0, 1, 0, $4C, $A
SME_F9BLz_50:
		dc.b 2
		dc.b $E0, $D, 0, $4E, $EA
		dc.b $E0, 1, 0, $56, $A
SME_F9BLz_5B:
		dc.b 2
		dc.b $E0, $D, 0, $58, $EA
		dc.b $E0, 1, 0, $60, $A
SME_F9BLz_66:
		dc.b 2
		dc.b $E0, $D, 0, $62, $EA
		dc.b $E0, 1, 0, $6A, $A
SME_F9BLz_71:
		dc.b 2
		dc.b $E0, $D, 0, $62, $EA
		dc.b $E0, 1, 0, $6A, $A
SME_F9BLz_7C:
		dc.b 1
		dc.b $B, 4, 0, $6C, $E
SME_F9BLz_82:
		dc.b 1
		dc.b $B, 5, 0, $6E, $E
SME_F9BLz_88:
		dc.b 0
SME_F9BLz_92:
		dc.b 1
		dc.b $B, 4, 0, $6C, $E0
SME_F9BLz_94:
		dc.b 1
		dc.b $B, 5, 0, $6E, $E0
SME_j77JA_9D:
		dc.b 3
		dc.b $D8, $A, 0, $72, $E8
		dc.b $D8, $A, 8, $72, $FE
		dc.b $DA, 0, 0, $7B, $FA
	even