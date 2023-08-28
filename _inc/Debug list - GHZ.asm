; ---------------------------------------------------------------------------
; Debug	list - Green Hill
; ---------------------------------------------------------------------------

		dc.w 1						; number of items in list
		dc.l Map_obj25+$25000000	; mappings pointer, object type * 10^6
		dc.b 0, 0						; subtype, frame
		dc.w $26CA					; VRAM setting (2 bytes)
	even