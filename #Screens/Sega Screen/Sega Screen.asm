SegaScreen:
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
		move.w	#$8B03,(a6)
		move.w	#$8720,(a6)
		jsr	(Clear_Palette).l
		clearRAM2 Sprite_table_input,$FF
		clearRAM2 Object_RAM,$7FF
		clr.w	(DMA_queue).w
		move.l	#DMA_queue,(DMA_queue_slot).w
		lea	(Art_Kos_Sega_BG).l,a0
		lea	(RAM_start).l,a1
		movea.w	#$20,a2
		jsr	(KosArt_To_VDP).l
		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
		lea	(Map_Eni_Sega_BG).l,a0
		lea	(RAM_start).l,a1
		move.w	#1,d0
		jsr	(EniDec).l
		copyTilemap	$FF0000, $C000, $27, $1B
		lea	Pal_SegaScreen(pc),a0
		lea	(Target_palette).w,a1
		moveq	#7,d0
@1		move.l	(a0)+,(a1)+
		dbf	d0,@1
		moveq	#$12,d0
		jsr	(PlaySound).l
		move.w	#$60,(Demo_timer).w
		btst	#6,(Graphics_flags).w
		beq.s	@2
		move.w	#$40,(Demo_timer).w
@2		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
		bsr.w	AnPal_SegaScreen
		move.w	(VDP_reg_1_command).w,d0
		ori.b	#$40,d0
		move.w	d0,(VDP_control_port).l
		jsr	(Pal_FadeTo).l
@3		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
		bsr.w	AnPal_SegaScreen
		tst.w (Demo_timer).w
		bne.s	@3
		move.w	#$10,($FFFF7800).l
		move.w	#$18,($FFFF7802).l
		move.w	#$30,(Demo_timer).w
@4		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
		bsr.w	AnPal_SegaScreen
		bsr.s	Sega_Deform
		tst.w (Demo_timer).w
		bne.s	@4
		move.b	#4,(Game_mode).w
		rts

; =============== S U B R O U T I N E =======================================

Sega_Deform:
		moveq	#0,d2
		lea	(H_scroll_buffer).w,a1
		subq.w	#1,($FFFF7800).l
		bmi.s	Sega_Deform_1
		add.w	(Camera_X_pos).w,d2
		neg.w	d2
		move.w	#$6F,d3
@1		jsr	(RandomNumber).l
		andi.w	#7,d0
		move.w	d0,(a1)+
		move.w	d2,(a1)+
		swap	d0
		andi.w	#7,d0
		neg.w	d0
		move.w	d0,(a1)+
		move.w	d2,(a1)+
		dbf	d3,@1
		rts
; ---------------------------------------------------------------------------

Sega_Deform_1:
		subq.w	#1,($FFFF7802).l
		bmi.s	Sega_Deform_2
		move.w	(Camera_X_pos).w,d2
		neg.w	d2
		move.w	#$6F,d3
@1		jsr	(RandomNumber).l
		addq.w	#8,(a1)
		andi.w	#7,d0
		add.w	d0,(a1)
		cmpi.w	#$F8,(a1)
		blt.s		@2
		move.w	#$F8,(a1)
@2		addq.w	#2,a1
		move.w	d2,(a1)+
		subq.w	#8,(a1)
		swap	d0
		andi.w	#7,d0
		sub.w	d0,(a1)
		cmpi.w	#-$104,(a1)
		bgt.s	@3
		move.w	#-$104,(a1)
@3		addq.w	#2,a1
		move.w	d2,(a1)+
		dbf	d3,@1
		rts
; ---------------------------------------------------------------------------

Sega_Deform_2:
		disableInts
		move.l	#$45000003,d0
		move.w	#$FF,d3
		jsr	(ClearVRAMArea).l
		enableInts
		rts

; =============== S U B R O U T I N E =======================================

AnPal_SegaScreen:
		subq.w	#1,($FFFFF634).w
		bpl.s	@3
		move.w	#2,($FFFFF634).w
		lea	Pal_SegaScreen_Anim(pc),a0
		move.w	($FFFFF632).w,d0
		addq.w	#2,($FFFFF632).w
		cmpi.w	#$10,($FFFFF632).w
		bcs.s	@1
		move.w	#0,($FFFFF632).w
@1		lea	(a0,d0.w),a1
		lea	(Normal_palette_line_2).w,a2
		moveq	#3,d0
@2		move.w	(a1)+,-(a2)
		move.w	(a1)+,-(a2)
		dbf	d0,@2
@3		rts

; =============== S U B R O U T I N E =======================================

Art_Kos_Sega_BG:				incbin "#Screens/Sega Screen/Kosinski Art/Art - BG.bin"
	even
Map_Eni_Sega_BG:				incbin "#Screens/Sega Screen/Enigma Map/Map - BG.bin"
	even
Pal_SegaScreen:					incbin "#Screens/Sega Screen/Palettes/Pal - BG.bin"
	even
Pal_SegaScreen_Anim:			incbin	"#Screens/Sega Screen/Palettes/ANIPAL.bin"
	even