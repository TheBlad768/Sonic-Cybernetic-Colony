; ===========================================================================
; Boss for GHZ.
; Version 2.3
; By TheBlad768 (2016).
; ===========================================================================

; Universal object variables
obRender:		equ 1	; .b
obGfx:			equ 2	; .w
obMap:			equ 4	; .l
obX:			equ 8	; .w.l
obScreenY:		equ $A	; .w
obY:				equ $C	; .w.l
obVelX:			equ $10	; .w
obVelY:			equ $12	; .w
obInertia:		equ $14	; .w
obHeight:		equ $16	; .b
obWidth:		equ $17	; .b
obPriority:		equ $18	; .b
obActWid:		equ $19	; .b
obFrame:		equ $1A	; .b
obAnim:			equ $1C	; .b
obColType:		equ $20	; .b
obColProp:		equ $21	; .b
obStatus:		equ $22	; .b
obRoutine:		equ $24	; .b
ob2ndRout:		equ $25	; .b
obAngle:			equ $26	; .b.w
obSubtype:		equ $28	; .b.w

; Dynamic object variables
;obNull			equ $2A	; .w
;obNull			equ $2C	; .w
;obNull			equ $2E	; .w
obXNext:		equ $30	; .w
;obNull			equ $32	; .w
obParent: 		equ $34	; .w
;obNull			equ $36	; .w
obYNext:		equ $38	; .w
;obNull			equ $3A	; .w
obTimer:			equ $3C	; .w
obFlash: 			equ $3E	; .b
;obNull			equ $3F	; .b

; =============== S U B R O U T I N E =======================================

BossGreenHill:
		lea	BossGreenHill_Index(pc),a1
		bra.w	ObjectsRoutine
; ---------------------------------------------------------------------------

BossGreenHill_Index:
		offsetEntry.w BossGreenHill_Init
BossGreenHill_RobotnikShip_Index
		offsetEntry.w BossGreenHill_ShipMain
BossGreenHill_RobotnikFace_Index
		offsetEntry.w ObjBossGreenHill_RobotnikFace
BossGreenHill_RobotnikFlame_Index
		offsetEntry.w ObjBossGreenHill_RobotnikFlame
BossGreenHill_RobotnikGlass_Index
		offsetEntry.w ObjBossGreenHill_RobotnikGlass
BossGreenHill_CircularRing_Index
		offsetEntry.w BossCircularRing
BossGreenHill_ChaseBall_Index
		offsetEntry.w BossChaseBall
BossGreenHill_EggmanLives_Index
		offsetEntry.w Robotnik_HudLives
BossGreenHill_Targetting_Sensor_Index
		offsetEntry.w Targetting_Sensor
BossGreenHill_RobotnikShipCrane_Index
		offsetEntry.w Robotnik_ShipCrane
BossGreenHill_RobotnikRun_Index
		offsetEntry.w Robotnik_Run
; ---------------------------------------------------------------------------

BossGreenHill_Init:
		addq.b	#2,obRoutine(a0)
		lea	ObjDat3_BossGreenHill_Robotnik(pc),a1
		bsr.w	LoadObjects_Data
		move.w	obX(a0),obXNext(a0)
		move.w	obY(a0),obYNext(a0)
		move.b	#$18,obHeight(a0)
		move.b	#16,obColProp(a0)
		lea	ChildObjDat_RobotnikGlassFaceAndFlame(pc),a2
		bsr.w	Create_ChildObject

BossGreenHill_Hud:
		lea	ChildObjDat_RobotnikHud(pc),a2
		bsr.w	Create_ChildObject
		bne.s	@2
		move.b	#2,obFrame(a1)
		locVRAM	$D120,$2A(a1)
@2		rts

; =============== S U B R O U T I N E =======================================

BossGreenHill_ShipMain:
		jsr	(BossMove).l
		cmpi.b	#(BossGreenHill_EndSecond_ShipIndex-BossGreenHill_ShipIndex),ob2ndRout(a0)
		bcc.s	@1
		cmpi.b	#(BossGreenHill_ShipIndex_Simples_Fall-BossGreenHill_ShipIndex),ob2ndRout(a0)
		beq.s	@1
		move.b	obAngle(a0),d0
		addq.b	#2,obAngle(a0)
		jsr	(CalcSine).l
		asr.w	#6,d0
		add.w	obYNext(a0),d0
		move.w	d0,obY(a0)
		move.w	obXNext(a0),obX(a0)
@1		lea	BossGreenHill_ShipIndex(pc),a1
		bsr.w	ChildObjectsRoutine
		bsr.w	BossGreenHill_Hurt
		bra.w	BossGreenHill_Display2
; ---------------------------------------------------------------------------

BossGreenHill_ShipIndex:
		offsetEntry.w BossGreenHill_Move_Circular_LeftRight
		offsetEntry.w BossGreenHill_Move_Circular_Move
		offsetEntry.w BossGreenHill_Move_Circular_LeftRight
		offsetEntry.w BossGreenHill_Move_Circular_Create
		offsetEntry.w BossGreenHill_Move_Jump
		offsetEntry.w BossGreenHill_Move_Locret
BossGreenHill_ShipIndex_Simples_Fall
		offsetEntry.w BossGreenHill_Move_Simples_Fall
		offsetEntry.w BossGreenHill_Move_Simples_Jump
BossGreenHill_ShipIndex_RevengeMode
		offsetEntry.w BossGreenHill_RevengeMode_Start
BossGreenHill_ShipIndex_RevengeMode_Move
		offsetEntry.w BossGreenHill_RevengeMode_Move
BossGreenHill_ShipIndex_RevengeMode_Wait
		offsetEntry.w BossGreenHill_RevengeMode_Wait
		offsetEntry.w BossGreenHill_RevengeMode_LeftRight
BossGreenHill_ShipIndex_RevengeMode_CheckReturn
		offsetEntry.w BossGreenHill_RevengeMode_CheckReturn
		offsetEntry.w BossGreenHill_RevengeMode_Return
BossGreenHill_EndFirst_ShipIndex
		offsetEntry.w BossGreenHill_EndFirst
BossGreenHill_EndSecond_ShipIndex
		offsetEntry.w BossGreenHill_EndSecond
		offsetEntry.w BossGreenHill_EndSecond_Fall
BossGreenHill_EndThird_ShipIndex
		offsetEntry.w BossGreenHill_EndThird

; =============== S U B R O U T I N E =======================================

BossGreenHill_Move_Circular_LeftRight:
		move.w	(v_screenposx).w,d0
		move.w	#-$200,obVelX(a0)
		btst	#0,obStatus(a0)
		beq.s	@1
		neg.w	obVelX(a0)
		addi.w	#$1A0,d0
		cmp.w	obX(a0),d0
		bge.s	@3
		bra.s	@2
@1		subi.w	#$60,d0
		cmp.w	obX(a0),d0
		ble.s		@3
@2		addq.b	#2,ob2ndRout(a0)
		move.w	(v_screenposy).w,d0
		addi.w	#$26,d0
		move.w	d0,obYNext(a0)
		move.w	#$300,obTimer(a0)
		bchg	#0,obStatus(a0)
@3 		rts
; ---------------------------------------------------------------------------

BossGreenHill_Move_Circular_Move:
		subq.w	#1,obTimer(a0)
		bne.s	@1
		addq.b	#2,ob2ndRout(a0)
@1		move.w	(v_framecount).w,d0
		andi.w	#$1F,d0
		bne.s	BossGreenHill_Move_Circular_FindSonic
		lea	ChildObjDat_RobotnikRingFall(pc),a2
		bsr.w	Create_ChildObject
		bne.s	BossGreenHill_Move_Circular_FindSonic
		move.w	#-$400,obVelY(a1)
		jsr	(RandomNumber).l
		andi.w	#$FF,d0
		move.w	d0,obVelX(a1)
		btst	#0,obStatus(a0)
		beq.s	BossGreenHill_Move_Circular_FindSonic
		neg.w	obVelX(a1)

BossGreenHill_Move_Circular_FindSonic:
		bsr.w	Find_SonicObject
		addi.w	#$10,d2
		cmpi.w	#$40,d2
		bcs.s	@3
		move.w	#$100,d1
		tst.w	d0
		bne.s	@2
		neg.w	d1
@2		move.w	d1,obVelX(a0)
@3		bra.w	Change_FlipXWithVelocity
; ---------------------------------------------------------------------------

SpikeBall_XPos:
		dc.w 0
		dc.w $10
		dc.w $20
		dc.w $30
		dc.w $40
		dc.w $50
		dc.w $60
		dc.w $70
		dc.w $80
SpikeBall_XPos_End
; ---------------------------------------------------------------------------

BossGreenHill_Move_Circular_Create:
		addq.b	#2,ob2ndRout(a0)
		move.w	#$288,obTimer(a0)
		lea	ChildObjDat_RobotnikCircularRing(pc),a2
		bsr.w	Create_ChildObject2
		move.w	(v_screenposy).w,d0
		addi.w	#$50,d0
		move.w	d0,obYNext(a0)

BossGreenHill_Move_Jump:
		subq.w	#1,obTimer(a0)
		beq.s	BossGreenHill_Move_Simples_Jump_Next
		move.w	(v_framecount).w,d0
		andi.w	#$F,d0
		bne.s	@2
		lea	ChildObjDat_RobotnikRingFall(pc),a2
		bsr.w	Create_ChildObject
		bne.s	@2
		move.w	#-$500,obVelY(a1)
		moveq	#0,d0
		move.b	$2A(a0),d0
		move.w	SpikeBall_XPos(pc,d0.w),obVelX(a1)
		btst	#0,obStatus(a0)
		beq.s	@4
		neg.w	obVelX(a1)
@4		addq.b	#2,$2A(a0)
		cmpi.b	#(SpikeBall_XPos_End-SpikeBall_XPos),$2A(a0)
		bne.s	@2
		move.b	#0,$2A(a0)
@2		move.w	(v_screenposx).w,d0
		move.w	#-$200,obVelX(a0)
		btst	#0,obStatus(a0)
		beq.s	@5
		neg.w	obVelX(a0)
		addi.w	#$1A0,d0
		cmp.w	obX(a0),d0
		bge.s	@7
		bra.s	@6
@5		subi.w	#$60,d0
		cmp.w	obX(a0),d0
		ble.s		@7
@6		bchg	#0,obStatus(a0)
@7 		rts
; ---------------------------------------------------------------------------

BossGreenHill_Move_Simples_Jump_Next:
		addq.b	#2,ob2ndRout(a0)
		clr.w	obVelX(a0)
		rts
; ---------------------------------------------------------------------------

BossGreenHill_Move_Simples_Fall:
		subq.w	#1,obTimer(a0)
		bmi.s	BossGreenHill_Move_Simples_Jump_Return
		move.w	(v_framecount).w,d0
		andi.w	#$1F,d0
		bne.s	@1
		lea	ChildObjDat_RobotnikRingFall(pc),a2
		bsr.w	Create_ChildObject
		bne.s	@1
		move.w	#-$500,obVelY(a1)
@1		jsr	(ObjectFall).l
		tst.w obVelY(a0)
		bmi.s	BossGreenHill_Move_Locret
		jsr	(ObjHitFloor).l
		tst.w	d1
		bpl.s	BossGreenHill_Move_Locret
		add.w	d1,obY(a0)
		addq.b	#2,ob2ndRout(a0)
		clr.l	obVelX(a0)
		move.w	#$10,(Screen_Shaking_Flag).w
	if Snd_Driver_Version=0
		moveq	#$FFFFFFBD,d0
	else
		moveq	#4,d0
	endif
		jmp	(PlaySound_Special).l
; ---------------------------------------------------------------------------

BossGreenHill_Move_Simples_Jump_Return:
		move.b	#(BossGreenHill_ShipIndex-BossGreenHill_ShipIndex),ob2ndRout(a0)
		clr.w	obVelY(a0)

BossGreenHill_Move_Locret:
		rts
; ---------------------------------------------------------------------------

