
; =============== S U B R O U T I N E =======================================

ShakeScreen_Setup:
		moveq	#0,d1
		move.w	(Screen_Shaking_Flag).w,d0
		beq.s	loc_4F406
		bmi.s	loc_4F3FA
		subq.w	#1,d0
		move.w	d0,(Screen_Shaking_Flag).w
		move.b	ScreenShakeArray(pc,d0.w),d1
		ext.w	d1
		bra.s	loc_4F406
; ---------------------------------------------------------------------------

loc_4F3FA:
		move.w	($FFFFFE04).w,d0
		andi.w	#$3F,d0
		move.b	ScreenShakeArray2(pc,d0.w),d1

loc_4F406:
		move.w	d1,(Screen_Shaking_Screen).w
		rts

; =============== S U B R O U T I N E =======================================

ShakeScreen_Menu:
		moveq	#0,d0
		move.w	($FFFFFE0E).w,d0
		andi.w	#$3F,d0
		lea	ScreenShakeArray2(pc),a1
		lea	(a1,d0.w),a1
		moveq	#0,d0
		move.b	(a1)+,d0
		move.w	d0,(V_scroll_value_FG).w
		move.w	d0,(V_scroll_value_BG).w
		move.b	(a1)+,d0
		move.w	d0,(H_scroll_buffer_FG).w
		move.w	d0,(H_scroll_buffer_BG).w
		rts

; =============== S U B R O U T I N E =======================================

ScreenShakeArray:
		dc.b 1,$FF,1,$FF,2,$FE,2,$FE,3,$FD,3,$FD,4,$FC,4,$FC,5,$FB,5,$FB
ScreenShakeArray2:
		dc.b   1,  2,  1,  3,  1,  2,  2,  1,  2,  3,  1,  2,  1,  2,  0,  0
		dc.b   2,  0,  3,  2,  2,  3,  2,  2,  1,  3,  0,  0,  1,  0,  1,  3
		dc.b   1,  2,  1,  3,  1,  2,  2,  1,  2,  3,  1,  2,  1,  2,  0,  0
		dc.b   2,  0,  3,  2,  2,  3,  2,  2,  1,  3,  0,  0,  1,  0,  1,  3
		dc.w     1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    0,    0,    0,    0
		dc.w     0,    0,    0,    0,    0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
		dc.w $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    0
		dc.w     0,    0,    0,    0,    0,    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1
		dc.w     1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    0,    0,    0,    0
		dc.w     0,    0,    0,    0,    0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
		dc.w $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    0
		dc.w     0,    0,    0,    0,    0,    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1
		dc.w     1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    0,    0,    0,    0
		dc.w     0,    0,    0,    0,    0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
		dc.w $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    0
		dc.w     0,    0,    0,    0,    0,    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1
		dc.w     1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    0,    0,    0,    0
		dc.w     0,    0,    0,    0,    0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
		dc.w $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    0
		dc.w     0,    0,    0,    0,    0,    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1
		dc.w     1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,    0,    0,    0,    0
		dc.w     0,    0,    0,    0,    0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF
		dc.w     0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    1,    1,    1,    1,    1
		dc.w     1,    0,    0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    1,    1,    1
		dc.w     1,    1,    1,    0,    0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    1
		dc.w     1,    1,    1,    1,    1,    0,$FFFF,$FFFE,$FFFE,$FFFF,    0,    2,    2,    2,    2,    0
		dc.w     0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    1,    1,    1,    1,    1
		dc.w     1,    0,    0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    1,    1,    1
		dc.w     1,    1,    1,    0,    0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    1
		dc.w     1,    1,    1,    1,    1,    0,$FFFF,$FFFE,$FFFE,$FFFF,    0,    2,    2,    2,    2,    0
		dc.w     0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    1,    1,    1,    1,    1
		dc.w     1,    0,    0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    1,    1,    1
		dc.w     1,    1,    1,    0,    0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    1
		dc.w     1,    1,    1,    1,    1,    0,$FFFF,$FFFE,$FFFE,$FFFF,    0,    2,    2,    2,    2,    0
		dc.w     0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    1,    1,    1,    1,    1
		dc.w     1,    0,    0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    1,    1,    1
		dc.w     1,    1,    1,    0,    0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    1
		dc.w     1,    1,    1,    1,    1,    0,$FFFF,$FFFE,$FFFE,$FFFF,    0,    2,    2,    2,    2,    0
		dc.w     0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    1,    1,    1,    1,    1
		dc.w     1,    0,    0,    0,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,    0,    0,    0,    1,    1,    1