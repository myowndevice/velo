   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 67 void I2C_DeInit(void)
  49                     ; 68 {
  51                     .text:	section	.text,new
  52  0000               _I2C_DeInit:
  56                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  58  0000 725f5210      	clr	21008
  59                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  61  0004 725f5211      	clr	21009
  62                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  64  0008 725f5212      	clr	21010
  65                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  67  000c 725f5213      	clr	21011
  68                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  70  0010 725f5214      	clr	21012
  71                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  73  0014 725f521a      	clr	21018
  74                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  76  0018 725f521b      	clr	21019
  77                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  79  001c 725f521c      	clr	21020
  80                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  82  0020 3502521d      	mov	21021,#2
  83                     ; 78 }
  86  0024 81            	ret	
 265                     .const:	section	.text
 266  0000               L01:
 267  0000 000186a1      	dc.l	100001
 268  0004               L21:
 269  0004 000f4240      	dc.l	1000000
 270                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 270                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 270                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 270                     ; 99 {
 271                     .text:	section	.text,new
 272  0000               _I2C_Init:
 274  0000 5209          	subw	sp,#9
 275       00000009      OFST:	set	9
 278                     ; 100   uint16_t result = 0x0004;
 280                     ; 101   uint16_t tmpval = 0;
 282                     ; 102   uint8_t tmpccrh = 0;
 284  0002 0f07          	clr	(OFST-2,sp)
 286                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 288                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 290                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 292                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 294                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 296                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 298                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 300  0004 c65212        	ld	a,21010
 301  0007 a4c0          	and	a,#192
 302  0009 c75212        	ld	21010,a
 303                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 305  000c c65212        	ld	a,21010
 306  000f 1a15          	or	a,(OFST+12,sp)
 307  0011 c75212        	ld	21010,a
 308                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 310  0014 72115210      	bres	21008,#0
 311                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 313  0018 c6521c        	ld	a,21020
 314  001b a430          	and	a,#48
 315  001d c7521c        	ld	21020,a
 316                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 318  0020 725f521b      	clr	21019
 319                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 321  0024 96            	ldw	x,sp
 322  0025 1c000c        	addw	x,#OFST+3
 323  0028 cd0000        	call	c_ltor
 325  002b ae0000        	ldw	x,#L01
 326  002e cd0000        	call	c_lcmp
 328  0031 2560          	jrult	L131
 329                     ; 131     tmpccrh = I2C_CCRH_FS;
 331  0033 a680          	ld	a,#128
 332  0035 6b07          	ld	(OFST-2,sp),a
 334                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 336  0037 96            	ldw	x,sp
 337  0038 0d12          	tnz	(OFST+9,sp)
 338  003a 261d          	jrne	L331
 339                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 341  003c 1c000c        	addw	x,#OFST+3
 342  003f cd0000        	call	c_ltor
 344  0042 a603          	ld	a,#3
 345  0044 cd0000        	call	c_smul
 347  0047 96            	ldw	x,sp
 348  0048 5c            	incw	x
 349  0049 cd0000        	call	c_rtol
 352  004c 7b15          	ld	a,(OFST+12,sp)
 353  004e cd00f1        	call	LC001
 355  0051 96            	ldw	x,sp
 356  0052 cd00ff        	call	LC002
 357  0055 1f08          	ldw	(OFST-1,sp),x
 360  0057 2021          	jra	L531
 361  0059               L331:
 362                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 364  0059 1c000c        	addw	x,#OFST+3
 365  005c cd0000        	call	c_ltor
 367  005f a619          	ld	a,#25
 368  0061 cd0000        	call	c_smul
 370  0064 96            	ldw	x,sp
 371  0065 5c            	incw	x
 372  0066 cd0000        	call	c_rtol
 375  0069 7b15          	ld	a,(OFST+12,sp)
 376  006b cd00f1        	call	LC001
 378  006e 96            	ldw	x,sp
 379  006f cd00ff        	call	LC002
 380  0072 1f08          	ldw	(OFST-1,sp),x
 382                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 384  0074 7b07          	ld	a,(OFST-2,sp)
 385  0076 aa40          	or	a,#64
 386  0078 6b07          	ld	(OFST-2,sp),a
 388  007a               L531:
 389                     ; 147     if (result < (uint16_t)0x01)
 391  007a 1e08          	ldw	x,(OFST-1,sp)
 392  007c 2603          	jrne	L731
 393                     ; 150       result = (uint16_t)0x0001;
 395  007e 5c            	incw	x
 396  007f 1f08          	ldw	(OFST-1,sp),x
 398  0081               L731:
 399                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 401  0081 7b15          	ld	a,(OFST+12,sp)
 402  0083 97            	ld	xl,a
 403  0084 a603          	ld	a,#3
 404  0086 42            	mul	x,a
 405  0087 a60a          	ld	a,#10
 406  0089 cd0000        	call	c_sdivx
 408  008c 5c            	incw	x
 409  008d 1f05          	ldw	(OFST-4,sp),x
 411                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 413  008f 7b06          	ld	a,(OFST-3,sp)
 415  0091 2028          	jra	L141
 416  0093               L131:
 417                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 419  0093 96            	ldw	x,sp
 420  0094 1c000c        	addw	x,#OFST+3
 421  0097 cd0000        	call	c_ltor
 423  009a 3803          	sll	c_lreg+3
 424  009c 3902          	rlc	c_lreg+2
 425  009e 3901          	rlc	c_lreg+1
 426  00a0 96            	ldw	x,sp
 427  00a1 3900          	rlc	c_lreg
 428  00a3 5c            	incw	x
 429  00a4 cd0000        	call	c_rtol
 432  00a7 7b15          	ld	a,(OFST+12,sp)
 433  00a9 ad46          	call	LC001
 435  00ab 96            	ldw	x,sp
 436  00ac ad51          	call	LC002
 438                     ; 167     if (result < (uint16_t)0x0004)
 440  00ae a30004        	cpw	x,#4
 441  00b1 2403          	jruge	L341
 442                     ; 170       result = (uint16_t)0x0004;
 444  00b3 ae0004        	ldw	x,#4
 446  00b6               L341:
 447  00b6 1f08          	ldw	(OFST-1,sp),x
 448                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 450  00b8 7b15          	ld	a,(OFST+12,sp)
 451  00ba 4c            	inc	a
 452  00bb               L141:
 453  00bb c7521d        	ld	21021,a
 454                     ; 181   I2C->CCRL = (uint8_t)result;
 456  00be 7b09          	ld	a,(OFST+0,sp)
 457  00c0 c7521b        	ld	21019,a
 458                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 460  00c3 7b08          	ld	a,(OFST-1,sp)
 461  00c5 a40f          	and	a,#15
 462  00c7 1a07          	or	a,(OFST-2,sp)
 463  00c9 c7521c        	ld	21020,a
 464                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 466  00cc 72105210      	bset	21008,#0
 467                     ; 188   I2C_AcknowledgeConfig(Ack);
 469  00d0 7b13          	ld	a,(OFST+10,sp)
 470  00d2 cd0000        	call	_I2C_AcknowledgeConfig
 472                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 474  00d5 7b11          	ld	a,(OFST+8,sp)
 475  00d7 c75213        	ld	21011,a
 476                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 476                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 478  00da 1e10          	ldw	x,(OFST+7,sp)
 479  00dc 4f            	clr	a
 480  00dd 01            	rrwa	x,a
 481  00de 48            	sll	a
 482  00df 01            	rrwa	x,a
 483  00e0 49            	rlc	a
 484  00e1 a406          	and	a,#6
 485  00e3 6b04          	ld	(OFST-5,sp),a
 487  00e5 7b14          	ld	a,(OFST+11,sp)
 488  00e7 aa40          	or	a,#64
 489  00e9 1a04          	or	a,(OFST-5,sp)
 490  00eb c75214        	ld	21012,a
 491                     ; 194 }
 494  00ee 5b09          	addw	sp,#9
 495  00f0 81            	ret	
 496  00f1               LC001:
 497  00f1 b703          	ld	c_lreg+3,a
 498  00f3 3f02          	clr	c_lreg+2
 499  00f5 3f01          	clr	c_lreg+1
 500  00f7 3f00          	clr	c_lreg
 501  00f9 ae0004        	ldw	x,#L21
 502  00fc cc0000        	jp	c_lmul
 503  00ff               LC002:
 504  00ff 5c            	incw	x
 505  0100 cd0000        	call	c_ludv
 507  0103 be02          	ldw	x,c_lreg+2
 508  0105 81            	ret	
 563                     ; 202 void I2C_Cmd(FunctionalState NewState)
 563                     ; 203 {
 564                     .text:	section	.text,new
 565  0000               _I2C_Cmd:
 569                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 571                     ; 207   if (NewState != DISABLE)
 573  0000 4d            	tnz	a
 574  0001 2705          	jreq	L371
 575                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 577  0003 72105210      	bset	21008,#0
 580  0007 81            	ret	
 581  0008               L371:
 582                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 584  0008 72115210      	bres	21008,#0
 585                     ; 217 }
 588  000c 81            	ret	
 623                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 623                     ; 226 {
 624                     .text:	section	.text,new
 625  0000               _I2C_GeneralCallCmd:
 629                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 631                     ; 230   if (NewState != DISABLE)
 633  0000 4d            	tnz	a
 634  0001 2705          	jreq	L512
 635                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 637  0003 721c5210      	bset	21008,#6
 640  0007 81            	ret	
 641  0008               L512:
 642                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 644  0008 721d5210      	bres	21008,#6
 645                     ; 240 }
 648  000c 81            	ret	
 683                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 683                     ; 251 {
 684                     .text:	section	.text,new
 685  0000               _I2C_GenerateSTART:
 689                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 691                     ; 255   if (NewState != DISABLE)
 693  0000 4d            	tnz	a
 694  0001 2705          	jreq	L732
 695                     ; 258     I2C->CR2 |= I2C_CR2_START;
 697  0003 72105211      	bset	21009,#0
 700  0007 81            	ret	
 701  0008               L732:
 702                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 704  0008 72115211      	bres	21009,#0
 705                     ; 265 }
 708  000c 81            	ret	
 743                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 743                     ; 274 {
 744                     .text:	section	.text,new
 745  0000               _I2C_GenerateSTOP:
 749                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 751                     ; 278   if (NewState != DISABLE)
 753  0000 4d            	tnz	a
 754  0001 2705          	jreq	L162
 755                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 757  0003 72125211      	bset	21009,#1
 760  0007 81            	ret	
 761  0008               L162:
 762                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 764  0008 72135211      	bres	21009,#1
 765                     ; 288 }
 768  000c 81            	ret	
 804                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
 804                     ; 297 {
 805                     .text:	section	.text,new
 806  0000               _I2C_SoftwareResetCmd:
 810                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 812                     ; 301   if (NewState != DISABLE)
 814  0000 4d            	tnz	a
 815  0001 2705          	jreq	L303
 816                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
 818  0003 721e5211      	bset	21009,#7
 821  0007 81            	ret	
 822  0008               L303:
 823                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 825  0008 721f5211      	bres	21009,#7
 826                     ; 311 }
 829  000c 81            	ret	
 865                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
 865                     ; 321 {
 866                     .text:	section	.text,new
 867  0000               _I2C_StretchClockCmd:
 871                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 873                     ; 325   if (NewState != DISABLE)
 875  0000 4d            	tnz	a
 876  0001 2705          	jreq	L523
 877                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 879  0003 721f5210      	bres	21008,#7
 882  0007 81            	ret	
 883  0008               L523:
 884                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 886  0008 721e5210      	bset	21008,#7
 887                     ; 336 }
 890  000c 81            	ret	
 926                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 926                     ; 346 {
 927                     .text:	section	.text,new
 928  0000               _I2C_AcknowledgeConfig:
 930  0000 88            	push	a
 931       00000000      OFST:	set	0
 934                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
 936                     ; 350   if (Ack == I2C_ACK_NONE)
 938  0001 4d            	tnz	a
 939  0002 2606          	jrne	L743
 940                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 942  0004 72155211      	bres	21009,#2
 944  0008 2011          	jra	L153
 945  000a               L743:
 946                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
 948  000a 72145211      	bset	21009,#2
 949                     ; 360     if (Ack == I2C_ACK_CURR)
 951  000e 4a            	dec	a
 952  000f 2606          	jrne	L353
 953                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 955  0011 72175211      	bres	21009,#3
 957  0015 2004          	jra	L153
 958  0017               L353:
 959                     ; 368       I2C->CR2 |= I2C_CR2_POS;
 961  0017 72165211      	bset	21009,#3
 962  001b               L153:
 963                     ; 371 }
 966  001b 84            	pop	a
 967  001c 81            	ret	
