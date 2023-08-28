; Z80 addresses
Z80_RAM =			$A00000
Z80_RAM_end =		$A02000
Z80_bus_request =	$A11100
Z80_reset =			$A11200
PSG_input = 			$C00011

; VDP addresses
VDP_data_port =			$C00000
VDP_control_port =		$C00004
PSG_input =				$C00011

; I/O Area
HW_Version =					$A10001
HW_Port_1_Data =				$A10003
HW_Port_2_Data =				$A10005
HW_Expansion_Data =			$A10007
HW_Port_1_Control =				$A10009
HW_Port_2_Control =				$A1000B
HW_Expansion_Control =			$A1000D
HW_Port_1_TxData =				$A1000F
HW_Port_1_RxData =				$A10011
HW_Port_1_SCtrl =				$A10013
HW_Port_2_TxData =				$A10015
HW_Port_2_RxData =				$A10017
HW_Port_2_SCtrl =				$A10019
HW_Expansion_TxData =			$A1001B
HW_Expansion_RxData =			$A1001D
HW_Expansion_SCtrl =			$A1001F

; ---------------------------------------------------------------
; struct
; ---------------------------------------------------------------

Snd_Driver_Version 	= 1	; 0 - SMPS, 1 - Z80
Debug_Mode 		= 1	; 0 - Off, 1- On

; ---------------------------------------------------------------
; Object struct
; ---------------------------------------------------------------

render			equ	$01
art				equ	$02
lastframe		equ	$04
maps			equ	$04
xpos				equ $08
ypos				equ $0C
xvel				equ	$10
yvel				equ	$12
inertia			equ	$14
height			equ	$16
width			equ	$17
layer			equ	$18
visible_width		equ	$19
frame			equ	$1A
anim			equ	$1C
touch			equ	$20
hits				equ	$21
state			equ	$22
routine			equ	$24
routine2			equ	$25
angle			equ	$26
subtype			equ	$28
xbase			equ	$2C
ybase			equ	$2E
xacc				equ	$30
yacc				equ	$32
parent			equ	$34
timer			equ	$38
obj				equ	$3C

; ---------------------------------------------------------------------------
; Object Status Table offsets (for everything between Object_RAM and Primary_Collision)
; ---------------------------------------------------------------------------
; universally followed object conventions:
render_flags =		  	1 ; bitfield ; bit 7 = onscreen flag, bit 0 = x mirror, bit 1 = y mirror, bit 2 = coordinate system
art_tile =		  		2 ; and 3 ; start of sprite's art
mappings =		  		4 ; and 5 and 6 and 7
x_pos =				 	8 ; and 9 ... some objects use $A and $B as well when extra precision is required (see ObjectMove) ... for screen-space objects this is called x_pixel instead
y_pos =			 		$C ; and $D ... some objects use $E and $F as well when extra precision is required ... screen-space objects use y_pixel instead
priority =				$18 ; 0 = front
width_pixels =			$19
mapping_frame =			$1A

; ---------------------------------------------------------------------------
; conventions followed by most objects:
x_vel =					$10 ; and $11 ; horizontal velocity
y_vel =					$12 ; and $13 ; vertical velocity
y_radius =				$16 ; collision width / 2
x_radius =				$17 ; collision height / 2
anim_frame =			$1B
next_anim =				$1D
prev_anim =				$1D
anim_frame_duration =	$1E
anim_frame_timer =		$1E
status =					$22 ; note: exact meaning depends on the object... for sonic/tails: bit 0: leftfacing. bit 1: inair. bit 2: spinning. bit 3: onobject. bit 4: rolljumping. bit 5: pushing. bit 6: underwater.
routine_secondary =		$25
v_objstate:	= $FFFFFC00	; object state list ($200 bytes)
v_ani1_time:	= $FFFFFEC2	; synchronised sprite animation 1 - time until next frame
v_ani1_frame:	= $FFFFFEC3
v_objstate:	= $FFFFFC00	; object state list ($200 bytes)
v_rings:	= $FFFFFE20	; rings (2 bytes)
v_ani3_time:	= $FFFFFEC6	; synchronised sprite animation 3 - time until next frame
v_ani3_frame:	= $FFFFFEC7	; synchronised sprite animation 3 - current frame
v_lifecount:	= $FFFFFE1B	; lives counter value (for actual number, see "v_lives")
f_lifecount:	= $FFFFFE1C	; lives counter update flag
f_ringcount:	= $FFFFFE1D	; ring counter update flag
v_vbla_count:	= $FFFFFE0C	; vertical interrupt counter (adds 1 every VBlank) (4 bytes)
v_vbla_word:	= v_vbla_count+2 ; low word for vertical interrupt counter (2 bytes)
v_vbla_byte:	= v_vbla_word+1	; low byte for vertical interrupt counter
v_limitbtm2:	= $FFFFF72E	; bottom level boundary (2 bytes)
v_screenposx: = $FFFFF700	; screen position x (2 bytes)
v_screenposy: = $FFFFF704	; screen position y (2 bytes)
v_framecount: = $FFFFFE04
v_player:	 = $FFFFD000	; Main character
v_dle_routine: = $FFFFF742
f_timecount: = $FFFFFE1E	; Time counter update flag
v_bossstatus: = $FFFFF7A7	; Status of boss and prison capsule