BossGreenHill_Move_Simples_Jump:
		subq.b	#2,ob2ndRout(a0)
		move.w	#-$750,obVelY(a0)
		bsr.w	Find_SonicObject
		addi.w	#$10,d2
		cmpi.w	#$20,d2
		bcs.s	@2
		move.w	#$200,d1
		tst.w	d0
		bne.s	@1
		neg.w	d1
@1		move.w	d1,obVelX(a0)
@2		bra.w	Change_FlipXWithVelocity

; =============== S U B R O U T I N E =======================================

BossGreenHill_RevengeMode_Start:
		jsr	(BossDefeated).l
		move.w	(v_screenposx).w,d0
		move.w	#-$200,obVelX(a0)
		btst	#0,obStatus(a0)
		beq.s	@1
		neg.w	obVelX(a0)
		addi.w	#$260,d0
		cmp.w	obX(a0),d0
		bge.s	@3
		bra.s	@2
@1		subi.w	#$120,d0
		cmp.w	obX(a0),d0
		ble.s		@3
@2		addq.b	#2,ob2ndRout(a0)
		lea	ChildObjDat_RobotnikChaseBall(pc),a2
		bsr.w	Create_ChildObject
		lea	ChildObjDat_RobotnikShipCrane(pc),a2
		bsr.w	Create_ChildObject5
		move.w	(v_screenposy).w,d0
		addi.w	#$26,d0
		move.w	d0,$38(a0)
		bchg	#0,obStatus(a0)
@3 		rts
; ---------------------------------------------------------------------------

BossGreenHill_RevengeMode_Move:
		move.w	(v_screenposx).w,d0
		move.w	#-$200,obVelX(a0)
		btst	#0,obStatus(a0)
		beq.s	@1
		neg.w	obVelX(a0)
		addi.w	#$A0,d0
		cmp.w	obX(a0),d0
		bge.s	@3
		bra.s	@2
@1		addi.w	#$A0,d0
		cmp.w	obX(a0),d0
		ble.s		@3
@2		movea.w	obParent(a0),a1
		addq.b	#2,ob2ndRout(a0)
		addq.b	#2,ob2ndRout(a1)
		clr.w	obVelX(a0)
@3 		rts
; ---------------------------------------------------------------------------

BossGreenHill_RevengeMode_LeftRight:
		move.w	(v_screenposx).w,d0
		move.w	#-$200,obVelX(a0)
		btst	#0,obStatus(a0)
		beq.s	@1
		neg.w	obVelX(a0)
		addi.w	#$1A0,d0
		cmp.w	obX(a0),d0
		bge.s	BossGreenHill_RevengeMode_Wait
		bra.s	@2
@1		subi.w	#$60,d0
		cmp.w	obX(a0),d0
		ble.s		BossGreenHill_RevengeMode_Wait
@2		addq.b	#2,ob2ndRout(a0)
		clr.w	obVelX(a0)
		bchg	#0,obStatus(a0)

BossGreenHill_RevengeMode_Wait:
		rts
; ---------------------------------------------------------------------------

BossGreenHill_RevengeMode_CheckReturn:
		movea.w	obParent(a0),a1
		tst.w obParent(a1)
		bne.s	BossGreenHill_RevengeMode_Wait
		addq.b	#2,ob2ndRout(a0)
		move.w	(v_screenposy).w,d0
		addi.w	#$30,d0
		move.w	d0,$38(a0)
		bsr.w	BossGreenHill_Hud

BossGreenHill_RevengeMode_Return:
		move.w	(v_framecount).w,d0
		andi.w	#$1F,d0
		bne.s	@0
		lea	ChildObjDat_RobotnikChaseBallClone(pc),a2
		bsr.w	Create_ChildObject
		bne.s	@0
		move.w	#-$400,obVelY(a1)
@0		move.w	(v_screenposx).w,d0
		move.w	#-$200,obVelX(a0)
		btst	#0,obStatus(a0)
		beq.s	@1
		neg.w	obVelX(a0)
		addi.w	#$1A0,d0
		cmp.w	obX(a0),d0
		bge.s	@3
		bra.s	@2
@1		subi.w	#$60,d0
		cmp.w	obX(a0),d0
		ble.s		@3
@2		bchg	#0,obStatus(a0)
@3 		rts

; =============== S U B R O U T I N E =======================================

BossGreenHill_Hurt:
		cmpi.b	#(BossGreenHill_EndFirst_ShipIndex-BossGreenHill_ShipIndex),ob2ndRout(a0)
		bcc.w	BossGreenHill_Locret
		tst.b obColType(a0)
		bne.s	BossGreenHill_Locret
		move.b	obColProp(a0),d0
		beq.w	BossGreenHill_ShipGone
		tst.b	obFlash(a0)
		bne.s	BossGreenHill_ShipFlash
		move.b	#$40,obFlash(a0)
		cmpi.b	#8,d0
		bne.s	@1
	if Snd_Driver_Version=1
		addq.b	#2,(v_dle_routine).w
	endif
		move.b	#(BossGreenHill_ShipIndex_RevengeMode-BossGreenHill_ShipIndex),ob2ndRout(a0)
		move.b	#$E0,obFlash(a0)
		clr.w	obVelY(a0)
		bchg #4,obStatus(a0)
@1	if Snd_Driver_Version=0
		moveq	#$FFFFFFAC,d0
	else
		moveq	#10,d0
	endif
		jsr	(PlaySound_Special).l
		bsr.w	Load_SimpleRing

BossGreenHill_ShipFlash:
		moveq	#0,d0
		btst	#0,obFlash(a0)
		bne.s	@3
		addi.w	#$A,d0
@3		lea	LoadBossGreenHill_PalRAM(pc),a1
		lea	LoadBossGreenHill_PalCycle(pc,d0.w),a2
	rept 5
		movea.w	(a1)+,a3
		move.w	(a2)+,(a3)+
	endr
		subq.b	#1,obFlash(a0)
		bne.s	BossGreenHill_Locret
		move.b	#$F,obColType(a0)

BossGreenHill_Locret:
		rts
; ---------------------------------------------------------------------------

LoadBossGreenHill_PalRAM:
		dc.w $FB34
		dc.w $FB36
		dc.w $FB38
		dc.w $FB3A
		dc.w $FB3C
LoadBossGreenHill_PalCycle:
		dc.w $ECC
		dc.w $CAA
		dc.w $A88
		dc.w $866
		dc.w $644
		dc.w $E
		dc.w $C
		dc.w $A
		dc.w 8
		dc.w 6
; ---------------------------------------------------------------------------

BossGreenHill_ShipGone:
		move.b	#(BossGreenHill_EndFirst_ShipIndex-BossGreenHill_ShipIndex),ob2ndRout(a0)
		move.b	#$AE,obTimer(a0)
		bchg #4,obStatus(a0)
		clr.w obVelX(a0)
		clr.b (f_timecount).w
		moveq	#100,d0
		jmp	(AddPoints).l
; ---------------------------------------------------------------------------

BossGreenHill_EndFirst:
		jsr	(BossDefeated).l
		subq.b	#1,obTimer(a0)
		bne.s	@1
		addq.b	#2,ob2ndRout(a0)
		bclr	#7,obStatus(a0)
		tst.b	(v_bossstatus).w
		bne.s	@1
		move.b	#1,(v_bossstatus).w
@1		rts
; ---------------------------------------------------------------------------

BossGreenHill_EndSecond:
		jsr	(BossDefeated).l
		jsr	(ObjectFall).l
		tst.w obVelY(a0)
		bmi.s	BossGreenHill_End_Locret
		jsr	(ObjHitFloor).l
		tst.w	d1
		bpl.s	BossGreenHill_End_Locret
		add.w	d1,obY(a0)
		addq.b	#2,ob2ndRout(a0)
		move.w	#$10,(Screen_Shaking_Flag).w
	if Snd_Driver_Version=0
		moveq	#$FFFFFFBD,d0
	else
		moveq	#4,d0
	endif
		jmp	(PlaySound_Special).l
; ---------------------------------------------------------------------------

BossGreenHill_EndSecond_Fall:
		subq.b	#2,ob2ndRout(a0)
		move.w	obVelY(a0),d0
		asr.w	d0
		neg.w	d0
		move.w	d0,obVelY(a0)
		cmpi.w	#-$480,obVelY(a0)
		blo.s		BossGreenHill_End_Locret
		addq.b	#4,ob2ndRout(a0)
		st	(Screen_Shaking_Flag).w

BossGreenHill_End_Locret:
		rts
; ---------------------------------------------------------------------------

BossGreenHill_EndThird:
		jsr	(BossDefeated).l
		jsr	(ObjectFall).l
		tst.b obRender(a0)
		bmi.s	BossGreenHill_End_Locret
		lea	ChildObjDat_RobotnikRun(pc),a2
		bsr.w	Create_ChildObject
		jmp	(DeleteObject).l

; =============== S U B R O U T I N E =======================================

ObjBossGreenHill_RobotnikFace:
		lea	BossGreenHill_RobotnikFace_ShipIndex(pc),a1
		bra.w	ChildObjectsRoutine
; ---------------------------------------------------------------------------

BossGreenHill_RobotnikFace_ShipIndex:
		offsetEntry.w BossGreenHill_RobotnikFace_Init
		offsetEntry.w BossGreenHill_RobotnikFace_Main
; ---------------------------------------------------------------------------

BossGreenHill_RobotnikFace_Init:
		addq.b	#2,ob2ndRout(a0)
		lea	ObjDat3_BossGreenHill_RobotnikFace(pc),a1
		bra.w	LoadObjects_ExtraData
; ---------------------------------------------------------------------------

BossGreenHill_RobotnikFace_Main:
		movea.w	obParent(a0),a1
		moveq	#1,d0
		tst.w obVelX(a1)
		beq.s	@1
		cmpi.b	#4,(v_player+obRoutine).w
		bcs.s	@2
@1		moveq	#4,d0
@2		tst.b obColType(a1)
		bne.s	@3
		moveq	#5,d0
@3		cmpi.b	#(BossGreenHill_EndFirst_ShipIndex-BossGreenHill_ShipIndex),ob2ndRout(a1)
		bmi.s	@4
		moveq	#$A,d0
@4		cmpi.b	#(BossGreenHill_EndThird_ShipIndex-BossGreenHill_ShipIndex),ob2ndRout(a1)
		bne.s	@5
		moveq	#$A,d0
		tst.b obRender(a0)
		bpl.w	BossGreenHill_Del
@5		move.b	d0,obAnim(a0)
		bra.s	BossGreenHill_Display

; =============== S U B R O U T I N E =======================================

ObjBossGreenHill_RobotnikFlame:
		lea	BossGreenHill_RobotnikFlame_ShipIndex(pc),a1
		bra.w	ChildObjectsRoutine
; ---------------------------------------------------------------------------

BossGreenHill_RobotnikFlame_ShipIndex:
		offsetEntry.w BossGreenHill_RobotnikFlame_Init
		offsetEntry.w BossGreenHill_RobotnikFlame_Main
; ---------------------------------------------------------------------------

BossGreenHill_RobotnikFlame_Init:
		addq.b	#2,ob2ndRout(a0)
		lea	ObjDat3_BossGreenHill_RobotnikFlame(pc),a1
		moveq	#0,d0
		move.b	obSubtype(a0),d0
		cmpi.b	#4,d0
		bne.s	@1
		lea	ObjDat3_BossGreenHill_RobotnikFlame2(pc),a1
@1		bra.w	LoadObjects_ExtraData
; ---------------------------------------------------------------------------

BossGreenHill_RobotnikFlame_Main:
		movea.w	obParent(a0),a1
		moveq	#8,d0
		moveq	#0,d1
		move.b	obSubtype(a0),d1
		cmpi.b	#4,d1
		bne.s	@1
		moveq	#9,d0
@1		move.b	d0,obAnim(a0)
		cmpi.b	#(BossGreenHill_EndSecond_ShipIndex-BossGreenHill_ShipIndex),ob2ndRout(a1)
		beq.s	BossGreenHill_Del