1039                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1039                     ; 382 {
1040                     .text:	section	.text,new
1041  0000               _I2C_ITConfig:
1043  0000 89            	pushw	x
1044       00000000      OFST:	set	0
1047                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1049                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1051                     ; 387   if (NewState != DISABLE)
1053  0001 9f            	ld	a,xl
1054  0002 4d            	tnz	a
1055  0003 2706          	jreq	L314
1056                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1058  0005 9e            	ld	a,xh
1059  0006 ca521a        	or	a,21018
1061  0009 2006          	jra	L514
1062  000b               L314:
1063                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1065  000b 7b01          	ld	a,(OFST+1,sp)
1066  000d 43            	cpl	a
1067  000e c4521a        	and	a,21018
1068  0011               L514:
1069  0011 c7521a        	ld	21018,a
1070                     ; 397 }
1073  0014 85            	popw	x
1074  0015 81            	ret	
1110                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1110                     ; 406 {
1111                     .text:	section	.text,new
1112  0000               _I2C_FastModeDutyCycleConfig:
1116                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1118                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1120  0000 a140          	cp	a,#64
1121  0002 2605          	jrne	L534
1122                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1124  0004 721c521c      	bset	21020,#6
1127  0008 81            	ret	
1128  0009               L534:
1129                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1131  0009 721d521c      	bres	21020,#6
1132                     ; 420 }
1135  000d 81            	ret	
1158                     ; 427 uint8_t I2C_ReceiveData(void)
1158                     ; 428 {
1159                     .text:	section	.text,new
1160  0000               _I2C_ReceiveData:
1164                     ; 430   return ((uint8_t)I2C->DR);
1166  0000 c65216        	ld	a,21014
1169  0003 81            	ret	
1234                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1234                     ; 441 {
1235                     .text:	section	.text,new
1236  0000               _I2C_Send7bitAddress:
1238  0000 89            	pushw	x
1239       00000000      OFST:	set	0
1242                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1244                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1246                     ; 447   Address &= (uint8_t)0xFE;
1248  0001 7b01          	ld	a,(OFST+1,sp)
1249  0003 a4fe          	and	a,#254
1250  0005 6b01          	ld	(OFST+1,sp),a
1251                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1253  0007 1a02          	or	a,(OFST+2,sp)
1254  0009 c75216        	ld	21014,a
1255                     ; 451 }
1258  000c 85            	popw	x
1259  000d 81            	ret	
1293                     ; 458 void I2C_SendData(uint8_t Data)
1293                     ; 459 {
1294                     .text:	section	.text,new
1295  0000               _I2C_SendData:
1299                     ; 461   I2C->DR = Data;
1301  0000 c75216        	ld	21014,a
1302                     ; 462 }
1305  0003 81            	ret	
1529                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1529                     ; 579 {
1530                     .text:	section	.text,new
1531  0000               _I2C_CheckEvent:
1533  0000 89            	pushw	x
1534  0001 5206          	subw	sp,#6
1535       00000006      OFST:	set	6
1538                     ; 580   __IO uint16_t lastevent = 0x00;
1540  0003 5f            	clrw	x
1541  0004 1f04          	ldw	(OFST-2,sp),x
1543                     ; 581   uint8_t flag1 = 0x00 ;
1545                     ; 582   uint8_t flag2 = 0x00;
1547                     ; 583   ErrorStatus status = ERROR;
1549                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1551                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1553  0006 1e07          	ldw	x,(OFST+1,sp)
1554  0008 a30004        	cpw	x,#4
1555  000b 2609          	jrne	L136
1556                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
1558  000d c65218        	ld	a,21016
1559  0010 a404          	and	a,#4
1560  0012 5f            	clrw	x
1561  0013 97            	ld	xl,a
1563  0014 201a          	jra	L336
1564  0016               L136:
1565                     ; 594     flag1 = I2C->SR1;
1567  0016 c65217        	ld	a,21015
1568  0019 6b03          	ld	(OFST-3,sp),a
1570                     ; 595     flag2 = I2C->SR3;
1572  001b c65219        	ld	a,21017
1573  001e 6b06          	ld	(OFST+0,sp),a
1575                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1577  0020 5f            	clrw	x
1578  0021 7b03          	ld	a,(OFST-3,sp)
1579  0023 97            	ld	xl,a
1580  0024 1f01          	ldw	(OFST-5,sp),x
1582  0026 5f            	clrw	x
1583  0027 7b06          	ld	a,(OFST+0,sp)
1584  0029 97            	ld	xl,a
1585  002a 7b02          	ld	a,(OFST-4,sp)
1586  002c 01            	rrwa	x,a
1587  002d 1a01          	or	a,(OFST-5,sp)
1588  002f 01            	rrwa	x,a
1589  0030               L336:
1590  0030 1f04          	ldw	(OFST-2,sp),x
1592                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1594  0032 1e04          	ldw	x,(OFST-2,sp)
1595  0034 01            	rrwa	x,a
1596  0035 1408          	and	a,(OFST+2,sp)
1597  0037 01            	rrwa	x,a
1598  0038 1407          	and	a,(OFST+1,sp)
1599  003a 01            	rrwa	x,a
1600  003b 1307          	cpw	x,(OFST+1,sp)
1601  003d 2604          	jrne	L536
1602                     ; 602     status = SUCCESS;
1604  003f a601          	ld	a,#1
1607  0041 2001          	jra	L736
1608  0043               L536:
1609                     ; 607     status = ERROR;
1611  0043 4f            	clr	a
1613  0044               L736:
1614                     ; 611   return status;
1618  0044 5b08          	addw	sp,#8
1619  0046 81            	ret	
1672                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
1672                     ; 629 {
1673                     .text:	section	.text,new
1674  0000               _I2C_GetLastEvent:
1676  0000 5206          	subw	sp,#6
1677       00000006      OFST:	set	6
1680                     ; 630   __IO uint16_t lastevent = 0;
1682  0002 5f            	clrw	x
1683  0003 1f05          	ldw	(OFST-1,sp),x
1685                     ; 631   uint16_t flag1 = 0;
1687                     ; 632   uint16_t flag2 = 0;
1689                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1691  0005 7205521805    	btjf	21016,#2,L766
1692                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1694  000a ae0004        	ldw	x,#4
1696  000d 2013          	jra	L176
1697  000f               L766:
1698                     ; 641     flag1 = I2C->SR1;
1700  000f c65217        	ld	a,21015
1701  0012 97            	ld	xl,a
1702  0013 1f01          	ldw	(OFST-5,sp),x
1704                     ; 642     flag2 = I2C->SR3;
1706  0015 c65219        	ld	a,21017
1707  0018 5f            	clrw	x
1708  0019 97            	ld	xl,a
1709  001a 1f03          	ldw	(OFST-3,sp),x
1711                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1713  001c 7b02          	ld	a,(OFST-4,sp)
1714  001e 01            	rrwa	x,a
1715  001f 1a01          	or	a,(OFST-5,sp)
1716  0021 01            	rrwa	x,a
1717  0022               L176:
1718  0022 1f05          	ldw	(OFST-1,sp),x
1720                     ; 648   return (I2C_Event_TypeDef)lastevent;
1722  0024 1e05          	ldw	x,(OFST-1,sp)
1725  0026 5b06          	addw	sp,#6
1726  0028 81            	ret	
1941                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1941                     ; 680 {
1942                     .text:	section	.text,new
1943  0000               _I2C_GetFlagStatus:
1945  0000 89            	pushw	x
1946  0001 89            	pushw	x
1947       00000002      OFST:	set	2
1950                     ; 681   uint8_t tempreg = 0;
1952  0002 0f02          	clr	(OFST+0,sp)
1954                     ; 682   uint8_t regindex = 0;
1956                     ; 683   FlagStatus bitstatus = RESET;
1958                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1960                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1962  0004 9e            	ld	a,xh
1963  0005 6b01          	ld	(OFST-1,sp),a
1965                     ; 691   switch (regindex)
1968                     ; 708     default:
1968                     ; 709       break;
1969  0007 4a            	dec	a
1970  0008 2708          	jreq	L376
1971  000a 4a            	dec	a
1972  000b 270a          	jreq	L576
1973  000d 4a            	dec	a
1974  000e 270c          	jreq	L776
1975  0010 200f          	jra	L3101
1976  0012               L376:
1977                     ; 694     case 0x01:
1977                     ; 695       tempreg = (uint8_t)I2C->SR1;
1979  0012 c65217        	ld	a,21015
1980                     ; 696       break;
1982  0015 2008          	jp	LC003
1983  0017               L576:
1984                     ; 699     case 0x02:
1984                     ; 700       tempreg = (uint8_t)I2C->SR2;
1986  0017 c65218        	ld	a,21016
1987                     ; 701       break;
1989  001a 2003          	jp	LC003
1990  001c               L776:
1991                     ; 704     case 0x03:
1991                     ; 705       tempreg = (uint8_t)I2C->SR3;
1993  001c c65219        	ld	a,21017
1994  001f               LC003:
1995  001f 6b02          	ld	(OFST+0,sp),a
1997                     ; 706       break;
1999                     ; 708     default:
1999                     ; 709       break;
2001  0021               L3101:
2002                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2004  0021 7b04          	ld	a,(OFST+2,sp)
2005  0023 1502          	bcp	a,(OFST+0,sp)
2006  0025 2704          	jreq	L5101
2007                     ; 716     bitstatus = SET;
2009  0027 a601          	ld	a,#1
2012  0029 2001          	jra	L7101
2013  002b               L5101:
2014                     ; 721     bitstatus = RESET;
2016  002b 4f            	clr	a
2018  002c               L7101:
2019                     ; 724   return bitstatus;
2023  002c 5b04          	addw	sp,#4
2024  002e 81            	ret	
2068                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2068                     ; 760 {
2069                     .text:	section	.text,new
2070  0000               _I2C_ClearFlag:
2072  0000 89            	pushw	x
2073       00000002      OFST:	set	2
2076                     ; 761   uint16_t flagpos = 0;
2078                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2080                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2082  0001 01            	rrwa	x,a
2083  0002 5f            	clrw	x
2084  0003 02            	rlwa	x,a
2085  0004 1f01          	ldw	(OFST-1,sp),x
2087                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2089  0006 7b02          	ld	a,(OFST+0,sp)
2090  0008 43            	cpl	a
2091  0009 c75218        	ld	21016,a
2092                     ; 769 }
2095  000c 85            	popw	x
2096  000d 81            	ret	
2262                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2262                     ; 792 {
2263                     .text:	section	.text,new
2264  0000               _I2C_GetITStatus:
2266  0000 89            	pushw	x
2267  0001 5204          	subw	sp,#4
2268       00000004      OFST:	set	4
2271                     ; 793   ITStatus bitstatus = RESET;
2273                     ; 794   __IO uint8_t enablestatus = 0;
2275  0003 0f03          	clr	(OFST-1,sp)
2277                     ; 795   uint16_t tempregister = 0;
2279                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2281                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2283  0005 9e            	ld	a,xh
2284  0006 a407          	and	a,#7
2285  0008 5f            	clrw	x
2286  0009 97            	ld	xl,a
2287  000a 1f01          	ldw	(OFST-3,sp),x
2289                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2291  000c c6521a        	ld	a,21018
2292  000f 1402          	and	a,(OFST-2,sp)
2293  0011 6b03          	ld	(OFST-1,sp),a
2295                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2297  0013 7b05          	ld	a,(OFST+1,sp)
2298  0015 a430          	and	a,#48
2299  0017 97            	ld	xl,a
2300  0018 4f            	clr	a
2301  0019 02            	rlwa	x,a
2302  001a a30100        	cpw	x,#256
2303  001d 260d          	jrne	L1311
2304                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2306  001f c65217        	ld	a,21015
2307  0022 1506          	bcp	a,(OFST+2,sp)
2308  0024 2715          	jreq	L1411
2310  0026 0d03          	tnz	(OFST-1,sp)
2311  0028 2711          	jreq	L1411
2312                     ; 811       bitstatus = SET;
2314  002a 200b          	jp	LC005
2315                     ; 816       bitstatus = RESET;
2316  002c               L1311:
2317                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2319  002c c65218        	ld	a,21016
2320  002f 1506          	bcp	a,(OFST+2,sp)
2321  0031 2708          	jreq	L1411
2323  0033 0d03          	tnz	(OFST-1,sp)
2324  0035 2704          	jreq	L1411
2325                     ; 825       bitstatus = SET;
2327  0037               LC005:
2329  0037 a601          	ld	a,#1
2332  0039 2001          	jra	L7311
2333  003b               L1411:
2334                     ; 830       bitstatus = RESET;
2337  003b 4f            	clr	a
2339  003c               L7311:
2340                     ; 834   return  bitstatus;
2344  003c 5b06          	addw	sp,#6
2345  003e 81            	ret	
2390                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2390                     ; 872 {
2391                     .text:	section	.text,new
2392  0000               _I2C_ClearITPendingBit:
2394  0000 89            	pushw	x
2395       00000002      OFST:	set	2
2398                     ; 873   uint16_t flagpos = 0;
2400                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2402                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2404  0001 01            	rrwa	x,a
2405  0002 5f            	clrw	x
2406  0003 02            	rlwa	x,a
2407  0004 1f01          	ldw	(OFST-1,sp),x
2409                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2411  0006 7b02          	ld	a,(OFST+0,sp)
2412  0008 43            	cpl	a
2413  0009 c75218        	ld	21016,a
2414                     ; 883 }
2417  000c 85            	popw	x
2418  000d 81            	ret	
2431                     	xdef	_I2C_ClearITPendingBit
2432                     	xdef	_I2C_GetITStatus
2433                     	xdef	_I2C_ClearFlag
2434                     	xdef	_I2C_GetFlagStatus
2435                     	xdef	_I2C_GetLastEvent
2436                     	xdef	_I2C_CheckEvent
2437                     	xdef	_I2C_SendData
2438                     	xdef	_I2C_Send7bitAddress
2439                     	xdef	_I2C_ReceiveData
2440                     	xdef	_I2C_ITConfig
2441                     	xdef	_I2C_FastModeDutyCycleConfig
2442                     	xdef	_I2C_AcknowledgeConfig
2443                     	xdef	_I2C_StretchClockCmd
2444                     	xdef	_I2C_SoftwareResetCmd
2445                     	xdef	_I2C_GenerateSTOP
2446                     	xdef	_I2C_GenerateSTART
2447                     	xdef	_I2C_GeneralCallCmd
2448                     	xdef	_I2C_Cmd
2449                     	xdef	_I2C_Init
2450                     	xdef	_I2C_DeInit
2451                     	xref.b	c_lreg
2452                     	xref.b	c_x
2471                     	xref	c_sdivx
2472                     	xref	c_ludv
2473                     	xref	c_rtol
2474                     	xref	c_smul
2475                     	xref	c_lmul
2476                     	xref	c_lcmp
2477                     	xref	c_ltor
2478                     	end
