
; =============== S U B R O U T I N E =======================================

SFX_Pointer:
		dc.b $1E, $FA, $F5	; First byte -+6(unknown), unknown, unknown
		dc.b $4B				; Priority
		dc.l byte_1E53EE		; Offset SFX #1
; ---------------------------------------------------------------------------
		dc.b $1E, $32, $2D	; First byte -+6(unknown), unknown, unknown
		dc.b $C				; Priority
		dc.l byte_1E540C		; Offset SFX #2
; ---------------------------------------------------------------------------
		dc.b $1E, $96, $91		; First byte -+6(unknown), unknown, unknown
		dc.b $8C				; Priority
		dc.l byte_1E542A		; Offset SFX #3
; ---------------------------------------------------------------------------
		dc.b $1E, $32, $2D	; First byte -+6(unknown), unknown, unknown
		dc.b $A				; Priority
		dc.l byte_1E5448		; Offset SFX #4
; ---------------------------------------------------------------------------
		dc.b $1E, $32, $2D	; First byte -+6(unknown), unknown, unknown
		dc.b $A				; Priority
		dc.l byte_1E5466		; Offset SFX #5
; ---------------------------------------------------------------------------
		dc.b $1E, $32, $2D	; First byte -+6(unknown), unknown, unknown
		dc.b 0				; Priority
		dc.l byte_1E5484		; Offset SFX #6
; ---------------------------------------------------------------------------
		dc.b $1E, $32, $2D
		dc.b $A
		dc.l byte_1E54A2
; ---------------------------------------------------------------------------
		dc.b $1E, $3C, $37
		dc.b $A
		dc.l byte_1E54C0
; ---------------------------------------------------------------------------
		dc.b $1E, $32, $2D
		dc.b 0
		dc.l byte_1E54DE
; ---------------------------------------------------------------------------
		dc.b $1E, $6E, $69
		dc.b $A
		dc.l byte_1E54FC
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $50
		dc.b $A
		dc.l byte_1E551A
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $A
		dc.l byte_1E5538
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $C
		dc.l byte_1E5556
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $A
		dc.l byte_1E5574
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $C
		dc.l byte_1E5592
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $82
		dc.l byte_1E55B0
; ---------------------------------------------------------------------------
		dc.b $1E, $8C, $87
		dc.b $3C
		dc.l byte_1E55CE
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b 8
		dc.l byte_1E55EC
; ---------------------------------------------------------------------------
		dc.b $18, $B4, $AF
		dc.b $1E
		dc.l byte_1E560A
; ---------------------------------------------------------------------------
		dc.b $1E, $32, $2D
		dc.b $1E
		dc.l byte_1E5628
; ---------------------------------------------------------------------------
		dc.b $18, $6E, $69
		dc.b $C
		dc.l byte_1E5646
; ---------------------------------------------------------------------------
		dc.b $1E, $32, $2D
		dc.b $C
		dc.l byte_1E5664
; ---------------------------------------------------------------------------
		dc.b $1E, $64, $5F
		dc.b $1E
		dc.l byte_1E5682
; ---------------------------------------------------------------------------
		dc.b $1E, $C8, $C3
		dc.b $F
		dc.l byte_1E56A0
; ---------------------------------------------------------------------------
		dc.b $1E, $5A, $55
		dc.b 8
		dc.l byte_1E56BE
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b 8
		dc.l byte_1E56DC
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $14
		dc.l byte_1E56FA
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $F
		dc.l byte_1E5718
; ---------------------------------------------------------------------------
		dc.b $1E, $96, $91
		dc.b $B4
		dc.l byte_1E5736
; ---------------------------------------------------------------------------
		dc.b $1E, $96, $91
		dc.b $B4
		dc.l byte_1E5754
; ---------------------------------------------------------------------------
		dc.b $1E, $96, $91
		dc.b $55
		dc.l byte_1E5772
; ---------------------------------------------------------------------------
		dc.b $1E, $96, $91
		dc.b $55
		dc.l byte_1E5790
; ---------------------------------------------------------------------------
		dc.b $1E, $96, $91
		dc.b $C8
		dc.l byte_1E57AE
; ---------------------------------------------------------------------------
		dc.b $1E, $32, $2D
		dc.b $A
		dc.l byte_1E57CC
; ---------------------------------------------------------------------------
		dc.b $1E, $32, $2D
		dc.b $A
		dc.l byte_1E57EA
; ---------------------------------------------------------------------------
		dc.b $18, $32, $2D
		dc.b $28
		dc.l byte_1E5808
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $A
		dc.l byte_1E5826
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $A
		dc.l byte_1E5844
; ---------------------------------------------------------------------------
		dc.b $1E, $6E, $69
		dc.b $82
		dc.l byte_1E5862
; ---------------------------------------------------------------------------
		dc.b $1E, $01, $01
		dc.b $A
		dc.l byte_1E5880