BossGreenHill_Display:
		move.w	obX(a1),obX(a0)
		move.w	obY(a1),obY(a0)
		move.b	obStatus(a1),obStatus(a0)

BossGreenHill_Display2:
		lea	(Ani_Eggman).l,a1
		jsr	(AnimateSprite).l
		move.b	obStatus(a0),d0
		andi.b	#3,d0
		andi.b	#$FC,obRender(a0)
		or.b	d0,obRender(a0)

BossGreenHill_Display3:
		jmp	(DisplaySprite).l
; ---------------------------------------------------------------------------

BossGreenHill_Del:
		jmp	(DeleteObject).l

; =============== S U B R O U T I N E =======================================

ObjBossGreenHill_RobotnikGlass:
		lea	BossGreenHill_RobotnikGlass_ShipIndex(pc),a1
		bra.w	ChildObjectsRoutine
; ---------------------------------------------------------------------------

BossGreenHill_RobotnikGlass_ShipIndex:
		offsetEntry.w BossGreenHill_RobotnikGlass_Init
		offsetEntry.w BossGreenHill_RobotnikGlass_Main
; ---------------------------------------------------------------------------

BossGreenHill_RobotnikGlass_Init:
		addq.b	#2,ob2ndRout(a0)
		lea	ObjDat3_BossGreenHill_RobotnikGlass(pc),a1
		bra.w	LoadObjects_ExtraData
; ---------------------------------------------------------------------------

BossGreenHill_RobotnikGlass_Main:
		movea.w	obParent(a0),a1
		move.w	obX(a1),d0
		move.b	obXNext(a0),d1
		ext.w	d1
		bclr	#0,obRender(a0)
		btst	#0,obStatus(a1)
		beq.s	@1
		neg.w	d1
		bset	#0,obRender(a0)
@1		add.w	d1,d0
		move.w	d0,obX(a0)
		move.w	obY(a1),d0
		move.b	obYNext(a0),d1
		ext.w	d1
		bclr	#1,obRender(a0)
		btst	#1,obStatus(a1)
		beq.s	@2
		neg.w	d1
		bset	#1,obRender(a0)
@2		add.w	d1,d0
		move.w	d0,obY(a0)
		bra.s	BossGreenHill_Display3

; =============== S U B R O U T I N E =======================================

BossCircularRing:
		movea.w	obParent(a0),a1
		btst	#4,obStatus(a1)
		bne.w	BossCircularRing_Explode_Status
		lea	BossCircularRing_Index(pc),a1
		bsr.w	ChildObjectsRoutine
		moveq	#2,d0
		btst	#0,(v_vbla_count+3).w
		beq.s	@1
		moveq	#3,d0
@1		move.b	d0,obFrame(a0)
		jmp	(DisplaySprite).l
; ---------------------------------------------------------------------------

BossCircularRing_Index:
		offsetEntry.w BossCircularRing_Main
		offsetEntry.w BossCircularRing_Circular
		offsetEntry.w BossCircularRing_Shot
		offsetEntry.w BossCircularRing_Render
BossCircularRing_Index_SetUpAttributes
		offsetEntry.w BossCircularRing_SetUpAttributes
		offsetEntry.w BossCircularRing_Fall
BossCircularRing_Index_SetUpAttributes2
		offsetEntry.w BossCircularRing_Main2
		offsetEntry.w BossCircularRing_Wait
		offsetEntry.w BossCircularRing_Wait2
		offsetEntry.w BossCircularRing_Circular2
		offsetEntry.w BossCircularRing_Shot_Time
		offsetEntry.w BossCircularRing_Shot_Wait
		offsetEntry.w BossCircularRing_RenderSpeed
BossCircularRing_Index_SetUpAttributes3
		offsetEntry.w BossCircularRing_Main
		offsetEntry.w BossCircularRing_ShotUp_ResetCollision
		offsetEntry.w BossCircularRing_ShotUp_Timer
		offsetEntry.w BossCircularRing_ShotUp
		offsetEntry.w BossCircularRing_ShotWait
		offsetEntry.w BossCircularRing_ShotFall
		offsetEntry.w BossCircularRing_RenderFall_Time
		offsetEntry.w BossCircularRing_RenderFall
BossCircularRing_Index_SetUpAttributes4
		offsetEntry.w BossCircularRing_Main
		offsetEntry.w BossCircularRing_CircularAddRadius
		offsetEntry.w BossCircularRing_ShotAttack
		offsetEntry.w BossCircularRing_RenderSpeedCheck
; ---------------------------------------------------------------------------

BossCircularRing_Main:
		moveq	#0,d0
		move.b	obSubtype(a0),d0
		lsl.b	#3,d0
		move.b	d0,obAngle(a0)
		lsl.w #2,d0
		tst.b ob2ndRout(a0)
		beq.s	@1
		lsr.w d0
@1		cmpi.b	#(BossCircularRing_Index_SetUpAttributes4-BossCircularRing_Index),ob2ndRout(a0)
		bne.s	@2
		move.w	#$20,obTimer(a0)
@2		tst.b ob2ndRout(a0)
		bne.s	@3
		move.w	#$390,obTimer(a0)
@3		add.w	d0,obTimer(a0)
		move.w	#$100,$2A(a0)

BossCircularRing_SetUpAttributes:
		lea	ObjDat3_BossGreenHill_RobotnikSpike(pc),a1
		tst.b ob2ndRout(a0)
		bne.s	@1
		lea	ObjDat3_BossGreenHill_RobotnikSphere(pc),a1
@1		addq.b	#2,ob2ndRout(a0)
		bra.w	LoadObjects_Data
; ---------------------------------------------------------------------------

BossCircularRing_Main2:
		moveq	#0,d0
		move.b	obSubtype(a0),d0
		lsl.b	#4,d0
		add.b	d0,obTimer(a0)
		movea.w	obParent(a0),a1
		move.w	#$200,d0
		btst	#0,obStatus(a1)
		bne.s	@1
		neg.w	d0
@1		move.w	d0,obVelX(a0)
		move.w	a0,obParent(a1)
		bra.s	BossCircularRing_SetUpAttributes
; ---------------------------------------------------------------------------

BossCircularRing_ShotUp_ResetCollision:
		addq.b	#2,ob2ndRout(a0)
		move.b	#0,obColType(a0)

BossCircularRing_ShotUp_Timer:
		subq.w	#1,obTimer(a0)
		bpl.w	BossCircularRing_Locret2
		moveq	#0,d0
		move.b	obSubtype(a0),d0
		lsl.w	#3,d0
		move.w	#$150,obTimer(a0)
		add.w	d0,obTimer(a0)
		move.w	#-$600,obVelY(a0)
		move.b	#$8B,obColType(a0)
		addq.b	#2,ob2ndRout(a0)
	if Snd_Driver_Version=0
		moveq	#$FFFFFFA5,d0
	else
		moveq	#26,d0
	endif
		jsr	(PlaySound_Special).l

BossCircularRing_ShotUp:
		jsr	(SpeedToPos).l
		move.w	(v_screenposy).w,d0
		subi.w	#$20,d0
		cmp.w	obY(a0),d0
		bcs.s	BossCircularRing_Locret2
		addq.b	#2,ob2ndRout(a0)

BossCircularRing_ShotWait:
		subq.w	#1,obTimer(a0)
		bne.s	BossCircularRing_Locret2
		addq.b	#2,ob2ndRout(a0)
		move.w	(v_screenposx).w,d0
		add.w	$38(a0),d0
		move.w	d0,8(a0)
		lea	ChildObjDat_Targetting_Sensor2(pc),a2
		bsr.w	Create_ChildObject2
		bne.s	BossCircularRing_ShotFall
		move.w	(v_screenposy).w,d0
		addi.w	#$C0,d0
		move.w	d0,obY(a1)
		move.b	#1,obAnim(a1)

BossCircularRing_ShotFall:
		jsr	(ObjectFall).l
		tst.b obRender(a0)
		bpl.s	BossCircularRing_Locret2
		addq.b	#2,ob2ndRout(a0)

BossCircularRing_Locret2:
		rts
; ---------------------------------------------------------------------------

BossCircularRing_Wait:
		subq.b	#1,obTimer(a0)
		bne.s	BossCircularRing_Locret2
		addq.b	#2,ob2ndRout(a0)
		move.b	#$20,obTimer(a0)
		move.b	obAngle(a0),d0
		move.b	#$40,d0
		tst.w	obVelX(a0)
		bpl.s	@1
		neg.w	d0
@1		move.b	d0,obAngle(a0)
		move.b	d0,$3F(a0)
	if Snd_Driver_Version=0
		moveq	#$FFFFFFA5,d0
	else
		moveq	#26,d0
	endif
		jsr	(PlaySound_Special).l

BossCircularRing_Wait2:
		jsr	(SpeedToPos).l
		subq.b	#1,obTimer(a0)
		bne.s	BossCircularRing_CircularSimple_Locret
		addq.b	#2,ob2ndRout(a0)

BossCircularRing_Circular2:
		movea.w	obParent(a0),a1
		cmpi.b	#(BossChaseBall_Locret3_Index-BossChaseBall_Index),ob2ndRout(a1)
		bne.s	BossCircularRing_CircularSimpleOffset
		addq.b	#2,ob2ndRout(a0)
		clr.l	obVelX(a0)

BossCircularRing_CircularSimpleOffset:
		subq.b	#1,obAngle(a0)
		moveq	#2,d2
		bra.w	BossCircularRing_CircularSimple
; ---------------------------------------------------------------------------

BossCircularRing_Shot_Data:
		dc.w -$300, 0
		dc.w -$300, $200
		dc.w -$100, $300
		dc.w $100, $300
		dc.w $300, $100
		dc.w $300, -$250
		dc.w 0, -$300
		dc.w -$300, -$300
; ---------------------------------------------------------------------------

BossCircularRing_Shot_Time:
		addq.b	#2,ob2ndRout(a0)
		moveq	#0,d0
		move.b	obSubtype(a0),d0
		add.w	d0,d0
		move.l	BossCircularRing_Shot_Data(pc,d0.w),obVelX(a0)
		tst.b $3F(a0)
		bpl.s	BossCircularRing_CircularSimple_Locret
		neg.l	obVelX(a0)

BossCircularRing_CircularSimple_Locret:
		rts
; ---------------------------------------------------------------------------

BossCircularRing_Shot_Wait:
		addq.b	#2,ob2ndRout(a0)
		movea.w	obParent(a0),a1
		move.b	#(BossChaseBall_Bouncing3_Index-BossChaseBall_Index),ob2ndRout(a1)
		move.b	#$16,obHeight(a1)
		move.b	#0,obAnim(a1)
		move.w	#-$400,$3A(a1)
		move.w	#3,obTimer(a1)
	if Snd_Driver_Version=0
		moveq	#$FFFFFFA5,d0
	else
		moveq	#26,d0
	endif
		jmp	(PlaySound_Special).l
; ---------------------------------------------------------------------------

BossCircularRing_Circular:
		subq.w	#1,obTimer(a0)
		bpl.s	@1
		addq.b	#2,ob2ndRout(a0)
@1		subq.b	#3,obAngle(a0)
		moveq	#2,d2

BossCircularRing_CircularSimple:
		move.b	obAngle(a0),d0
		jsr	(CalcSine).l
		swap	d0
		clr.w	d0
		swap	d1
		clr.w	d1
		asr.l	d2,d0
		asr.l	d2,d1
		movea.w	obParent(a0),a1
		move.l	obX(a1),d2
		move.l	obY(a1),d3
		add.l	d0,d2
		add.l	d1,d3
		move.l	d2,obX(a0)
		move.l	d3,obY(a0)
		rts
; ---------------------------------------------------------------------------

BossCircularRing_CircularAddRadius:
		moveq	#0,d0
		move.b	$2C(a0),d0
		addq.b	#1,d0
		moveq	#$50,d1
		btst	#2,obStatus(a0)
		beq.s	@1
		subq.b	#2,d0
		moveq	#0,d1
