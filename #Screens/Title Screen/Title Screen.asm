Title_Screen:
		jsr	(Pal_FadeFrom).l
		move	#$2700,sr
		move.w	(VDP_reg_1_command).w,d0
		andi.b	#$BF,d0
		move.w	d0,(VDP_control_port).l
		jsr	(ClearVRAM).l
		jsr	(ClearScreen).l
		lea	(VDP_control_port).l,a6
		move.w	#$8004,(a6)
		move.w	#$8230,(a6)
		move.w	#$8330,(a6)
		move.w	#$8407,(a6)
		move.w	#$857C,(a6)
		move.w	#$8230,(a6)
		move.w	#$8700,(a6)
		move.w	#$8C81,(a6)
		move.w	#$9001,(a6)
		move.w	#$9200,(a6)
		move.w	#$8B04,(a6)
		move.w	#$8720,(a6)
		jsr	(Clear_Palette).l
		clearRAM2 Sprite_table_input,$FF
		clearRAM2 Object_RAM,$7FF
		clr.w	(DMA_queue).w
		move.l	#DMA_queue,(DMA_queue_slot).w
		locVRAM	$800
		lea	(ArtNem_TitleScreen_Text).l,a0
		jsr	(NemDec).l
		lea	(ArtKos_BGTitleScreen).l,a0
		lea	(RAM_start).l,a1
		movea.w	#$20,a2
		jsr	(KosArt_To_VDP).l
		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
		lea	(ArtKos_FGTitleScreen).l,a0
		lea	(RAM_start).l,a1
		movea.w	#$2000,a2
		jsr	(KosArt_To_VDP).l
		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
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
		lea	(Info_TitleText).l,a1
		lea	(Map_TitleText).l,a5
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
		addi.w	#$D,d0
@10		move.w	d0,(a2)+
		dbf	d2,@9
@12		dbf	d1,@8
		lea	(RAM_start).l,a1
		locVRAM	$C000,d0
		moveq	#$27,d1
		moveq	#$1B,d2
		jsr	(ShowVDPGraphics).l
		lea	(MapEni_FGTitleScreen).l,a0
		lea	(RAM_start).l,a1
		move.w	#$4100,d0
		jsr	(EniDec).l
		copyTilemap	$FF0000, $C000, $27, $D
		lea	Palette_TitleScreen(pc),a0
		lea	(Target_palette).w,a1
		moveq	#$1F,d0
@2		move.l	(a0)+,(a1)+
		dbf	d0,@2
		cmpi.w	#$12,(Sound_test_sound).w
		beq.s	@5
		moveq	#$12,d0
		jsr	(PlaySound).l
@5		moveq	#0,d0
		move.w	d0,($FFFFFF82).w
		move.l	d0,(Music_test_count).w
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
		bsr.w	Title_Controls
		move.w	#$2000,d3
		bsr.w	LevelSelect_MarkFields
		move	#$2300,sr
		tst.b	(Joypad|Press).w
		bpl.s	@3
		move.b	#$20,(Game_mode).w
		tst.w ($FFFFFF82).w
		bne.s	@4
		move.b	#$C,(Game_mode).w
		move.b	#1,(Current_act).w
		move.b	#3,($FFFFFE12).w
		move.b	#3,($FFFFFEC6).w
@4		rts

; =============== S U B R O U T I N E =======================================

LevelSelect_MarkFields:
		lea	(RAM_start).l,a4
		lea	(TitleScr_MarkTable).l,a5
		cmpi.b	#$20,(Game_mode).w
		bne.s	@1
		lea	(OptScr_MarkTable).l,a5
@1		cmpi.b	#$2C,(Game_mode).w
		bne.s	@2
		lea	(AdvScr_MarkTable).l,a5
@2		lea	(VDP_data_port).l,a6
		moveq	#0,d0
		move.w	($FFFFFF82).w,d0
		lsl.w	#2,d0
		lea	(a5,d0.w),a3
		moveq	#0,d0
		move.b	(a3),d0
		mulu.w	#$50,d0
		moveq	#0,d1
		move.b	1(a3),d1
		add.w	d1,d0
		lea	(a4,d0.w),a1
		moveq	#0,d1
		move.b	(a3),d1
		lsl.w	#7,d1
		add.b	1(a3),d1
		addi.w	#$C000,d1
		lsl.l	#2,d1
		lsr.w	#2,d1
		ori.w	#$4000,d1
		swap	d1
		move.l	d1,VDP_control_port-VDP_data_port(a6)
		moveq	#$E,d2
@3		move.w	(a1)+,d0
		add.w	d3,d0
		move.w	d0,(a6)
		dbf	d2,@3
		addq.w	#2,a3
		moveq	#0,d0
		move.b	(a3),d0
		beq.s	@4
		mulu.w	#$50,d0
		moveq	#0,d1
		move.b	1(a3),d1
		add.w	d1,d0
		lea	(a4,d0.w),a1
		moveq	#0,d1
		move.b	(a3),d1
		lsl.w	#7,d1
		add.b	1(a3),d1
		addi.w	#$C000,d1
		lsl.l	#2,d1
		lsr.w	#2,d1
		ori.w	#$4000,d1
		swap	d1
		move.l	d1,VDP_control_port-VDP_data_port(a6)
		move.w	(a1)+,d0
		add.w	d3,d0
		move.w	d0,(a6)
