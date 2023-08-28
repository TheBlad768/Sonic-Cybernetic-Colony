SME_JgLkg:
		dc.w SME_JgLkg_C-SME_JgLkg	; 0
		dc.w SME_JgLkg_35-SME_JgLkg	; 1
		dc.w SME_JgLkg_5E-SME_JgLkg	; 2
		dc.w SME_JgLkg_87-SME_JgLkg	; 3
		dc.w SME_JgLkg_B0-SME_JgLkg	; 4
		dc.w SME_JgLkg_D9-SME_JgLkg	; 5
		dc.w SME_JgLkg_E4-SME_JgLkg	; 6
		dc.w SME_tIQ9r_A-SME_JgLkg	; 7
		dc.w SME_tIQ9r_1F-SME_JgLkg	; 8
		dc.w SME_tIQ9r_25-SME_JgLkg	; 9
		dc.w SME_tIQ9r_2B-SME_JgLkg	; A
		dc.w SME_tIQ9r_31-SME_JgLkg	; B
SME_JgLkg_C:
		dc.b 8
		dc.b $F0, 5, 0, 1, $F0
		dc.b $F0, 5, 8, 1, 0
		dc.b 0, 5, $10, 1, $F0
		dc.b 0, 5, $18, 1, 0
		dc.b $E8, 0, 0, 5, $E8
		dc.b $E8, 0, 8, 5, $10
		dc.b $10, 0, $10, 5, $E8
		dc.b $10, 0, $18, 5, $10
SME_JgLkg_35:
		dc.b 8
		dc.b $F0, 5, 0, 1, $F0
		dc.b $F0, 5, 8, 1, 0
		dc.b 0, 5, $10, 1, $F0
		dc.b 0, 5, $18, 1, 0
		dc.b $E0, 0, 0, 5, $E0
		dc.b $E0, 0, 8, 5, $18
		dc.b $18, 0, $10, 5, $E0
		dc.b $18, 0, $18, 5, $18
SME_JgLkg_5E:
		dc.b 8
		dc.b $F0, 5, 0, 1, $F0
		dc.b $F0, 5, 8, 1, 0
		dc.b 0, 5, $10, 1, $F0
		dc.b 0, 5, $18, 1, 0
		dc.b $D8, 0, 0, 6, $D8
		dc.b $D8, 0, 8, 6, $20
		dc.b $20, 0, $10, 6, $D8
		dc.b $20, 0, $18, 6, $20
SME_JgLkg_87:
		dc.b 8
		dc.b $F0, 5, 0, 1, $F0
		dc.b $F0, 5, 8, 1, 0
		dc.b 0, 5, $10, 1, $F0
		dc.b 0, 5, $18, 1, 0
		dc.b $D0, 0, 0, 7, $D0
		dc.b $D0, 0, 8, 7, $28
		dc.b $28, 0, $10, 7, $D0
		dc.b $28, 0, $18, 7, $28
SME_JgLkg_B0:
		dc.b 8
		dc.b $F0, 5, 0, 1, $F0
		dc.b $F0, 5, 8, 1, 0
		dc.b 0, 5, $10, 1, $F0
		dc.b 0, 5, $18, 1, 0
		dc.b $C8, 0, 0, 0, $C8
		dc.b $C8, 0, 8, 0, $30
		dc.b $30, 0, $10, 0, $C8
		dc.b $30, 0, $18, 0, $30
SME_JgLkg_D9:
		dc.b 1
		dc.b $F8, 5, 0, 8, $F8
SME_JgLkg_E4:
		dc.b 1
		dc.b $F8, 5, $20, 8, $F8
SME_tIQ9r_A:
		dc.b 4
		dc.b $F4, 0, 0, $C, $F4
		dc.b $F4, 0, 8, $C, 4
		dc.b 4, 0, $10, $C, $F4
		dc.b 4, 0, $18, $C, 4
SME_tIQ9r_1F:
		dc.b 1
		dc.b $FC, 0, 0, $D, $FC
SME_tIQ9r_25:
		dc.b 1
		dc.b $FC, 0, 8, $D, $FC
SME_tIQ9r_2B:
		dc.b 1
		dc.b $FC, 0, 0, $E, $FC
SME_tIQ9r_31:
		dc.b 1
		dc.b $FC, 0, $10, $E, $FC
		even