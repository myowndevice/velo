   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 54 void BEEP_DeInit(void)
  49                     ; 55 {
  51                     .text:	section	.text,new
  52  0000               _BEEP_DeInit:
  56                     ; 56   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  58  0000 351f50f3      	mov	20723,#31
  59                     ; 57 }
  62  0004 81            	ret	
 127                     ; 67 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 127                     ; 68 {
 128                     .text:	section	.text,new
 129  0000               _BEEP_Init:
 131  0000 88            	push	a
 132       00000000      OFST:	set	0
 135                     ; 70   assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 137                     ; 73   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 139  0001 c650f3        	ld	a,20723
 140  0004 a41f          	and	a,#31
 141  0006 a11f          	cp	a,#31
 142  0008 2610          	jrne	L15
 143                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 145  000a c650f3        	ld	a,20723
 146  000d a4e0          	and	a,#224
 147  000f c750f3        	ld	20723,a
 148                     ; 76     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 150  0012 c650f3        	ld	a,20723
 151  0015 aa0b          	or	a,#11
 152  0017 c750f3        	ld	20723,a
 153  001a               L15:
 154                     ; 80   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 156  001a c650f3        	ld	a,20723
 157  001d a43f          	and	a,#63
 158  001f c750f3        	ld	20723,a
 159                     ; 81   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 161  0022 c650f3        	ld	a,20723
 162  0025 1a01          	or	a,(OFST+1,sp)
 163  0027 c750f3        	ld	20723,a
 164                     ; 82 }
 167  002a 84            	pop	a
 168  002b 81            	ret	
 223                     ; 91 void BEEP_Cmd(FunctionalState NewState)
 223                     ; 92 {
 224                     .text:	section	.text,new
 225  0000               _BEEP_Cmd:
 229                     ; 93   if (NewState != DISABLE)
 231  0000 4d            	tnz	a
 232  0001 2705          	jreq	L101
 233                     ; 96     BEEP->CSR |= BEEP_CSR_BEEPEN;
 235  0003 721a50f3      	bset	20723,#5
 238  0007 81            	ret	
 239  0008               L101:
 240                     ; 101     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 242  0008 721b50f3      	bres	20723,#5
 243                     ; 103 }
 246  000c 81            	ret	
 299                     .const:	section	.text
 300  0000               L41:
 301  0000 000003e8      	dc.l	1000
 302                     ; 118 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 302                     ; 119 {
 303                     .text:	section	.text,new
 304  0000               _BEEP_LSICalibrationConfig:
 306  0000 5206          	subw	sp,#6
 307       00000006      OFST:	set	6
 310                     ; 124   assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 312                     ; 126   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 314  0002 96            	ldw	x,sp
 315  0003 1c0009        	addw	x,#OFST+3
 316  0006 cd0000        	call	c_ltor
 318  0009 ae0000        	ldw	x,#L41
 319  000c cd0000        	call	c_ludv
 321  000f be02          	ldw	x,c_lreg+2
 322  0011 1f03          	ldw	(OFST-3,sp),x
 324                     ; 130   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 326  0013 c650f3        	ld	a,20723
 327  0016 a4e0          	and	a,#224
 328  0018 c750f3        	ld	20723,a
 329                     ; 132   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 331  001b 54            	srlw	x
 332  001c 54            	srlw	x
 333  001d 54            	srlw	x
 334  001e 1f05          	ldw	(OFST-1,sp),x
 336                     ; 134   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 338  0020 58            	sllw	x
 339  0021 58            	sllw	x
 340  0022 58            	sllw	x
 341  0023 1f01          	ldw	(OFST-5,sp),x
 343  0025 1e03          	ldw	x,(OFST-3,sp)
 344  0027 72f001        	subw	x,(OFST-5,sp)
 345  002a 1605          	ldw	y,(OFST-1,sp)
 346  002c 9058          	sllw	y
 347  002e 905c          	incw	y
 348  0030 cd0000        	call	c_imul
 350  0033 1605          	ldw	y,(OFST-1,sp)
 351  0035 9058          	sllw	y
 352  0037 9058          	sllw	y
 353  0039 bf00          	ldw	c_x,x
 354  003b 9058          	sllw	y
 355  003d 90b300        	cpw	y,c_x
 356  0040 7b06          	ld	a,(OFST+0,sp)
 357  0042 2504          	jrult	L331
 358                     ; 136     BEEP->CSR |= (uint8_t)(A - 2U);
 360  0044 a002          	sub	a,#2
 362  0046 2001          	jra	L531
 363  0048               L331:
 364                     ; 140     BEEP->CSR |= (uint8_t)(A - 1U);
 366  0048 4a            	dec	a
 367  0049               L531:
 368  0049 ca50f3        	or	a,20723
 369  004c c750f3        	ld	20723,a
 370                     ; 142 }
 373  004f 5b06          	addw	sp,#6
 374  0051 81            	ret	
 387                     	xdef	_BEEP_LSICalibrationConfig
 388                     	xdef	_BEEP_Cmd
 389                     	xdef	_BEEP_Init
 390                     	xdef	_BEEP_DeInit
 391                     	xref.b	c_lreg
 392                     	xref.b	c_x
 411                     	xref	c_imul
 412                     	xref	c_ludv
 413                     	xref	c_ltor
 414                     	end