; ---------------------------------------------------------------------------
		dc.b $1E, $01, $01
		dc.b $A
		dc.l byte_1E589E
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $28
		dc.l byte_1E58BC
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $A
		dc.l byte_1E58DA
; ---------------------------------------------------------------------------
		dc.b $1E, $B4, $AF
		dc.b $2D
		dc.l byte_1E58F8
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $C
		dc.l byte_1E5916
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $23
		dc.l byte_1E5934
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $14
		dc.l byte_1E5952
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $19
		dc.l byte_1E5970
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $19
		dc.l byte_1E598E
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $78
		dc.l byte_1E59AC
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $78
		dc.l byte_1E59CA
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $78
		dc.l byte_1E59E8
; ---------------------------------------------------------------------------
		dc.b $12, $50, $4B
		dc.b $78
		dc.l byte_1E5A06
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $78
		dc.l byte_1E5A24
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $78
		dc.l byte_1E5A42
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $78
		dc.l byte_1E5A60
; ---------------------------------------------------------------------------
		dc.b $12, $50, $4B
		dc.b $78
		dc.l byte_1E5A7E
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $78
		dc.l byte_1E5A9C
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $78
		dc.l byte_1E5ABA
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $14
		dc.l byte_1E5AD8
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $78
		dc.l byte_1E5AF6
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $A
		dc.l byte_1E5B14
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $A
		dc.l byte_1E5B32
; ---------------------------------------------------------------------------
		dc.b $18, $3C, $37
		dc.b $A
		dc.l byte_1E5B50
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $A
		dc.l byte_1E5B6E
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $F
		dc.l byte_1E5B8C
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $14
		dc.l byte_1E5BAA
; ---------------------------------------------------------------------------
		dc.b $12, $50, $4B
		dc.b 8
		dc.l byte_1E5BC8
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $14
		dc.l byte_1E5BE6
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $F
		dc.l byte_1E5C04
; ---------------------------------------------------------------------------
		dc.b $12, $50, $4B
		dc.b $A
		dc.l byte_1E5C22
; ---------------------------------------------------------------------------
		dc.b $12, $50, $4B
		dc.b $A
		dc.l byte_1E5C40
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $28
		dc.l byte_1E5C5E
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $A
		dc.l byte_1E5C7C
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $A
		dc.l byte_1E5C9A
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $A
		dc.l byte_1E5CB8
; ---------------------------------------------------------------------------
		dc.b $18, $50, $50
		dc.b $C
		dc.l byte_1E5CD6
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $19
		dc.l byte_1E5CF4
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $50
		dc.l byte_1E5D12
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $14
		dc.l byte_1E5D30
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $14
		dc.l byte_1E5D4E
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $18
		dc.l byte_1E5D6C
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $14
		dc.l byte_1E5D8A
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $18
		dc.l byte_1E5DA8
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $28
		dc.l byte_1E5DC6
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $D
		dc.l byte_1E5DE4
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $D
		dc.l byte_1E5E02
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $D
		dc.l byte_1E5E20
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $D
		dc.l byte_1E5E3E
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $D
		dc.l byte_1E5E5C
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $14
		dc.l byte_1E5E7A
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $14
		dc.l byte_1E5E98
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $14
		dc.l byte_1E5EB6
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $14
		dc.l byte_1E5ED4
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $14
		dc.l byte_1E5EF2
; ---------------------------------------------------------------------------
		dc.b $18, $50, $4B
		dc.b $14
		dc.l byte_1E5F10
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $28
		dc.l byte_1E5F2E
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $46
		dc.l byte_1E5F4C
; ---------------------------------------------------------------------------
		dc.b $1E, $50, $4B
		dc.b $46
		dc.l byte_1E5F6A
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF6C2
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF686
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF6E0
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF6FE
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF71C
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF73A
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF758
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF776
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF794
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF7B2
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF7D0
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF7EE
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF80C
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF82A
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF848
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF866
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF884
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF8A2
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF8C0
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF8DE
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF8FC
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF91A
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF938
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF956
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF974
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF992
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF9B0
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF9CE
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EF9EC
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EFA0A
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EFA28
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EFA46
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EFA64
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EFA82
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EFAA0
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EFABE
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EFADC
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EFAFA
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EFB18
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1EFB36
; ---------------------------------------------------------------------------
		dc.b $1E, $FA, $F5
		dc.b $4B
		dc.l byte_1F7F84

; =============== S U B R O U T I N E =======================================

byte_1E53EE:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/1.bin"
	even
byte_1E540C:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/2.bin"
	even
byte_1E542A:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/3.bin"
	even
byte_1E5448:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/4.bin"
	even
byte_1E5466:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/5.bin"
	even
byte_1E5484:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/6.bin"
	even