@1		cmpi.b	#$10,d0
		bge.s	BossCircularRing_CircularCheckRadius
		subq.w	#1,obTimer(a0)
		bpl.s	BossCircularRing_CircularCheckRadius
		addq.b	#2,ob2ndRout(a0)
	if Snd_Driver_Version=0
		moveq	#$FFFFFFA5,d0
	else
		moveq	#26,d0
	endif
		jmp	(PlaySound_Special).l
; ---------------------------------------------------------------------------

BossCircularRing_CircularCheckRadius:
		cmp.b	d0,d1
		bne.s	@1
		bchg	#2,obStatus(a0)
@1		move.b	d0,$2C(a0)
		move.w	$2A(a0),d0
		add.w	d0,obAngle(a0)
		move.b	obAngle(a0),d0
		jsr	(CalcSine).l
		moveq	#0,d4
		move.b	$2C(a0),d4
		move.l	d4,d5
		muls.w	d0,d4
		asr.l	#8,d4
		muls.w	d1,d5
		asr.l	#8,d5
		movea.w	obParent(a0),a1
		move.w	obX(a1),d2
		move.w	obY(a1),d3
		add.w	d2,d4
		add.w	d3,d5
		move.w	d4,obX(a0)
		move.w	d5,obY(a0)
		rts
; ---------------------------------------------------------------------------

BossCircularRing_Shot:
		moveq	#0,d0
		move.b	obSubtype(a0),d0
		cmpi.b	#$1E,d0
		bne.s	BossCircularRing_ShotAttack
		movea.w	obParent(a0),a1
		move.b	#(BossGreenHill_ShipIndex_Simples_Fall-BossGreenHill_ShipIndex),ob2ndRout(a1)
		move.w	#$260,obTimer(a1)

BossCircularRing_ShotAttack:
		addq.b	#2,ob2ndRout(a0)
	if Snd_Driver_Version=0
		moveq	#$FFFFFFA5,d0
	else
		moveq	#26,d0
	endif
		jsr	(PlaySound_Special).l
		moveq	#3,d5
		lea	(v_player).w,a1
		moveq	#0,d0
		move.w	obX(a1),d0
		moveq	#0,d1
		move.w	obY(a1),d1

Shot_Object:
		sub.w	obX(a0),d0
		smi	d2
		bpl.s	@1
		neg.w	d0
@1		sub.w	obY(a0),d1
		smi	d3
		bpl.s	@2
		neg.w	d1
@2		cmp.w	d1,d0
		scs	d4
		beq.s	BossCircularRing_Shot2
		bcc.s	@3
		exg	d0,d1
@3		swap	d1
		divu.w	d0,d1

BossCircularRing_Return2:
		move.w	#$100,d0
		lsl.w	d5,d0
		moveq	#8,d6
		sub.w	d5,d6
		lsr.w	d6,d1

BossCircularRing_Return:
		tst.b	d4
		beq.s	@4
		exg	d0,d1
@4		tst.b	d2
		beq.s	@5
		neg.w	d0
@5		tst.b	d3
		beq.s	@6
		neg.w	d1
@6		move.w	d0,obVelX(a0)
		move.w	d1,obVelY(a0)

BossCircularRing_Locret:
		rts
; ---------------------------------------------------------------------------

BossCircularRing_Shot2:
		tst.w	d0
		beq.s	BossCircularRing_Return2
		move.w	#$100,d0
		lsl.w	d5,d0
		move.w	#$100,d1
		lsl.w	d5,d1
		bra.s	BossCircularRing_Return
; ---------------------------------------------------------------------------

BossCircularRing_Render:
		bsr.w	BossCircularRing_Fall_Extra
		bra.s	BossCircularRing_RenderSpeed
; ---------------------------------------------------------------------------

BossCircularRing_RenderFall_Time:
		moveq	#0,d0
		move.b	obSubtype(a0),d0
		cmpi.b	#$12,d0
		bne.s	BossCircularRing_RenderFall
		movea.w	obParent(a0),a1
		move.b	#(BossChaseBall_LDL_Index-BossChaseBall_Index),ob2ndRout(a1)
		move.w	#$30,obTimer(a1)
		move.b	#0,obAnim(a1)
		move.w	#-$400,$3A(a1)
		move.w	#3,obYNext(a1)
		addq.b	#2,ob2ndRout(a0)

BossCircularRing_RenderFall:
		bsr.s	BossCircularRing_Fall_Extra
		jsr	(ObjectFall).l
		bra.s	BossCircularRing_Render_Delete
; ---------------------------------------------------------------------------

BossCircularRing_RenderSpeedCheck:
		moveq	#0,d0
		move.b	obSubtype(a0),d0
		cmpi.b	#$1E,d0
		bne.s	BossCircularRing_RenderSpeed
		tst.b obRender(a0)
		bmi.s	BossCircularRing_RenderSpeed
		movea.w	obParent(a0),a1
		addq.b	#2,ob2ndRout(a1)
		move.w	#$30,obTimer(a1)
		move.b	#0,obAnim(a1)

BossCircularRing_RenderSpeed:
		jsr	(SpeedToPos).l

BossCircularRing_Render_Delete:
		tst.b obRender(a0)
		bmi.w	BossCircularRing_Locret
		jmp	(DeleteObject).l
; ---------------------------------------------------------------------------

BossCircularRing_Explode_Status:
		bchg #4,obStatus(a0)
		bra.s	BossCircularRing_Explode
; ---------------------------------------------------------------------------

BossCircularRing_Fall:
		jsr	(ObjectFall).l
		tst.w obVelY(a0)
		bmi.w	BossCircularRing_Locret

BossCircularRing_Fall_Extra:
		jsr	(ObjHitFloor).l
		tst.w	d1
		bpl.w	BossCircularRing_Locret
		add.w	d1,obY(a0)
		clr.w obVelY(a0)

BossCircularRing_Explode:
		move.w	#$10,(Screen_Shaking_Flag).w
		jmp	(Obj7B_Explode).l

; =============== S U B R O U T I N E =======================================

BossChaseBall:
		lea	BossChaseBall_Index(pc),a1
		bsr.w	ChildObjectsRoutine
		cmpi.b	#(BossChaseBall_Clone_Index_SetUpAttributes-BossChaseBall_Index),ob2ndRout(a0)
		bcc.s	@0
		cmpi.b	#(BossChaseBall_JumpShot_Index-BossChaseBall_Index),ob2ndRout(a0)
		bcs.s	@0
		bsr.w	BossChaseBall_Hurt
		bsr.w	BossChaseBall_Collision
@0		cmpi.b	#(BossChaseBall_Bouncing4_Index-BossChaseBall_Index),ob2ndRout(a0)
		bcc.s	@1
		lea	(Ani_obj48).l,a1
		jsr	(AnimateSprite).l
@1		jmp	(DisplaySprite).l
; ---------------------------------------------------------------------------

BossChaseBall_Index:
		offsetEntry.w BossChaseBall_InitHud
		offsetEntry.w BossChaseBall_Move
		offsetEntry.w BossChaseBall_Fall
		offsetEntry.w BossChaseBall_Bouncing
		offsetEntry.w BossChaseBall_Load_Dynamic_Location
BossChaseBall_JumpShot_Index
		offsetEntry.w BossChaseBall_Wait
		offsetEntry.w BossChaseBall_Check
		offsetEntry.w BossChaseBall_CheckJump
		offsetEntry.w BossChaseBall_Wait
		offsetEntry.w BossChaseBall_Shot
		offsetEntry.w BossChaseBall_Fall
		offsetEntry.w BossChaseBall_CreateRing
BossChaseBall_Circular_Index
		offsetEntry.w BossChaseBall_Circular
		offsetEntry.w BossChaseBall_Fall
		offsetEntry.w BossChaseBall_Bouncing2
		offsetEntry.w BossChaseBall_Load_Dynamic_Location
BossChaseBall_JumpCircular_Index
		offsetEntry.w BossChaseBall_Wait
		offsetEntry.w BossChaseBall_Circular_Create
		offsetEntry.w BossChaseBall_Circular_CreateJump
		offsetEntry.w BossChaseBall_Wait
		offsetEntry.w BossChaseBall_Circular_Fall_Time
		offsetEntry.w BossChaseBall_Circular_Fall
		offsetEntry.w BossChaseBall_Circular_Jump
BossChaseBall_Locret3_Index
		offsetEntry.w BossChaseBall_Locret3
BossChaseBall_Bouncing3_Index
		offsetEntry.w BossChaseBall_Fall
		offsetEntry.w BossChaseBall_Bouncing3
		offsetEntry.w BossChaseBall_Load_Dynamic_Location
BossChaseBall_ShotVertical_Index
		offsetEntry.w BossChaseBall_Wait
		offsetEntry.w BossChaseBall_Create_ShotVertical
BossChaseBall_Wait3_Index
		offsetEntry.w BossChaseBall_Wait
		offsetEntry.w BossChaseBall_MoveLeftRightStart
		offsetEntry.w BossChaseBall_Wait
		offsetEntry.w BossChaseBall_MoveLeftRight
BossChaseBall_LDL_Index
		offsetEntry.w BossChaseBall_Load_Dynamic_Location
BossChaseBall_CreateClone_Index
		offsetEntry.w BossChaseBall_Wait
		offsetEntry.w BossChaseBall_Check
		offsetEntry.w BossChaseBall_CheckJump
		offsetEntry.w BossChaseBall_Wait
		offsetEntry.w BossChaseBall_MoveLeftRightCreateClone_Time
		offsetEntry.w BossChaseBall_MoveLeftRightCreateClone
		offsetEntry.w BossChaseBall_MoveFallDestroy
		offsetEntry.w BossChaseBall_Shot
		offsetEntry.w BossChaseBall_Fall
		offsetEntry.w BossChaseBall_JumpWait
		offsetEntry.w BossChaseBall_Load_Dynamic_Location
BossChaseBall_RadiusCircular_Index
		offsetEntry.w BossChaseBall_Wait
		offsetEntry.w BossChaseBall_CreateRadiusCircular
		offsetEntry.w BossChaseBall_MoveRadiusCircular
		offsetEntry.w BossChaseBall_Load_Dynamic_Location
BossChaseBall_Defeated_Index
		offsetEntry.w BossChaseBall_Defeated
BossChaseBall_Clone_Index_SetUpAttributes
		offsetEntry.w BossChaseBall_InitExtra
		offsetEntry.w BossChaseBall_Fall
BossChaseBall_Bouncing4_Index
		offsetEntry.w BossChaseBall_Bouncing4
BossChaseBall_Bouncing4_Remove_Index
		offsetEntry.w BossChaseBall_Remove
; ---------------------------------------------------------------------------

BossChaseBall_InitHud:
		lea	ChildObjDat_RobotnikHud(pc),a2
		bsr.w	Create_ChildObject
		bne.s	BossChaseBall_Init
		move.b	#3,obFrame(a1)
		locVRAM	$D2A0,$2A(a1)
		bra.s	BossChaseBall_Init
; ---------------------------------------------------------------------------

BossChaseBall_InitExtra:
		movea.w	obParent(a0),a1
		move.b	obStatus(a1),obStatus(a0)
		move.b	#1,obAnim(a0)

BossChaseBall_Init:
		addq.b	#2,ob2ndRout(a0)
		lea	ObjDat3_BossGreenHill_RobotnikBall(pc),a1
		bsr.w	LoadObjects_Data
		move.b	#$46,obYNext(a0)
		move.w	#-$400,$3A(a0)
		move.w	#3,obTimer(a0)
		move.b	#3,$3F(a0)
		movea.w	obParent(a0),a1
		move.b	obColProp(a1),d0
		subq.b	#2,d0
		add.b	d0,d0
		move.b	d0,obColProp(a0)
		move.w	a0,obParent(a1)

BossChaseBall_Locret:
		rts
; ---------------------------------------------------------------------------

BossChaseBall_Move:
		movea.w	obParent(a0),a1
		move.w	obX(a1),d0
		move.b	obXNext(a0),d1
		ext.w	d1
		add.w	d1,d0
		move.w	d0,obX(a0)
		move.w	obY(a1),d0
		move.b	obYNext(a0),d1
		ext.w	d1
		add.w	d1,d0
		move.w	d0,obY(a0)
		rts
