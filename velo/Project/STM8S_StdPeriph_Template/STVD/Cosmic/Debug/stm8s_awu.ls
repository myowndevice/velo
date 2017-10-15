   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  21                     .const:	section	.text
  22  0000               _APR_Array:
  23  0000 00            	dc.b	0
  24  0001 1e            	dc.b	30
  25  0002 1e            	dc.b	30
  26  0003 1e            	dc.b	30
  27  0004 1e            	dc.b	30
  28  0005 1e            	dc.b	30
  29  0006 1e            	dc.b	30
  30  0007 1e            	dc.b	30
  31  0008 1e            	dc.b	30
  32  0009 1e            	dc.b	30
  33  000a 1e            	dc.b	30
  34  000b 1e            	dc.b	30
  35  000c 1e            	dc.b	30
  36  000d 3d            	dc.b	61
  37  000e 17            	dc.b	23
  38  000f 17            	dc.b	23
  39  0010 3e            	dc.b	62
  40  0011               _TBR_Array:
  41  0011 00            	dc.b	0
  42  0012 01            	dc.b	1
  43  0013 02            	dc.b	2
  44  0014 03            	dc.b	3
  45  0015 04            	dc.b	4
  46  0016 05            	dc.b	5
  47  0017 06            	dc.b	6
  48  0018 07            	dc.b	7
  49  0019 08            	dc.b	8
  50  001a 09            	dc.b	9
  51  001b 0a            	dc.b	10
  52  001c 0b            	dc.b	11
  53  001d 0c            	dc.b	12
  54  001e 0c            	dc.b	12
  55  001f 0e            	dc.b	14
  56  0020 0f            	dc.b	15
  57  0021 0f            	dc.b	15
  86                     ; 73 void AWU_DeInit(void)
  86                     ; 74 {
  88                     .text:	section	.text,new
  89  0000               _AWU_DeInit:
  93                     ; 75   AWU->CSR = AWU_CSR_RESET_VALUE;
  95  0000 725f50f0      	clr	20720
  96                     ; 76   AWU->APR = AWU_APR_RESET_VALUE;
  98  0004 353f50f1      	mov	20721,#63
  99                     ; 77   AWU->TBR = AWU_TBR_RESET_VALUE;
 101  0008 725f50f2      	clr	20722
 102                     ; 78 }
 105  000c 81            	ret	
 267                     ; 88 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 267                     ; 89 {
 268                     .text:	section	.text,new
 269  0000               _AWU_Init:
 271  0000 88            	push	a
 272       00000000      OFST:	set	0
 275                     ; 91   assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 277                     ; 94   AWU->CSR |= AWU_CSR_AWUEN;
 279  0001 721850f0      	bset	20720,#4
 280                     ; 97   AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 282  0005 c650f2        	ld	a,20722
 283  0008 a4f0          	and	a,#240
 284  000a c750f2        	ld	20722,a
 285                     ; 98   AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 287  000d 7b01          	ld	a,(OFST+1,sp)
 288  000f 5f            	clrw	x
 289  0010 97            	ld	xl,a
 290  0011 c650f2        	ld	a,20722
 291  0014 da0011        	or	a,(_TBR_Array,x)
 292  0017 c750f2        	ld	20722,a
 293                     ; 101   AWU->APR &= (uint8_t)(~AWU_APR_APR);
 295  001a c650f1        	ld	a,20721
 296  001d a4c0          	and	a,#192
 297  001f c750f1        	ld	20721,a
 298                     ; 102   AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 300  0022 7b01          	ld	a,(OFST+1,sp)
 301  0024 5f            	clrw	x
 302  0025 97            	ld	xl,a
 303  0026 c650f1        	ld	a,20721
 304  0029 da0000        	or	a,(_APR_Array,x)
 305  002c c750f1        	ld	20721,a
 306                     ; 103 }
 309  002f 84            	pop	a
 310  0030 81            	ret	
 365                     ; 112 void AWU_Cmd(FunctionalState NewState)
 365                     ; 113 {
 366                     .text:	section	.text,new
 367  0000               _AWU_Cmd:
 371                     ; 114   if (NewState != DISABLE)
 373  0000 4d            	tnz	a
 374  0001 2705          	jreq	L331
 375                     ; 117     AWU->CSR |= AWU_CSR_AWUEN;
 377  0003 721850f0      	bset	20720,#4
 380  0007 81            	ret	
 381  0008               L331:
 382                     ; 122     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 384  0008 721950f0      	bres	20720,#4
 385                     ; 124 }
 388  000c 81            	ret	
 441                     	switch	.const
 442  0022               L41:
 443  0022 000003e8      	dc.l	1000
 444                     ; 139 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 444                     ; 140 {
 445                     .text:	section	.text,new
 446  0000               _AWU_LSICalibrationConfig:
 448  0000 5206          	subw	sp,#6
 449       00000006      OFST:	set	6
 452                     ; 141   uint16_t lsifreqkhz = 0x0;
 454                     ; 142   uint16_t A = 0x0;
 456                     ; 145   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 458                     ; 147   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 460  0002 96            	ldw	x,sp
 461  0003 1c0009        	addw	x,#OFST+3
 462  0006 cd0000        	call	c_ltor
 464  0009 ae0022        	ldw	x,#L41
 465  000c cd0000        	call	c_ludv
 467  000f be02          	ldw	x,c_lreg+2
 468  0011 1f03          	ldw	(OFST-3,sp),x
 470                     ; 151   A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 472  0013 54            	srlw	x
 473  0014 54            	srlw	x
 474  0015 1f05          	ldw	(OFST-1,sp),x
 476                     ; 153   if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 478  0017 58            	sllw	x
 479  0018 58            	sllw	x
 480  0019 1f01          	ldw	(OFST-5,sp),x
 482  001b 1e03          	ldw	x,(OFST-3,sp)
 483  001d 72f001        	subw	x,(OFST-5,sp)
 484  0020 1605          	ldw	y,(OFST-1,sp)
 485  0022 9058          	sllw	y
 486  0024 905c          	incw	y
 487  0026 cd0000        	call	c_imul
 489  0029 1605          	ldw	y,(OFST-1,sp)
 490  002b 9058          	sllw	y
 491  002d bf00          	ldw	c_x,x
 492  002f 9058          	sllw	y
 493  0031 90b300        	cpw	y,c_x
 494  0034 7b06          	ld	a,(OFST+0,sp)
 495  0036 2504          	jrult	L561
 496                     ; 155     AWU->APR = (uint8_t)(A - 2U);
 498  0038 a002          	sub	a,#2
 500  003a 2001          	jra	L761
 501  003c               L561:
 502                     ; 159     AWU->APR = (uint8_t)(A - 1U);
 504  003c 4a            	dec	a
 505  003d               L761:
 506  003d c750f1        	ld	20721,a
 507                     ; 161 }
 510  0040 5b06          	addw	sp,#6
 511  0042 81            	ret	
 534                     ; 168 void AWU_IdleModeEnable(void)
 534                     ; 169 {
 535                     .text:	section	.text,new
 536  0000               _AWU_IdleModeEnable:
 540                     ; 171   AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 542  0000 721950f0      	bres	20720,#4
 543                     ; 174   AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 545  0004 35f050f2      	mov	20722,#240
 546                     ; 175 }
 549  0008 81            	ret	
 593                     ; 183 FlagStatus AWU_GetFlagStatus(void)
 593                     ; 184 {
 594                     .text:	section	.text,new
 595  0000               _AWU_GetFlagStatus:
 599                     ; 185   return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 601  0000 720a50f002    	btjt	20720,#5,L22
 602  0005 4f            	clr	a
 604  0006 81            	ret	
 605  0007               L22:
 606  0007 a601          	ld	a,#1
 609  0009 81            	ret	
 644                     	xdef	_TBR_Array
 645                     	xdef	_APR_Array
 646                     	xdef	_AWU_GetFlagStatus
 647                     	xdef	_AWU_IdleModeEnable
 648                     	xdef	_AWU_LSICalibrationConfig
 649                     	xdef	_AWU_Cmd
 650                     	xdef	_AWU_Init
 651                     	xdef	_AWU_DeInit
 652                     	xref.b	c_lreg
 653                     	xref.b	c_x
 672                     	xref	c_imul
 673                     	xref	c_ludv
 674                     	xref	c_ltor
 675                     	end
