; ===========================================================================
; Advanced Z80 Player (Macros)
; ===========================================================================

UniBank_OffsetTable macro *
\* EQU *
UniBank_offset_table = \*
    endm
UniBankOffset macro offset
	dc.l offset+(UniBank_offset_table+$8000)
    endm
MusicBankOffset macro offset
	dc.b (offset>>16)&$FF,(offset>>8)&$FF,offset&$FF
    endm
SequenceVoiceBankOffset macro offset
	dc.w (offset>>8)&$FFFF+(UniBank_offset_table>>8)&$FFFF+($8000>>8)&$FFFF
	dc.b offset&$FF
    endm