; ---------------------------------------------------------------------------

BossChaseBall_Fall:
		jsr	(ObjectFall).l
		tst.w obVelY(a0)
		bmi.s	BossChaseBall_Locret
		jsr	(ObjHitFloor).l
		tst.w	d1
		bpl.s	BossChaseBall_Locret
		add.w	d1,obY(a0)
		addq.b	#2,ob2ndRout(a0)
		clr.l	obVelX(a0)
		move.w	#$10,(Screen_Shaking_Flag).w
	if Snd_Driver_Version=0
		moveq	#$FFFFFFBD,d0
	else
		moveq	#4,d0
	endif
		jmp	(PlaySound_Special).l
; ---------------------------------------------------------------------------

BossChaseBall_Bouncing:
		move.w	$3A(a0),d0
		move.w	d0,obVelY(a0)
		asr.w	d0
		move.w	d0,$3A(a0)
		subq.b	#2,ob2ndRout(a0)
		subq.w	#1,obTimer(a0)
		bpl.s	BossChaseBall_Locret
		addq.b	#4,ob2ndRout(a0)
		movea.w	obParent(a0),a1
		addq.b	#2,ob2ndRout(a1)
		move.w	#-$400,$3A(a0)
		move.w	#$30,obTimer(a0)
		clr.w	obVelY(a0)
		bsr.w	Find_SonicObject
		bra.w	Change_FlipX
; ---------------------------------------------------------------------------

BossChaseBall_Wait:
		subq.w	#1,obTimer(a0)
		bpl.s	@1
		addq.b	#2,ob2ndRout(a0)
		clr.l obVelX(a0)
@1		rts

; =============== S U B R O U T I N E =======================================

BossChaseBall_Check:
		addq.b	#2,ob2ndRout(a0)
		move.w	#-$500,obVelY(a0)
		move.b	#1,obAnim(a0)
		move.w	#$30,obTimer(a0)

BossChaseBall_CheckJump:
		jsr	(SpeedToPos).l
		move.w	(v_screenposy).w,d0
		addi.w	#$30,d0
		cmp.w	obY(a0),d0
		bcs.w	BossChaseBall_Locret
		addq.b	#2,ob2ndRout(a0)
		bsr.w	Find_SonicObject
		bsr.w	Change_FlipX
		move.w	#0,obVelY(a0)
	if Snd_Driver_Version=0
		moveq	#$FFFFFFBE,d0
	else
		moveq	#20,d0
	endif
		jmp	(PlaySound_Special).l
; ---------------------------------------------------------------------------

BossChaseBall_Shot:
		addq.b	#2,ob2ndRout(a0)
		moveq	#4,d5
		lea	(v_player).w,a1
		moveq	#0,d0
		move.w	obX(a1),d0
		moveq	#0,d1
		move.w	(v_screenposy).w,d1
		addi.w	#$B0,d1
		bra.w	Shot_Object
; ---------------------------------------------------------------------------

BossChaseBall_CreateRing:
		move.b	#(BossChaseBall_JumpShot_Index-BossChaseBall_Index),ob2ndRout(a0)
		subq.b	#1,$3F(a0)
		bne.s	@0
		move.b	#(BossChaseBall_Circular_Index-BossChaseBall_Index),ob2ndRout(a0)
		move.w	#-$400,$3A(a0)
		move.w	#3,obTimer(a0)
		move.b	#3,$3F(a0)
@0		lea	ChildObjDat_RobotnikChaseBallRing(pc),a2
		bsr.w	Create_ChildObject3

BossChaseBall_Locret2:
		rts

; =============== S U B R O U T I N E =======================================

BossChaseBall_Circular:
		addq.b	#2,ob2ndRout(a0)
		move.w	#-$600,obVelY(a0)
		jmp	(SpeedToPos).l
; ---------------------------------------------------------------------------

BossChaseBall_Bouncing2:
		move.w	$3A(a0),d0
		move.w	d0,obVelY(a0)
		asr.w	d0
		move.w	d0,$3A(a0)
		subq.b	#2,ob2ndRout(a0)
		subq.w	#1,obTimer(a0)
		bpl.s	BossChaseBall_Locret2
		addq.b	#4,ob2ndRout(a0)
		move.w	#$40,obTimer(a0)
		move.b	#0,obAnim(a0)
		rts
; ---------------------------------------------------------------------------

BossChaseBall_Circular_Create:
		addq.b	#2,ob2ndRout(a0)
		move.w	#-$600,obVelY(a0)
		move.w	#$150,obTimer(a0)
		move.b	#1,obAnim(a0)

BossChaseBall_Circular_CreateJump:
		jsr	(SpeedToPos).l
		move.w	(v_screenposy).w,d0
		addi.w	#$50,d0
		cmp.w	obY(a0),d0
		bcs.s	BossChaseBall_Locret3
		addq.b	#2,ob2ndRout(a0)
		bsr.w	Find_SonicObject
		bsr.w	Change_FlipX
		clr.w	obVelY(a0)
		move.b	#$48,obHeight(a0)
	if Snd_Driver_Version=0
		moveq	#$FFFFFFBE,d0
	else
		moveq	#20,d0
	endif
		jsr	(PlaySound_Special).l
		lea	ChildObjDat_RobotnikChaseBallCircularRing(pc),a2
		bsr.w	Create_ChildObject2

BossChaseBall_Locret3:
		rts
; ---------------------------------------------------------------------------

BossChaseBall_Circular_Fall_Time:
		addq.b	#2,ob2ndRout(a0)
		move.w	#$140,obTimer(a0)

BossChaseBall_Circular_Fall:
		jsr	(ObjectFall).l
		tst.w obVelY(a0)
		bmi.s	BossChaseBall_Locret3
		subq.w	#1,obTimer(a0)
		bmi.s	@1
		jsr	(ObjHitFloor).l
		tst.w	d1
		bpl.s	BossChaseBall_Locret3
		add.w	d1,obY(a0)
		addq.b	#2,ob2ndRout(a0)
		clr.l	obVelX(a0)
		move.w	#$10,(Screen_Shaking_Flag).w
	if Snd_Driver_Version=0
		moveq	#$FFFFFFBD,d0
	else
		moveq	#4,d0
	endif
		jmp	(PlaySound_Special).l
; ---------------------------------------------------------------------------
@1		move.b	#(BossChaseBall_Locret3_Index-BossChaseBall_Index),ob2ndRout(a0)
		clr.l	obVelX(a0)
		rts
; ---------------------------------------------------------------------------

BossChaseBall_Circular_Jump:
		subq.b	#2,ob2ndRout(a0)
		move.w	#-$500,obVelY(a0)
		bsr.w	BossGreenHill_Move_Circular_FindSonic
		jmp	(SpeedToPos).l
; ---------------------------------------------------------------------------

BossChaseBall_Bouncing3:
		move.w	$3A(a0),d0
		move.w	d0,obVelY(a0)
		asr.w	d0
		move.w	d0,$3A(a0)
		subq.b	#2,ob2ndRout(a0)
		subq.w	#1,obTimer(a0)
		bne.s	BossChaseBall_Locret3
		addq.b	#4,ob2ndRout(a0)
		move.w	#$40,obTimer(a0)
		bsr.w	Find_SonicObject
		bra.w	Change_FlipX
; ---------------------------------------------------------------------------

BossChaseBall_Create_ShotVertical:
		addq.b	#2,ob2ndRout(a0)
		bsr.w	Find_SonicObject
		bsr.w	Change_FlipX
		move.w	#$180,obTimer(a0)
		lea	ChildObjDat_RobotnikShotRing(pc),a2
		bsr.w	Create_ChildObject4

BossChaseBall_Locret4:
		rts
; ---------------------------------------------------------------------------

BossChaseBall_MoveLeftRightStart:
		addq.b	#2,ob2ndRout(a0)
		move.w	#$40,obTimer(a0)
		tst.b obAnim(a0)
		bne.s	@1
		bsr.w	Find_SonicObject
		bsr.w	Change_FlipX
		move.b	#1,obAnim(a0)
@1		clr.l	obVelX(a0)
	if Snd_Driver_Version=0
		moveq	#$FFFFFFBE,d0
	else
		moveq	#20,d0
	endif
		jmp	(PlaySound_Special).l
; ---------------------------------------------------------------------------

BossChaseBall_MoveLeftRight:
		move.w	(v_screenposx).w,d0
		move.w	#-$600,obVelX(a0)
		btst	#0,obStatus(a0)
		beq.s	@1
		neg.w	obVelX(a0)
		addi.w	#$120,d0
		cmp.w	obX(a0),d0
		bge.s	@3
		bra.s	@2
@1		addi.w	#$20,d0
		cmp.w	obX(a0),d0
		ble.s		@3
@2		move.b	#(BossChaseBall_Wait3_Index-BossChaseBall_Index),ob2ndRout(a0)
		clr.w	obVelX(a0)
		bchg	#0,obStatus(a0)
@3		jmp	(SpeedToPos).l
; ---------------------------------------------------------------------------

BossChaseBall_MoveLeftRightCreateClone_Time:
		addq.b	#2,ob2ndRout(a0)
		move.w	#$248,obTimer(a0)

BossChaseBall_MoveLeftRightCreateClone:
		subq.w	#1,obTimer(a0)
		bpl.s	@0
		addq.b	#2,ob2ndRout(a0)
		move.w	#$20,obTimer(a0)
		bsr.w	Find_SonicObject
		bsr.w	Change_FlipX
	if Snd_Driver_Version=0
		moveq	#$FFFFFFBE,d0
	else
		moveq	#20,d0
	endif
		jsr	(PlaySound_Special).l
@0		move.w	(v_framecount).w,d0
		andi.w	#$1F,d0
		bne.s	BossChaseBall_MoveLeftRightClone
		lea	ChildObjDat_RobotnikChaseBallClone(pc),a2
		bsr.w	Create_ChildObject

BossChaseBall_MoveLeftRightClone:
		move.w	(v_screenposx).w,d0
		move.w	#-$200,obVelX(a0)
		move.w	#0,obVelY(a0)
		btst	#0,obStatus(a0)
		beq.s	@1
		neg.w	obVelX(a0)
		addi.w	#$120,d0
		cmp.w	obX(a0),d0
		bge.s	@3
		bra.s	@2
@1		addi.w	#$20,d0
		cmp.w	obX(a0),d0
		ble.s		@3
@2		bchg	#0,obStatus(a0)
@3		jmp	(SpeedToPos).l
; ---------------------------------------------------------------------------

BossChaseBall_MoveFallDestroy:
		subq.w	#1,obTimer(a0)
		bne.s	BossChaseBall_Locret5
		addq.b	#2,ob2ndRout(a0)
		move.w	#-$400,$3A(a0)
		move.w	#3,obTimer(a0)
		move.b	#0,obAnim(a0)

BossChaseBall_Locret5:
		rts
; ---------------------------------------------------------------------------

BossChaseBall_JumpWait:
		move.w	$3A(a0),d0
		move.w	d0,obVelY(a0)
		asr.w	d0
		move.w	d0,$3A(a0)
		subq.b	#2,ob2ndRout(a0)
		subq.w	#1,obTimer(a0)
		bne.s	BossChaseBall_Locret5
		addq.b	#4,ob2ndRout(a0)
		move.w	#$30,obTimer(a0)
		clr.l	obVelX(a0)
		rts

; =============== S U B R O U T I N E =======================================

BossChaseBall_CreateRadiusCircular:
		addq.b	#2,ob2ndRout(a0)
		bsr.w	Find_SonicObject
		bsr.w	Change_FlipX
		move.b	#1,obAnim(a0)
		lea	ChildObjDat_RobotnikChaseBallCircularRadius(pc),a2
		bsr.w	Create_ChildObject2
		move.w	#-$200,obVelX(a0)
		btst	#0,obStatus(a0)
		beq.s	@1
		neg.w	obVelX(a0)