objSonic		= $FFFFD000
objSpinDust		= $FFFFD180	; Warning! Isn't compatible with the original game!

pal1	= 1<<13
pal2	= 2<<13
pal3	= 3<<13

iStart		equ 	7
iA			equ 	6
iB			equ 	4
iC			equ 	5
iRight		equ 	3
iLeft			equ 	2
iDown		equ 	1
iUp			equ 	0

Start		equ 	1<<7
A			equ 	1<<6
B			equ 	1<<4
C			equ 	1<<5
Right		equ 	1<<3
Left			equ 	1<<2
Down		equ 	1<<1
Up			equ 	1

SonicControl		equ	$FFFFF602
Joypad			equ	$FFFFF604

Ctrl_1 			equ $FFFFF604
Ctrl_1_held 		equ $FFFFF604
Ctrl_1_hold 		equ $FFFFF604
Ctrl_1_pressed	equ $FFFFF605

Held		equ	0
Press		equ	1

*$FFFFF602	SonicControl|Held
*$FFFFF603	SonicControl|Press
*$FFFFF604	Joypad|Held
*$FFFFF605	Joypad|Press

; for Parallax Engine
_normal = $0000
_moving	= $0200
_linear = $0400

; values for the type argument
VRAM = %100001
CRAM = %101011
VSRAM = %100101

; values for the rwd argument
READ = %001100
WRITE = %000111
DMA = %100111

VDP_reg_1_command =			$FFFFF60C ; word ; AND the lower byte by $BF and write to VDP control port to disable display, OR by $40 to enable
VDP_Control = 					$C00004

Normal_palette 					equ $FFFFFB00  ; $80 bytes
Normal_palette_line_1 			equ $FFFFFB00  ; $80 bytes
Normal_palette_line_2 			equ $FFFFFB20  ; $20 bytes
Normal_palette_line_3 			equ $FFFFFB40  ; $20 bytes
Normal_palette_line_4 			equ $FFFFFB60  ; $20 bytes
Normal_palette_line1 				equ $FFFFFB00  ; $80 bytes
Normal_palette_line2 				equ $FFFFFB20  ; $20 bytes
Normal_palette_line3 				equ $FFFFFB40  ; $20 bytes
Normal_palette_line4 				equ $FFFFFB60  ; $20 bytes
Second_palette 					equ $FFFFFB80  ; $80 bytes ; used by palette fading routines
Target_palette 					equ $FFFFFB80  ; $80 bytes ; used by palette fading routines
Target_palette_line_1 				equ $FFFFFB80  ; $80 bytes ; used by palette fading routines
Target_palette_line_2 				equ $FFFFFBA0  ; $20 bytes
Target_palette_line_3 				equ $FFFFFBC0  ; $20 bytes
Target_palette_line_4 				equ $FFFFFBE0  ; $20 bytes
Target_palette_line1 				equ $FFFFFB80  ; $80 bytes ; used by palette fading routines
Target_palette_line2 				equ $FFFFFBA0  ; $20 bytes
Target_palette_line3 				equ $FFFFFBC0  ; $20 bytes
Target_palette_line4				equ $FFFFFBE0  ; $20 bytes