@4		cmpi.b	#$20,(Game_mode).w
		bne.s	Advanced_MarkFields
		tst.w	($FFFFFF82).w
		bne.s	@5
		bsr.w	Load_OptionsMenu_Text
@5		cmpi.w	#1,($FFFFFF82).w
		bne.s	@6
		bsr.w	Load_OptionsMusic_Numbers
@6		cmpi.w	#2,($FFFFFF82).w
		bne.s	Title_Controls_Locret
		bra.w	Load_OptionsSound_Numbers
; ---------------------------------------------------------------------------

Advanced_MarkFields:
		cmpi.b	#$2C,(Game_mode).w
		bne.s	Title_Controls_Locret
		tst.w	($FFFFFF82).w
		bne.s	Title_Controls_Locret
		bra.w	Load_OptionsTempo_Numbers

; =============== S U B R O U T I N E =======================================

Title_Controls:
		moveq	#0,d0
		move.w	($FFFFFF82).w,d0
		move.b	(Ctrl_1_pressed).w,d1
		btst	#0,d1
		beq.s	@1
		tst.w	d0
		beq.s	@2
		bsr.s	Title_Controls_Sound
		subq.w	#1,d0
		bpl.s	@2
		moveq	#0,d0
		bra.s	@2
@1		btst	#1,d1
		beq.s	@2
		tst.w d0
		bne.s	@2
		bsr.s	Title_Controls_Sound
		addq.w	#1,d0
		cmpi.w	#1,d0
		ble.s		@2
		move.w	#1,d0
@2		move.w	d0,($FFFFFF82).w

Title_Controls_Locret:
		rts

; =============== S U B R O U T I N E =======================================

Title_Controls_Sound:
		move.w	d0,-(sp)
		moveq	#$28,d0
		jsr	(PlaySound_Special).l
		move.w	(sp)+,d0
		rts

; =============== S U B R O U T I N E =======================================

HScroll_Deform:
		lea	(H_scroll_buffer).w,a1
		move.w	(a2)+,d6
@1		movea.w	(a2)+,a1
		move.w	(a2)+,d2
		move.w	(a2)+,d7
		ext.l	d2
		asl.l	#8,d2
@2		add.l	d2,(a1)
		adda.w	#4,a1
		dbf	d7,@2
		dbf	d6,@1
		rts

; =============== S U B R O U T I N E =======================================

Title_Deform:
		lea	Scroll_Data(pc),a2

VScroll_Deform:
		lea	(VDP_data_port).l,a6
		move.l	#$40000010,VDP_control_port-VDP_data_port(a6)
		lea	($FFFFA000).w,a1
		moveq	#$27,d6
@1		move.w	(a2)+,d2
		ext.l	d2
		asl.l	#8,d2
		add.l	d2,(a1)
		move.w	(a1)+,(a6)
		dbf	d6,@1
		rts
; ---------------------------------------------------------------------------

Scroll_Data:
		dc.w 0, $200
		dc.w 0, $300
		dc.w 0, $400
		dc.w 0, $500
		dc.w 0, $200
		dc.w 0, $300
		dc.w 0, $500
		dc.w 0, $600
		dc.w 0, $200
		dc.w 0, $300
		dc.w 0, $400
		dc.w 0, $600
		dc.w 0, $500
		dc.w 0, $300
		dc.w 0, $400
		dc.w 0, $600
		dc.w 0, $200
		dc.w 0, $300
		dc.w 0, $500
		dc.w 0, $600
; ---------------------------------------------------------------------------

TitleScr_MarkTable:
		dc.b $16, $16,$16,$24
		dc.b $19, $16,$19,$24
Map_TitleText:
		dc.w $6FE
		dc.w $7F0
Info_TitleText:
		dc.b 10, "START LEVEL"
		dc.b 7, " OPTIONS"
	even

; =============== S U B R O U T I N E =======================================

ArtNem_TitleScreen_Text:		incbin "#Screens/Title Screen/Nemesis Art/Text.bin"
	even
ArtKos_FGTitleScreen:			incbin "#Screens/Title Screen/Kosinski Art/Art - FG.bin"
	even
MapEni_FGTitleScreen:		incbin "#Screens/Title Screen/Enigma Map/Map - FG.bin"
	even
ArtKos_BGTitleScreen:			incbin "#Screens/Title Screen/Kosinski Art/Art - BG.bin"
	even
MapEni_BGTitleScreen:		incbin "#Screens/Title Screen/Enigma Map/Map - BG.bin"
	even
Palette_TitleScreen:			incbin "#Screens/Title Screen/Palettes/1.bin"
	even