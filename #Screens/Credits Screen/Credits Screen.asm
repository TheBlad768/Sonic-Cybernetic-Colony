Credits_Screen:
		jsr	(Pal_FadeFrom).l
		move	#$2700,sr
		move.w	(VDP_reg_1_command).w,d0
		andi.b	#$BF,d0
		move.w	d0,(VDP_control_port).l
		jsr	(Fade_Music).l
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
		move.w	#$8B07,(a6)
		move.w	#$8720,(a6)
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
		lea	(InfoCredits_Text).l,a1
		lea	(MapCredits_Text).l,a5
		moveq	#0,d0
		move.w	#7,d1
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
		lea	Palette_TitleScreen(pc),a0
		lea	(Target_palette).w,a1
		moveq	#$1F,d0
@2		move.l	(a0)+,(a1)+
		dbf	d0,@2
		moveq	#$33,d0
		jsr	(PlaySound).l
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
		bsr.s	Credits_Deform
		move	#$2300,sr
		tst.b	(Joypad|Press).w
		bpl.s	@3
		moveq	#0,d0
		cmpi.b	#$30,(Game_mode).w
		beq.s	@4
		moveq	#$20,d0
@4		move.b	d0,(Game_mode).w
		rts

; =============== S U B R O U T I N E =======================================

Credits_Deform:
		lea	CreditsScroll_Data(pc),a2
		bra.w	HScroll_Deform
; ---------------------------------------------------------------------------

CreditsScroll_Data:
		dc.w ((CreditsScroll_Data_End-CreditsScroll_Data)/6)-1
		dScroll_Header A, 216, -$100, 8
CreditsScroll_Data_End
; ---------------------------------------------------------------------------

MapCredits_Text:
		dc.w $F2
		dc.w $1E2
		dc.w $2D2
		dc.w $3C2
		dc.w $4B2
		dc.w $5A2
		dc.w $692
		dc.w $886
InfoCredits_Text:
		dc.b $1D, "HACK AND IDEA?      THEBLAD:9;"
		dc.b $21, "GRAPHICS?        EGORTF     MR@CAT"
		dc.b $22, "GRAPHICS?       DOLPHMAN    SHOOTER"
		dc.b $1D, "PROGRAMMER?         THEBLAD:9;"
		dc.b $1D, "COMPOSER?           JESPER KYD"
		dc.b $22, "SOUND DRIVER?   ADVANCED Z;3 PLAYER"
		dc.b $24, "ORIGINAL IDEA? SONIC 4 MASTER EDITION"
		dc.b $12, "PRESS START TO EXIT"
	even