byte_1E54A2:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/7.bin"
	even
byte_1E54C0:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/8.bin"
	even
byte_1E54DE:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/9.bin"
	even
byte_1E54FC:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/A.bin"
	even
byte_1E551A:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/B.bin"
	even
byte_1E5538:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/C.bin"
	even
byte_1E5556:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/D.bin"
	even
byte_1E5574:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/E.bin"
	even
byte_1E5592:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/F.bin"
	even
byte_1E55B0:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/10.bin"
	even
byte_1E55CE:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/11.bin"
	even
byte_1E55EC:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/12.bin"
	even
byte_1E560A:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/13.bin"
	even
byte_1E5628:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/14.bin"
	even
byte_1E5646:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/15.bin"
	even
byte_1E5664:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/16.bin"
	even
byte_1E5682:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/17.bin"
	even
byte_1E56A0:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/18.bin"
	even
byte_1E56BE:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/19.bin"
	even
byte_1E56DC:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/1A.bin"
	even
byte_1E56FA:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/1B.bin"
	even
byte_1E5718:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/1C.bin"
	even
byte_1E5736:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/1D.bin"
	even
byte_1E5754:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/1E.bin"
	even
byte_1E5772:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/1F.bin"
	even
byte_1E5790:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/20.bin"
	even
byte_1E57AE:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/21.bin"
	even
byte_1E57CC:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/22.bin"
	even
byte_1E57EA:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/23.bin"
	even
byte_1E5808:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/24.bin"
	even
byte_1E5826:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/25.bin"
	even
byte_1E5844:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/26.bin"
	even
byte_1E5862:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/27.bin"
	even
byte_1E5880:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/28.bin"
	even
byte_1E589E:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/29.bin"
	even
byte_1E58BC:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/2A.bin"
	even
byte_1E58DA:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/2B.bin"
	even
byte_1E58F8:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/2C.bin"
	even
byte_1E5916:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/2D.bin"
	even
byte_1E5934:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/2E.bin"
	even
byte_1E5952:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/2F.bin"
	even
byte_1E5970:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/30.bin"
	even
byte_1E598E:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/31.bin"
	even
byte_1E59AC:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/32.bin"
	even
byte_1E59CA:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/33.bin"
	even
byte_1E59E8:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/34.bin"
	even
byte_1E5A06:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/35.bin"
	even
byte_1E5A24:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/36.bin"
	even
byte_1E5A42:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/37.bin"
	even
byte_1E5A60:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/38.bin"
	even
byte_1E5A7E:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/39.bin"
	even
byte_1E5A9C:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/3A.bin"
	even
byte_1E5ABA:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/3B.bin"
	even
byte_1E5AD8:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/3C.bin"
	even
byte_1E5AF6:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/3D.bin"
	even
byte_1E5B14:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/3E.bin"
	even
byte_1E5B32:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/3F.bin"
	even
byte_1E5B50:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/40.bin"
	even
byte_1E5B6E:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/41.bin"
	even
byte_1E5B8C:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/42.bin"
	even
byte_1E5BAA:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/43.bin"
	even
byte_1E5BC8:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/44.bin"
	even
byte_1E5BE6:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/45.bin"
	even
byte_1E5C04:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/46.bin"
	even
byte_1E5C22:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/47.bin"
	even
byte_1E5C40:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/48.bin"
	even
byte_1E5C5E:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/49.bin"
	even
byte_1E5C7C:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/4A.bin"
	even
byte_1E5C9A:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/4B.bin"
	even
byte_1E5CB8:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/4C.bin"
	even
byte_1E5CD6:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/4D.bin"
	even
byte_1E5CF4:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/4E.bin"
	even
byte_1E5D12:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/4F.bin"
	even
byte_1E5D30:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/50.bin"
	even
byte_1E5D4E:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/51.bin"
	even
byte_1E5D6C:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/52.bin"
	even
byte_1E5D8A:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/53.bin"
	even
byte_1E5DA8:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/54.bin"
	even
byte_1E5DC6:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/55.bin"
	even
byte_1E5DE4:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/56.bin"
	even
byte_1E5E02:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/57.bin"
	even
byte_1E5E20:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/58.bin"
	even
byte_1E5E3E:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/59.bin"
	even
byte_1E5E5C:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/5A.bin"
	even
byte_1E5E7A:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/5B.bin"
	even
byte_1E5E98:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/5C.bin"
	even
byte_1E5EB6:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/5D.bin"
	even
byte_1E5ED4:	incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/5E.bin"
	even
byte_1E5EF2:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/5F.bin"
	even
byte_1E5F10:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/60.bin"
	even
byte_1E5F2E:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/61.bin"
	even
byte_1E5F4C:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/62.bin"
	even
byte_1E5F6A:		incbin "z80 driver/SFX/SFX/Adventures of Batman and Robin/63.bin"
	even
