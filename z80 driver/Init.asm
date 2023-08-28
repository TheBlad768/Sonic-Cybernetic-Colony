; ===========================================================================
; Advanced Z80 Player (1824)
; ===========================================================================

; Disassembled and edit by TheBlad768.

; ===========================================================================
; Constants
; ===========================================================================

		include "z80 driver/Macros.asm"
; ---------------------------------------------------------------------------

; Sound Driver control:
zCurrentTempo			= $3B
unk_ED					= $ED
unk_E61					= $E61
unk_E67					= $E67
zFMChannelRAM			= $1480
unk_16EA				= $16EA
unk_17EA				= $17EA
zPauseFlag				= $180E
unk_1810				= $1810
SFX_RAM				= $FFFFF000
; ---------------------------------------------------------------------------

; FM data
Size_FMData 			= $67 ; bytes

; =============== S U B R O U T I N E =======================================

PlaySound:
		move.w	d0,(Sound_test_sound).w
		movem.l	a1-a6,-(sp)
		bsr.w	Clear_ChannelData
		bsr.w	sub_1E799A
		move.w	(Sound_test_sound).w,d0
		beq.s	@1
		bsr.w	sub_1E6012
@1		movem.l	(sp)+,a1-a6
		rts
; End of function PlaySound

; =============== S U B R O U T I N E =======================================

PlaySound_Special:
		subq.w	#1,d0
		bmi.s	@2
		movem.l	a0-a1,-(sp)
		lsl.w	#3,d0
		lea	(SFX_Pointer).l,a0
		adda.w	d0,a0
		lea	(SFX_RAM+2).l,a1
		moveq	#0,d0
		move.b	(a0)+,d0
		adda.w	d0,a1
		move.b	(a0)+,d0
		cmp.b	(a1),d0
		bcs.s	@1
		move.b	(a0)+,(a1)
		move.b	(a0)+,1(a1)
		move.l	(a0)+,2(a1)
@1		movem.l	(sp)+,a0-a1
@2		rts
; End of function PlaySound_Special

; =============== S U B R O U T I N E =======================================

Fade_Music:
		moveq   #$3F,d7
@1		tst.b	($C00008).l
		bne.s	@1
@2		tst.b	($C00008).l
		beq.s	@2
		moveq	#4,d0
		bsr.w	Load_Fade_Music
		dbf	d7,@1
		rts

; =============== S U B R O U T I N E =======================================

Load_Pause_Music:
		stopZ80
		eori.b	#-1,(Z80_RAM+zPauseFlag).l
		startZ80
		rts

; =============== S U B R O U T I N E =======================================

Load_Music_Tempo:
		stopZ80
		move.b	d0,(Z80_RAM+zCurrentTempo).l
		startZ80
		rts

; =============== S U B R O U T I N E =======================================

SndAdvancedDrvInit:
		bsr.s	Load_Z80_Sound_Driver
		bsr.s	Clear_ChannelData
		bra.w	sub_1E799A
; End of function SndAdvancedDrvInit

; =============== S U B R O U T I N E =======================================

Load_Z80_Sound_Driver:
		resetZ80
		stopZ80
		lea	AdvancedZ80_Player(pc),a0
		lea	(Z80_RAM).l,a1
		bsr.w	KosDec
		move.b	#$E4,(Z80_RAM+zCurrentTempo).l
		resetZ80a
		nop
		nop
		nop
		nop
		resetZ80
		startZ80
		rts

; =============== S U B R O U T I N E =======================================

Clear_ChannelData:
		stopZ80
		lea	(Z80_RAM+zFMChannelRAM).l,a1
		moveq	#5,d7
@1		move.b	#0,d0
		move.b	d0,$1F(a1)
		adda.w	#(Size_FMData),a1
		dbf	d7,@1
		startZ80
		rts

; =============== S U B R O U T I N E =======================================

sub_1E799A:
		lea	(SFX_RAM).l,a0
		clr.w	(a0)
		moveq	#0,d0

sub_1E79A4:
		movem.l	a1,-(sp)
		stopZ80
		lea	(Z80_RAM+$E67).l,a1
		move.b	d0,(a1)
		startZ80
		movem.l	(sp)+,a1
		rts
; End of function sub_1E79A4

; =============== S U B R O U T I N E =======================================

Load_SFX_VIntProcess:
		stopZ80
		lea	(SFX_RAM+2).l,a0
		lea	(Z80_RAM+$17EA).l,a1
		moveq	#5,d7

loc_1E7B12:
		tst.l	2(a0)
		beq.s	loc_1E7B3A
		moveq	#5,d6

