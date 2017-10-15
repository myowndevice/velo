   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 53 void UART1_DeInit(void)
  49                     ; 54 {
  51                     .text:	section	.text,new
  52  0000               _UART1_DeInit:
  56                     ; 57   (void)UART1->SR;
  58  0000 c65230        	ld	a,21040
  59                     ; 58   (void)UART1->DR;
  61  0003 c65231        	ld	a,21041
  62                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  64  0006 725f5233      	clr	21043
  65                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  67  000a 725f5232      	clr	21042
  68                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  70  000e 725f5234      	clr	21044
  71                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  73  0012 725f5235      	clr	21045
  74                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  76  0016 725f5236      	clr	21046
  77                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  79  001a 725f5237      	clr	21047
  80                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  82  001e 725f5238      	clr	21048
  83                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  85  0022 725f5239      	clr	21049
  86                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  88  0026 725f523a      	clr	21050
  89                     ; 71 }
  92  002a 81            	ret	
 395                     .const:	section	.text
 396  0000               L41:
 397  0000 00000064      	dc.l	100
 398                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 398                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 398                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 398                     ; 93 {
 399                     .text:	section	.text,new
 400  0000               _UART1_Init:
 402  0000 520c          	subw	sp,#12
 403       0000000c      OFST:	set	12
 406                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 410                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 412                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 414                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 416                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 418                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 420                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 422                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 424  0002 72195234      	bres	21044,#4
 425                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 427  0006 c65234        	ld	a,21044
 428  0009 1a13          	or	a,(OFST+7,sp)
 429  000b c75234        	ld	21044,a
 430                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 432  000e c65236        	ld	a,21046
 433  0011 a4cf          	and	a,#207
 434  0013 c75236        	ld	21046,a
 435                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 437  0016 c65236        	ld	a,21046
 438  0019 1a14          	or	a,(OFST+8,sp)
 439  001b c75236        	ld	21046,a
 440                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 442  001e c65234        	ld	a,21044
 443  0021 a4f9          	and	a,#249
 444  0023 c75234        	ld	21044,a
 445                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 447  0026 c65234        	ld	a,21044
 448  0029 1a15          	or	a,(OFST+9,sp)
 449  002b c75234        	ld	21044,a
 450                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 452  002e 725f5232      	clr	21042
 453                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 455  0032 c65233        	ld	a,21043
 456  0035 a40f          	and	a,#15
 457  0037 c75233        	ld	21043,a
 458                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 460  003a c65233        	ld	a,21043
 461  003d a4f0          	and	a,#240
 462  003f c75233        	ld	21043,a
 463                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 465  0042 96            	ldw	x,sp
 466  0043 cd011c        	call	LC001
 468  0046 96            	ldw	x,sp
 469  0047 5c            	incw	x
 470  0048 cd0000        	call	c_rtol
 473  004b cd0000        	call	_CLK_GetClockFreq
 475  004e 96            	ldw	x,sp
 476  004f 5c            	incw	x
 477  0050 cd0000        	call	c_ludv
 479  0053 96            	ldw	x,sp
 480  0054 1c0009        	addw	x,#OFST-3
 481  0057 cd0000        	call	c_rtol
 484                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 486  005a 96            	ldw	x,sp
 487  005b cd011c        	call	LC001
 489  005e 96            	ldw	x,sp
 490  005f 5c            	incw	x
 491  0060 cd0000        	call	c_rtol
 494  0063 cd0000        	call	_CLK_GetClockFreq
 496  0066 a664          	ld	a,#100
 497  0068 cd0000        	call	c_smul
 499  006b 96            	ldw	x,sp
 500  006c 5c            	incw	x
 501  006d cd0000        	call	c_ludv
 503  0070 96            	ldw	x,sp
 504  0071 1c0005        	addw	x,#OFST-7
 505  0074 cd0000        	call	c_rtol
 508                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 510  0077 96            	ldw	x,sp
 511  0078 1c0009        	addw	x,#OFST-3
 512  007b cd0000        	call	c_ltor
 514  007e a664          	ld	a,#100
 515  0080 cd0000        	call	c_smul
 517  0083 96            	ldw	x,sp
 518  0084 5c            	incw	x
 519  0085 cd0000        	call	c_rtol
 522  0088 96            	ldw	x,sp
 523  0089 1c0005        	addw	x,#OFST-7
 524  008c cd0000        	call	c_ltor
 526  008f 96            	ldw	x,sp
 527  0090 5c            	incw	x
 528  0091 cd0000        	call	c_lsub
 530  0094 a604          	ld	a,#4
 531  0096 cd0000        	call	c_llsh
 533  0099 ae0000        	ldw	x,#L41
 534  009c cd0000        	call	c_ludv
 536  009f b603          	ld	a,c_lreg+3
 537  00a1 a40f          	and	a,#15
 538  00a3 ca5233        	or	a,21043
 539  00a6 c75233        	ld	21043,a
 540                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 542  00a9 96            	ldw	x,sp
 543  00aa 1c0009        	addw	x,#OFST-3
 544  00ad cd0000        	call	c_ltor
 546  00b0 a604          	ld	a,#4
 547  00b2 cd0000        	call	c_lursh
 549  00b5 b603          	ld	a,c_lreg+3
 550  00b7 a4f0          	and	a,#240
 551  00b9 b703          	ld	c_lreg+3,a
 552  00bb 3f02          	clr	c_lreg+2
 553  00bd 3f01          	clr	c_lreg+1
 554  00bf 3f00          	clr	c_lreg
 555  00c1 ca5233        	or	a,21043
 556  00c4 c75233        	ld	21043,a
 557                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 559  00c7 c65232        	ld	a,21042
 560  00ca 1a0c          	or	a,(OFST+0,sp)
 561  00cc c75232        	ld	21042,a
 562                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 564  00cf c65235        	ld	a,21045
 565  00d2 a4f3          	and	a,#243
 566  00d4 c75235        	ld	21045,a
 567                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 569  00d7 c65236        	ld	a,21046
 570  00da a4f8          	and	a,#248
 571  00dc c75236        	ld	21046,a
 572                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 572                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 574  00df 7b16          	ld	a,(OFST+10,sp)
 575  00e1 a407          	and	a,#7
 576  00e3 ca5236        	or	a,21046
 577  00e6 c75236        	ld	21046,a
 578                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 580  00e9 7b17          	ld	a,(OFST+11,sp)
 581  00eb a504          	bcp	a,#4
 582  00ed 2706          	jreq	L371
 583                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 585  00ef 72165235      	bset	21045,#3
 587  00f3 2004          	jra	L571
 588  00f5               L371:
 589                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 591  00f5 72175235      	bres	21045,#3
 592  00f9               L571:
 593                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 595  00f9 a508          	bcp	a,#8
 596  00fb 2706          	jreq	L771
 597                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 599  00fd 72145235      	bset	21045,#2
 601  0101 2004          	jra	L102
 602  0103               L771:
 603                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 605  0103 72155235      	bres	21045,#2
 606  0107               L102:
 607                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 609  0107 7b16          	ld	a,(OFST+10,sp)
 610  0109 2a06          	jrpl	L302
 611                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 613  010b 72175236      	bres	21046,#3
 615  010f 2008          	jra	L502
 616  0111               L302:
 617                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 619  0111 a408          	and	a,#8
 620  0113 ca5236        	or	a,21046
 621  0116 c75236        	ld	21046,a
 622  0119               L502:
 623                     ; 176 }
 626  0119 5b0c          	addw	sp,#12
 627  011b 81            	ret	
 628  011c               LC001:
 629  011c 1c000f        	addw	x,#OFST+3
 630  011f cd0000        	call	c_ltor
 632  0122 a604          	ld	a,#4
 633  0124 cc0000        	jp	c_llsh
 688                     ; 184 void UART1_Cmd(FunctionalState NewState)
 688                     ; 185 {
 689                     .text:	section	.text,new
 690  0000               _UART1_Cmd:
 694                     ; 186   if (NewState != DISABLE)
 696  0000 4d            	tnz	a
 697  0001 2705          	jreq	L532
 698                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 700  0003 721b5234      	bres	21044,#5
 703  0007 81            	ret	
 704  0008               L532:
 705                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 707  0008 721a5234      	bset	21044,#5
 708                     ; 196 }
 711  000c 81            	ret	
 836                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 836                     ; 212 {
 837                     .text:	section	.text,new
 838  0000               _UART1_ITConfig:
 840  0000 89            	pushw	x
 841  0001 89            	pushw	x
 842       00000002      OFST:	set	2
 845                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 849                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 851                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 853                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 855  0002 9e            	ld	a,xh
 856  0003 6b01          	ld	(OFST-1,sp),a
 858                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 860  0005 9f            	ld	a,xl
 861  0006 a40f          	and	a,#15
 862  0008 5f            	clrw	x
 863  0009 97            	ld	xl,a
 864  000a a601          	ld	a,#1
 865  000c 5d            	tnzw	x
 866  000d 2704          	jreq	L22
 867  000f               L42:
 868  000f 48            	sll	a
 869  0010 5a            	decw	x
 870  0011 26fc          	jrne	L42
 871  0013               L22:
 872  0013 6b02          	ld	(OFST+0,sp),a
 874                     ; 224   if (NewState != DISABLE)
 876  0015 7b07          	ld	a,(OFST+5,sp)
 877  0017 271f          	jreq	L713
 878                     ; 227     if (uartreg == 0x01)
 880  0019 7b01          	ld	a,(OFST-1,sp)
 881  001b a101          	cp	a,#1
 882  001d 2607          	jrne	L123
 883                     ; 229       UART1->CR1 |= itpos;
 885  001f c65234        	ld	a,21044
 886  0022 1a02          	or	a,(OFST+0,sp)
 888  0024 201e          	jp	LC003
 889  0026               L123:
 890                     ; 231     else if (uartreg == 0x02)
 892  0026 a102          	cp	a,#2
 893  0028 2607          	jrne	L523
 894                     ; 233       UART1->CR2 |= itpos;
 896  002a c65235        	ld	a,21045
 897  002d 1a02          	or	a,(OFST+0,sp)
 899  002f 2022          	jp	LC004
 900  0031               L523:
 901                     ; 237       UART1->CR4 |= itpos;
 903  0031 c65237        	ld	a,21047
 904  0034 1a02          	or	a,(OFST+0,sp)
 905  0036 2026          	jp	LC002
 906  0038               L713:
 907                     ; 243     if (uartreg == 0x01)
 909  0038 7b01          	ld	a,(OFST-1,sp)
 910  003a a101          	cp	a,#1
 911  003c 260b          	jrne	L333
 912                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 914  003e 7b02          	ld	a,(OFST+0,sp)
 915  0040 43            	cpl	a
 916  0041 c45234        	and	a,21044
 917  0044               LC003:
 918  0044 c75234        	ld	21044,a
 920  0047 2018          	jra	L133
 921  0049               L333:
 922                     ; 247     else if (uartreg == 0x02)
 924  0049 a102          	cp	a,#2
 925  004b 260b          	jrne	L733
 926                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 928  004d 7b02          	ld	a,(OFST+0,sp)
 929  004f 43            	cpl	a
 930  0050 c45235        	and	a,21045
 931  0053               LC004:
 932  0053 c75235        	ld	21045,a
 934  0056 2009          	jra	L133
 935  0058               L733:
 936                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 938  0058 7b02          	ld	a,(OFST+0,sp)
 939  005a 43            	cpl	a
 940  005b c45237        	and	a,21047
 941  005e               LC002:
 942  005e c75237        	ld	21047,a
 943  0061               L133:
 944                     ; 257 }
 947  0061 5b04          	addw	sp,#4
 948  0063 81            	ret	
 984                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 984                     ; 266 {
 985                     .text:	section	.text,new
 986  0000               _UART1_HalfDuplexCmd:
 990                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 992                     ; 269   if (NewState != DISABLE)
 994  0000 4d            	tnz	a
 995  0001 2705          	jreq	L163
 996                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 998  0003 72165238      	bset	21048,#3
1001  0007 81            	ret	
1002  0008               L163:
1003                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1005  0008 72175238      	bres	21048,#3
1006                     ; 277 }
1009  000c 81            	ret	
1066                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1066                     ; 286 {
1067                     .text:	section	.text,new
1068  0000               _UART1_IrDAConfig:
1072                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1074                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1076  0000 4d            	tnz	a
1077  0001 2705          	jreq	L314
1078                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1080  0003 72145238      	bset	21048,#2
1083  0007 81            	ret	
1084  0008               L314:
1085                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1087  0008 72155238      	bres	21048,#2
1088                     ; 297 }
1091  000c 81            	ret	
1126                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1126                     ; 306 {
1127                     .text:	section	.text,new
1128  0000               _UART1_IrDACmd:
1132                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1134                     ; 310   if (NewState != DISABLE)
1136  0000 4d            	tnz	a
1137  0001 2705          	jreq	L534
1138                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1140  0003 72125238      	bset	21048,#1
1143  0007 81            	ret	
1144  0008               L534:
1145                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1147  0008 72135238      	bres	21048,#1
1148                     ; 320 }
1151  000c 81            	ret	
1210                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1210                     ; 330 {
1211                     .text:	section	.text,new
1212  0000               _UART1_LINBreakDetectionConfig:
1216                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1218                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1220  0000 4d            	tnz	a
1221  0001 2705          	jreq	L764
1222                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1224  0003 721a5237      	bset	21047,#5
1227  0007 81            	ret	
1228  0008               L764:
1229                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1231  0008 721b5237      	bres	21047,#5
1232                     ; 341 }
1235  000c 81            	ret	
1270                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1270                     ; 350 {
1271                     .text:	section	.text,new
1272  0000               _UART1_LINCmd:
1276                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1278                     ; 353   if (NewState != DISABLE)
1280  0000 4d            	tnz	a
1281  0001 2705          	jreq	L115
1282                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1284  0003 721c5236      	bset	21046,#6
1287  0007 81            	ret	
1288  0008               L115:
1289                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1291  0008 721d5236      	bres	21046,#6
1292                     ; 363 }
1295  000c 81            	ret	
1330                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1330                     ; 372 {
1331                     .text:	section	.text,new
1332  0000               _UART1_SmartCardCmd:
1336                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1338                     ; 375   if (NewState != DISABLE)
1340  0000 4d            	tnz	a
1341  0001 2705          	jreq	L335
1342                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1344  0003 721a5238      	bset	21048,#5
1347  0007 81            	ret	
1348  0008               L335:
1349                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1351  0008 721b5238      	bres	21048,#5
1352                     ; 385 }
1355  000c 81            	ret	
1391                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1391                     ; 395 {
1392                     .text:	section	.text,new
1393  0000               _UART1_SmartCardNACKCmd:
1397                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1399                     ; 398   if (NewState != DISABLE)
1401  0000 4d            	tnz	a
1402  0001 2705          	jreq	L555
1403                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1405  0003 72185238      	bset	21048,#4
1408  0007 81            	ret	
1409  0008               L555:
1410                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1412  0008 72195238      	bres	21048,#4
1413                     ; 408 }
1416  000c 81            	ret	
1473                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1473                     ; 417 {
1474                     .text:	section	.text,new
1475  0000               _UART1_WakeUpConfig:
1479                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1481                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1483  0000 72175234      	bres	21044,#3
1484                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1486  0004 ca5234        	or	a,21044
1487  0007 c75234        	ld	21044,a
1488                     ; 422 }
1491  000a 81            	ret	
1527                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1527                     ; 431 {
1528                     .text:	section	.text,new
1529  0000               _UART1_ReceiverWakeUpCmd:
1533                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1535                     ; 434   if (NewState != DISABLE)
1537  0000 4d            	tnz	a
1538  0001 2705          	jreq	L526
1539                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1541  0003 72125235      	bset	21045,#1
1544  0007 81            	ret	
1545  0008               L526:
1546                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1548  0008 72135235      	bres	21045,#1
1549                     ; 444 }
1552  000c 81            	ret	
1575                     ; 451 uint8_t UART1_ReceiveData8(void)
1575                     ; 452 {
1576                     .text:	section	.text,new
1577  0000               _UART1_ReceiveData8:
1581                     ; 453   return ((uint8_t)UART1->DR);
1583  0000 c65231        	ld	a,21041
1586  0003 81            	ret	
1620                     ; 461 uint16_t UART1_ReceiveData9(void)
1620                     ; 462 {
1621                     .text:	section	.text,new
1622  0000               _UART1_ReceiveData9:
1624  0000 89            	pushw	x
1625       00000002      OFST:	set	2
1628                     ; 463   uint16_t temp = 0;
1630                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1632  0001 c65234        	ld	a,21044
1633  0004 a480          	and	a,#128
1634  0006 5f            	clrw	x
1635  0007 02            	rlwa	x,a
1636  0008 58            	sllw	x
1637  0009 1f01          	ldw	(OFST-1,sp),x
1639                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1641  000b c65231        	ld	a,21041
1642  000e 5f            	clrw	x
1643  000f 97            	ld	xl,a
1644  0010 01            	rrwa	x,a
1645  0011 1a02          	or	a,(OFST+0,sp)
1646  0013 01            	rrwa	x,a
1647  0014 1a01          	or	a,(OFST-1,sp)
1648  0016 a401          	and	a,#1
1649  0018 01            	rrwa	x,a
1652  0019 5b02          	addw	sp,#2
1653  001b 81            	ret	
1687                     ; 474 void UART1_SendData8(uint8_t Data)
1687                     ; 475 {
1688                     .text:	section	.text,new
1689  0000               _UART1_SendData8:
1693                     ; 477   UART1->DR = Data;
1695  0000 c75231        	ld	21041,a
1696                     ; 478 }
1699  0003 81            	ret	
1733                     ; 486 void UART1_SendData9(uint16_t Data)
1733                     ; 487 {
1734                     .text:	section	.text,new
1735  0000               _UART1_SendData9:
1737  0000 89            	pushw	x
1738       00000000      OFST:	set	0
1741                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1743  0001 721d5234      	bres	21044,#6
1744                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1746  0005 54            	srlw	x
1747  0006 54            	srlw	x
1748  0007 9f            	ld	a,xl
1749  0008 a440          	and	a,#64
1750  000a ca5234        	or	a,21044
1751  000d c75234        	ld	21044,a
1752                     ; 493   UART1->DR   = (uint8_t)(Data);
1754  0010 7b02          	ld	a,(OFST+2,sp)
1755  0012 c75231        	ld	21041,a
1756                     ; 494 }
1759  0015 85            	popw	x
1760  0016 81            	ret	
1783                     ; 501 void UART1_SendBreak(void)
1783                     ; 502 {
1784                     .text:	section	.text,new
1785  0000               _UART1_SendBreak:
1789                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1791  0000 72105235      	bset	21045,#0
1792                     ; 504 }
1795  0004 81            	ret	
1829                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1829                     ; 512 {
1830                     .text:	section	.text,new
1831  0000               _UART1_SetAddress:
1833  0000 88            	push	a
1834       00000000      OFST:	set	0
1837                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1839                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1841  0001 c65237        	ld	a,21047
1842  0004 a4f0          	and	a,#240
1843  0006 c75237        	ld	21047,a
1844                     ; 519   UART1->CR4 |= UART1_Address;
1846  0009 c65237        	ld	a,21047
1847  000c 1a01          	or	a,(OFST+1,sp)
1848  000e c75237        	ld	21047,a
1849                     ; 520 }
1852  0011 84            	pop	a
1853  0012 81            	ret	
1887                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1887                     ; 529 {
1888                     .text:	section	.text,new
1889  0000               _UART1_SetGuardTime:
1893                     ; 531   UART1->GTR = UART1_GuardTime;
1895  0000 c75239        	ld	21049,a
1896                     ; 532 }
1899  0003 81            	ret	
1933                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1933                     ; 557 {
1934                     .text:	section	.text,new
1935  0000               _UART1_SetPrescaler:
1939                     ; 559   UART1->PSCR = UART1_Prescaler;
1941  0000 c7523a        	ld	21050,a
1942                     ; 560 }
1945  0003 81            	ret	
2088                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2088                     ; 569 {
2089                     .text:	section	.text,new
2090  0000               _UART1_GetFlagStatus:
2092  0000 89            	pushw	x
2093  0001 88            	push	a
2094       00000001      OFST:	set	1
2097                     ; 570   FlagStatus status = RESET;
2099                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2101                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2103  0002 a30210        	cpw	x,#528
2104  0005 2608          	jrne	L7501
2105                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2107  0007 9f            	ld	a,xl
2108  0008 c45237        	and	a,21047
2109  000b 271c          	jreq	L5601
2110                     ; 582       status = SET;
2112  000d 2015          	jp	LC007
2113                     ; 587       status = RESET;
2114  000f               L7501:
2115                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2117  000f a30101        	cpw	x,#257
2118  0012 2609          	jrne	L7601
2119                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2121  0014 c65235        	ld	a,21045
2122  0017 1503          	bcp	a,(OFST+2,sp)
2123  0019 270d          	jreq	L7701
2124                     ; 595       status = SET;
2126  001b 2007          	jp	LC007
2127                     ; 600       status = RESET;
2128  001d               L7601:
2129                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2131  001d c65230        	ld	a,21040
2132  0020 1503          	bcp	a,(OFST+2,sp)
2133  0022 2704          	jreq	L7701
2134                     ; 608       status = SET;
2136  0024               LC007:
2139  0024 a601          	ld	a,#1
2143  0026 2001          	jra	L5601
2144  0028               L7701:
2145                     ; 613       status = RESET;
2148  0028 4f            	clr	a
2150  0029               L5601:
2151                     ; 617   return status;
2155  0029 5b03          	addw	sp,#3
2156  002b 81            	ret	
2191                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2191                     ; 647 {
2192                     .text:	section	.text,new
2193  0000               _UART1_ClearFlag:
2197                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2199                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2201  0000 a30020        	cpw	x,#32
2202  0003 2605          	jrne	L1211
2203                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2205  0005 35df5230      	mov	21040,#223
2208  0009 81            	ret	
2209  000a               L1211:
2210                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2212  000a 72195237      	bres	21047,#4
2213                     ; 660 }
2216  000e 81            	ret	
2298                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2298                     ; 676 {
2299                     .text:	section	.text,new
2300  0000               _UART1_GetITStatus:
2302  0000 89            	pushw	x
2303  0001 89            	pushw	x
2304       00000002      OFST:	set	2
2307                     ; 677   ITStatus pendingbitstatus = RESET;
2309                     ; 678   uint8_t itpos = 0;
2311                     ; 679   uint8_t itmask1 = 0;
2313                     ; 680   uint8_t itmask2 = 0;
2315                     ; 681   uint8_t enablestatus = 0;
2317                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2319                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2321  0002 9f            	ld	a,xl
2322  0003 a40f          	and	a,#15
2323  0005 5f            	clrw	x
2324  0006 97            	ld	xl,a
2325  0007 a601          	ld	a,#1
2326  0009 5d            	tnzw	x
2327  000a 2704          	jreq	L67
2328  000c               L001:
2329  000c 48            	sll	a
2330  000d 5a            	decw	x
2331  000e 26fc          	jrne	L001
2332  0010               L67:
2333  0010 6b01          	ld	(OFST-1,sp),a
2335                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2337  0012 7b04          	ld	a,(OFST+2,sp)
2338  0014 4e            	swap	a
2339  0015 a40f          	and	a,#15
2340  0017 6b02          	ld	(OFST+0,sp),a
2342                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2344  0019 5f            	clrw	x
2345  001a 97            	ld	xl,a
2346  001b a601          	ld	a,#1
2347  001d 5d            	tnzw	x
2348  001e 2704          	jreq	L201
2349  0020               L401:
2350  0020 48            	sll	a
2351  0021 5a            	decw	x
2352  0022 26fc          	jrne	L401
2353  0024               L201:
2354  0024 6b02          	ld	(OFST+0,sp),a
2356                     ; 695   if (UART1_IT == UART1_IT_PE)
2358  0026 1e03          	ldw	x,(OFST+1,sp)
2359  0028 a30100        	cpw	x,#256
2360  002b 260c          	jrne	L7611
2361                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2363  002d c65234        	ld	a,21044
2364  0030 1402          	and	a,(OFST+0,sp)
2365  0032 6b02          	ld	(OFST+0,sp),a
2367                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2369  0034 c65230        	ld	a,21040
2371                     ; 704       pendingbitstatus = SET;
2373  0037 200f          	jp	LC010
2374                     ; 709       pendingbitstatus = RESET;
2375  0039               L7611:
2376                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2378  0039 a30346        	cpw	x,#838
2379  003c 2616          	jrne	L7711
2380                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2382  003e c65237        	ld	a,21047
2383  0041 1402          	and	a,(OFST+0,sp)
2384  0043 6b02          	ld	(OFST+0,sp),a
2386                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2388  0045 c65237        	ld	a,21047
2390  0048               LC010:
2391  0048 1501          	bcp	a,(OFST-1,sp)
2392  004a 271a          	jreq	L7021
2393  004c 7b02          	ld	a,(OFST+0,sp)
2394  004e 2716          	jreq	L7021
2395                     ; 721       pendingbitstatus = SET;
2397  0050               LC009:
2400  0050 a601          	ld	a,#1
2403  0052 2013          	jra	L5711
2404                     ; 726       pendingbitstatus = RESET;
2405  0054               L7711:
2406                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2408  0054 c65235        	ld	a,21045
2409  0057 1402          	and	a,(OFST+0,sp)
2410  0059 6b02          	ld	(OFST+0,sp),a
2412                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2414  005b c65230        	ld	a,21040
2415  005e 1501          	bcp	a,(OFST-1,sp)
2416  0060 2704          	jreq	L7021
2418  0062 7b02          	ld	a,(OFST+0,sp)
2419                     ; 737       pendingbitstatus = SET;
2421  0064 26ea          	jrne	LC009
2422  0066               L7021:
2423                     ; 742       pendingbitstatus = RESET;
2427  0066 4f            	clr	a
2429  0067               L5711:
2430                     ; 747   return  pendingbitstatus;
2434  0067 5b04          	addw	sp,#4
2435  0069 81            	ret	
2471                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2471                     ; 776 {
2472                     .text:	section	.text,new
2473  0000               _UART1_ClearITPendingBit:
2477                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2479                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2481  0000 a30255        	cpw	x,#597
2482  0003 2605          	jrne	L1321
2483                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2485  0005 35df5230      	mov	21040,#223
2488  0009 81            	ret	
2489  000a               L1321:
2490                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2492  000a 72195237      	bres	21047,#4
2493                     ; 789 }
2496  000e 81            	ret	
2509                     	xdef	_UART1_ClearITPendingBit
2510                     	xdef	_UART1_GetITStatus
2511                     	xdef	_UART1_ClearFlag
2512                     	xdef	_UART1_GetFlagStatus
2513                     	xdef	_UART1_SetPrescaler
2514                     	xdef	_UART1_SetGuardTime
2515                     	xdef	_UART1_SetAddress
2516                     	xdef	_UART1_SendBreak
2517                     	xdef	_UART1_SendData9
2518                     	xdef	_UART1_SendData8
2519                     	xdef	_UART1_ReceiveData9
2520                     	xdef	_UART1_ReceiveData8
2521                     	xdef	_UART1_ReceiverWakeUpCmd
2522                     	xdef	_UART1_WakeUpConfig
2523                     	xdef	_UART1_SmartCardNACKCmd
2524                     	xdef	_UART1_SmartCardCmd
2525                     	xdef	_UART1_LINCmd
2526                     	xdef	_UART1_LINBreakDetectionConfig
2527                     	xdef	_UART1_IrDACmd
2528                     	xdef	_UART1_IrDAConfig
2529                     	xdef	_UART1_HalfDuplexCmd
2530                     	xdef	_UART1_ITConfig
2531                     	xdef	_UART1_Cmd
2532                     	xdef	_UART1_Init
2533                     	xdef	_UART1_DeInit
2534                     	xref	_CLK_GetClockFreq
2535                     	xref.b	c_lreg
2536                     	xref.b	c_x
2555                     	xref	c_lursh
2556                     	xref	c_lsub
2557                     	xref	c_smul
2558                     	xref	c_ludv
2559                     	xref	c_rtol
2560                     	xref	c_llsh
2561                     	xref	c_ltor
2562                     	end