@1	if Snd_Driver_Version=0
		moveq	#$FFFFFFBE,d0
	else
		moveq	#20,d0
	endif
		jmp	(PlaySound_Special).l
; ---------------------------------------------------------------------------

BossChaseBall_MoveRadiusCircular:
		bsr.w	Find_SonicObject
		addi.w	#$10,d2
		cmpi.w	#$80,d2
		bcs.s	@2
		move.w	#$200,d1
		tst.w	d0
		bne.s	@1
		neg.w	d1
@1		move.w	d1,obVelX(a0)
@2		bsr.w	Change_FlipXWithVelocity
		jmp	(SpeedToPos).l

; =============== S U B R O U T I N E =======================================

BossChaseBall_Bouncing4:
		lea	Obj8DCheseBall_Speed(pc),a4
		lea	Obj8DCheseBall_Pos(pc),a5
		moveq	#5,d4
		moveq	#3,d1
		moveq	#$38,d2
		move.b	#(BossChaseBall_Bouncing4_Remove_Index-BossChaseBall_Index),ob2ndRout(a0)
		move.b	#$10,obActWid(a0)
		move.b	#$16,obHeight(a0)
		move.b	#0,obColType(a0)
		bclr #0,obRender(a0)
		lea	(a0),a1
		bra.s	@1
@2		jsr	(SingleObjLoad2).l
		bne.s	@4
@1		lea	(a0),a2
		lea	(a1),a3
		moveq	#3,d3
@3	rept 4
		move.l	(a2)+,(a3)+
	endr
		dbf	d3,@3
		move.w	(a4)+,obVelX(a1)
		move.w	(a4)+,obVelY(a1)
		move.w	(a5)+,d3
		add.w	d3,obX(a1)
		move.w	(a5)+,d3
		add.w	d3,obY(a1)
		move.b	d4,obFrame(a1)
		addq.w	#1,d4
		dbf	d1,@2
@4	if Snd_Driver_Version=0
		moveq	#$FFFFFFCB,d0
	else
		moveq	#1,d0
	endif
		jmp	(PlaySound_Special).l
; ---------------------------------------------------------------------------

BossChaseBall_Remove:
		jsr	(ObjectFall).l
		tst.b obRender(a0)
		bmi.w	BossChaseBallHurt_Locret
		jmp	(DeleteObject).l

; =============== S U B R O U T I N E =======================================

BossChaseBall_Hurt:
		cmpi.b	#(BossChaseBall_Defeated_Index-BossChaseBall_Index),ob2ndRout(a0)
		bcc.s	BossChaseBallHurt_Locret
		tst.b obColType(a0)
		bne.s	BossChaseBallHurt_Locret
		tst.b obColProp(a0)
		beq.w	BossChaseBall_ShipGone
		tst.b	obFlash(a0)
		bne.s	@2
		move.b	#$90,obFlash(a0)
	if Snd_Driver_Version=0
		moveq	#$FFFFFFAC,d0
	else
		moveq	#10,d0
	endif
		jsr	(PlaySound_Special).l
		bset	#6,obStatus(a0)
		lea	(v_player).w,a1
		move.w	#$600,d0
		btst	#0,obRender(a1)
		bne.s	@1
		neg.w	d0
@1		move.w	d0,obVelX(a1)
		bsr.w	Load_SimpleRing
@2		moveq	#0,d0
		btst	#0,obFlash(a0)
		bne.s	@3
		addi.w	#$C,d0
@3		lea	LoadBossChaseBall_PalRAM(pc),a1
		lea	LoadBossChaseBall_PalCycle(pc,d0.w),a2
	rept 6
		movea.w	(a1)+,a3
		move.w	(a2)+,(a3)+
	endr
		subq.b	#1,obFlash(a0)
		bne.s	BossChaseBallHurt_Locret
		bclr	#6,obStatus(a0)

BossChaseBallHurt_Locret:
		rts
; ---------------------------------------------------------------------------

LoadBossChaseBall_PalRAM:
		dc.w $FB74
		dc.w $FB76
		dc.w $FB78
		dc.w $FB7A
		dc.w $FB7C
		dc.w $FB7E
LoadBossChaseBall_PalCycle:
		dc.w $ECC
		dc.w $CAA
		dc.w $A88
		dc.w $866
		dc.w $644
		dc.w $222
		dc.w $E
		dc.w $C
		dc.w $A
		dc.w 8
		dc.w 6
		dc.w 8
; ---------------------------------------------------------------------------

BossChaseBall_ShipGone:
		move.b	#(BossChaseBall_Defeated_Index-BossChaseBall_Index),ob2ndRout(a0)
		move.b	#$AE,$2E(a0)
		bchg #4,obStatus(a0)
		bset	#6,obStatus(a0)
		rts
; ---------------------------------------------------------------------------

BossChaseBall_Defeated:
		subq.b	#1,$2E(a0)
		bne.s	@1
		move.b	#(BossChaseBall_Bouncing4_Index-BossChaseBall_Index),ob2ndRout(a0)
@1		move.b	(v_vbla_count+3).w,d0
		andi.b	#7,d0
		bne.s	@2
		jsr	(SingleObjLoad).l
		bne.s	@2
		move.b	#$3F,(a1)
		move.w	obX(a0),obX(a1)
		move.w	obY(a0),obY(a1)
		jsr	(RandomNumber).l
		move.w	d0,d1
		andi.w	#$1F,d1
		subi.w	#$10,d1
		add.w	d1,obX(a1)
		neg.w	d0
		andi.w	#$1F,d0
		subi.w	#$10,d0
		add.w	d0,obY(a1)
@2		rts

; =============== S U B R O U T I N E =======================================

BossChaseBall_Collision:
		btst	#6,obStatus(a0)
		bne.s	@1
		moveq	#0,d0
		move.b	obAnim(a0),d0
		move.b	@Data_Collision(pc,d0.w),d1
		move.b	d1,obColType(a0)
@1		rts
; ---------------------------------------------------------------------------

@Data_Collision:
		dc.b $F
		dc.b $81

; =============== S U B R O U T I N E =======================================

BossChaseBall_Load_Dynamic_Location:
		moveq	#0,d0
		move.b	$2B(a0),d0
		addq.b	#1,$2B(a0)
		cmpi.b	#(@Load_DCL-@Load_DNL)-1,d0
		bne.s	@1
		move.b	#0,$2B(a0)
@1		moveq	#0,d1
		move.b	@Load_DNL(pc,d0.w),d1
		move.b	@Load_DCL(pc,d1.w),ob2ndRout(a0)
		lea	ChildObjDat_Targetting_Sensor(pc),a2
		bra.w	Create_ChildObject2
; ---------------------------------------------------------------------------

@Load_DNL:
		dc.b 0
		dc.b 1
		dc.b 3
		dc.b 2
		dc.b 3
		dc.b 0
		dc.b 1
		dc.b 4
		dc.b 0
		dc.b 3
		dc.b 2
		dc.b 0
		dc.b 3
@Load_DCL:
		dc.b (BossChaseBall_JumpShot_Index-BossChaseBall_Index)
		dc.b (BossChaseBall_JumpCircular_Index-BossChaseBall_Index)
		dc.b (BossChaseBall_ShotVertical_Index-BossChaseBall_Index)
		dc.b (BossChaseBall_CreateClone_Index-BossChaseBall_Index)
		dc.b (BossChaseBall_RadiusCircular_Index-BossChaseBall_Index)

; =============== S U B R O U T I N E =======================================

Targetting_Sensor:
		lea	Targetting_Sensor_ShipIndex(pc),a1
		bra.w	ChildObjectsRoutine
; ---------------------------------------------------------------------------

Targetting_Sensor_ShipIndex:
		offsetEntry.w Targetting_Sensor_Init
		offsetEntry.w Targetting_Sensor_Show
		offsetEntry.w Robotnik_HudLives_MoveRemove
Targetting_Sensor2_Init
		offsetEntry.w Targetting_Sensor_Init
		offsetEntry.w Targetting_Sensor2_Create
		offsetEntry.w Targetting_Sensor2_Show
		offsetEntry.w Robotnik_HudLives_MoveRemove
Targetting_Sensor3_Init
		offsetEntry.w Targetting_Sensor_Init
		offsetEntry.w Targetting_Sensor3_Create
		offsetEntry.w Targetting_Sensor3_Check
		offsetEntry.w Targetting_Sensor3_Return
Targetting_Sensor3_Remove
		offsetEntry.w Robotnik_HudLives_MoveRemove
; ---------------------------------------------------------------------------

Targetting_Sensor_Init:
		addq.b	#2,ob2ndRout(a0)
		lea	ObjDat3_Targetting_Sensor(pc),a1
		bra.w	LoadObjects_Data
; ---------------------------------------------------------------------------

Targetting_Sensor3_Create:
		addq.b	#2,ob2ndRout(a0)
		movea.w	obParent(a0),a1
		move.b	#2,obAnim(a1)
		move.w	obX(a0),obXNext(a0)
		move.w	obY(a0),obYNext(a0)
		moveq	#0,d0
		move.b	obSubtype(a0),d0
		move.w	d0,d1
		lsr.w	#1,d0
		move.b	RawAni_7917E(pc,d0.w),obFrame(a0)
		add.w	d1,d1
		move.l	dword_79182(pc,d1.w),obVelX(a0)
		move.w	#$B,obTimer(a0)
		rts
; ---------------------------------------------------------------------------

RawAni_7917E:
		dc.b 8, 9, $A, $B
dword_79182:
		dc.w $100
		dc.w 0
		dc.w -$100
		dc.w 0
		dc.w 0
		dc.w $100
		dc.w 0
		dc.w -$100
; ---------------------------------------------------------------------------

Targetting_Sensor3_Check:
		movea.w	obParent(a0),a1
		tst.b obRender(a1)
		bmi.s	Targetting_Sensor3_Move
		move.b	#(Targetting_Sensor3_Remove-Targetting_Sensor_ShipIndex),ob2ndRout(a0)

Targetting_Sensor3_Move:
		jsr	(SpeedToPos).l
		subq.w	#1,obTimer(a0)
		bpl.w	Targetting_Sensor_Draw
		addq.b	#2,ob2ndRout(a0)
		move.w	#$F,obTimer(a0)

Targetting_Sensor3_Return:
		subq.w	#1,obTimer(a0)
		bpl.s	Targetting_Sensor_Draw
		subq.b	#2,ob2ndRout(a0)
		move.w	obXNext(a0),obX(a0)
		move.w	obYNext(a0),obY(a0)
		move.w	#$B,obTimer(a0)
		rts
; ---------------------------------------------------------------------------

Targetting_Sensor2_Create:
		addq.b	#2,ob2ndRout(a0)
;		lea	ChildObjDat_Targetting_Sensor3(pc),a2
;		bsr.w	Create_ChildObject5

Targetting_Sensor2_Show:
		movea.w	obParent(a0),a1
		tst.b obRender(a1)
		bpl.s	Targetting_Sensor_Animate
		bra.s	Targetting_Sensor_Remove
; ---------------------------------------------------------------------------

Targetting_Sensor_Show:
		movea.w	obParent(a0),a1
		move.w	obX(a1),obX(a0)
		move.w	obY(a1),obY(a0)
		btst	#4,obStatus(a1)
		bne.s	Targetting_Sensor_Remove
		tst.b	obFlash(a1)
		bne.s	Targetting_Sensor_Locret
		tst.b	obAnim(a1)
		beq.s	Targetting_Sensor_Count

Targetting_Sensor_Remove:
		addq.b	#2,ob2ndRout(a0)

Targetting_Sensor_Locret:
		rts
; ---------------------------------------------------------------------------

Targetting_Sensor_Count:
		move.w	(v_framecount).w,d0
		andi.w	#7,d0
		bne.s	Targetting_Sensor_Animate
	if Snd_Driver_Version=0
		moveq	#$FFFFFFCD,d0
	else
		moveq	#41,d0
	endif
		jsr	(PlaySound_Special).l

Targetting_Sensor_Animate:
		lea	(Ani_obj8D).l,a1
		jsr	(AnimateSprite).l