Player_1							equ $FFFFD000
Object_RAM						equ $FFFFD000
Sprite_table_input				equ $FFFFAC00
Boss_flag						equ $FFFFF7AA
Debug_placement_mode			equ $FFFFFE08
Camera_RAM					equ $FFFFF73A
Camera_X_pos					equ $FFFFF700
Camera_Y_pos					equ $FFFFF704
Camera_target_max_Y_pos		equ $FFFFF726
Camera_min_X_pos				equ $FFFFF728
Camera_max_X_pos				equ $FFFFF72A
Camera_min_Y_pos				equ $FFFFF72C
RAM_start						equ $FF0000
DMA_queue						equ $FFFFC800
DMA_queue_slot					equ $FFFFC8FC
Game_mode 						equ $FFFFF600
Demo_timer						equ $FFFFF614
V_int_routine					equ $FFFFF62A
Last_star_post_hit 				equ $FFFFFE30
Dynamic_resize_routine			equ $FFFFF742
H_scroll_buffer					equ $FFFFCC00
H_scroll_buffer_FG				equ $FFFFCC00
H_scroll_buffer_BG				equ $FFFFCC02
V_scroll_value					equ $FFFFF616
V_scroll_value_FG				equ $FFFFF616
V_scroll_value_BG				equ $FFFFF618
Current_zone_and_act				equ $FFFFFE10	; .w
Current_zone						equ $FFFFFE10	; .b
Current_act						equ $FFFFFE11	; .b
H_int_flag 						equ $FFFFF644
System_stack						equ $FFFFFE00
Graphics_flags					equ $FFFFFFD8
Checksum_string 					equ $FFFFFFFC 	; long ; set to 'SM&K' once the checksum routine has run
Checksum_fourcc 					equ $FFFFFFFC 	; long ; set to 'SM&K' once the checksum routine has run

; RAM
Screen_Shaking_Flag				equ $FFFFFEF4
Screen_Shaking_Screen			equ $FFFFFEF6
Sound_test_sound				equ $FFFFFF86
Hyper_Sonic_flash_timer			equ $FFFFFF88
Options_Italic_Count				equ $FFFFFF8A
Music_test_count					equ $FFFFFF8C
Sound_test_count					equ $FFFFFF8E
Rings_mode_count				equ $FFFFFF90	; b
Options_Screen_Timer			equ $FFFFFF92	; w

; Variables
HScroll			equ	$FFFFCC00
FG_XPos		equ	$FFFFF700
FrameCounter	equ	$FFFFFE04
CamLeftBound		equ	$FFFFF728	; w	Left level boundary
CamRightBound		equ	$FFFFF72A	; w	Right level boundary
CamTopBound		equ	$FFFFF72C	; w	Top level boundary
CamBottomBound		equ	$FFFFF72E	; w	Bottom level boundary
LockScreen		equ	$FFFFF7AA
CamXshift		equ	$FFFFF73A	; w	Camera X shift for frame (8 fixed)
CamYshift		equ	$FFFFF73C	; w	Camera Y shift for frame (8 fixed)

Objects			equ	$FFFFD000	;	Reserved Objects RAM
ObjectsMain		equ	$FFFFD800	;	Main Objects RAM

CamXpos			equ	$FFFFF700	; l	Camera X position (FG)
CamYpos			equ	$FFFFF704	; l	Camera Y position (FG)
CamXpos2		equ	$FFFFF708	; l	Camera X position (BG1)
CamYpos2		equ	$FFFFF70C	; l	Camera Y position (BG1)
CamXpos3		equ	$FFFFF710	; l	Camera X position (BG2)
CamYpos3		equ	$FFFFF714	; l	Camera Y position (BG2)
CamXpos4		equ	$FFFFF718	; l	Camera X position (BG3)
CamYpos4		equ	$FFFFF71C	; l	Camera Y position (BG3)

; property of all objects:
object_size =				$40 ; the size of an object's status table entry
next_object =				object_size

; =============================================================
; Macro to check button presses
; Arguments:	1 - buttons to check
;		2 - bitfield to check
; -------------------------------------------------------------
tpress	macro
	move.b	(\2+1),d0
	andi.b	#\1,d0
	endm

align macro
	cnop 0,\1
	endm

enableInts macro
	move	#$2300,sr
    endm

disableInts macro
	move	#$2700,sr
    endm

