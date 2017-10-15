   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 53 void EXTI_DeInit(void)
  49                     ; 54 {
  51                     .text:	section	.text,new
  52  0000               _EXTI_DeInit:
  56                     ; 55   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  58  0000 725f50a0      	clr	20640
  59                     ; 56   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  61  0004 725f50a1      	clr	20641
  62                     ; 57 }
  65  0008 81            	ret	
 190                     ; 70 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 190                     ; 71 {
 191                     .text:	section	.text,new
 192  0000               _EXTI_SetExtIntSensitivity:
 194  0000 89            	pushw	x
 195       00000000      OFST:	set	0
 198                     ; 73   assert_param(IS_EXTI_PORT_OK(Port));
 200                     ; 74   assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 202                     ; 77   switch (Port)
 204  0001 9e            	ld	a,xh
 206                     ; 99   default:
 206                     ; 100     break;
 207  0002 4d            	tnz	a
 208  0003 270e          	jreq	L12
 209  0005 4a            	dec	a
 210  0006 271a          	jreq	L32
 211  0008 4a            	dec	a
 212  0009 2725          	jreq	L52
 213  000b 4a            	dec	a
 214  000c 2731          	jreq	L72
 215  000e 4a            	dec	a
 216  000f 2745          	jreq	L13
 217  0011 2053          	jra	L311
 218  0013               L12:
 219                     ; 79   case EXTI_PORT_GPIOA:
 219                     ; 80     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 221  0013 c650a0        	ld	a,20640
 222  0016 a4fc          	and	a,#252
 223  0018 c750a0        	ld	20640,a
 224                     ; 81     EXTI->CR1 |= (uint8_t)(SensitivityValue);
 226  001b c650a0        	ld	a,20640
 227  001e 1a02          	or	a,(OFST+2,sp)
 228                     ; 82     break;
 230  0020 202f          	jp	LC001
 231  0022               L32:
 232                     ; 83   case EXTI_PORT_GPIOB:
 232                     ; 84     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 234  0022 c650a0        	ld	a,20640
 235  0025 a4f3          	and	a,#243
 236  0027 c750a0        	ld	20640,a
 237                     ; 85     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 239  002a 7b02          	ld	a,(OFST+2,sp)
 240  002c 48            	sll	a
 241  002d 48            	sll	a
 242                     ; 86     break;
 244  002e 201e          	jp	LC002
 245  0030               L52:
 246                     ; 87   case EXTI_PORT_GPIOC:
 246                     ; 88     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 248  0030 c650a0        	ld	a,20640
 249  0033 a4cf          	and	a,#207
 250  0035 c750a0        	ld	20640,a
 251                     ; 89     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 253  0038 7b02          	ld	a,(OFST+2,sp)
 254  003a 97            	ld	xl,a
 255  003b a610          	ld	a,#16
 256                     ; 90     break;
 258  003d 200d          	jp	LC003
 259  003f               L72:
 260                     ; 91   case EXTI_PORT_GPIOD:
 260                     ; 92     EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 262  003f c650a0        	ld	a,20640
 263  0042 a43f          	and	a,#63
 264  0044 c750a0        	ld	20640,a
 265                     ; 93     EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 267  0047 7b02          	ld	a,(OFST+2,sp)
 268  0049 97            	ld	xl,a
 269  004a a640          	ld	a,#64
 270  004c               LC003:
 271  004c 42            	mul	x,a
 272  004d 9f            	ld	a,xl
 273  004e               LC002:
 274  004e ca50a0        	or	a,20640
 275  0051               LC001:
 276  0051 c750a0        	ld	20640,a
 277                     ; 94     break;
 279  0054 2010          	jra	L311
 280  0056               L13:
 281                     ; 95   case EXTI_PORT_GPIOE:
 281                     ; 96     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 283  0056 c650a1        	ld	a,20641
 284  0059 a4fc          	and	a,#252
 285  005b c750a1        	ld	20641,a
 286                     ; 97     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 288  005e c650a1        	ld	a,20641
 289  0061 1a02          	or	a,(OFST+2,sp)
 290  0063 c750a1        	ld	20641,a
 291                     ; 98     break;
 293                     ; 99   default:
 293                     ; 100     break;
 295  0066               L311:
 296                     ; 102 }
 299  0066 85            	popw	x
 300  0067 81            	ret	
 358                     ; 111 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 358                     ; 112 {
 359                     .text:	section	.text,new
 360  0000               _EXTI_SetTLISensitivity:
 364                     ; 114   assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 366                     ; 117   EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 368  0000 721550a1      	bres	20641,#2
 369                     ; 118   EXTI->CR2 |= (uint8_t)(SensitivityValue);
 371  0004 ca50a1        	or	a,20641
 372  0007 c750a1        	ld	20641,a
 373                     ; 119 }
 376  000a 81            	ret	
 422                     ; 126 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 422                     ; 127 {
 423                     .text:	section	.text,new
 424  0000               _EXTI_GetExtIntSensitivity:
 426  0000 88            	push	a
 427       00000001      OFST:	set	1
 430                     ; 128   uint8_t value = 0;
 432  0001 0f01          	clr	(OFST+0,sp)
 434                     ; 131   assert_param(IS_EXTI_PORT_OK(Port));
 436                     ; 133   switch (Port)
 439                     ; 150   default:
 439                     ; 151     break;
 440  0003 4d            	tnz	a
 441  0004 2710          	jreq	L341
 442  0006 4a            	dec	a
 443  0007 2712          	jreq	L541
 444  0009 4a            	dec	a
 445  000a 2718          	jreq	L741
 446  000c 4a            	dec	a
 447  000d 271b          	jreq	L151
 448  000f 4a            	dec	a
 449  0010 2722          	jreq	L351
 450  0012 7b01          	ld	a,(OFST+0,sp)
 451  0014 2023          	jra	LC004
 452  0016               L341:
 453                     ; 135   case EXTI_PORT_GPIOA:
 453                     ; 136     value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 455  0016 c650a0        	ld	a,20640
 456                     ; 137     break;
 458  0019 201c          	jp	LC005
 459  001b               L541:
 460                     ; 138   case EXTI_PORT_GPIOB:
 460                     ; 139     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 462  001b c650a0        	ld	a,20640
 463  001e a40c          	and	a,#12
 464  0020 44            	srl	a
 465  0021 44            	srl	a
 466                     ; 140     break;
 468  0022 2015          	jp	LC004
 469  0024               L741:
 470                     ; 141   case EXTI_PORT_GPIOC:
 470                     ; 142     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 472  0024 c650a0        	ld	a,20640
 473  0027 4e            	swap	a
 474                     ; 143     break;
 476  0028 200d          	jp	LC005
 477  002a               L151:
 478                     ; 144   case EXTI_PORT_GPIOD:
 478                     ; 145     value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 480  002a c650a0        	ld	a,20640
 481  002d 4e            	swap	a
 482  002e a40c          	and	a,#12
 483  0030 44            	srl	a
 484  0031 44            	srl	a
 485                     ; 146     break;
 487  0032 2003          	jp	LC005
 488  0034               L351:
 489                     ; 147   case EXTI_PORT_GPIOE:
 489                     ; 148     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 491  0034 c650a1        	ld	a,20641
 492  0037               LC005:
 493  0037 a403          	and	a,#3
 494  0039               LC004:
 496                     ; 149     break;
 498                     ; 150   default:
 498                     ; 151     break;
 500                     ; 154   return((EXTI_Sensitivity_TypeDef)value);
 504  0039 5b01          	addw	sp,#1
 505  003b 81            	ret	
 541                     ; 162 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 541                     ; 163 {
 542                     .text:	section	.text,new
 543  0000               _EXTI_GetTLISensitivity:
 545  0000 88            	push	a
 546       00000001      OFST:	set	1
 549                     ; 164   uint8_t value = 0;
 551                     ; 167   value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 553  0001 c650a1        	ld	a,20641
 554  0004 a404          	and	a,#4
 556                     ; 169   return((EXTI_TLISensitivity_TypeDef)value);
 560  0006 5b01          	addw	sp,#1
 561  0008 81            	ret	
 574                     	xdef	_EXTI_GetTLISensitivity
 575                     	xdef	_EXTI_GetExtIntSensitivity
 576                     	xdef	_EXTI_SetTLISensitivity
 577                     	xdef	_EXTI_SetExtIntSensitivity
 578                     	xdef	_EXTI_DeInit
 597                     	end