Targetting_Sensor_Draw:
		jmp	(DisplaySprite).l

; =============== S U B R O U T I N E =======================================

Robotnik_ShipCrane:
		lea	Robotnik_ShipCrane_ShipIndex(pc),a1
		bsr.w	ChildObjectsRoutine
		jmp	(DisplaySprite).l
; ---------------------------------------------------------------------------

Robotnik_ShipCrane_ShipIndex:
		offsetEntry.w Robotnik_ShipCrane_Init
		offsetEntry.w Robotnik_ShipCrane_Check
		offsetEntry.w Robotnik_ShipCrane_CheckRemove
		offsetEntry.w Robotnik_HudLives_MoveRemove
; ---------------------------------------------------------------------------

Robotnik_ShipCrane_Init:
		addq.b	#2,ob2ndRout(a0)
		lea ObjDat3_RobotnikShipCrane(pc),a1
		bsr.w	LoadObjects_Data
		tst.w	obSubtype(a0)
		beq.s	Robotnik_ShipCrane_Check
		move.b	#3,obFrame(a0)
		move.b	#5,obPriority(a0)

Robotnik_ShipCrane_Check:
		movea.w	obParent(a0),a1
		cmpi.b	#(BossGreenHill_ShipIndex_RevengeMode_Wait-BossGreenHill_ShipIndex),ob2ndRout(a1)
		bne.s	Robotnik_ShipCrane_CheckRemove
		addq.b	#2,ob2ndRout(a0)
		move.b	#0,obFrame(a0)
		tst.w	obSubtype(a0)
		beq.s	Robotnik_ShipCrane_CheckRemove
		move.b	#1,obFrame(a0)

Robotnik_ShipCrane_CheckRemove:
		movea.w	obParent(a0),a1
		cmpi.b	#(BossGreenHill_ShipIndex_RevengeMode_CheckReturn-BossGreenHill_ShipIndex),ob2ndRout(a1)
		bne.s	Robotnik_ShipCrane_Move
		addq.b	#2,ob2ndRout(a0)

Robotnik_ShipCrane_Move:
		movea.w	obParent(a0),a1
		move.w	obX(a1),d0
		move.b	obXNext(a0),d1
		ext.w	d1
		bclr	#0,obRender(a0)
		btst	#0,obStatus(a1)
		beq.s	@1
		neg.w	d1
		bset	#0,obRender(a0)
@1		add.w	d1,d0
		move.w	d0,obX(a0)
		move.w	obY(a1),d0
		move.b	obYNext(a0),d1
		ext.w	d1
		bclr	#1,obRender(a0)
		btst	#1,obStatus(a1)
		beq.s	@2
		neg.w	d1
		bset	#1,obRender(a0)
@2		add.w	d1,d0
		move.w	d0,obY(a0)
		rts

; =============== S U B R O U T I N E =======================================

Robotnik_Run:
		lea	Robotnik_Run_ShipIndex(pc),a1
		bsr.w	ChildObjectsRoutine
		bsr.w	Level_Defeated
		jmp	(DisplaySprite).l
; ---------------------------------------------------------------------------

Robotnik_Run_ShipIndex:
		offsetEntry.w Robotnik_Run_Init
		offsetEntry.w Robotnik_Run_Jump
		offsetEntry.w Robotnik_Run_Move
; ---------------------------------------------------------------------------

Robotnik_Run_Init:
		addq.b	#2,ob2ndRout(a0)
		lea ObjDat3_RobotnikRun(pc),a1
		bsr.w	LoadObjects_Data
		move.b	#$1E,obHeight(a0)
		bset	#0,obRender(a0)
		bset	#0,obStatus(a0)
		move.w	#$100,obVelX(a0)
		move.w	#-$800,obVelY(a0)

Robotnik_Run_Jump:
		jsr	(ObjectFall).l
		tst.w obVelY(a0)
		bmi.s	Robotnik_Run_Locret
		jsr	(ObjHitFloor).l
		tst.w	d1
		bpl.s	Robotnik_Run_Locret
		add.w	d1,obY(a0)
		addq.b	#2,ob2ndRout(a0)
		move.b	#$A,(v_dle_routine).w
		move.w	#$300,obVelX(a0)
		move.w	#0,obVelY(a0)

Robotnik_Run_Locret:
		rts
; ---------------------------------------------------------------------------

Robotnik_Run_Move:
		bsr.w	Find_SonicObject
		addi.w	#$50,d2
		cmpi.w	#$A0,d2
		bhs.s	Robotnik_Run_Animate
		move.w	obX(a1),d0
		addi.w	#$50,d0
		move.w	d0,obX(a0)

Robotnik_Run_Animate:
		jsr	(SpeedToPos).l
		lea	(Ani_RobotnikRun).l,a1
		jmp	(AnimateSprite).l
; ---------------------------------------------------------------------------

Level_Defeated:
		moveq	#0,d0
		move.b	(v_vbla_count+3).w,d0
		andi.b	#6,d0
		bne.s	@1
		jsr	(SingleObjLoad2).l
		bne.s	@1
		move.b	#$3F,(a1)
		move.w	obX(a0),obX(a1)
		move.w	obY(a0),obY(a1)
		jsr	(RandomNumber).l
		moveq	#0,d1
		move.b	#$80,d1
		move.w	d1,d2
		add.w	d2,d2
		subq.w	#1,d2
		and.w	d2,d0
		sub.w	d1,d0
		add.w	d0,obX(a1)
		swap	d0
		moveq	#0,d1
		move.b	#$80,d1
		move.w	d1,d2
		add.w	d2,d2
		subq.w	#1,d2
		and.w	d2,d0
		sub.w	d1,d0
		add.w	d0,obY(a1)
@1		rts

; =============== S U B R O U T I N E =======================================

Robotnik_HudLives:
		lea	Robotnik_HudLives_ShipIndex(pc),a1
		bra.w	ChildObjectsRoutine
; ---------------------------------------------------------------------------

Robotnik_HudLives_ShipIndex:
		offsetEntry.w Robotnik_HudLives_Init
		offsetEntry.w Robotnik_HudLives_MoveUp
		offsetEntry.w Robotnik_HudLives_MoveDown
		offsetEntry.w Robotnik_HudLives_MoveRemove
; ---------------------------------------------------------------------------

Robotnik_HudLives_Init:
		addq.b	#2,ob2ndRout(a0)
		move.l	#Map_obj21,obMap(a0)
		move.w	#$A680,obGfx(a0)
		move.w	#$170,obX(a0)
		move.w	#$28,obScreenY(a0)
		move.l	#Hud_10,$36(a0)
		move.l	#Art_LivesNums,$30(a0)

Robotnik_HudLives_MoveUp:
		addq.w	#1,obScreenY(a0)
		cmpi.w	#$48,obScreenY(a0)
		bne.s	Robotnik_HudLives_MoveDisplay
		addq.b	#2,ob2ndRout(a0)

Robotnik_HudLives_MoveDown:
		movea.w	obParent(a0),a1
		cmpi.b	#(BossGreenHill_RobotnikShip_Index-BossGreenHill_Index),obRoutine(a1)
		bne.s	Robotnik_HudLives_Check
		cmpi.b	#(BossGreenHill_ShipIndex_RevengeMode-BossGreenHill_ShipIndex),ob2ndRout(a1)
		bne.s	Robotnik_HudLives_Check
		bra.s	Robotnik_HudLives_Move2Down
; ---------------------------------------------------------------------------

Robotnik_HudLives_Check:
		tst.b obColProp(a1)
		bne.s	Robotnik_HudLives_MoveDisplay

Robotnik_HudLives_Move2Down:
		subq.w	#1,obScreenY(a0)
		cmpi.w	#$28,obScreenY(a0)
		bne.s	Robotnik_HudLives_MoveDisplay
		addq.b	#2,ob2ndRout(a0)

Robotnik_HudLives_MoveDisplay:
		move	#$2700,sr
		bsr.s	Robotnik_HudLives_DPLC
		move	#$2300,sr
		jmp	(DisplaySprite).l
; ---------------------------------------------------------------------------

Robotnik_HudLives_MoveRemove:
		jmp	(DeleteObject).l
; ---------------------------------------------------------------------------

Robotnik_HudLives_DPLC:
		lea	(VDP_data_port).l,a6
		move.l	$2A(a0),d0
		moveq	#0,d1
		movea.w	obParent(a0),a1
		move.b	obColProp(a1),d1
		movea.l	$36(a0),a2
		moveq	#1,d6
		moveq	#0,d4
		movea.l	$30(a0),a1
@0		move.l	d0,VDP_control_port-VDP_data_port(a6)
		moveq	#0,d2
		move.l	(a2)+,d3
@1		sub.l	d3,d1
		bcs.s	@2
		addq.w	#1,d2
		bra.s	@1
@2		add.l	d3,d1
		tst.w	d2
		beq.s	@3
		move.w	#1,d4
@3		tst.w	d4
		beq.s	@6
@4		lsl.w	#5,d2
		lea	(a1,d2.w),a3
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
		move.l	(a3)+,(a6)
@5		addi.l	#$400000,d0
		dbf	d6,@0
		rts
; ---------------------------------------------------------------------------
@6		tst.w	d6
		beq.s	@4
		moveq	#7,d5
@7		move.l	#0,(a6)
		dbf	d5,@7
		bra.s	@5

; =============== S U B R O U T I N E =======================================

ObjectsRoutine:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		adda.w	(a1,d0.w),a1
		jmp	(a1,d0.w)
; ---------------------------------------------------------------------------

ChildObjectsRoutine:
		moveq	#0,d0
		move.b	ob2ndRout(a0),d0
		adda.w	(a1,d0.w),a1
		jmp	(a1,d0.w)

; =============== S U B R O U T I N E =======================================

LoadObjects_Data:
		move.l	(a1)+,obMap(a0)
		move.w	(a1)+,obGfx(a0)

LoadObjects_ExtraData:
		move.b	(a1)+,obPriority(a0)
		move.b	(a1)+,obWidth(a0)
		move.b	(a1)+,obHeight(a0)
		move.b	(a1)+,obActWid(a0)
		move.b	(a1)+,obFrame(a0)
		move.b	(a1)+,obColType(a0)
		bset	#2,obRender(a0)
		rts
; ---------------------------------------------------------------------------

Create_ChildObject:
		moveq	#0,d2
		move.w	(a2)+,d6
@1		jsr	(SingleObjLoad2).l
		bne.s	@2
		move.w	a0,obParent(a1)
		move.l	obMap(a0),obMap(a1)
		move.w	obGfx(a0),obGfx(a1)
		move.b	(a2)+,(a1)
		move.b	d2,obSubtype(a1)
		move.w	obX(a0),obX(a1)
		move.w	obY(a0),obY(a1)
		move.b	(a2)+,obRoutine(a1)
		move.b	(a2)+,ob2ndRout(a1)
		addq.w	#2,d2
		dbf	d6,@1
		moveq	#0,d0
@2		rts
; ---------------------------------------------------------------------------

Create_ChildObject2:
		moveq	#0,d2
		move.w	(a2)+,d6
		move.w	(a2)+,d3
@1		jsr	(SingleObjLoad2).l
		bne.s	@2
		move.w	a0,obParent(a1)
		move.b	(a2),(a1)
		move.b	d2,obSubtype(a1)
		move.w	obX(a0),obX(a1)
		move.w	obY(a0),obY(a1)
		move.w	d3,obRoutine(a1)
		addq.w	#2,d2
		dbf	d6,@1
		moveq	#0,d0
@2		rts
; ---------------------------------------------------------------------------

Create_ChildObject3:
		moveq	#0,d2
		move.w	(a2)+,d6
		move.w	(a2)+,d3
@1		jsr	(SingleObjLoad2).l
		bne.s	@2
		move.w	a0,obParent(a1)
		move.b	d3,(a1)
		move.b	d2,obSubtype(a1)
		move.w	obX(a0),obX(a1)
		move.w	obY(a0),obY(a1)
		move.w	(a2)+,obVelX(a1)
		move.w	(a2)+,obVelY(a1)
		move.b	(a2)+,obRoutine(a1)
		move.b	(a2)+,ob2ndRout(a1)
		addq.w	#2,d2
		dbf	d6,@1
		moveq	#0,d0
