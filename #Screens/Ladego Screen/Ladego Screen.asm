Ladego_Screen:
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
		move.w	#$9011,(a6)
		move.w	#$9200,(a6)
		move.w	#$8B00,(a6)
		move.w	#$8720,(a6)
		jsr	(Clear_Palette).l
		clearRAM2 Sprite_table_input,$FF
		clearRAM2 Object_RAM,$7FF
		clr.w	(DMA_queue).w
		move.l	#DMA_queue,(DMA_queue_slot).w
		lea	(Art_Kos_Ladego_FG).l,a0
		lea	(RAM_start).l,a1
		movea.w	#$20,a2
		jsr	(KosArt_To_VDP).l
		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
		lea	(Art_Kos_Ladego_BG).l,a0
		lea	(RAM_start).l,a1
		movea.w	#$1200,a2
		jsr	(KosArt_To_VDP).l
		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
		lea	(Map_Eni_Ladego_FG).l,a0
		lea	(RAM_start).l,a1
		move.w	#1,d0
		jsr	(EniDec).l
		copyTilemap	$FF0000, $C000, $27, $1B
		move	#$2700,sr
		locVRAM	$D000,d0
		move.w	#$3FF,d3
		jsr	(ClearVRAMArea).l
		move	#$2300,sr
		lea	(Map_Eni_Ladego_BG).l,a0
		lea	(RAM_start).l,a1
		move.w	#$2090,d0
		jsr	(EniDec).l
		copyTilemap	$FF0000, $E000, $27, $1B
		move	#$2700,sr
		locVRAM	$F000,d0
		move.w	#$3FF,d3
		jsr	(ClearVRAMArea).l
		move	#$2300,sr
		lea	Pal_Ladego_Screen(pc),a0
		lea	(Target_palette).w,a1
		moveq	#$1F,d0
@2		move.l	(a0)+,(a1)+
		dbf	d0,@2
		move.w	#$10,(Demo_timer).w
		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
		move.w	(VDP_reg_1_command).w,d0
		ori.b	#$40,d0
		move.w	d0,(VDP_control_port).l
		jsr	(Pal_FadeTo).l
@1		move.b	#$16,(V_int_routine).w
		jsr	(DelayProgram).l
		bsr.w	ScrollScreen
		bra.s	@1
		tst.w (Demo_timer).w
		bne.s	@1
		move.b	#$2C,(Game_mode).w
		rts

; =============== S U B R O U T I N E =======================================

ScrollScreen:
		moveq	#0,d0
		move.w	($FFFFF616).w,d0
		subq.w	#8,d0
		move.w	d0,($FFFFF616).w
		neg.w	d0
		move.w	d0,($FFFFF618).w
		rts









; =============== S U B R O U T I N E =======================================

Art_Kos_Ladego_FG:				incbin "#Screens/Ladego Screen/Kosinski Art/Art - FG.bin"
	even
Art_Kos_Ladego_BG:				incbin "#Screens/Ladego Screen/Kosinski Art/Art - BG.bin"
	even
Map_Eni_Ladego_FG:				incbin "#Screens/Ladego Screen/Enigma Map/Map - FG.bin"
	even
Map_Eni_Ladego_BG:				incbin "#Screens/Ladego Screen/Enigma Map/Map - BG.bin"
	even
Pal_Ladego_Screen:				incbin "#Screens/Ladego Screen/Palettes/1.bin"
	even