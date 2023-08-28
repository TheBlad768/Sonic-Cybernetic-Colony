Advanced_Screen:
		jsr	(Pal_FadeFrom).l
		move	#$2700,sr
		move.w	(VDP_reg_1_command).w,d0
		andi.b	#$BF,d0
		move.w	d0,(VDP_control_port).l
		jsr	(ClearScreen).l
		lea	(VDP_control_port).l,a6
		move.w	#$8004,(a6)
		move.w	#$8230,(a6)
		move.w	#$8330,(a6)
		move.w	#$8407,(a6)
		move.w	#$857C,(a6)
		move.w	#$8230,(a6)
		move.w	#$8700,(a6)
		move.w	#$8C89,(a6)
		move.w	#$9001,(a6)
		move.w	#$9200,(a6)
		move.w	#$8B04,(a6)
		move.w	#$8720,(a6)
		jsr	(Clear_Palette).l
		clearRAM2 Sprite_table_input,$FF
		clearRAM2 Object_RAM,$7FF
		clr.w	(DMA_queue).w
		move.l	#DMA_queue,(DMA_queue_slot).w
		lea	(MapEni_BGTitleScreen).l,a0
		lea	(RAM_start).l,a1
		move.w	#$6001,d0
		jsr	(EniDec).l
		copyTilemap	$FF0000, $E000, $3F, $1B
		lea	(RAM_start).l,a3
		move.w	#$45F,d1
@1		move.w	#0,(a3)+
		dbf	d1,@1
		lea	(RAM_start).l,a3
		lea	(Info_AdvancedText).l,a1
		lea	(Map_AdvancedText).l,a5
		moveq	#0,d0
		move.w	#1,d1
@8		move.w	(a5)+,d3
		lea	(a3,d3.w),a2
		moveq	#0,d2
		move.b	(a1)+,d2
		move.w	d2,d3
@9		moveq	#0,d0
		move.b	(a1)+,d0
		tst.b d0
		beq.s	@10
		addi.w	#$200D,d0
@10		move.w	d0,(a2)+
		dbf	d2,@9
@12		dbf	d1,@8
		lea	(RAM_start).l,a1
		locVRAM	$C000,d0
		moveq	#$27,d1
		moveq	#$1B,d2
		jsr	(ShowVDPGraphics).l
		moveq	#0,d3
		bsr.w	Load_OptionsTempo_Numbers
		lea	Palette_OptionsScreen(pc),a0
		lea	(Target_palette).w,a1
		moveq	#$1F,d0
@2		move.l	(a0)+,(a1)+
		dbf	d0,@2
		moveq	#0,d0
		move.w	d0,($FFFFFF82).w
		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
		move.w	(VDP_reg_1_command).w,d0
		ori.b	#$40,d0
		move.w	d0,(VDP_control_port).l
		jsr	(Pal_FadeTo).l
@3		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
		move	#$2700,sr
		bsr.w	Title_Deform
		moveq	#0,d3
		bsr.w	LevelSelect_MarkFields
		bsr.w	Advanced_Controls
		move.w	#$8000,d3
		bsr.w	LevelSelect_MarkFields
		move	#$2300,sr
		moveq	#0,d0
		moveq	#0,d2
		move.b	(Ctrl_1_pressed).w,d1
		move.w	($FFFFFF82).w,d2
		add.w	d2,d2
		jsr	.Main(pc,d2.w)
		tst.b	(Joypad|Press).w
		bpl.s	@3
		move.b	#$20,(Game_mode).w
		rts
; ---------------------------------------------------------------------------

.Main:
		bra.s	Select_Tempo
; ---------------------------------------------------------------------------
		rts

; =============== S U B R O U T I N E =======================================

Select_Tempo:
		move.w	#$FF,d2
		stopZ80
		move.b	(Z80_RAM+$3B).l,d0
		bsr.w	Options_Screen_Control
		move.b	d0,(Z80_RAM+$3B).l
		startZ80
		rts

; =============== S U B R O U T I N E =======================================

Advanced_Controls:
		moveq	#0,d0
		move.w	($FFFFFF82).w,d0
		move.b	(Ctrl_1_pressed).w,d1
		btst	#0,d1
		beq.s	@1
		tst.w	d0
		beq.s	@2
		bsr.w	Title_Controls_Sound
		subq.w	#1,d0
		bpl.s	@2
		moveq	#0,d0
		bra.s	@2
@1		btst	#1,d1
		beq.s	@2
		cmpi.w	#1,d0
		bcc.s	@2
		bsr.w	Title_Controls_Sound
		addq.w	#1,d0
		cmpi.w	#1,d0
		ble.s		@2
		move.w	#1,d0
@2		move.w	d0,($FFFFFF82).w
		rts

; =============== S U B R O U T I N E =======================================

Load_OptionsTempo_Numbers:
		locVRAM	$C236
		stopZ80
		move.b	(Z80_RAM+$3B).l,d0
		startZ80
		bra.w	Load_Options_Numbers
; ---------------------------------------------------------------------------

AdvScr_MarkTable:
		dc.b 4, 2, 4,$24
		dc.b 7, 2, 7,$24
Map_AdvancedText:
		dc.w $142
		dc.w $232
Info_AdvancedText:
		dc.b $C, "DRIVER TEMPO?"
		dc.b 3, "EXIT"
	even