; ---------------------------------------------------------------------------

byte_1EF6C2:		incbin "z80 driver/SFX/SFX/Sub-Terrania/1.bin"
	even
byte_1EF686:		incbin "z80 driver/SFX/SFX/Sub-Terrania/2.bin"
	even
byte_1EF6E0:	incbin "z80 driver/SFX/SFX/Sub-Terrania/3.bin"
	even
byte_1EF6FE:		incbin "z80 driver/SFX/SFX/Sub-Terrania/4.bin"
	even
byte_1EF71C:		incbin "z80 driver/SFX/SFX/Sub-Terrania/5.bin"
	even
byte_1EF73A:		incbin "z80 driver/SFX/SFX/Sub-Terrania/6.bin"
	even
byte_1EF758:		incbin "z80 driver/SFX/SFX/Sub-Terrania/7.bin"
	even
byte_1EF776:		incbin "z80 driver/SFX/SFX/Sub-Terrania/8.bin"
	even
byte_1EF794:		incbin "z80 driver/SFX/SFX/Sub-Terrania/9.bin"
	even
byte_1EF7B2:		incbin "z80 driver/SFX/SFX/Sub-Terrania/A.bin"
	even
byte_1EF7D0:	incbin "z80 driver/SFX/SFX/Sub-Terrania/B.bin"
	even
byte_1EF7EE:		incbin "z80 driver/SFX/SFX/Sub-Terrania/C.bin"
	even
byte_1EF80C:	incbin "z80 driver/SFX/SFX/Sub-Terrania/D.bin"
	even
byte_1EF82A:	incbin "z80 driver/SFX/SFX/Sub-Terrania/E.bin"
	even
byte_1EF848:		incbin "z80 driver/SFX/SFX/Sub-Terrania/F.bin"
	even
byte_1EF866:		incbin "z80 driver/SFX/SFX/Sub-Terrania/10.bin"
	even
byte_1EF884:		incbin "z80 driver/SFX/SFX/Sub-Terrania/11.bin"
	even
byte_1EF8A2:	incbin "z80 driver/SFX/SFX/Sub-Terrania/12.bin"
	even
byte_1EF8C0:	incbin "z80 driver/SFX/SFX/Sub-Terrania/13.bin"
	even
byte_1EF8DE:	incbin "z80 driver/SFX/SFX/Sub-Terrania/14.bin"
	even
byte_1EF8FC:		incbin "z80 driver/SFX/SFX/Sub-Terrania/15.bin"
	even
byte_1EF91A:		incbin "z80 driver/SFX/SFX/Sub-Terrania/16.bin"
	even
byte_1EF938:		incbin "z80 driver/SFX/SFX/Sub-Terrania/17.bin"
	even
byte_1EF956:		incbin "z80 driver/SFX/SFX/Sub-Terrania/18.bin"
	even
byte_1EF974:		incbin "z80 driver/SFX/SFX/Sub-Terrania/19.bin"
	even
byte_1EF992:		incbin "z80 driver/SFX/SFX/Sub-Terrania/1A.bin"
	even
byte_1EF9B0:	incbin "z80 driver/SFX/SFX/Sub-Terrania/1B.bin"
	even
byte_1EF9CE:	incbin "z80 driver/SFX/SFX/Sub-Terrania/1C.bin"
	even
byte_1EF9EC:	incbin "z80 driver/SFX/SFX/Sub-Terrania/1D.bin"
	even
byte_1EFA0A:	incbin "z80 driver/SFX/SFX/Sub-Terrania/1E.bin"
	even
byte_1EFA28:	incbin "z80 driver/SFX/SFX/Sub-Terrania/1F.bin"
	even
byte_1EFA46:	incbin "z80 driver/SFX/SFX/Sub-Terrania/20.bin"
	even
byte_1EFA64:	incbin "z80 driver/SFX/SFX/Sub-Terrania/21.bin"
	even
byte_1EFA82:	incbin "z80 driver/SFX/SFX/Sub-Terrania/22.bin"
	even
byte_1EFAA0:	incbin "z80 driver/SFX/SFX/Sub-Terrania/23.bin"
	even
byte_1EFABE:	incbin "z80 driver/SFX/SFX/Sub-Terrania/24.bin"
	even
byte_1EFADC:	incbin "z80 driver/SFX/SFX/Sub-Terrania/25.bin"
	even
byte_1EFAFA:	incbin "z80 driver/SFX/SFX/Sub-Terrania/26.bin"
	even
byte_1EFB18:		incbin "z80 driver/SFX/SFX/Sub-Terrania/27.bin"
	even
byte_1EFB36:		incbin "z80 driver/SFX/SFX/Sub-Terrania/28.bin"
	even
byte_1F7F84:		incbin "z80 driver/SFX/SFX/Sub-Terrania/29.bin"
	even