loc_1E7B1A:
		move.b	(a0)+,d0
		move.b	d0,(a1)
		addq.w	#1,a1
		dbf	d6,loc_1E7B1A
		clr.l	-4(a0)
		dbf	d7,loc_1E7B12
		startZ80
		rts
; ---------------------------------------------------------------------------

loc_1E7B3A:
		tst.b 1(a0)
		beq.s	loc_1E7B56
		subq.b	#1,1(a0)
		addq.w	#6,a0
		addq.w	#6,a1
		dbf	d7,loc_1E7B12
		startZ80
		rts
; ---------------------------------------------------------------------------

loc_1E7B56:
		clr.b (a0)
		addq.w	#6,a0
		addq.w	#6,a1
		dbf	d7,loc_1E7B12
		startZ80
		rts

; =============== S U B R O U T I N E =======================================

sub_1E7B70:
		move.l	a0,-(sp)
		lea	byte_1E7914(pc),a3
		resetZ80
		stopZ80
		movea.l	(a0),a0
		adda.w	d0,a0
		add.w	d0,d0
		adda.w	d0,a0
		moveq	#0,d0
		move.b	(a0)+,d0
		lsl.w	#8,d0
		move.b	(a0)+,d0
		lsl.l	#8,d0
		move.b	(a0)+,d0
		movea.l	d0,a0
		lea	(Z80_RAM+zFMChannelRAM).l,a1
		moveq	#5,d7
@1		bsr.s	sub_1E7BBE
		adda.w	#(Size_FMData),a1
		dbf	d7,@1
		bra.w	sub_1E7C70

; =============== S U B R O U T I N E =======================================

sub_1E7BBE:
		moveq	#0,d1
		move.b	(a0),d1
		lsl.w	#2,d1
		beq.w	loc_1E7C56
		movea.l	d0,a2
		addq.l	#2,d0
		lsl.l	#1,d0
		lsr.w	#1,d0
		addi.w	#$8000,d0
		move.b	d0,$2F(a1)
		lsr.l	#8,d0
		move.b	d0,$2E(a1)
		lsr.w	#8,d0
		move.b	d0,$2D(a1)
		move.b	(a2)+,d0
		move.b	d0,$2B(a1)
		move.b	(a2),d0
		move.b	d0,$29(a1)
		move.b	(a3)+,d0
		move.b	d0,$2A(a1)
		move.b	(a3)+,d0
		move.b	d0,$20(a1)
		move.b	(a3)+,d0
		move.b	d0,$21(a1)
		move.b	#-1,d0
		move.b	d0,$3D(a1)
		move.b	#-1,d0
		move.b	d0,$1F(a1)
		adda.w	d1,a0

loc_1E7C50:
		addq.w	#2,a0
		move.l	a0,d0
		rts
; ---------------------------------------------------------------------------

loc_1E7C56:
		move.b	d1,d0
		move.b	d0,$1F(a1)
		move.b	d1,d0
		move.b	d0,$3D(a1)
		bra.s	loc_1E7C50
; End of function sub_1E7BBE

; =============== S U B R O U T I N E =======================================

sub_1E7C70:
		movea.l	(sp)+,a0
		lea	(Z80_RAM+$E61).l,a1
		movea.l	4(a0),a0
		addq.w	#7,a0
		move.b	(a0)+,(a1)+
		move.b	(a0)+,1(a1)
		move.b	(a0)+,(a1)
		addq.w	#3,a0
		addq.w	#2,a1
		move.b	(a0)+,(a1)+
		move.b	(a0)+,1(a1)
		move.b	(a0)+,(a1)
		resetZ80a
		startZ80
		resetZ80
		rts

; =============== S U B R O U T I N E =======================================

sub_1E6012:
		lea	(Music_Tbl1).l,a0
		add.w	d0,d0
		add.w	d0,d0
		adda.w	word_1E602A(pc,d0.w),a0
		move.w	word_1E6028(pc,d0.w),d0
		jmp	sub_1E7B70(pc)
; End of function sub_1E6012
; ---------------------------------------------------------------------------

word_1E6028:
		dc.w 0			; Current music