; =============================================================
; Macro to check if buttons are held
; Arguments:	1 - buttons to check
;		2 - bitfield to check
; -------------------------------------------------------------
theld	macro
	move.b	\2,d0
	andi.b	#\1,d0
	endm
; =============================================================
; Macro to set VRAM write access
; Arguments:	1 - raw VRAM offset
;		2 - register to write access bitfield in (Optional)
; -------------------------------------------------------------
locVRAM:	macro
	if (narg=1)
		move.l	#($40000000+((\1&$3FFF)<<16)+((\1&$C000)>>14)),($C00004).l
	else
		move.l	#($40000000+((\1&$3FFF)<<16)+((\1&$C000)>>14)),\2
	endc
	endm

_Kos_UseLUT: = 1
_Kos_LoopUnroll: = 3
_Kos_ExtremeUnrolling: = 1

_Kos_RunBitStream macro
	dbra	d2,@skip\@
	moveq	#7,d2					; Set repeat count to 8.
	move.b	d1,d0					; Use the remaining 8 bits.
	not.w	d3						; Have all 16 bits been used up?
	bne.s	@skip\@					; Branch if not.
	move.b	(a0)+,d0				; Get desc field low-byte.
	move.b	(a0)+,d1				; Get desc field hi-byte.
	if _Kos_UseLUT=1
	move.b	(a4,d0.w),d0			; Invert bit order...
	move.b	(a4,d1.w),d1			; ... for both bytes.
	endif
@skip\@
	endm

_Kos_ReadBit macro
	if _Kos_UseLUT=1
	add.b	d0,d0					; Get a bit from the bitstream.
	else
	lsr.b	#1,d0					; Get a bit from the bitstream.
	endif
	endm

; fills a region of 68k RAM with 0 (4 bytes at a time)
clearRAM2 macro addr,length
	lea	(addr).w,a1
	moveq	#0,d0
	move.w	#(length),d1
@loop\@ move.l	d0,(a1)+
	dbf	d1,@loop\@
    endm

; ---------------------------------------------------------------------------
; Copy a tilemap from 68K (ROM/RAM) to the VRAM without using DMA
; input: source, destination, width [cells], height [cells]
; ---------------------------------------------------------------------------

copyTilemap	macro source,loc,width,height
		lea	(source).l,a1
		move.l	#$40000000+((loc&$3FFF)<<16)+((loc&$C000)>>14),d0
		moveq	#width,d1
		moveq	#height,d2
		jsr	(ShowVDPGraphics).l
	endm

; =============================================================
; Macro to stop Z80
; -------------------------------------------------------------
stopZ80	macro
	move.w	#$100,(Z80_bus_request).l
	nop
	nop
	nop

@wait\@:
	btst	#0,(Z80_bus_request).l
	bne.s	@wait\@
    endm
; =============================================================

; tells the Z80 to stop, and waits for it to finish stopping (acquire bus)
stopZ80a macro
	move.w	#$100,(Z80_bus_request).l ; stop the Z80
    endm
; =============================================================

; tells the Z80 to wait for it to finish stopping (acquire bus)
waitZ80 macro
@wait\@:
	btst	#0,(Z80_bus_request).l
	bne.s	@wait\@
    endm

; =============================================================
; Macro to reset Z80
; -------------------------------------------------------------
resetZ80	macro
	move.w	#$100,(Z80_reset).l
	endm
; =============================================================

; tells the Z80 to reset
resetZ80a macro
	move.w	#0,(Z80_reset).l
    endm

; =============================================================
; Macro to start Z80
; -------------------------------------------------------------
startZ80	macro
	move.w	#0,(Z80_bus_request).l
	endm
; =============================================================

dScroll_Header macro plane,ram,speed,pixel
		if plane=A
	if ram=0
		dc.w $CC00+(ram)
	else
		dc.w $CC00+(ram<<2)
	endif
		elseif plane=B
	if ram=0
		dc.w $CC00+(ram)+2
	else
		dc.w $CC00+(ram<<2)+2
	endif
		else
			fatal 'Error! Non-existent plan.'
		endif
	dc.w speed,pixel
    endm

offsetTable macro *
\* EQU *
current_offset_table = \*
    endm
offsetTableEntry macro ptr
	dc.\0 ptr-current_offset_table
    endm
offsetEntry macro ptr
	dc.\0 ptr-*
    endm