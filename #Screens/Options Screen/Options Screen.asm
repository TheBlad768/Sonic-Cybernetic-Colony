Options_Screen:
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
		lea	(Info_Text).l,a1
		lea	(Map_Text).l,a5
		moveq	#0,d0
		move.w	#4,d1
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
		bsr.w	Load_OptionsMenu_Text
		moveq	#0,d3
		bsr.w	Load_OptionsMusic_Numbers
		moveq	#0,d3
		bsr.w	Load_OptionsSound_Numbers
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
		bsr.w	Options_Controls
		move.w	#$8000,d3
		bsr.w	LevelSelect_MarkFields
		move	#$2300,sr
		moveq	#0,d0
		moveq	#0,d2
		move.b	(Ctrl_1_pressed).w,d1
		move.w	($FFFFFF82).w,d2
		add.w	d2,d2
		jsr	.Main2(pc,d2.w)
		tst.b	(Joypad|Press).w
		bpl.s	@3
		move.b	#$24,(Game_mode).w
		cmpi.w	#3,($FFFFFF82).w
		bne.s	@6
		move.b	#$28,(Game_mode).w
@6		cmpi.w	#1,($FFFFFF82).w
		bne.s	@7
		move.b	#$2C,(Game_mode).w
@7		rts
; ---------------------------------------------------------------------------

.Main2:
		bra.s	Select_Rings
; ---------------------------------------------------------------------------
		bra.s	Select_Music
; ---------------------------------------------------------------------------
		bra.s	Select_Sound
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------
		rts

; =============== S U B R O U T I N E =======================================

Select_Rings:
		move.b	(Rings_mode_count).w,d0
		btst	#2,d1
		beq.s	@1
		subq.b	#1,d0
		bpl.s	@1
		moveq	#0,d0
@1		btst	#3,d1
		beq.s	@2
		addq.b	#1,d0
		cmpi.b	#2,d0
		ble.s		@2
		moveq	#2,d0
@2		move.b	d0,(Rings_mode_count).w

Select_Rings_Locret:
		rts

; =============== S U B R O U T I N E =======================================

Select_Music:
		move.w	#$39,d2
		move.w	(Music_test_count).w,d0
		bsr.s	Options_Screen_Control
		move.w	d0,(Music_test_count).w
		move.b	(Ctrl_1_pressed).w,d1
		andi.b	#$70,d1
		beq.s	Select_Rings_Locret
		jmp	(PlaySound).l

; =============== S U B R O U T I N E =======================================

Select_Sound:
		move.w	#$7A,d2
		move.w	(Sound_test_count).w,d0
		bsr.s	Options_Screen_Control
		move.w	d0,(Sound_test_count).w
		move.b	(Ctrl_1_pressed).w,d1
		andi.b	#$70,d1
		beq.s	Select_Rings_Locret
		jmp	(PlaySound_Special).l

; =============== S U B R O U T I N E =======================================

Options_Screen_Control:
		andi.b	#$C,d1
		beq.s	@1
		move.w	#$10,(Options_Screen_Timer).w
		bra.s	@2
; ---------------------------------------------------------------------------
@1		move.b	(Ctrl_1_hold).w,d1
		andi.b	#$C,d1
		beq.s	@4
		subq.w	#1,(Options_Screen_Timer).w
		bpl.s	@4
		move.w	#3,(Options_Screen_Timer).w
@2		btst	#2,d1
		beq.s	@3
		subq.w	#1,d0
		bpl.s	@4
		moveq	#0,d0
		rts
; ---------------------------------------------------------------------------
@3		addq.w	#1,d0
		cmp.w	d2,d0
		ble.s		@4
		move.w	d2,d0
@4		rts

; =============== S U B R O U T I N E =======================================

Options_Controls:
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
		cmpi.w	#4,d0
		bcc.s	@2
		bsr.w	Title_Controls_Sound
		addq.w	#1,d0
		cmpi.w	#4,d0
		ble.s		@2
		move.w	#4,d0
@2		move.w	d0,($FFFFFF82).w
		rts

; =============== S U B R O U T I N E =======================================

Load_OptionsMenu_Text:
		locVRAM	$C236
		moveq	#0,d0
		move.b	(Rings_mode_count).w,d0
		add.w	d0,d0
		andi.w	#(Off_OptionsMenu_Text_End-Off_OptionsMenu_Text)-2,d0
		move.w	Off_OptionsMenu_Text(pc,d0.w),d0
		lea	Off_OptionsMenu_Text(pc,d0.w),a0
		moveq	#9,d1

Load_OptionsMenuText:
		moveq	#0,d0
		move.b	(a0)+,d0
		addi.w	#$200D,d0
		add.w	d3,d0
		move.w	d0,(a6)
		dbf	d1,Load_OptionsMenuText
		rts
; --------------------------------------------------------------------------

Off_OptionsMenu_Text: offsetTable
		offsetTableEntry.w OptionsMenu_Text1
		offsetTableEntry.w OptionsMenu_Text2
		offsetTableEntry.w OptionsMenu_Text3
		offsetTableEntry.w OptionsMenu_Text4
Off_OptionsMenu_Text_End
; --------------------------------------------------------------------------

OptionsMenu_Text1:
		dc.b "WITHOUT   "
	even
OptionsMenu_Text2:
		dc.b "STANDARD  "
	even
OptionsMenu_Text3:
		dc.b "MORE@@@   "
	even
OptionsMenu_Text4:
		dc.b "INFINITELY"
	even

; =============== S U B R O U T I N E =======================================

Load_OptionsMusic_Numbers:
		locVRAM	$C3B6
		move.w	(Music_test_count).w,d0
		bra.s	Load_Options_Numbers
; ---------------------------------------------------------------------------

Load_OptionsSound_Numbers:
		locVRAM	$C536
		move.w	(Sound_test_count).w,d0

Load_Options_Numbers:
		move.b	d0,d2
		lsr.b #8,d0
		bsr.s	@1
		move.b	d2,d0
		lsr.b	#4,d0
		bsr.s	@1
		move.b	d2,d0
@1		andi.w	#$F,d0
		cmpi.b	#$A,d0
		blo.s		@2
		addq.b	#4,d0
@2		addi.w	#$2040,d0
		add.w	d3,d0
		move.w	d0,(a6)
		rts
; ---------------------------------------------------------------------------

OptScr_MarkTable:
		dc.b 4, 2, 4,$24
		dc.b 7, 2, 7,$24
		dc.b $A, 2, $A,$24
		dc.b $D, 2, $D,$24
		dc.b $10, 2, $10,$24
Map_Text:
		dc.w $142
		dc.w $232
		dc.w $322
		dc.w $412
		dc.w $502
Info_Text:
		dc.b $D, "RINGS IN GAME?"
		dc.b $A, "MUSIC TEST?"
		dc.b $A, "SOUND TEST?"
		dc.b 6, "CREDITS"
		dc.b 3, "EXIT"
	even
; ---------------------------------------------------------------------------

Palette_OptionsScreen:			incbin "#Screens/Options Screen/Palettes/1.bin"
	even