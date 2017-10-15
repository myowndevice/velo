   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 50 uint8_t ITC_GetCPUCC(void)
  49                     ; 51 {
  51                     .text:	section	.text,new
  52  0000               _ITC_GetCPUCC:
  56                     ; 53   _asm("push cc");
  59  0000 8a            	push	cc
  61                     ; 54   _asm("pop a");
  64  0001 84            	pop	a
  66                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  69  0002 81            	ret	
  92                     ; 80 void ITC_DeInit(void)
  92                     ; 81 {
  93                     .text:	section	.text,new
  94  0000               _ITC_DeInit:
  98                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
 100  0000 35ff7f70      	mov	32624,#255
 101                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 103  0004 35ff7f71      	mov	32625,#255
 104                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 106  0008 35ff7f72      	mov	32626,#255
 107                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 109  000c 35ff7f73      	mov	32627,#255
 110                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 112  0010 35ff7f74      	mov	32628,#255
 113                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 115  0014 35ff7f75      	mov	32629,#255
 116                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 118  0018 35ff7f76      	mov	32630,#255
 119                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 121  001c 35ff7f77      	mov	32631,#255
 122                     ; 90 }
 125  0020 81            	ret	
 150                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 150                     ; 98 {
 151                     .text:	section	.text,new
 152  0000               _ITC_GetSoftIntStatus:
 156                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 158  0000 cd0000        	call	_ITC_GetCPUCC
 160  0003 a428          	and	a,#40
 163  0005 81            	ret	
 412                     .const:	section	.text
 413  0000               L42:
 414  0000 0021          	dc.w	L14
 415  0002 0021          	dc.w	L14
 416  0004 0021          	dc.w	L14
 417  0006 0021          	dc.w	L14
 418  0008 0026          	dc.w	L34
 419  000a 0026          	dc.w	L34
 420  000c 0026          	dc.w	L34
 421  000e 0026          	dc.w	L34
 422  0010 0046          	dc.w	L302
 423  0012 0046          	dc.w	L302
 424  0014 002b          	dc.w	L54
 425  0016 002b          	dc.w	L54
 426  0018 0030          	dc.w	L74
 427  001a 0030          	dc.w	L74
 428  001c 0030          	dc.w	L74
 429  001e 0030          	dc.w	L74
 430  0020 0035          	dc.w	L15
 431  0022 0035          	dc.w	L15
 432  0024 0035          	dc.w	L15
 433  0026 0035          	dc.w	L15
 434  0028 0046          	dc.w	L302
 435  002a 0046          	dc.w	L302
 436  002c 003a          	dc.w	L35
 437  002e 003a          	dc.w	L35
 438  0030 003f          	dc.w	L55
 439                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 439                     ; 108 {
 440                     .text:	section	.text,new
 441  0000               _ITC_GetSoftwarePriority:
 443  0000 88            	push	a
 444  0001 89            	pushw	x
 445       00000002      OFST:	set	2
 448                     ; 109   uint8_t Value = 0;
 450  0002 0f02          	clr	(OFST+0,sp)
 452                     ; 110   uint8_t Mask = 0;
 454                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 456                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 458  0004 a403          	and	a,#3
 459  0006 48            	sll	a
 460  0007 5f            	clrw	x
 461  0008 97            	ld	xl,a
 462  0009 a603          	ld	a,#3
 463  000b 5d            	tnzw	x
 464  000c 2704          	jreq	L61
 465  000e               L02:
 466  000e 48            	sll	a
 467  000f 5a            	decw	x
 468  0010 26fc          	jrne	L02
 469  0012               L61:
 470  0012 6b01          	ld	(OFST-1,sp),a
 472                     ; 118   switch (IrqNum)
 474  0014 7b03          	ld	a,(OFST+1,sp)
 476                     ; 198   default:
 476                     ; 199     break;
 477  0016 a119          	cp	a,#25
 478  0018 242c          	jruge	L302
 479  001a 5f            	clrw	x
 480  001b 97            	ld	xl,a
 481  001c 58            	sllw	x
 482  001d de0000        	ldw	x,(L42,x)
 483  0020 fc            	jp	(x)
 484  0021               L14:
 485                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 485                     ; 121   case ITC_IRQ_AWU:
 485                     ; 122   case ITC_IRQ_CLK:
 485                     ; 123   case ITC_IRQ_PORTA:
 485                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 487  0021 c67f70        	ld	a,32624
 488                     ; 125     break;
 490  0024 201c          	jp	LC001
 491  0026               L34:
 492                     ; 127   case ITC_IRQ_PORTB:
 492                     ; 128   case ITC_IRQ_PORTC:
 492                     ; 129   case ITC_IRQ_PORTD:
 492                     ; 130   case ITC_IRQ_PORTE:
 492                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 494  0026 c67f71        	ld	a,32625
 495                     ; 132     break;
 497  0029 2017          	jp	LC001
 498  002b               L54:
 499                     ; 141   case ITC_IRQ_SPI:
 499                     ; 142   case ITC_IRQ_TIM1_OVF:
 499                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 501  002b c67f72        	ld	a,32626
 502                     ; 144     break;
 504  002e 2012          	jp	LC001
 505  0030               L74:
 506                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 506                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 506                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 506                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 506                     ; 150 #else
 506                     ; 151   case ITC_IRQ_TIM2_OVF:
 506                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 506                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 506                     ; 154   case ITC_IRQ_TIM3_OVF:
 506                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 508  0030 c67f73        	ld	a,32627
 509                     ; 156     break;
 511  0033 200d          	jp	LC001
 512  0035               L15:
 513                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 513                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 513                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 513                     ; 161   case ITC_IRQ_UART1_TX:
 513                     ; 162   case ITC_IRQ_UART1_RX:
 513                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 513                     ; 164 #if defined(STM8AF622x)
 513                     ; 165   case ITC_IRQ_UART4_TX:
 513                     ; 166   case ITC_IRQ_UART4_RX:
 513                     ; 167 #endif /*STM8AF622x */
 513                     ; 168   case ITC_IRQ_I2C:
 513                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 515  0035 c67f74        	ld	a,32628
 516                     ; 170     break;
 518  0038 2008          	jp	LC001
 519  003a               L35:
 520                     ; 184   case ITC_IRQ_ADC1:
 520                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 520                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 520                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 520                     ; 188 #else
 520                     ; 189   case ITC_IRQ_TIM4_OVF:
 520                     ; 190 #endif /*STM8S903 or STM8AF622x */
 520                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 522  003a c67f75        	ld	a,32629
 523                     ; 192     break;
 525  003d 2003          	jp	LC001
 526  003f               L55:
 527                     ; 194   case ITC_IRQ_EEPROM_EEC:
 527                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 529  003f c67f76        	ld	a,32630
 530  0042               LC001:
 531  0042 1401          	and	a,(OFST-1,sp)
 532  0044 6b02          	ld	(OFST+0,sp),a
 534                     ; 196     break;
 536                     ; 198   default:
 536                     ; 199     break;
 538  0046               L302:
 539                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 541  0046 7b03          	ld	a,(OFST+1,sp)
 542  0048 a403          	and	a,#3
 543  004a 48            	sll	a
 544  004b 5f            	clrw	x
 545  004c 97            	ld	xl,a
 546  004d 7b02          	ld	a,(OFST+0,sp)
 547  004f 5d            	tnzw	x
 548  0050 2704          	jreq	L62
 549  0052               L03:
 550  0052 44            	srl	a
 551  0053 5a            	decw	x
 552  0054 26fc          	jrne	L03
 553  0056               L62:
 555                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 559  0056 5b03          	addw	sp,#3
 560  0058 81            	ret	
 624                     	switch	.const
 625  0032               L64:
 626  0032 0036          	dc.w	L502
 627  0034 0036          	dc.w	L502
 628  0036 0036          	dc.w	L502
 629  0038 0036          	dc.w	L502
 630  003a 0048          	dc.w	L702
 631  003c 0048          	dc.w	L702
 632  003e 0048          	dc.w	L702
 633  0040 0048          	dc.w	L702
 634  0042 00b2          	dc.w	L162
 635  0044 00b2          	dc.w	L162
 636  0046 005a          	dc.w	L112
 637  0048 005a          	dc.w	L112
 638  004a 006c          	dc.w	L312
 639  004c 006c          	dc.w	L312
 640  004e 006c          	dc.w	L312
 641  0050 006c          	dc.w	L312
 642  0052 007e          	dc.w	L512
 643  0054 007e          	dc.w	L512
 644  0056 007e          	dc.w	L512
 645  0058 007e          	dc.w	L512
 646  005a 00b2          	dc.w	L162
 647  005c 00b2          	dc.w	L162
 648  005e 0090          	dc.w	L712
 649  0060 0090          	dc.w	L712
 650  0062 00a2          	dc.w	L122
 651                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 651                     ; 221 {
 652                     .text:	section	.text,new
 653  0000               _ITC_SetSoftwarePriority:
 655  0000 89            	pushw	x
 656  0001 89            	pushw	x
 657       00000002      OFST:	set	2
 660                     ; 222   uint8_t Mask = 0;
 662                     ; 223   uint8_t NewPriority = 0;
 664                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 666                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 668                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 670                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 672  0002 9e            	ld	a,xh
 673  0003 a403          	and	a,#3
 674  0005 48            	sll	a
 675  0006 5f            	clrw	x
 676  0007 97            	ld	xl,a
 677  0008 a603          	ld	a,#3
 678  000a 5d            	tnzw	x
 679  000b 2704          	jreq	L43
 680  000d               L63:
 681  000d 48            	sll	a
 682  000e 5a            	decw	x
 683  000f 26fc          	jrne	L63
 684  0011               L43:
 685  0011 43            	cpl	a
 686  0012 6b01          	ld	(OFST-1,sp),a
 688                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 690  0014 7b03          	ld	a,(OFST+1,sp)
 691  0016 a403          	and	a,#3
 692  0018 48            	sll	a
 693  0019 5f            	clrw	x
 694  001a 97            	ld	xl,a
 695  001b 7b04          	ld	a,(OFST+2,sp)
 696  001d 5d            	tnzw	x
 697  001e 2704          	jreq	L04
 698  0020               L24:
 699  0020 48            	sll	a
 700  0021 5a            	decw	x
 701  0022 26fc          	jrne	L24
 702  0024               L04:
 703  0024 6b02          	ld	(OFST+0,sp),a
 705                     ; 239   switch (IrqNum)
 707  0026 7b03          	ld	a,(OFST+1,sp)
 709                     ; 329   default:
 709                     ; 330     break;
 710  0028 a119          	cp	a,#25
 711  002a 2503cc00b2    	jruge	L162
 712  002f 5f            	clrw	x
 713  0030 97            	ld	xl,a
 714  0031 58            	sllw	x
 715  0032 de0032        	ldw	x,(L64,x)
 716  0035 fc            	jp	(x)
 717  0036               L502:
 718                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 718                     ; 242   case ITC_IRQ_AWU:
 718                     ; 243   case ITC_IRQ_CLK:
 718                     ; 244   case ITC_IRQ_PORTA:
 718                     ; 245     ITC->ISPR1 &= Mask;
 720  0036 c67f70        	ld	a,32624
 721  0039 1401          	and	a,(OFST-1,sp)
 722  003b c77f70        	ld	32624,a
 723                     ; 246     ITC->ISPR1 |= NewPriority;
 725  003e c67f70        	ld	a,32624
 726  0041 1a02          	or	a,(OFST+0,sp)
 727  0043 c77f70        	ld	32624,a
 728                     ; 247     break;
 730  0046 206a          	jra	L162
 731  0048               L702:
 732                     ; 249   case ITC_IRQ_PORTB:
 732                     ; 250   case ITC_IRQ_PORTC:
 732                     ; 251   case ITC_IRQ_PORTD:
 732                     ; 252   case ITC_IRQ_PORTE:
 732                     ; 253     ITC->ISPR2 &= Mask;
 734  0048 c67f71        	ld	a,32625
 735  004b 1401          	and	a,(OFST-1,sp)
 736  004d c77f71        	ld	32625,a
 737                     ; 254     ITC->ISPR2 |= NewPriority;
 739  0050 c67f71        	ld	a,32625
 740  0053 1a02          	or	a,(OFST+0,sp)
 741  0055 c77f71        	ld	32625,a
 742                     ; 255     break;
 744  0058 2058          	jra	L162
 745  005a               L112:
 746                     ; 264   case ITC_IRQ_SPI:
 746                     ; 265   case ITC_IRQ_TIM1_OVF:
 746                     ; 266     ITC->ISPR3 &= Mask;
 748  005a c67f72        	ld	a,32626
 749  005d 1401          	and	a,(OFST-1,sp)
 750  005f c77f72        	ld	32626,a
 751                     ; 267     ITC->ISPR3 |= NewPriority;
 753  0062 c67f72        	ld	a,32626
 754  0065 1a02          	or	a,(OFST+0,sp)
 755  0067 c77f72        	ld	32626,a
 756                     ; 268     break;
 758  006a 2046          	jra	L162
 759  006c               L312:
 760                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 760                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 760                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 760                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 760                     ; 274 #else
 760                     ; 275   case ITC_IRQ_TIM2_OVF:
 760                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 760                     ; 277 #endif /*STM8S903 or STM8AF622x */
 760                     ; 278   case ITC_IRQ_TIM3_OVF:
 760                     ; 279     ITC->ISPR4 &= Mask;
 762  006c c67f73        	ld	a,32627
 763  006f 1401          	and	a,(OFST-1,sp)
 764  0071 c77f73        	ld	32627,a
 765                     ; 280     ITC->ISPR4 |= NewPriority;
 767  0074 c67f73        	ld	a,32627
 768  0077 1a02          	or	a,(OFST+0,sp)
 769  0079 c77f73        	ld	32627,a
 770                     ; 281     break;
 772  007c 2034          	jra	L162
 773  007e               L512:
 774                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 774                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 774                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 774                     ; 286   case ITC_IRQ_UART1_TX:
 774                     ; 287   case ITC_IRQ_UART1_RX:
 774                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 774                     ; 289 #if defined(STM8AF622x)
 774                     ; 290   case ITC_IRQ_UART4_TX:
 774                     ; 291   case ITC_IRQ_UART4_RX:
 774                     ; 292 #endif /*STM8AF622x */
 774                     ; 293   case ITC_IRQ_I2C:
 774                     ; 294     ITC->ISPR5 &= Mask;
 776  007e c67f74        	ld	a,32628
 777  0081 1401          	and	a,(OFST-1,sp)
 778  0083 c77f74        	ld	32628,a
 779                     ; 295     ITC->ISPR5 |= NewPriority;
 781  0086 c67f74        	ld	a,32628
 782  0089 1a02          	or	a,(OFST+0,sp)
 783  008b c77f74        	ld	32628,a
 784                     ; 296     break;
 786  008e 2022          	jra	L162
 787  0090               L712:
 788                     ; 312   case ITC_IRQ_ADC1:
 788                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 788                     ; 314     
 788                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 788                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 788                     ; 317 #else
 788                     ; 318   case ITC_IRQ_TIM4_OVF:
 788                     ; 319 #endif /* STM8S903 or STM8AF622x */
 788                     ; 320     ITC->ISPR6 &= Mask;
 790  0090 c67f75        	ld	a,32629
 791  0093 1401          	and	a,(OFST-1,sp)
 792  0095 c77f75        	ld	32629,a
 793                     ; 321     ITC->ISPR6 |= NewPriority;
 795  0098 c67f75        	ld	a,32629
 796  009b 1a02          	or	a,(OFST+0,sp)
 797  009d c77f75        	ld	32629,a
 798                     ; 322     break;
 800  00a0 2010          	jra	L162
 801  00a2               L122:
 802                     ; 324   case ITC_IRQ_EEPROM_EEC:
 802                     ; 325     ITC->ISPR7 &= Mask;
 804  00a2 c67f76        	ld	a,32630
 805  00a5 1401          	and	a,(OFST-1,sp)
 806  00a7 c77f76        	ld	32630,a
 807                     ; 326     ITC->ISPR7 |= NewPriority;
 809  00aa c67f76        	ld	a,32630
 810  00ad 1a02          	or	a,(OFST+0,sp)
 811  00af c77f76        	ld	32630,a
 812                     ; 327     break;
 814                     ; 329   default:
 814                     ; 330     break;
 816  00b2               L162:
 817                     ; 332 }
 820  00b2 5b04          	addw	sp,#4
 821  00b4 81            	ret	
 834                     	xdef	_ITC_GetSoftwarePriority
 835                     	xdef	_ITC_SetSoftwarePriority
 836                     	xdef	_ITC_GetSoftIntStatus
 837                     	xdef	_ITC_DeInit
 838                     	xdef	_ITC_GetCPUCC
 857                     	end