@2		rts
; ---------------------------------------------------------------------------

Create_ChildObject4:
		moveq	#0,d2
		move.w	(a2)+,d6
		move.w	(a2)+,d3
@1		jsr	(SingleObjLoad2).l
		bne.s	@2
		move.w	a0,obParent(a1)
		move.b	(a2),(a1)
		move.b	d2,obSubtype(a1)
		move.w	obX(a0),obX(a1)
		move.w	obY(a0),obY(a1)
		move.w	d3,obRoutine(a1)
		jsr	(RandomNumber).l
		andi.w	#$FF,d0
		addi.w	#$20,d0
		move.w	d0,$38(a1)
		addq.w	#2,d2
		dbf	d6,@1
		moveq	#0,d0
@2		rts
; ---------------------------------------------------------------------------

Create_ChildObject5:
		moveq	#0,d2
		move.w	(a2)+,d6
		move.w	(a2)+,d3
@1		jsr	(SingleObjLoad2).l
		bne.s	@2
		move.w	a0,obParent(a1)
		move.b	(a2)+,(a1)
		move.b	d2,obSubtype(a1)
		move.w	obX(a0),d0
		move.b	(a2)+,d1
		move.b	d1,obXNext(a1)
		ext.w	d1
		add.w	d1,d0
		move.w	d0,obX(a1)
		move.w	obY(a0),d0
		move.b	(a2)+,d1
		move.b	d1,obYNext(a1)
		ext.w	d1
		add.w	d1,d0
		move.w	d0,obY(a1)
		move.w	d3,obRoutine(a1)
		addq.w	#2,d2
		dbf	d6,@1
		moveq	#0,d0
@2		rts
; ---------------------------------------------------------------------------

Find_SonicObject:
		lea	(v_player).w,a1

Find_OtherObject:
		moveq	#0,d0
		move.w	obX(a0),d2
		sub.w	obX(a1),d2
		bpl.s	@1
		neg.w	d2
		addq.w	#2,d0
@1		moveq	#0,d1
		move.w	obY(a0),d3
		sub.w	obY(a1),d3
		bpl.s	@2
		neg.w	d3
		addq.w	#2,d1
@2		rts
; ---------------------------------------------------------------------------

Change_FlipX:
		bclr	#0,obStatus(a0)
		tst.w	d0
		beq.s	@1
		bset	#0,obStatus(a0)
@1		rts
; ---------------------------------------------------------------------------

Change_FlipXWithVelocity:
		bclr	#0,obStatus(a0)
		tst.w	obVelX(a0)
		bmi.s	@1
		bset	#0,obStatus(a0)
@1		rts

; =============== S U B R O U T I N E =======================================

Load_SimpleRing:
		cmpi.b	#2,(Rings_mode_count).w
		bne.s	@1
		jsr	(SingleObjLoad2).l
		bne.s	@1
	        move.b #$37,(a1)
	        move.w obX(a0),obX(a1)
	        move.w obY(a0),obY(a1)
	        move.b #2,obRoutine(a1)
	        move.b #8,obHeight(a1)
	        move.b #8,obWidth(a1)
	        move.l #Map_obj25,obMap(a1)
	        move.w #$26CA,obGfx(a1)
	        move.b #4,obRender(a1)
	        move.b #3,obPriority(a1)
	        move.b #$47,obColType(a1)
	        move.b #8,obActWid(a1)
	        move.b #-1,($FFFFFEC6).w
	        move.w #0,obVelX(a1)
	        move.w #-$300,obVelY(a1)
@1		rts

; =============== S U B R O U T I N E =======================================

ObjDat3_BossGreenHill_Robotnik:
		dc.l Map_Eggman
		dc.w $400
		dc.b 3
		dc.b $40
		dc.b $40
		dc.b $40
		dc.b 0
		dc.b $F
ObjDat3_BossGreenHill_RobotnikFace:
		dc.b 3
		dc.b $10
		dc.b $10
		dc.b $10
		dc.b 1
		dc.b 0
ObjDat3_BossGreenHill_RobotnikFlame:
		dc.b 2
		dc.b $20
		dc.b $20
		dc.b $20
		dc.b 3
		dc.b 0
ObjDat3_BossGreenHill_RobotnikFlame2:
		dc.b 4
		dc.b $20
		dc.b $20
		dc.b $20
		dc.b 3
		dc.b 0
ObjDat3_BossGreenHill_RobotnikGlass:
		dc.b 2
		dc.b $20
		dc.b $20
		dc.b $20
		dc.b $F
		dc.b 0
ObjDat3_BossGreenHill_RobotnikSpike:
		dc.l Map_obj5Ea
		dc.w $2518
		dc.b 5
		dc.b $C
		dc.b 4
		dc.b $C
		dc.b 1
		dc.b $9A
ObjDat3_BossGreenHill_RobotnikSphere:
		dc.l Map_obj45
		dc.w $480
		dc.b 5
		dc.b 8
		dc.b 0
		dc.b 8
		dc.b 3
		dc.b $87
ObjDat3_BossGreenHill_RobotnikBall:
		dc.l Map_obj48
		dc.w $63AA
		dc.b 4
		dc.b $10
		dc.b $16
		dc.b $20
		dc.b 0
		dc.b $81
ObjDat3_Targetting_Sensor:
		dc.l Map_obj8D
		dc.w $86A0
		dc.b 1
		dc.b $10
		dc.b $10
		dc.b $10
		dc.b 0
		dc.b 0
ObjDat3_RobotnikShipCrane:
		dc.l Map_RobotnikShipCrane
		dc.w $380
		dc.b 3
		dc.b $30
		dc.b $30
		dc.b $30
		dc.b 2
		dc.b 0
ObjDat3_RobotnikRun:
		dc.l Map_RobotnikRun
		dc.w $4C0
		dc.b 3
		dc.b $30
		dc.b $30
		dc.b $30
		dc.b 0
		dc.b 0
Obj8DCheseBall_Speed:
		dc.w -$180, -$200
		dc.w $180, -$200
		dc.w -$100, -$100
		dc.w $100, -$100
Obj8DCheseBall_Pos:
		dc.w -1, -1
		dc.w $19, 2
		dc.w 1, $1A
		dc.w $19, $1A
ChildObjDat_RobotnikGlassFaceAndFlame:
		dc.w 3
		dc.b $8D
		dc.b (BossGreenHill_RobotnikFace_Index-BossGreenHill_Index),0
		dc.b $8D
		dc.b (BossGreenHill_RobotnikFlame_Index-BossGreenHill_Index),0
		dc.b $8D
		dc.b (BossGreenHill_RobotnikFlame_Index-BossGreenHill_Index),0
		dc.b $8D
		dc.b (BossGreenHill_RobotnikGlass_Index-BossGreenHill_Index),0
ChildObjDat_RobotnikHud:
		dc.w 0
		dc.b $8D
		dc.b (BossGreenHill_EggmanLives_Index-BossGreenHill_Index),0,0
ChildObjDat_Targetting_Sensor:
		dc.w 0
		dc.b (BossGreenHill_Targetting_Sensor_Index-BossGreenHill_Index),0
		dc.b $8D,0
ChildObjDat_Targetting_Sensor2:
		dc.w 0
		dc.b (BossGreenHill_Targetting_Sensor_Index-BossGreenHill_Index),(Targetting_Sensor2_Init-Targetting_Sensor_ShipIndex)
		dc.b $8D,0
ChildObjDat_RobotnikRingFall:
		dc.w 0
		dc.b $8D
		dc.b (BossGreenHill_CircularRing_Index-BossGreenHill_Index),(BossCircularRing_Index_SetUpAttributes-BossCircularRing_Index),0
ChildObjDat_RobotnikCircularRing:
		dc.w $F
		dc.b (BossGreenHill_CircularRing_Index-BossGreenHill_Index),0
		dc.b $8D,0
ChildObjDat_RobotnikChaseBall:
		dc.w 0
		dc.b $8D
		dc.b (BossGreenHill_ChaseBall_Index-BossGreenHill_Index),0,0
ChildObjDat_RobotnikChaseBallClone:
		dc.w 0
		dc.b $8D
		dc.b (BossGreenHill_ChaseBall_Index-BossGreenHill_Index),(BossChaseBall_Clone_Index_SetUpAttributes-BossChaseBall_Index),0
ChildObjDat_RobotnikChaseBallRing:
		dc.w 2
		dc.w $8D
		dc.w -$200
		dc.w -$600
		dc.b (BossGreenHill_CircularRing_Index-BossGreenHill_Index),(BossCircularRing_Index_SetUpAttributes-BossCircularRing_Index)
		dc.w 0
		dc.w -$600
		dc.b (BossGreenHill_CircularRing_Index-BossGreenHill_Index),(BossCircularRing_Index_SetUpAttributes-BossCircularRing_Index)
		dc.w $200
		dc.w -$600
		dc.b (BossGreenHill_CircularRing_Index-BossGreenHill_Index),(BossCircularRing_Index_SetUpAttributes-BossCircularRing_Index)
ChildObjDat_RobotnikChaseBallRing2:
		dc.w 4
		dc.w $8D
		dc.w -$400
		dc.w -$600
		dc.b (BossGreenHill_CircularRing_Index-BossGreenHill_Index),(BossCircularRing_Index_SetUpAttributes-BossCircularRing_Index)
		dc.w -$200
		dc.w -$600
		dc.b (BossGreenHill_CircularRing_Index-BossGreenHill_Index),(BossCircularRing_Index_SetUpAttributes-BossCircularRing_Index)
		dc.w 0
		dc.w -$600
		dc.b (BossGreenHill_CircularRing_Index-BossGreenHill_Index),(BossCircularRing_Index_SetUpAttributes-BossCircularRing_Index)
		dc.w $200
		dc.w -$600
		dc.b (BossGreenHill_CircularRing_Index-BossGreenHill_Index),(BossCircularRing_Index_SetUpAttributes-BossCircularRing_Index)
		dc.w $400
		dc.w -$600
		dc.b (BossGreenHill_CircularRing_Index-BossGreenHill_Index),(BossCircularRing_Index_SetUpAttributes-BossCircularRing_Index)
ChildObjDat_RobotnikChaseBallCircularRing:
		dc.w 7
		dc.b (BossGreenHill_CircularRing_Index-BossGreenHill_Index),(BossCircularRing_Index_SetUpAttributes2-BossCircularRing_Index)
		dc.b $8D,0
ChildObjDat_RobotnikShotRing:
		dc.w 9
		dc.b (BossGreenHill_CircularRing_Index-BossGreenHill_Index),(BossCircularRing_Index_SetUpAttributes3-BossCircularRing_Index)
		dc.b $8D,0
ChildObjDat_RobotnikChaseBallCircularRadius:
		dc.w $F
		dc.b (BossGreenHill_CircularRing_Index-BossGreenHill_Index),(BossCircularRing_Index_SetUpAttributes4-BossCircularRing_Index)
		dc.b $8D,0
ChildObjDat_Targetting_Sensor3:
		dc.w 3
		dc.b (BossGreenHill_Targetting_Sensor_Index-BossGreenHill_Index),(Targetting_Sensor3_Init-Targetting_Sensor_ShipIndex)
		dc.b $8D
		dc.w $F000
		dc.b $8D
		dc.w $1000
		dc.b $8D
		dc.w $F0
		dc.b $8D
		dc.w $10
ChildObjDat_RobotnikShipCrane:
		dc.w 1
		dc.b (BossGreenHill_RobotnikShipCrane_Index-BossGreenHill_Index),0
		dc.b $8D
		dc.w $FF2C
		dc.b $8D
		dc.w $FF2C
ChildObjDat_RobotnikRun:
		dc.w 0
		dc.b $8D
		dc.b (BossGreenHill_RobotnikRun_Index-BossGreenHill_Index),0,0