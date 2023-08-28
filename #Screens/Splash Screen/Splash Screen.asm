Splash_Screen:
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
		move.w	#$8B00,(a6)
		move.w	#$8720,(a6)
		jsr	(Clear_Palette).l
		clearRAM2 Sprite_table_input,$FF
		clearRAM2 Object_RAM,$7FF
		clr.w	(DMA_queue).w
		move.l	#DMA_queue,(DMA_queue_slot).w
		lea	(Art_Kos_Splash_FG).l,a0
		lea	(RAM_start).l,a1
		movea.w	#$20,a2
		jsr	(KosArt_To_VDP).l
		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
		lea	(Map_Eni_Splash_FG).l,a0
		lea	(RAM_start).l,a1
		move.w	#1,d0
		jsr	(EniDec).l
		copyTilemap	$FF0000, $C000, $27, $1B
		move.w	#$40,(Demo_timer).w
		btst	#6,(Graphics_flags).w
		beq.s	@1
		move.w	#$38,(Demo_timer).w
@1		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
		bsr.s	AnPal_Splash
		jsr	(ShakeScreen_Menu).l
		move.w	(VDP_reg_1_command).w,d0
		ori.b	#$40,d0
		move.w	d0,(VDP_control_port).l
		jsr	(Pal_FadeTo).l
@2		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
		bsr.s	AnPal_Splash
		jsr	(ShakeScreen_Menu).l
		tst.w (Demo_timer).w
		bne.s	@2
		move.b	#$1C,(Game_mode).w
		rts

; =============== S U B R O U T I N E =======================================

AnPal_Splash:
		subq.w	#1,($FFFFF634).w
		bpl.s	@3
		move.w	#1,($FFFFF634).w
		lea	Pal_Splash_Screen_Anim(pc),a0
		move.w	($FFFFF632).w,d0
		addq.w	#2,($FFFFF632).w
		cmpi.w	#$1E,($FFFFF632).w
		bcs.s	@1
		move.w	#2,($FFFFF632).w
@1		lea	(a0,d0.w),a1
		lea	(Normal_palette_line_1).w,a2
		moveq	#7,d0
@2		move.l	(a1)+,(a2)+
		dbf	d0,@2
@3		rts

; =============== S U B R O U T I N E =======================================

Art_Kos_Splash_FG:				incbin "#Screens/Splash Screen/Kosinski Art/Art - FG.bin"
	even
Map_Eni_Splash_FG:				incbin "#Screens/Splash Screen/Enigma Map/Map - FG.bin"
	even
Pal_Splash_Screen_Anim:			incbin "#Screens/Splash Screen/Palettes/Pal - Anim.bin"
	even