word_1E602A:
		dc.w 0			; Current bank
		dc.w 0			; Current music
		dc.w 0			; Current bank
		dc.w 1			; Current music
		dc.w 0			; Current bank
		dc.w 2			; Current music
		dc.w 0			; Current bank
		dc.w 5			; Current music
		dc.w 8			; Current bank
		dc.w 3			; Current music
		dc.w 0			; Current bank
		dc.w 4			; Current music
		dc.w 0			; Current bank
		dc.w 5			; Current music
		dc.w 0			; Current bank
		dc.w 6			; Current music
		dc.w 0			; Current bank
		dc.w 0			; Current music
		dc.w 8			; Current bank
		dc.w 1			; Current music
		dc.w 8			; Current bank
		dc.w 2			; Current music
		dc.w 8			; Current bank
		dc.w 3			; Current music
		dc.w 8			; Current bank
		dc.w 4			; Current music
		dc.w 8			; Current bank
		dc.w 0			; Current music
		dc.w 16			; Current bank
		dc.w 1			; Current music
		dc.w 16			; Current bank
		dc.w 4			; Current music
		dc.w 16			; Current bank
		dc.w 3			; Current music
		dc.w 16			; Current bank
		dc.w 2			; Current music
		dc.w 16			; Current bank
		dc.w 6			; Current music
		dc.w 8			; Current bank
		dc.w 0			; Current music
		dc.w 24			; Current bank
		dc.w 1			; Current music
		dc.w 24			; Current bank
		dc.w 0			; Current music
		dc.w 32			; Current bank
		dc.w 1			; Current music
		dc.w 32			; Current bank
		dc.w 0			; Current music
		dc.w 40			; Current bank
		dc.w 1			; Current music
		dc.w 40			; Current bank
		dc.w 0			; Current music
		dc.w 48			; Current bank
		dc.w 1			; Current music
		dc.w 48			; Current bank
		dc.w 2			; Current music
		dc.w 48			; Current bank
		dc.w 0			; Current music
		dc.w 56			; Current bank
		dc.w 1			; Current music
		dc.w 56			; Current bank
		dc.w 2			; Current music
		dc.w 56			; Current bank
		dc.w 3			; Current music
		dc.w 56			; Current bank
		dc.w 4			; Current music
		dc.w 56			; Current bank
		dc.w 0			; Current music
		dc.w 64			; Current bank
		dc.w 0			; Current music
		dc.w 72			; Current bank
		dc.w 0			; Current music
		dc.w 80			; Current bank
		dc.w 0			; Current music
		dc.w 88			; Current bank
		dc.w 1			; Current music
		dc.w 88			; Current bank
		dc.w 2			; Current music
		dc.w 88			; Current bank
		dc.w 3			; Current music
		dc.w 88			; Current bank
		dc.w 4			; Current music
		dc.w 88			; Current bank
		dc.w 5			; Current music
		dc.w 88			; Current bank
		dc.w 0			; Current music
		dc.w 96			; Current bank
		dc.w 1			; Current music
		dc.w 96			; Current bank
		dc.w 2			; Current music
		dc.w 96			; Current bank
		dc.w 3			; Current music
		dc.w 96			; Current bank
		dc.w 4			; Current music
		dc.w 96			; Current bank
		dc.w 5			; Current music
		dc.w 96			; Current bank
		dc.w 6			; Current music
		dc.w 96			; Current bank
		dc.w 7			; Current music
		dc.w 96			; Current bank
		dc.w 0			; Current music
		dc.w 104			; Current bank
		dc.w 0			; Current music
		dc.w 112			; Current bank
		dc.w 0			; Current music
		dc.w 120			; Current bank
		dc.w 1			; Current music
		dc.w 120			; Current bank
		dc.w 2			; Current music
		dc.w 120			; Current bank
		dc.w 0			; Current music
		dc.w 128			; Current bank
		dc.w 1			; Current music
		dc.w 128			; Current bank

; =============== S U B R O U T I N E =======================================

Load_Fade_Music:
		movem.l	d0-d1,-(sp)
		lea	(SFX_RAM).l,a0
		add.w	d0,(a0)
		move.w	(a0),d1
		cmpi.w	#$FF,d1
		beq.s	loc_1E79F2
		bcs.s	loc_1E79EA
		move.w	#$FF,d1
		move.w	d1,(a0)

loc_1E79EA:
		move.b	Advanced_VolumeData(pc,d1.w),d0
		bsr.w	sub_1E79A4

loc_1E79F2:
		movem.l	(sp)+,d0-d1
		rts

; =============== S U B R O U T I N E =======================================

Advanced_VolumeData:	incbin "z80 driver/Misc/VolumeData.bin"
	even
AdvancedZ80_Player:		incbin "z80 driver/Z80 Sound Driver.bin"
	even
byte_1E7914:
		dc.b 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
		dc.b 0, 0, $F3, $76, 0