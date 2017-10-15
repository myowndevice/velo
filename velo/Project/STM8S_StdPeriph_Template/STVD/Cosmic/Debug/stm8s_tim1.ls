   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 58 void TIM1_DeInit(void)
  49                     ; 59 {
  51                     .text:	section	.text,new
  52  0000               _TIM1_DeInit:
  56                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  58  0000 725f5250      	clr	21072
  59                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  61  0004 725f5251      	clr	21073
  62                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  64  0008 725f5252      	clr	21074
  65                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  67  000c 725f5253      	clr	21075
  68                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  70  0010 725f5254      	clr	21076
  71                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  73  0014 725f5256      	clr	21078
  74                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  76  0018 725f525c      	clr	21084
  77                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  79  001c 725f525d      	clr	21085
  80                     ; 70   TIM1->CCMR1 = 0x01;
  82  0020 35015258      	mov	21080,#1
  83                     ; 71   TIM1->CCMR2 = 0x01;
  85  0024 35015259      	mov	21081,#1
  86                     ; 72   TIM1->CCMR3 = 0x01;
  88  0028 3501525a      	mov	21082,#1
  89                     ; 73   TIM1->CCMR4 = 0x01;
  91  002c 3501525b      	mov	21083,#1
  92                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  94  0030 725f525c      	clr	21084
  95                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  97  0034 725f525d      	clr	21085
  98                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
 100  0038 725f5258      	clr	21080
 101                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 103  003c 725f5259      	clr	21081
 104                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 106  0040 725f525a      	clr	21082
 107                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 109  0044 725f525b      	clr	21083
 110                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 112  0048 725f525e      	clr	21086
 113                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 115  004c 725f525f      	clr	21087
 116                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 118  0050 725f5260      	clr	21088
 119                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 121  0054 725f5261      	clr	21089
 122                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 124  0058 35ff5262      	mov	21090,#255
 125                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 127  005c 35ff5263      	mov	21091,#255
 128                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 130  0060 725f5265      	clr	21093
 131                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 133  0064 725f5266      	clr	21094
 134                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 136  0068 725f5267      	clr	21095
 137                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 139  006c 725f5268      	clr	21096
 140                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 142  0070 725f5269      	clr	21097
 143                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 145  0074 725f526a      	clr	21098
 146                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 148  0078 725f526b      	clr	21099
 149                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 151  007c 725f526c      	clr	21100
 152                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 154  0080 725f526f      	clr	21103
 155                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 157  0084 35015257      	mov	21079,#1
 158                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 160  0088 725f526e      	clr	21102
 161                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 163  008c 725f526d      	clr	21101
 164                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 166  0090 725f5264      	clr	21092
 167                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 169  0094 725f5255      	clr	21077
 170                     ; 101 }
 173  0098 81            	ret	
 282                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 282                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 282                     ; 113                        uint16_t TIM1_Period,
 282                     ; 114                        uint8_t TIM1_RepetitionCounter)
 282                     ; 115 {
 283                     .text:	section	.text,new
 284  0000               _TIM1_TimeBaseInit:
 286  0000 89            	pushw	x
 287       00000000      OFST:	set	0
 290                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 292                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 294  0001 7b06          	ld	a,(OFST+6,sp)
 295  0003 c75262        	ld	21090,a
 296                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 298  0006 7b07          	ld	a,(OFST+7,sp)
 299  0008 c75263        	ld	21091,a
 300                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 302  000b 9e            	ld	a,xh
 303  000c c75260        	ld	21088,a
 304                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 306  000f 9f            	ld	a,xl
 307  0010 c75261        	ld	21089,a
 308                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 308                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 310  0013 c65250        	ld	a,21072
 311  0016 a48f          	and	a,#143
 312  0018 1a05          	or	a,(OFST+5,sp)
 313  001a c75250        	ld	21072,a
 314                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 316  001d 7b08          	ld	a,(OFST+8,sp)
 317  001f c75264        	ld	21092,a
 318                     ; 133 }
 321  0022 85            	popw	x
 322  0023 81            	ret	
 607                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 607                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 607                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 607                     ; 157                   uint16_t TIM1_Pulse,
 607                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 607                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 607                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 607                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 607                     ; 162 {
 608                     .text:	section	.text,new
 609  0000               _TIM1_OC1Init:
 611  0000 89            	pushw	x
 612  0001 5203          	subw	sp,#3
 613       00000003      OFST:	set	3
 616                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 618                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 620                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 622                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 624                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 626                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 628                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 630                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 630                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 632  0003 c6525c        	ld	a,21084
 633  0006 a4f0          	and	a,#240
 634  0008 c7525c        	ld	21084,a
 635                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 635                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 635                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 635                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 637  000b 7b0c          	ld	a,(OFST+9,sp)
 638  000d a408          	and	a,#8
 639  000f 6b03          	ld	(OFST+0,sp),a
 641  0011 7b0b          	ld	a,(OFST+8,sp)
 642  0013 a402          	and	a,#2
 643  0015 1a03          	or	a,(OFST+0,sp)
 644  0017 6b02          	ld	(OFST-1,sp),a
 646  0019 7b08          	ld	a,(OFST+5,sp)
 647  001b a404          	and	a,#4
 648  001d 6b01          	ld	(OFST-2,sp),a
 650  001f 9f            	ld	a,xl
 651  0020 a401          	and	a,#1
 652  0022 1a01          	or	a,(OFST-2,sp)
 653  0024 1a02          	or	a,(OFST-1,sp)
 654  0026 ca525c        	or	a,21084
 655  0029 c7525c        	ld	21084,a
 656                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 656                     ; 185                           (uint8_t)TIM1_OCMode);
 658  002c c65258        	ld	a,21080
 659  002f a48f          	and	a,#143
 660  0031 1a04          	or	a,(OFST+1,sp)
 661  0033 c75258        	ld	21080,a
 662                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 664  0036 c6526f        	ld	a,21103
 665  0039 a4fc          	and	a,#252
 666  003b c7526f        	ld	21103,a
 667                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 667                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 669  003e 7b0e          	ld	a,(OFST+11,sp)
 670  0040 a402          	and	a,#2
 671  0042 6b03          	ld	(OFST+0,sp),a
 673  0044 7b0d          	ld	a,(OFST+10,sp)
 674  0046 a401          	and	a,#1
 675  0048 1a03          	or	a,(OFST+0,sp)
 676  004a ca526f        	or	a,21103
 677  004d c7526f        	ld	21103,a
 678                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 680  0050 7b09          	ld	a,(OFST+6,sp)
 681  0052 c75265        	ld	21093,a
 682                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 684  0055 7b0a          	ld	a,(OFST+7,sp)
 685  0057 c75266        	ld	21094,a
 686                     ; 196 }
 689  005a 5b05          	addw	sp,#5
 690  005c 81            	ret	
 794                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 794                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 794                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 794                     ; 220                   uint16_t TIM1_Pulse,
 794                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 794                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 794                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 794                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 794                     ; 225 {
 795                     .text:	section	.text,new
 796  0000               _TIM1_OC2Init:
 798  0000 89            	pushw	x
 799  0001 5203          	subw	sp,#3
 800       00000003      OFST:	set	3
 803                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 805                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 807                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 809                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 811                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 813                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 815                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 817                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 817                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 819  0003 c6525c        	ld	a,21084
 820  0006 a40f          	and	a,#15
 821  0008 c7525c        	ld	21084,a
 822                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 822                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 822                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 822                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 824  000b 7b0c          	ld	a,(OFST+9,sp)
 825  000d a480          	and	a,#128
 826  000f 6b03          	ld	(OFST+0,sp),a
 828  0011 7b0b          	ld	a,(OFST+8,sp)
 829  0013 a420          	and	a,#32
 830  0015 1a03          	or	a,(OFST+0,sp)
 831  0017 6b02          	ld	(OFST-1,sp),a
 833  0019 7b08          	ld	a,(OFST+5,sp)
 834  001b a440          	and	a,#64
 835  001d 6b01          	ld	(OFST-2,sp),a
 837  001f 9f            	ld	a,xl
 838  0020 a410          	and	a,#16
 839  0022 1a01          	or	a,(OFST-2,sp)
 840  0024 1a02          	or	a,(OFST-1,sp)
 841  0026 ca525c        	or	a,21084
 842  0029 c7525c        	ld	21084,a
 843                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 843                     ; 249                           (uint8_t)TIM1_OCMode);
 845  002c c65259        	ld	a,21081
 846  002f a48f          	and	a,#143
 847  0031 1a04          	or	a,(OFST+1,sp)
 848  0033 c75259        	ld	21081,a
 849                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 851  0036 c6526f        	ld	a,21103
 852  0039 a4f3          	and	a,#243
 853  003b c7526f        	ld	21103,a
 854                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 854                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 856  003e 7b0e          	ld	a,(OFST+11,sp)
 857  0040 a408          	and	a,#8
 858  0042 6b03          	ld	(OFST+0,sp),a
 860  0044 7b0d          	ld	a,(OFST+10,sp)
 861  0046 a404          	and	a,#4
 862  0048 1a03          	or	a,(OFST+0,sp)
 863  004a ca526f        	or	a,21103
 864  004d c7526f        	ld	21103,a
 865                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 867  0050 7b09          	ld	a,(OFST+6,sp)
 868  0052 c75267        	ld	21095,a
 869                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 871  0055 7b0a          	ld	a,(OFST+7,sp)
 872  0057 c75268        	ld	21096,a
 873                     ; 260 }
 876  005a 5b05          	addw	sp,#5
 877  005c 81            	ret	
 981                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 981                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 981                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 981                     ; 284                   uint16_t TIM1_Pulse,
 981                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 981                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 981                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 981                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 981                     ; 289 {
 982                     .text:	section	.text,new
 983  0000               _TIM1_OC3Init:
 985  0000 89            	pushw	x
 986  0001 5203          	subw	sp,#3
 987       00000003      OFST:	set	3
 990                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 992                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 994                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 996                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 998                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1000                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1002                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1004                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1004                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1006  0003 c6525d        	ld	a,21085
1007  0006 a4f0          	and	a,#240
1008  0008 c7525d        	ld	21085,a
1009                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1009                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1009                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1009                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1011  000b 7b0c          	ld	a,(OFST+9,sp)
1012  000d a408          	and	a,#8
1013  000f 6b03          	ld	(OFST+0,sp),a
1015  0011 7b0b          	ld	a,(OFST+8,sp)
1016  0013 a402          	and	a,#2
1017  0015 1a03          	or	a,(OFST+0,sp)
1018  0017 6b02          	ld	(OFST-1,sp),a
1020  0019 7b08          	ld	a,(OFST+5,sp)
1021  001b a404          	and	a,#4
1022  001d 6b01          	ld	(OFST-2,sp),a
1024  001f 9f            	ld	a,xl
1025  0020 a401          	and	a,#1
1026  0022 1a01          	or	a,(OFST-2,sp)
1027  0024 1a02          	or	a,(OFST-1,sp)
1028  0026 ca525d        	or	a,21085
1029  0029 c7525d        	ld	21085,a
1030                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1030                     ; 312                           (uint8_t)TIM1_OCMode);
1032  002c c6525a        	ld	a,21082
1033  002f a48f          	and	a,#143
1034  0031 1a04          	or	a,(OFST+1,sp)
1035  0033 c7525a        	ld	21082,a
1036                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1038  0036 c6526f        	ld	a,21103
1039  0039 a4cf          	and	a,#207
1040  003b c7526f        	ld	21103,a
1041                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1041                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1043  003e 7b0e          	ld	a,(OFST+11,sp)
1044  0040 a420          	and	a,#32
1045  0042 6b03          	ld	(OFST+0,sp),a
1047  0044 7b0d          	ld	a,(OFST+10,sp)
1048  0046 a410          	and	a,#16
1049  0048 1a03          	or	a,(OFST+0,sp)
1050  004a ca526f        	or	a,21103
1051  004d c7526f        	ld	21103,a
1052                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1054  0050 7b09          	ld	a,(OFST+6,sp)
1055  0052 c75269        	ld	21097,a
1056                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1058  0055 7b0a          	ld	a,(OFST+7,sp)
1059  0057 c7526a        	ld	21098,a
1060                     ; 323 }
1063  005a 5b05          	addw	sp,#5
1064  005c 81            	ret	
1138                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1138                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1138                     ; 340                   uint16_t TIM1_Pulse,
1138                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1138                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1138                     ; 343 {
1139                     .text:	section	.text,new
1140  0000               _TIM1_OC4Init:
1142  0000 89            	pushw	x
1143  0001 88            	push	a
1144       00000001      OFST:	set	1
1147                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1149                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1151                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1153                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1155                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1157  0002 c6525d        	ld	a,21085
1158  0005 a4cf          	and	a,#207
1159  0007 c7525d        	ld	21085,a
1160                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1160                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1162  000a 7b08          	ld	a,(OFST+7,sp)
1163  000c a420          	and	a,#32
1164  000e 6b01          	ld	(OFST+0,sp),a
1166  0010 9f            	ld	a,xl
1167  0011 a410          	and	a,#16
1168  0013 1a01          	or	a,(OFST+0,sp)
1169  0015 ca525d        	or	a,21085
1170  0018 c7525d        	ld	21085,a
1171                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1171                     ; 358                           TIM1_OCMode);
1173  001b c6525b        	ld	a,21083
1174  001e a48f          	and	a,#143
1175  0020 1a02          	or	a,(OFST+1,sp)
1176  0022 c7525b        	ld	21083,a
1177                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1179  0025 7b09          	ld	a,(OFST+8,sp)
1180  0027 270a          	jreq	L534
1181                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1183  0029 c6526f        	ld	a,21103
1184  002c aadf          	or	a,#223
1185  002e c7526f        	ld	21103,a
1187  0031 2004          	jra	L734
1188  0033               L534:
1189                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1191  0033 721d526f      	bres	21103,#6
1192  0037               L734:
1193                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1195  0037 7b06          	ld	a,(OFST+5,sp)
1196  0039 c7526b        	ld	21099,a
1197                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1199  003c 7b07          	ld	a,(OFST+6,sp)
1200  003e c7526c        	ld	21100,a
1201                     ; 373 }
1204  0041 5b03          	addw	sp,#3
1205  0043 81            	ret	
1410                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1410                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1410                     ; 390                      uint8_t TIM1_DeadTime,
1410                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1410                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1410                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1410                     ; 394 {
1411                     .text:	section	.text,new
1412  0000               _TIM1_BDTRConfig:
1414  0000 89            	pushw	x
1415  0001 88            	push	a
1416       00000001      OFST:	set	1
1419                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1421                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1423                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1425                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1427                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1429                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1431  0002 7b06          	ld	a,(OFST+5,sp)
1432  0004 c7526e        	ld	21102,a
1433                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1433                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1433                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1435  0007 7b07          	ld	a,(OFST+6,sp)
1436  0009 1a08          	or	a,(OFST+7,sp)
1437  000b 1a09          	or	a,(OFST+8,sp)
1438  000d 6b01          	ld	(OFST+0,sp),a
1440  000f 9f            	ld	a,xl
1441  0010 1a02          	or	a,(OFST+1,sp)
1442  0012 1a01          	or	a,(OFST+0,sp)
1443  0014 c7526d        	ld	21101,a
1444                     ; 409 }
1447  0017 5b03          	addw	sp,#3
1448  0019 81            	ret	
1650                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1650                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1650                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1650                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1650                     ; 427                  uint8_t TIM1_ICFilter)
1650                     ; 428 {
1651                     .text:	section	.text,new
1652  0000               _TIM1_ICInit:
1654  0000 89            	pushw	x
1655       00000000      OFST:	set	0
1658                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1660                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1662                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1664                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1666                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1668                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1670  0001 9e            	ld	a,xh
1671  0002 4d            	tnz	a
1672  0003 2614          	jrne	L766
1673                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1673                     ; 440                (uint8_t)TIM1_ICSelection,
1673                     ; 441                (uint8_t)TIM1_ICFilter);
1675  0005 7b07          	ld	a,(OFST+7,sp)
1676  0007 88            	push	a
1677  0008 7b06          	ld	a,(OFST+6,sp)
1678  000a 97            	ld	xl,a
1679  000b 7b03          	ld	a,(OFST+3,sp)
1680  000d 95            	ld	xh,a
1681  000e cd0000        	call	L3_TI1_Config
1683  0011 84            	pop	a
1684                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1686  0012 7b06          	ld	a,(OFST+6,sp)
1687  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1690  0017 2044          	jra	L176
1691  0019               L766:
1692                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1694  0019 7b01          	ld	a,(OFST+1,sp)
1695  001b a101          	cp	a,#1
1696  001d 2614          	jrne	L376
1697                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1697                     ; 449                (uint8_t)TIM1_ICSelection,
1697                     ; 450                (uint8_t)TIM1_ICFilter);
1699  001f 7b07          	ld	a,(OFST+7,sp)
1700  0021 88            	push	a
1701  0022 7b06          	ld	a,(OFST+6,sp)
1702  0024 97            	ld	xl,a
1703  0025 7b03          	ld	a,(OFST+3,sp)
1704  0027 95            	ld	xh,a
1705  0028 cd0000        	call	L5_TI2_Config
1707  002b 84            	pop	a
1708                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1710  002c 7b06          	ld	a,(OFST+6,sp)
1711  002e cd0000        	call	_TIM1_SetIC2Prescaler
1714  0031 202a          	jra	L176
1715  0033               L376:
1716                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1718  0033 a102          	cp	a,#2
1719  0035 2614          	jrne	L776
1720                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1720                     ; 458                (uint8_t)TIM1_ICSelection,
1720                     ; 459                (uint8_t)TIM1_ICFilter);
1722  0037 7b07          	ld	a,(OFST+7,sp)
1723  0039 88            	push	a
1724  003a 7b06          	ld	a,(OFST+6,sp)
1725  003c 97            	ld	xl,a
1726  003d 7b03          	ld	a,(OFST+3,sp)
1727  003f 95            	ld	xh,a
1728  0040 cd0000        	call	L7_TI3_Config
1730  0043 84            	pop	a
1731                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1733  0044 7b06          	ld	a,(OFST+6,sp)
1734  0046 cd0000        	call	_TIM1_SetIC3Prescaler
1737  0049 2012          	jra	L176
1738  004b               L776:
1739                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1739                     ; 467                (uint8_t)TIM1_ICSelection,
1739                     ; 468                (uint8_t)TIM1_ICFilter);
1741  004b 7b07          	ld	a,(OFST+7,sp)
1742  004d 88            	push	a
1743  004e 7b06          	ld	a,(OFST+6,sp)
1744  0050 97            	ld	xl,a
1745  0051 7b03          	ld	a,(OFST+3,sp)
1746  0053 95            	ld	xh,a
1747  0054 cd0000        	call	L11_TI4_Config
1749  0057 84            	pop	a
1750                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1752  0058 7b06          	ld	a,(OFST+6,sp)
1753  005a cd0000        	call	_TIM1_SetIC4Prescaler
1755  005d               L176:
1756                     ; 472 }
1759  005d 85            	popw	x
1760  005e 81            	ret	
1856                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1856                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1856                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1856                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1856                     ; 492                      uint8_t TIM1_ICFilter)
1856                     ; 493 {
1857                     .text:	section	.text,new
1858  0000               _TIM1_PWMIConfig:
1860  0000 89            	pushw	x
1861  0001 89            	pushw	x
1862       00000002      OFST:	set	2
1865                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1867                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1869                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1871                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1873                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1875                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1877                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1879  0002 9f            	ld	a,xl
1880  0003 4a            	dec	a
1881  0004 2702          	jreq	L157
1882                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1884  0006 a601          	ld	a,#1
1886  0008               L157:
1887                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1889  0008 6b01          	ld	(OFST-1,sp),a
1891                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1893  000a 7b07          	ld	a,(OFST+5,sp)
1894  000c 4a            	dec	a
1895  000d 2604          	jrne	L557
1896                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1898  000f a602          	ld	a,#2
1900  0011 2002          	jra	L757
1901  0013               L557:
1902                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1904  0013 a601          	ld	a,#1
1905  0015               L757:
1906  0015 6b02          	ld	(OFST+0,sp),a
1908                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1910  0017 7b03          	ld	a,(OFST+1,sp)
1911  0019 2626          	jrne	L167
1912                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1912                     ; 527                (uint8_t)TIM1_ICFilter);
1914  001b 7b09          	ld	a,(OFST+7,sp)
1915  001d 88            	push	a
1916  001e 7b08          	ld	a,(OFST+6,sp)
1917  0020 97            	ld	xl,a
1918  0021 7b05          	ld	a,(OFST+3,sp)
1919  0023 95            	ld	xh,a
1920  0024 cd0000        	call	L3_TI1_Config
1922  0027 84            	pop	a
1923                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1925  0028 7b08          	ld	a,(OFST+6,sp)
1926  002a cd0000        	call	_TIM1_SetIC1Prescaler
1928                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1930  002d 7b09          	ld	a,(OFST+7,sp)
1931  002f 88            	push	a
1932  0030 7b03          	ld	a,(OFST+1,sp)
1933  0032 97            	ld	xl,a
1934  0033 7b02          	ld	a,(OFST+0,sp)
1935  0035 95            	ld	xh,a
1936  0036 cd0000        	call	L5_TI2_Config
1938  0039 84            	pop	a
1939                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1941  003a 7b08          	ld	a,(OFST+6,sp)
1942  003c cd0000        	call	_TIM1_SetIC2Prescaler
1945  003f 2024          	jra	L367
1946  0041               L167:
1947                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1947                     ; 542                (uint8_t)TIM1_ICFilter);
1949  0041 7b09          	ld	a,(OFST+7,sp)
1950  0043 88            	push	a
1951  0044 7b08          	ld	a,(OFST+6,sp)
1952  0046 97            	ld	xl,a
1953  0047 7b05          	ld	a,(OFST+3,sp)
1954  0049 95            	ld	xh,a
1955  004a cd0000        	call	L5_TI2_Config
1957  004d 84            	pop	a
1958                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1960  004e 7b08          	ld	a,(OFST+6,sp)
1961  0050 cd0000        	call	_TIM1_SetIC2Prescaler
1963                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1965  0053 7b09          	ld	a,(OFST+7,sp)
1966  0055 88            	push	a
1967  0056 7b03          	ld	a,(OFST+1,sp)
1968  0058 97            	ld	xl,a
1969  0059 7b02          	ld	a,(OFST+0,sp)
1970  005b 95            	ld	xh,a
1971  005c cd0000        	call	L3_TI1_Config
1973  005f 84            	pop	a
1974                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1976  0060 7b08          	ld	a,(OFST+6,sp)
1977  0062 cd0000        	call	_TIM1_SetIC1Prescaler
1979  0065               L367:
1980                     ; 553 }
1983  0065 5b04          	addw	sp,#4
1984  0067 81            	ret	
2039                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2039                     ; 562 {
2040                     .text:	section	.text,new
2041  0000               _TIM1_Cmd:
2045                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2047                     ; 567   if (NewState != DISABLE)
2049  0000 4d            	tnz	a
2050  0001 2705          	jreq	L3101
2051                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2053  0003 72105250      	bset	21072,#0
2056  0007 81            	ret	
2057  0008               L3101:
2058                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2060  0008 72115250      	bres	21072,#0
2061                     ; 575 }
2064  000c 81            	ret	
2100                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2100                     ; 584 {
2101                     .text:	section	.text,new
2102  0000               _TIM1_CtrlPWMOutputs:
2106                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2108                     ; 590   if (NewState != DISABLE)
2110  0000 4d            	tnz	a
2111  0001 2705          	jreq	L5301
2112                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2114  0003 721e526d      	bset	21101,#7
2117  0007 81            	ret	
2118  0008               L5301:
2119                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2121  0008 721f526d      	bres	21101,#7
2122                     ; 598 }
2125  000c 81            	ret	
2232                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2232                     ; 618 {
2233                     .text:	section	.text,new
2234  0000               _TIM1_ITConfig:
2236  0000 89            	pushw	x
2237       00000000      OFST:	set	0
2240                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2242                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2244                     ; 623   if (NewState != DISABLE)
2246  0001 9f            	ld	a,xl
2247  0002 4d            	tnz	a
2248  0003 2706          	jreq	L7011
2249                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2251  0005 9e            	ld	a,xh
2252  0006 ca5254        	or	a,21076
2254  0009 2006          	jra	L1111
2255  000b               L7011:
2256                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2258  000b 7b01          	ld	a,(OFST+1,sp)
2259  000d 43            	cpl	a
2260  000e c45254        	and	a,21076
2261  0011               L1111:
2262  0011 c75254        	ld	21076,a
2263                     ; 633 }
2266  0014 85            	popw	x
2267  0015 81            	ret	
2291                     ; 640 void TIM1_InternalClockConfig(void)
2291                     ; 641 {
2292                     .text:	section	.text,new
2293  0000               _TIM1_InternalClockConfig:
2297                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2299  0000 c65252        	ld	a,21074
2300  0003 a4f8          	and	a,#248
2301  0005 c75252        	ld	21074,a
2302                     ; 644 }
2305  0008 81            	ret	
2422                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2422                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2422                     ; 664                               uint8_t ExtTRGFilter)
2422                     ; 665 {
2423                     .text:	section	.text,new
2424  0000               _TIM1_ETRClockMode1Config:
2426  0000 89            	pushw	x
2427       00000000      OFST:	set	0
2430                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2432                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2434                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2436  0001 7b05          	ld	a,(OFST+5,sp)
2437  0003 88            	push	a
2438  0004 7b02          	ld	a,(OFST+2,sp)
2439  0006 95            	ld	xh,a
2440  0007 cd0000        	call	_TIM1_ETRConfig
2442  000a 84            	pop	a
2443                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2443                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2445  000b c65252        	ld	a,21074
2446  000e aa77          	or	a,#119
2447  0010 c75252        	ld	21074,a
2448                     ; 676 }
2451  0013 85            	popw	x
2452  0014 81            	ret	
2510                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2510                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2510                     ; 696                               uint8_t ExtTRGFilter)
2510                     ; 697 {
2511                     .text:	section	.text,new
2512  0000               _TIM1_ETRClockMode2Config:
2514  0000 89            	pushw	x
2515       00000000      OFST:	set	0
2518                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2520                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2522                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2524  0001 7b05          	ld	a,(OFST+5,sp)
2525  0003 88            	push	a
2526  0004 7b02          	ld	a,(OFST+2,sp)
2527  0006 95            	ld	xh,a
2528  0007 cd0000        	call	_TIM1_ETRConfig
2530  000a 721c5253      	bset	21075,#6
2531  000e 84            	pop	a
2532                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2534                     ; 707 }
2537  000f 85            	popw	x
2538  0010 81            	ret	
2594                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2594                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2594                     ; 727                     uint8_t ExtTRGFilter)
2594                     ; 728 {
2595                     .text:	section	.text,new
2596  0000               _TIM1_ETRConfig:
2598  0000 89            	pushw	x
2599       00000000      OFST:	set	0
2602                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2604                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2604                     ; 733                          (uint8_t)ExtTRGFilter );
2606  0001 9f            	ld	a,xl
2607  0002 1a01          	or	a,(OFST+1,sp)
2608  0004 1a05          	or	a,(OFST+5,sp)
2609  0006 ca5253        	or	a,21075
2610  0009 c75253        	ld	21075,a
2611                     ; 734 }
2614  000c 85            	popw	x
2615  000d 81            	ret	
2704                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2704                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2704                     ; 753                                  uint8_t ICFilter)
2704                     ; 754 {
2705                     .text:	section	.text,new
2706  0000               _TIM1_TIxExternalClockConfig:
2708  0000 89            	pushw	x
2709       00000000      OFST:	set	0
2712                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2714                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2716                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2718                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2720  0001 9e            	ld	a,xh
2721  0002 a160          	cp	a,#96
2722  0004 260d          	jrne	L1131
2723                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2725  0006 7b05          	ld	a,(OFST+5,sp)
2726  0008 88            	push	a
2727  0009 9f            	ld	a,xl
2728  000a ae0001        	ldw	x,#1
2729  000d 95            	ld	xh,a
2730  000e cd0000        	call	L5_TI2_Config
2733  0011 200c          	jra	L3131
2734  0013               L1131:
2735                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2737  0013 7b05          	ld	a,(OFST+5,sp)
2738  0015 88            	push	a
2739  0016 7b03          	ld	a,(OFST+3,sp)
2740  0018 ae0001        	ldw	x,#1
2741  001b 95            	ld	xh,a
2742  001c cd0000        	call	L3_TI1_Config
2744  001f               L3131:
2745  001f 84            	pop	a
2746                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2748  0020 7b01          	ld	a,(OFST+1,sp)
2749  0022 cd0000        	call	_TIM1_SelectInputTrigger
2751                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2753  0025 c65252        	ld	a,21074
2754  0028 aa07          	or	a,#7
2755  002a c75252        	ld	21074,a
2756                     ; 775 }
2759  002d 85            	popw	x
2760  002e 81            	ret	
2845                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2845                     ; 788 {
2846                     .text:	section	.text,new
2847  0000               _TIM1_SelectInputTrigger:
2849  0000 88            	push	a
2850       00000000      OFST:	set	0
2853                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2855                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2857  0001 c65252        	ld	a,21074
2858  0004 a48f          	and	a,#143
2859  0006 1a01          	or	a,(OFST+1,sp)
2860  0008 c75252        	ld	21074,a
2861                     ; 794 }
2864  000b 84            	pop	a
2865  000c 81            	ret	
2901                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2901                     ; 804 {
2902                     .text:	section	.text,new
2903  0000               _TIM1_UpdateDisableConfig:
2907                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2909                     ; 809   if (NewState != DISABLE)
2911  0000 4d            	tnz	a
2912  0001 2705          	jreq	L1731
2913                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2915  0003 72125250      	bset	21072,#1
2918  0007 81            	ret	
2919  0008               L1731:
2920                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2922  0008 72135250      	bres	21072,#1
2923                     ; 817 }
2926  000c 81            	ret	
2984                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2984                     ; 828 {
2985                     .text:	section	.text,new
2986  0000               _TIM1_UpdateRequestConfig:
2990                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2992                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2994  0000 4d            	tnz	a
2995  0001 2705          	jreq	L3241
2996                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
2998  0003 72145250      	bset	21072,#2
3001  0007 81            	ret	
3002  0008               L3241:
3003                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3005  0008 72155250      	bres	21072,#2
3006                     ; 841 }
3009  000c 81            	ret	
3045                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3045                     ; 850 {
3046                     .text:	section	.text,new
3047  0000               _TIM1_SelectHallSensor:
3051                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3053                     ; 855   if (NewState != DISABLE)
3055  0000 4d            	tnz	a
3056  0001 2705          	jreq	L5441
3057                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3059  0003 721e5251      	bset	21073,#7
3062  0007 81            	ret	
3063  0008               L5441:
3064                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3066  0008 721f5251      	bres	21073,#7
3067                     ; 863 }
3070  000c 81            	ret	
3127                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3127                     ; 874 {
3128                     .text:	section	.text,new
3129  0000               _TIM1_SelectOnePulseMode:
3133                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3135                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3137  0000 4d            	tnz	a
3138  0001 2705          	jreq	L7741
3139                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3141  0003 72165250      	bset	21072,#3
3144  0007 81            	ret	
3145  0008               L7741:
3146                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3148  0008 72175250      	bres	21072,#3
3149                     ; 888 }
3152  000c 81            	ret	
3250                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3250                     ; 904 {
3251                     .text:	section	.text,new
3252  0000               _TIM1_SelectOutputTrigger:
3254  0000 88            	push	a
3255       00000000      OFST:	set	0
3258                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3260                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3260                     ; 910                         (uint8_t) TIM1_TRGOSource);
3262  0001 c65251        	ld	a,21073
3263  0004 a48f          	and	a,#143
3264  0006 1a01          	or	a,(OFST+1,sp)
3265  0008 c75251        	ld	21073,a
3266                     ; 911 }
3269  000b 84            	pop	a
3270  000c 81            	ret	
3344                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3344                     ; 924 {
3345                     .text:	section	.text,new
3346  0000               _TIM1_SelectSlaveMode:
3348  0000 88            	push	a
3349       00000000      OFST:	set	0
3352                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3354                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3354                     ; 930                          (uint8_t)TIM1_SlaveMode);
3356  0001 c65252        	ld	a,21074
3357  0004 a4f8          	and	a,#248
3358  0006 1a01          	or	a,(OFST+1,sp)
3359  0008 c75252        	ld	21074,a
3360                     ; 931 }
3363  000b 84            	pop	a
3364  000c 81            	ret	
3400                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3400                     ; 940 {
3401                     .text:	section	.text,new
3402  0000               _TIM1_SelectMasterSlaveMode:
3406                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3408                     ; 945   if (NewState != DISABLE)
3410  0000 4d            	tnz	a
3411  0001 2705          	jreq	L3161
3412                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3414  0003 721e5252      	bset	21074,#7
3417  0007 81            	ret	
3418  0008               L3161:
3419                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3421  0008 721f5252      	bres	21074,#7
3422                     ; 953 }
3425  000c 81            	ret	
3511                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3511                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3511                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3511                     ; 978 {
3512                     .text:	section	.text,new
3513  0000               _TIM1_EncoderInterfaceConfig:
3515  0000 89            	pushw	x
3516       00000000      OFST:	set	0
3519                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3521                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3523                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3525                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3527  0001 9f            	ld	a,xl
3528  0002 4d            	tnz	a
3529  0003 2706          	jreq	L7561
3530                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3532  0005 7212525c      	bset	21084,#1
3534  0009 2004          	jra	L1661
3535  000b               L7561:
3536                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3538  000b 7213525c      	bres	21084,#1
3539  000f               L1661:
3540                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3542  000f 7b05          	ld	a,(OFST+5,sp)
3543  0011 2706          	jreq	L3661
3544                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3546  0013 721a525c      	bset	21084,#5
3548  0017 2004          	jra	L5661
3549  0019               L3661:
3550                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3552  0019 721b525c      	bres	21084,#5
3553  001d               L5661:
3554                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3554                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3556  001d c65252        	ld	a,21074
3557  0020 a4f0          	and	a,#240
3558  0022 1a01          	or	a,(OFST+1,sp)
3559  0024 c75252        	ld	21074,a
3560                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3560                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3562  0027 c65258        	ld	a,21080
3563  002a a4fc          	and	a,#252
3564  002c aa01          	or	a,#1
3565  002e c75258        	ld	21080,a
3566                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3566                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3568  0031 c65259        	ld	a,21081
3569  0034 a4fc          	and	a,#252
3570  0036 aa01          	or	a,#1
3571  0038 c75259        	ld	21081,a
3572                     ; 1011 }
3575  003b 85            	popw	x
3576  003c 81            	ret	
3643                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3643                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3643                     ; 1025 {
3644                     .text:	section	.text,new
3645  0000               _TIM1_PrescalerConfig:
3647  0000 89            	pushw	x
3648       00000000      OFST:	set	0
3651                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3653                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3655  0001 9e            	ld	a,xh
3656  0002 c75260        	ld	21088,a
3657                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3659  0005 9f            	ld	a,xl
3660  0006 c75261        	ld	21089,a
3661                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3663  0009 7b05          	ld	a,(OFST+5,sp)
3664  000b c75257        	ld	21079,a
3665                     ; 1035 }
3668  000e 85            	popw	x
3669  000f 81            	ret	
3705                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3705                     ; 1049 {
3706                     .text:	section	.text,new
3707  0000               _TIM1_CounterModeConfig:
3709  0000 88            	push	a
3710       00000000      OFST:	set	0
3713                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3715                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3715                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3717  0001 c65250        	ld	a,21072
3718  0004 a48f          	and	a,#143
3719  0006 1a01          	or	a,(OFST+1,sp)
3720  0008 c75250        	ld	21072,a
3721                     ; 1057 }
3724  000b 84            	pop	a
3725  000c 81            	ret	
3783                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3783                     ; 1068 {
3784                     .text:	section	.text,new
3785  0000               _TIM1_ForcedOC1Config:
3787  0000 88            	push	a
3788       00000000      OFST:	set	0
3791                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3793                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3793                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3795  0001 c65258        	ld	a,21080
3796  0004 a48f          	and	a,#143
3797  0006 1a01          	or	a,(OFST+1,sp)
3798  0008 c75258        	ld	21080,a
3799                     ; 1075 }
3802  000b 84            	pop	a
3803  000c 81            	ret	
3839                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3839                     ; 1086 {
3840                     .text:	section	.text,new
3841  0000               _TIM1_ForcedOC2Config:
3843  0000 88            	push	a
3844       00000000      OFST:	set	0
3847                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3849                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3849                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3851  0001 c65259        	ld	a,21081
3852  0004 a48f          	and	a,#143
3853  0006 1a01          	or	a,(OFST+1,sp)
3854  0008 c75259        	ld	21081,a
3855                     ; 1093 }
3858  000b 84            	pop	a
3859  000c 81            	ret	
3895                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3895                     ; 1105 {
3896                     .text:	section	.text,new
3897  0000               _TIM1_ForcedOC3Config:
3899  0000 88            	push	a
3900       00000000      OFST:	set	0
3903                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3905                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3905                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3907  0001 c6525a        	ld	a,21082
3908  0004 a48f          	and	a,#143
3909  0006 1a01          	or	a,(OFST+1,sp)
3910  0008 c7525a        	ld	21082,a
3911                     ; 1112 }
3914  000b 84            	pop	a
3915  000c 81            	ret	
3951                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3951                     ; 1124 {
3952                     .text:	section	.text,new
3953  0000               _TIM1_ForcedOC4Config:
3955  0000 88            	push	a
3956       00000000      OFST:	set	0
3959                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3961                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3961                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3963  0001 c6525b        	ld	a,21083
3964  0004 a48f          	and	a,#143
3965  0006 1a01          	or	a,(OFST+1,sp)
3966  0008 c7525b        	ld	21083,a
3967                     ; 1131 }
3970  000b 84            	pop	a
3971  000c 81            	ret	
4007                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
4007                     ; 1140 {
4008                     .text:	section	.text,new
4009  0000               _TIM1_ARRPreloadConfig:
4013                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4015                     ; 1145   if (NewState != DISABLE)
4017  0000 4d            	tnz	a
4018  0001 2705          	jreq	L5502
4019                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
4021  0003 721e5250      	bset	21072,#7
4024  0007 81            	ret	
4025  0008               L5502:
4026                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4028  0008 721f5250      	bres	21072,#7
4029                     ; 1153 }
4032  000c 81            	ret	
4067                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4067                     ; 1162 {
4068                     .text:	section	.text,new
4069  0000               _TIM1_SelectCOM:
4073                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4075                     ; 1167   if (NewState != DISABLE)
4077  0000 4d            	tnz	a
4078  0001 2705          	jreq	L7702
4079                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4081  0003 72145251      	bset	21073,#2
4084  0007 81            	ret	
4085  0008               L7702:
4086                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4088  0008 72155251      	bres	21073,#2
4089                     ; 1175 }
4092  000c 81            	ret	
4128                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4128                     ; 1184 {
4129                     .text:	section	.text,new
4130  0000               _TIM1_CCPreloadControl:
4134                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4136                     ; 1189   if (NewState != DISABLE)
4138  0000 4d            	tnz	a
4139  0001 2705          	jreq	L1212
4140                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4142  0003 72105251      	bset	21073,#0
4145  0007 81            	ret	
4146  0008               L1212:
4147                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4149  0008 72115251      	bres	21073,#0
4150                     ; 1197 }
4153  000c 81            	ret	
4189                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4189                     ; 1206 {
4190                     .text:	section	.text,new
4191  0000               _TIM1_OC1PreloadConfig:
4195                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4197                     ; 1211   if (NewState != DISABLE)
4199  0000 4d            	tnz	a
4200  0001 2705          	jreq	L3412
4201                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4203  0003 72165258      	bset	21080,#3
4206  0007 81            	ret	
4207  0008               L3412:
4208                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4210  0008 72175258      	bres	21080,#3
4211                     ; 1219 }
4214  000c 81            	ret	
4250                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4250                     ; 1228 {
4251                     .text:	section	.text,new
4252  0000               _TIM1_OC2PreloadConfig:
4256                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4258                     ; 1233   if (NewState != DISABLE)
4260  0000 4d            	tnz	a
4261  0001 2705          	jreq	L5612
4262                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4264  0003 72165259      	bset	21081,#3
4267  0007 81            	ret	
4268  0008               L5612:
4269                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4271  0008 72175259      	bres	21081,#3
4272                     ; 1241 }
4275  000c 81            	ret	
4311                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4311                     ; 1250 {
4312                     .text:	section	.text,new
4313  0000               _TIM1_OC3PreloadConfig:
4317                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4319                     ; 1255   if (NewState != DISABLE)
4321  0000 4d            	tnz	a
4322  0001 2705          	jreq	L7022
4323                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4325  0003 7216525a      	bset	21082,#3
4328  0007 81            	ret	
4329  0008               L7022:
4330                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4332  0008 7217525a      	bres	21082,#3
4333                     ; 1263 }
4336  000c 81            	ret	
4372                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4372                     ; 1272 {
4373                     .text:	section	.text,new
4374  0000               _TIM1_OC4PreloadConfig:
4378                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4380                     ; 1277   if (NewState != DISABLE)
4382  0000 4d            	tnz	a
4383  0001 2705          	jreq	L1322
4384                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4386  0003 7216525b      	bset	21083,#3
4389  0007 81            	ret	
4390  0008               L1322:
4391                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4393  0008 7217525b      	bres	21083,#3
4394                     ; 1285 }
4397  000c 81            	ret	
4432                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4432                     ; 1294 {
4433                     .text:	section	.text,new
4434  0000               _TIM1_OC1FastConfig:
4438                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4440                     ; 1299   if (NewState != DISABLE)
4442  0000 4d            	tnz	a
4443  0001 2705          	jreq	L3522
4444                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4446  0003 72145258      	bset	21080,#2
4449  0007 81            	ret	
4450  0008               L3522:
4451                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4453  0008 72155258      	bres	21080,#2
4454                     ; 1307 }
4457  000c 81            	ret	
4492                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4492                     ; 1316 {
4493                     .text:	section	.text,new
4494  0000               _TIM1_OC2FastConfig:
4498                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4500                     ; 1321   if (NewState != DISABLE)
4502  0000 4d            	tnz	a
4503  0001 2705          	jreq	L5722
4504                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4506  0003 72145259      	bset	21081,#2
4509  0007 81            	ret	
4510  0008               L5722:
4511                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4513  0008 72155259      	bres	21081,#2
4514                     ; 1329 }
4517  000c 81            	ret	
4552                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4552                     ; 1338 {
4553                     .text:	section	.text,new
4554  0000               _TIM1_OC3FastConfig:
4558                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4560                     ; 1343   if (NewState != DISABLE)
4562  0000 4d            	tnz	a
4563  0001 2705          	jreq	L7132
4564                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4566  0003 7214525a      	bset	21082,#2
4569  0007 81            	ret	
4570  0008               L7132:
4571                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4573  0008 7215525a      	bres	21082,#2
4574                     ; 1351 }
4577  000c 81            	ret	
4612                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4612                     ; 1360 {
4613                     .text:	section	.text,new
4614  0000               _TIM1_OC4FastConfig:
4618                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4620                     ; 1365   if (NewState != DISABLE)
4622  0000 4d            	tnz	a
4623  0001 2705          	jreq	L1432
4624                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4626  0003 7214525b      	bset	21083,#2
4629  0007 81            	ret	
4630  0008               L1432:
4631                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4633  0008 7215525b      	bres	21083,#2
4634                     ; 1373 }
4637  000c 81            	ret	
4742                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4742                     ; 1390 {
4743                     .text:	section	.text,new
4744  0000               _TIM1_GenerateEvent:
4748                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4750                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4752  0000 c75257        	ld	21079,a
4753                     ; 1396 }
4756  0003 81            	ret	
4792                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4792                     ; 1407 {
4793                     .text:	section	.text,new
4794  0000               _TIM1_OC1PolarityConfig:
4798                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4800                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4802  0000 4d            	tnz	a
4803  0001 2705          	jreq	L5242
4804                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4806  0003 7212525c      	bset	21084,#1
4809  0007 81            	ret	
4810  0008               L5242:
4811                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4813  0008 7213525c      	bres	21084,#1
4814                     ; 1420 }
4817  000c 81            	ret	
4853                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4853                     ; 1431 {
4854                     .text:	section	.text,new
4855  0000               _TIM1_OC1NPolarityConfig:
4859                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4861                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4863  0000 4d            	tnz	a
4864  0001 2705          	jreq	L7442
4865                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4867  0003 7216525c      	bset	21084,#3
4870  0007 81            	ret	
4871  0008               L7442:
4872                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4874  0008 7217525c      	bres	21084,#3
4875                     ; 1444 }
4878  000c 81            	ret	
4914                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4914                     ; 1455 {
4915                     .text:	section	.text,new
4916  0000               _TIM1_OC2PolarityConfig:
4920                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4922                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4924  0000 4d            	tnz	a
4925  0001 2705          	jreq	L1742
4926                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4928  0003 721a525c      	bset	21084,#5
4931  0007 81            	ret	
4932  0008               L1742:
4933                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4935  0008 721b525c      	bres	21084,#5
4936                     ; 1468 }
4939  000c 81            	ret	
4975                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4975                     ; 1479 {
4976                     .text:	section	.text,new
4977  0000               _TIM1_OC2NPolarityConfig:
4981                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4983                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4985  0000 4d            	tnz	a
4986  0001 2705          	jreq	L3152
4987                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4989  0003 721e525c      	bset	21084,#7
4992  0007 81            	ret	
4993  0008               L3152:
4994                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4996  0008 721f525c      	bres	21084,#7
4997                     ; 1492 }
5000  000c 81            	ret	
5036                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5036                     ; 1503 {
5037                     .text:	section	.text,new
5038  0000               _TIM1_OC3PolarityConfig:
5042                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5044                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5046  0000 4d            	tnz	a
5047  0001 2705          	jreq	L5352
5048                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5050  0003 7212525d      	bset	21085,#1
5053  0007 81            	ret	
5054  0008               L5352:
5055                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5057  0008 7213525d      	bres	21085,#1
5058                     ; 1516 }
5061  000c 81            	ret	
5097                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5097                     ; 1528 {
5098                     .text:	section	.text,new
5099  0000               _TIM1_OC3NPolarityConfig:
5103                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5105                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5107  0000 4d            	tnz	a
5108  0001 2705          	jreq	L7552
5109                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5111  0003 7216525d      	bset	21085,#3
5114  0007 81            	ret	
5115  0008               L7552:
5116                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5118  0008 7217525d      	bres	21085,#3
5119                     ; 1541 }
5122  000c 81            	ret	
5158                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5158                     ; 1552 {
5159                     .text:	section	.text,new
5160  0000               _TIM1_OC4PolarityConfig:
5164                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5166                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5168  0000 4d            	tnz	a
5169  0001 2705          	jreq	L1062
5170                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5172  0003 721a525d      	bset	21085,#5
5175  0007 81            	ret	
5176  0008               L1062:
5177                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5179  0008 721b525d      	bres	21085,#5
5180                     ; 1565 }
5183  000c 81            	ret	
5228                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5228                     ; 1580 {
5229                     .text:	section	.text,new
5230  0000               _TIM1_CCxCmd:
5232  0000 89            	pushw	x
5233       00000000      OFST:	set	0
5236                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5238                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5240                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5242  0001 9e            	ld	a,xh
5243  0002 4d            	tnz	a
5244  0003 2610          	jrne	L7262
5245                     ; 1588     if (NewState != DISABLE)
5247  0005 9f            	ld	a,xl
5248  0006 4d            	tnz	a
5249  0007 2706          	jreq	L1362
5250                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5252  0009 7210525c      	bset	21084,#0
5254  000d 203e          	jra	L5362
5255  000f               L1362:
5256                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5258  000f 7211525c      	bres	21084,#0
5259  0013 2038          	jra	L5362
5260  0015               L7262:
5261                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5263  0015 7b01          	ld	a,(OFST+1,sp)
5264  0017 a101          	cp	a,#1
5265  0019 2610          	jrne	L7362
5266                     ; 1601     if (NewState != DISABLE)
5268  001b 7b02          	ld	a,(OFST+2,sp)
5269  001d 2706          	jreq	L1462
5270                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5272  001f 7218525c      	bset	21084,#4
5274  0023 2028          	jra	L5362
5275  0025               L1462:
5276                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5278  0025 7219525c      	bres	21084,#4
5279  0029 2022          	jra	L5362
5280  002b               L7362:
5281                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5283  002b a102          	cp	a,#2
5284  002d 2610          	jrne	L7462
5285                     ; 1613     if (NewState != DISABLE)
5287  002f 7b02          	ld	a,(OFST+2,sp)
5288  0031 2706          	jreq	L1562
5289                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5291  0033 7210525d      	bset	21085,#0
5293  0037 2014          	jra	L5362
5294  0039               L1562:
5295                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5297  0039 7211525d      	bres	21085,#0
5298  003d 200e          	jra	L5362
5299  003f               L7462:
5300                     ; 1625     if (NewState != DISABLE)
5302  003f 7b02          	ld	a,(OFST+2,sp)
5303  0041 2706          	jreq	L7562
5304                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5306  0043 7218525d      	bset	21085,#4
5308  0047 2004          	jra	L5362
5309  0049               L7562:
5310                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5312  0049 7219525d      	bres	21085,#4
5313  004d               L5362:
5314                     ; 1634 }
5317  004d 85            	popw	x
5318  004e 81            	ret	
5363                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5363                     ; 1648 {
5364                     .text:	section	.text,new
5365  0000               _TIM1_CCxNCmd:
5367  0000 89            	pushw	x
5368       00000000      OFST:	set	0
5371                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5373                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5375                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5377  0001 9e            	ld	a,xh
5378  0002 4d            	tnz	a
5379  0003 2610          	jrne	L5072
5380                     ; 1656     if (NewState != DISABLE)
5382  0005 9f            	ld	a,xl
5383  0006 4d            	tnz	a
5384  0007 2706          	jreq	L7072
5385                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5387  0009 7214525c      	bset	21084,#2
5389  000d 2029          	jra	L3172
5390  000f               L7072:
5391                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5393  000f 7215525c      	bres	21084,#2
5394  0013 2023          	jra	L3172
5395  0015               L5072:
5396                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5398  0015 7b01          	ld	a,(OFST+1,sp)
5399  0017 4a            	dec	a
5400  0018 2610          	jrne	L5172
5401                     ; 1668     if (NewState != DISABLE)
5403  001a 7b02          	ld	a,(OFST+2,sp)
5404  001c 2706          	jreq	L7172
5405                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5407  001e 721c525c      	bset	21084,#6
5409  0022 2014          	jra	L3172
5410  0024               L7172:
5411                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5413  0024 721d525c      	bres	21084,#6
5414  0028 200e          	jra	L3172
5415  002a               L5172:
5416                     ; 1680     if (NewState != DISABLE)
5418  002a 7b02          	ld	a,(OFST+2,sp)
5419  002c 2706          	jreq	L5272
5420                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5422  002e 7214525d      	bset	21085,#2
5424  0032 2004          	jra	L3172
5425  0034               L5272:
5426                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5428  0034 7215525d      	bres	21085,#2
5429  0038               L3172:
5430                     ; 1689 }
5433  0038 85            	popw	x
5434  0039 81            	ret	
5479                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5479                     ; 1713 {
5480                     .text:	section	.text,new
5481  0000               _TIM1_SelectOCxM:
5483  0000 89            	pushw	x
5484       00000000      OFST:	set	0
5487                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5489                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5491                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5493  0001 9e            	ld	a,xh
5494  0002 4d            	tnz	a
5495  0003 2610          	jrne	L3572
5496                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5498  0005 7211525c      	bres	21084,#0
5499                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5499                     ; 1725                             | (uint8_t)TIM1_OCMode);
5501  0009 c65258        	ld	a,21080
5502  000c a48f          	and	a,#143
5503  000e 1a02          	or	a,(OFST+2,sp)
5504  0010 c75258        	ld	21080,a
5506  0013 2038          	jra	L5572
5507  0015               L3572:
5508                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5510  0015 7b01          	ld	a,(OFST+1,sp)
5511  0017 a101          	cp	a,#1
5512  0019 2610          	jrne	L7572
5513                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5515  001b 7219525c      	bres	21084,#4
5516                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5516                     ; 1734                             | (uint8_t)TIM1_OCMode);
5518  001f c65259        	ld	a,21081
5519  0022 a48f          	and	a,#143
5520  0024 1a02          	or	a,(OFST+2,sp)
5521  0026 c75259        	ld	21081,a
5523  0029 2022          	jra	L5572
5524  002b               L7572:
5525                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5527  002b a102          	cp	a,#2
5528  002d 2610          	jrne	L3672
5529                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5531  002f 7211525d      	bres	21085,#0
5532                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5532                     ; 1743                             | (uint8_t)TIM1_OCMode);
5534  0033 c6525a        	ld	a,21082
5535  0036 a48f          	and	a,#143
5536  0038 1a02          	or	a,(OFST+2,sp)
5537  003a c7525a        	ld	21082,a
5539  003d 200e          	jra	L5572
5540  003f               L3672:
5541                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5543  003f 7219525d      	bres	21085,#4
5544                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5544                     ; 1752                             | (uint8_t)TIM1_OCMode);
5546  0043 c6525b        	ld	a,21083
5547  0046 a48f          	and	a,#143
5548  0048 1a02          	or	a,(OFST+2,sp)
5549  004a c7525b        	ld	21083,a
5550  004d               L5572:
5551                     ; 1754 }
5554  004d 85            	popw	x
5555  004e 81            	ret	
5589                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5589                     ; 1763 {
5590                     .text:	section	.text,new
5591  0000               _TIM1_SetCounter:
5595                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5597  0000 9e            	ld	a,xh
5598  0001 c7525e        	ld	21086,a
5599                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5601  0004 9f            	ld	a,xl
5602  0005 c7525f        	ld	21087,a
5603                     ; 1767 }
5606  0008 81            	ret	
5640                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5640                     ; 1776 {
5641                     .text:	section	.text,new
5642  0000               _TIM1_SetAutoreload:
5646                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5648  0000 9e            	ld	a,xh
5649  0001 c75262        	ld	21090,a
5650                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5652  0004 9f            	ld	a,xl
5653  0005 c75263        	ld	21091,a
5654                     ; 1780  }
5657  0008 81            	ret	
5691                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5691                     ; 1789 {
5692                     .text:	section	.text,new
5693  0000               _TIM1_SetCompare1:
5697                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5699  0000 9e            	ld	a,xh
5700  0001 c75265        	ld	21093,a
5701                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5703  0004 9f            	ld	a,xl
5704  0005 c75266        	ld	21094,a
5705                     ; 1793 }
5708  0008 81            	ret	
5742                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5742                     ; 1802 {
5743                     .text:	section	.text,new
5744  0000               _TIM1_SetCompare2:
5748                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5750  0000 9e            	ld	a,xh
5751  0001 c75267        	ld	21095,a
5752                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5754  0004 9f            	ld	a,xl
5755  0005 c75268        	ld	21096,a
5756                     ; 1806 }
5759  0008 81            	ret	
5793                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5793                     ; 1815 {
5794                     .text:	section	.text,new
5795  0000               _TIM1_SetCompare3:
5799                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5801  0000 9e            	ld	a,xh
5802  0001 c75269        	ld	21097,a
5803                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5805  0004 9f            	ld	a,xl
5806  0005 c7526a        	ld	21098,a
5807                     ; 1819 }
5810  0008 81            	ret	
5844                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5844                     ; 1828 {
5845                     .text:	section	.text,new
5846  0000               _TIM1_SetCompare4:
5850                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5852  0000 9e            	ld	a,xh
5853  0001 c7526b        	ld	21099,a
5854                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5856  0004 9f            	ld	a,xl
5857  0005 c7526c        	ld	21100,a
5858                     ; 1832 }
5861  0008 81            	ret	
5897                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5897                     ; 1845 {
5898                     .text:	section	.text,new
5899  0000               _TIM1_SetIC1Prescaler:
5901  0000 88            	push	a
5902       00000000      OFST:	set	0
5905                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5907                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5907                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5909  0001 c65258        	ld	a,21080
5910  0004 a4f3          	and	a,#243
5911  0006 1a01          	or	a,(OFST+1,sp)
5912  0008 c75258        	ld	21080,a
5913                     ; 1852 }
5916  000b 84            	pop	a
5917  000c 81            	ret	
5953                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5953                     ; 1865 {
5954                     .text:	section	.text,new
5955  0000               _TIM1_SetIC2Prescaler:
5957  0000 88            	push	a
5958       00000000      OFST:	set	0
5961                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5963                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5963                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5965  0001 c65259        	ld	a,21081
5966  0004 a4f3          	and	a,#243
5967  0006 1a01          	or	a,(OFST+1,sp)
5968  0008 c75259        	ld	21081,a
5969                     ; 1873 }
5972  000b 84            	pop	a
5973  000c 81            	ret	
6009                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6009                     ; 1886 {
6010                     .text:	section	.text,new
6011  0000               _TIM1_SetIC3Prescaler:
6013  0000 88            	push	a
6014       00000000      OFST:	set	0
6017                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6019                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6019                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
6021  0001 c6525a        	ld	a,21082
6022  0004 a4f3          	and	a,#243
6023  0006 1a01          	or	a,(OFST+1,sp)
6024  0008 c7525a        	ld	21082,a
6025                     ; 1894 }
6028  000b 84            	pop	a
6029  000c 81            	ret	
6065                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6065                     ; 1907 {
6066                     .text:	section	.text,new
6067  0000               _TIM1_SetIC4Prescaler:
6069  0000 88            	push	a
6070       00000000      OFST:	set	0
6073                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6075                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6075                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6077  0001 c6525b        	ld	a,21083
6078  0004 a4f3          	and	a,#243
6079  0006 1a01          	or	a,(OFST+1,sp)
6080  0008 c7525b        	ld	21083,a
6081                     ; 1915 }
6084  000b 84            	pop	a
6085  000c 81            	ret	
6137                     ; 1922 uint16_t TIM1_GetCapture1(void)
6137                     ; 1923 {
6138                     .text:	section	.text,new
6139  0000               _TIM1_GetCapture1:
6141  0000 5204          	subw	sp,#4
6142       00000004      OFST:	set	4
6145                     ; 1926   uint16_t tmpccr1 = 0;
6147                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6151                     ; 1929   tmpccr1h = TIM1->CCR1H;
6153  0002 c65265        	ld	a,21093
6154  0005 6b02          	ld	(OFST-2,sp),a
6156                     ; 1930   tmpccr1l = TIM1->CCR1L;
6158  0007 c65266        	ld	a,21094
6159  000a 6b01          	ld	(OFST-3,sp),a
6161                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6163  000c 5f            	clrw	x
6164  000d 97            	ld	xl,a
6165  000e 1f03          	ldw	(OFST-1,sp),x
6167                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6169  0010 5f            	clrw	x
6170  0011 7b02          	ld	a,(OFST-2,sp)
6171  0013 97            	ld	xl,a
6172  0014 7b04          	ld	a,(OFST+0,sp)
6173  0016 01            	rrwa	x,a
6174  0017 1a03          	or	a,(OFST-1,sp)
6175  0019 01            	rrwa	x,a
6177                     ; 1935   return (uint16_t)tmpccr1;
6181  001a 5b04          	addw	sp,#4
6182  001c 81            	ret	
6234                     ; 1943 uint16_t TIM1_GetCapture2(void)
6234                     ; 1944 {
6235                     .text:	section	.text,new
6236  0000               _TIM1_GetCapture2:
6238  0000 5204          	subw	sp,#4
6239       00000004      OFST:	set	4
6242                     ; 1947   uint16_t tmpccr2 = 0;
6244                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6248                     ; 1950   tmpccr2h = TIM1->CCR2H;
6250  0002 c65267        	ld	a,21095
6251  0005 6b02          	ld	(OFST-2,sp),a
6253                     ; 1951   tmpccr2l = TIM1->CCR2L;
6255  0007 c65268        	ld	a,21096
6256  000a 6b01          	ld	(OFST-3,sp),a
6258                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6260  000c 5f            	clrw	x
6261  000d 97            	ld	xl,a
6262  000e 1f03          	ldw	(OFST-1,sp),x
6264                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6266  0010 5f            	clrw	x
6267  0011 7b02          	ld	a,(OFST-2,sp)
6268  0013 97            	ld	xl,a
6269  0014 7b04          	ld	a,(OFST+0,sp)
6270  0016 01            	rrwa	x,a
6271  0017 1a03          	or	a,(OFST-1,sp)
6272  0019 01            	rrwa	x,a
6274                     ; 1956   return (uint16_t)tmpccr2;
6278  001a 5b04          	addw	sp,#4
6279  001c 81            	ret	
6331                     ; 1964 uint16_t TIM1_GetCapture3(void)
6331                     ; 1965 {
6332                     .text:	section	.text,new
6333  0000               _TIM1_GetCapture3:
6335  0000 5204          	subw	sp,#4
6336       00000004      OFST:	set	4
6339                     ; 1967   uint16_t tmpccr3 = 0;
6341                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6345                     ; 1970   tmpccr3h = TIM1->CCR3H;
6347  0002 c65269        	ld	a,21097
6348  0005 6b02          	ld	(OFST-2,sp),a
6350                     ; 1971   tmpccr3l = TIM1->CCR3L;
6352  0007 c6526a        	ld	a,21098
6353  000a 6b01          	ld	(OFST-3,sp),a
6355                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6357  000c 5f            	clrw	x
6358  000d 97            	ld	xl,a
6359  000e 1f03          	ldw	(OFST-1,sp),x
6361                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6363  0010 5f            	clrw	x
6364  0011 7b02          	ld	a,(OFST-2,sp)
6365  0013 97            	ld	xl,a
6366  0014 7b04          	ld	a,(OFST+0,sp)
6367  0016 01            	rrwa	x,a
6368  0017 1a03          	or	a,(OFST-1,sp)
6369  0019 01            	rrwa	x,a
6371                     ; 1976   return (uint16_t)tmpccr3;
6375  001a 5b04          	addw	sp,#4
6376  001c 81            	ret	
6428                     ; 1984 uint16_t TIM1_GetCapture4(void)
6428                     ; 1985 {
6429                     .text:	section	.text,new
6430  0000               _TIM1_GetCapture4:
6432  0000 5204          	subw	sp,#4
6433       00000004      OFST:	set	4
6436                     ; 1987   uint16_t tmpccr4 = 0;
6438                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6442                     ; 1990   tmpccr4h = TIM1->CCR4H;
6444  0002 c6526b        	ld	a,21099
6445  0005 6b02          	ld	(OFST-2,sp),a
6447                     ; 1991   tmpccr4l = TIM1->CCR4L;
6449  0007 c6526c        	ld	a,21100
6450  000a 6b01          	ld	(OFST-3,sp),a
6452                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6454  000c 5f            	clrw	x
6455  000d 97            	ld	xl,a
6456  000e 1f03          	ldw	(OFST-1,sp),x
6458                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6460  0010 5f            	clrw	x
6461  0011 7b02          	ld	a,(OFST-2,sp)
6462  0013 97            	ld	xl,a
6463  0014 7b04          	ld	a,(OFST+0,sp)
6464  0016 01            	rrwa	x,a
6465  0017 1a03          	or	a,(OFST-1,sp)
6466  0019 01            	rrwa	x,a
6468                     ; 1996   return (uint16_t)tmpccr4;
6472  001a 5b04          	addw	sp,#4
6473  001c 81            	ret	
6507                     ; 2004 uint16_t TIM1_GetCounter(void)
6507                     ; 2005 {
6508                     .text:	section	.text,new
6509  0000               _TIM1_GetCounter:
6511  0000 89            	pushw	x
6512       00000002      OFST:	set	2
6515                     ; 2006   uint16_t tmpcntr = 0;
6517                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6519  0001 c6525e        	ld	a,21086
6520  0004 97            	ld	xl,a
6521  0005 4f            	clr	a
6522  0006 02            	rlwa	x,a
6523  0007 1f01          	ldw	(OFST-1,sp),x
6525                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6527  0009 c6525f        	ld	a,21087
6528  000c 5f            	clrw	x
6529  000d 97            	ld	xl,a
6530  000e 01            	rrwa	x,a
6531  000f 1a02          	or	a,(OFST+0,sp)
6532  0011 01            	rrwa	x,a
6533  0012 1a01          	or	a,(OFST-1,sp)
6534  0014 01            	rrwa	x,a
6537  0015 5b02          	addw	sp,#2
6538  0017 81            	ret	
6572                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6572                     ; 2020 {
6573                     .text:	section	.text,new
6574  0000               _TIM1_GetPrescaler:
6576  0000 89            	pushw	x
6577       00000002      OFST:	set	2
6580                     ; 2021   uint16_t temp = 0;
6582                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6584  0001 c65260        	ld	a,21088
6585  0004 97            	ld	xl,a
6586  0005 4f            	clr	a
6587  0006 02            	rlwa	x,a
6588  0007 1f01          	ldw	(OFST-1,sp),x
6590                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6592  0009 c65261        	ld	a,21089
6593  000c 5f            	clrw	x
6594  000d 97            	ld	xl,a
6595  000e 01            	rrwa	x,a
6596  000f 1a02          	or	a,(OFST+0,sp)
6597  0011 01            	rrwa	x,a
6598  0012 1a01          	or	a,(OFST-1,sp)
6599  0014 01            	rrwa	x,a
6602  0015 5b02          	addw	sp,#2
6603  0017 81            	ret	
6777                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6777                     ; 2048 {
6778                     .text:	section	.text,new
6779  0000               _TIM1_GetFlagStatus:
6781  0000 89            	pushw	x
6782  0001 89            	pushw	x
6783       00000002      OFST:	set	2
6786                     ; 2049   FlagStatus bitstatus = RESET;
6788                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6792                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6794                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6796  0002 9f            	ld	a,xl
6797  0003 c45255        	and	a,21077
6798  0006 6b01          	ld	(OFST-1,sp),a
6800                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6802  0008 7b03          	ld	a,(OFST+1,sp)
6803  000a 6b02          	ld	(OFST+0,sp),a
6805                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6807  000c c45256        	and	a,21078
6808  000f 1a01          	or	a,(OFST-1,sp)
6809  0011 2702          	jreq	L5643
6810                     ; 2060     bitstatus = SET;
6812  0013 a601          	ld	a,#1
6815  0015               L5643:
6816                     ; 2064     bitstatus = RESET;
6819                     ; 2066   return (FlagStatus)(bitstatus);
6823  0015 5b04          	addw	sp,#4
6824  0017 81            	ret	
6859                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6859                     ; 2088 {
6860                     .text:	section	.text,new
6861  0000               _TIM1_ClearFlag:
6863  0000 89            	pushw	x
6864       00000000      OFST:	set	0
6867                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6869                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6871  0001 9f            	ld	a,xl
6872  0002 43            	cpl	a
6873  0003 c75255        	ld	21077,a
6874                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6874                     ; 2095                         (uint8_t)0x1E);
6876  0006 7b01          	ld	a,(OFST+1,sp)
6877  0008 43            	cpl	a
6878  0009 a41e          	and	a,#30
6879  000b c75256        	ld	21078,a
6880                     ; 2096 }
6883  000e 85            	popw	x
6884  000f 81            	ret	
6948                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6948                     ; 2113 {
6949                     .text:	section	.text,new
6950  0000               _TIM1_GetITStatus:
6952  0000 88            	push	a
6953  0001 89            	pushw	x
6954       00000002      OFST:	set	2
6957                     ; 2114   ITStatus bitstatus = RESET;
6959                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6963                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6965                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6967  0002 c45255        	and	a,21077
6968  0005 6b01          	ld	(OFST-1,sp),a
6970                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6972  0007 c65254        	ld	a,21076
6973  000a 1403          	and	a,(OFST+1,sp)
6974  000c 6b02          	ld	(OFST+0,sp),a
6976                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6978  000e 7b01          	ld	a,(OFST-1,sp)
6979  0010 2708          	jreq	L1453
6981  0012 7b02          	ld	a,(OFST+0,sp)
6982  0014 2704          	jreq	L1453
6983                     ; 2126     bitstatus = SET;
6985  0016 a601          	ld	a,#1
6988  0018 2001          	jra	L3453
6989  001a               L1453:
6990                     ; 2130     bitstatus = RESET;
6992  001a 4f            	clr	a
6994  001b               L3453:
6995                     ; 2132   return (ITStatus)(bitstatus);
6999  001b 5b03          	addw	sp,#3
7000  001d 81            	ret	
7036                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7036                     ; 2150 {
7037                     .text:	section	.text,new
7038  0000               _TIM1_ClearITPendingBit:
7042                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
7044                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7046  0000 43            	cpl	a
7047  0001 c75255        	ld	21077,a
7048                     ; 2156 }
7051  0004 81            	ret	
7103                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7103                     ; 2175                        uint8_t TIM1_ICSelection,
7103                     ; 2176                        uint8_t TIM1_ICFilter)
7103                     ; 2177 {
7104                     .text:	section	.text,new
7105  0000               L3_TI1_Config:
7107  0000 89            	pushw	x
7108  0001 88            	push	a
7109       00000001      OFST:	set	1
7112                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7114  0002 7211525c      	bres	21084,#0
7115                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7115                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7117  0006 7b06          	ld	a,(OFST+5,sp)
7118  0008 97            	ld	xl,a
7119  0009 a610          	ld	a,#16
7120  000b 42            	mul	x,a
7121  000c 9f            	ld	a,xl
7122  000d 1a03          	or	a,(OFST+2,sp)
7123  000f 6b01          	ld	(OFST+0,sp),a
7125  0011 c65258        	ld	a,21080
7126  0014 a40c          	and	a,#12
7127  0016 1a01          	or	a,(OFST+0,sp)
7128  0018 c75258        	ld	21080,a
7129                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7131  001b 7b02          	ld	a,(OFST+1,sp)
7132  001d 2706          	jreq	L1163
7133                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7135  001f 7212525c      	bset	21084,#1
7137  0023 2004          	jra	L3163
7138  0025               L1163:
7139                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7141  0025 7213525c      	bres	21084,#1
7142  0029               L3163:
7143                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7145  0029 7210525c      	bset	21084,#0
7146                     ; 2197 }
7149  002d 5b03          	addw	sp,#3
7150  002f 81            	ret	
7202                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7202                     ; 2216                        uint8_t TIM1_ICSelection,
7202                     ; 2217                        uint8_t TIM1_ICFilter)
7202                     ; 2218 {
7203                     .text:	section	.text,new
7204  0000               L5_TI2_Config:
7206  0000 89            	pushw	x
7207  0001 88            	push	a
7208       00000001      OFST:	set	1
7211                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7213  0002 7219525c      	bres	21084,#4
7214                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7214                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7216  0006 7b06          	ld	a,(OFST+5,sp)
7217  0008 97            	ld	xl,a
7218  0009 a610          	ld	a,#16
7219  000b 42            	mul	x,a
7220  000c 9f            	ld	a,xl
7221  000d 1a03          	or	a,(OFST+2,sp)
7222  000f 6b01          	ld	(OFST+0,sp),a
7224  0011 c65259        	ld	a,21081
7225  0014 a40c          	and	a,#12
7226  0016 1a01          	or	a,(OFST+0,sp)
7227  0018 c75259        	ld	21081,a
7228                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7230  001b 7b02          	ld	a,(OFST+1,sp)
7231  001d 2706          	jreq	L3463
7232                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7234  001f 721a525c      	bset	21084,#5
7236  0023 2004          	jra	L5463
7237  0025               L3463:
7238                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7240  0025 721b525c      	bres	21084,#5
7241  0029               L5463:
7242                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7244  0029 7218525c      	bset	21084,#4
7245                     ; 2236 }
7248  002d 5b03          	addw	sp,#3
7249  002f 81            	ret	
7301                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7301                     ; 2255                        uint8_t TIM1_ICSelection,
7301                     ; 2256                        uint8_t TIM1_ICFilter)
7301                     ; 2257 {
7302                     .text:	section	.text,new
7303  0000               L7_TI3_Config:
7305  0000 89            	pushw	x
7306  0001 88            	push	a
7307       00000001      OFST:	set	1
7310                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7312  0002 7211525d      	bres	21085,#0
7313                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7313                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7315  0006 7b06          	ld	a,(OFST+5,sp)
7316  0008 97            	ld	xl,a
7317  0009 a610          	ld	a,#16
7318  000b 42            	mul	x,a
7319  000c 9f            	ld	a,xl
7320  000d 1a03          	or	a,(OFST+2,sp)
7321  000f 6b01          	ld	(OFST+0,sp),a
7323  0011 c6525a        	ld	a,21082
7324  0014 a40c          	and	a,#12
7325  0016 1a01          	or	a,(OFST+0,sp)
7326  0018 c7525a        	ld	21082,a
7327                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7329  001b 7b02          	ld	a,(OFST+1,sp)
7330  001d 2706          	jreq	L5763
7331                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7333  001f 7212525d      	bset	21085,#1
7335  0023 2004          	jra	L7763
7336  0025               L5763:
7337                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7339  0025 7213525d      	bres	21085,#1
7340  0029               L7763:
7341                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7343  0029 7210525d      	bset	21085,#0
7344                     ; 2276 }
7347  002d 5b03          	addw	sp,#3
7348  002f 81            	ret	
7400                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7400                     ; 2295                        uint8_t TIM1_ICSelection,
7400                     ; 2296                        uint8_t TIM1_ICFilter)
7400                     ; 2297 {
7401                     .text:	section	.text,new
7402  0000               L11_TI4_Config:
7404  0000 89            	pushw	x
7405  0001 88            	push	a
7406       00000001      OFST:	set	1
7409                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7411  0002 7219525d      	bres	21085,#4
7412                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7412                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7414  0006 7b06          	ld	a,(OFST+5,sp)
7415  0008 97            	ld	xl,a
7416  0009 a610          	ld	a,#16
7417  000b 42            	mul	x,a
7418  000c 9f            	ld	a,xl
7419  000d 1a03          	or	a,(OFST+2,sp)
7420  000f 6b01          	ld	(OFST+0,sp),a
7422  0011 c6525b        	ld	a,21083
7423  0014 a40c          	and	a,#12
7424  0016 1a01          	or	a,(OFST+0,sp)
7425  0018 c7525b        	ld	21083,a
7426                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7428  001b 7b02          	ld	a,(OFST+1,sp)
7429  001d 2706          	jreq	L7273
7430                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7432  001f 721a525d      	bset	21085,#5
7434  0023 2004          	jra	L1373
7435  0025               L7273:
7436                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7438  0025 721b525d      	bres	21085,#5
7439  0029               L1373:
7440                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7442  0029 7218525d      	bset	21085,#4
7443                     ; 2317 }
7446  002d 5b03          	addw	sp,#3
7447  002f 81            	ret	
7460                     	xdef	_TIM1_ClearITPendingBit
7461                     	xdef	_TIM1_GetITStatus
7462                     	xdef	_TIM1_ClearFlag
7463                     	xdef	_TIM1_GetFlagStatus
7464                     	xdef	_TIM1_GetPrescaler
7465                     	xdef	_TIM1_GetCounter
7466                     	xdef	_TIM1_GetCapture4
7467                     	xdef	_TIM1_GetCapture3
7468                     	xdef	_TIM1_GetCapture2
7469                     	xdef	_TIM1_GetCapture1
7470                     	xdef	_TIM1_SetIC4Prescaler
7471                     	xdef	_TIM1_SetIC3Prescaler
7472                     	xdef	_TIM1_SetIC2Prescaler
7473                     	xdef	_TIM1_SetIC1Prescaler
7474                     	xdef	_TIM1_SetCompare4
7475                     	xdef	_TIM1_SetCompare3
7476                     	xdef	_TIM1_SetCompare2
7477                     	xdef	_TIM1_SetCompare1
7478                     	xdef	_TIM1_SetAutoreload
7479                     	xdef	_TIM1_SetCounter
7480                     	xdef	_TIM1_SelectOCxM
7481                     	xdef	_TIM1_CCxNCmd
7482                     	xdef	_TIM1_CCxCmd
7483                     	xdef	_TIM1_OC4PolarityConfig
7484                     	xdef	_TIM1_OC3NPolarityConfig
7485                     	xdef	_TIM1_OC3PolarityConfig
7486                     	xdef	_TIM1_OC2NPolarityConfig
7487                     	xdef	_TIM1_OC2PolarityConfig
7488                     	xdef	_TIM1_OC1NPolarityConfig
7489                     	xdef	_TIM1_OC1PolarityConfig
7490                     	xdef	_TIM1_GenerateEvent
7491                     	xdef	_TIM1_OC4FastConfig
7492                     	xdef	_TIM1_OC3FastConfig
7493                     	xdef	_TIM1_OC2FastConfig
7494                     	xdef	_TIM1_OC1FastConfig
7495                     	xdef	_TIM1_OC4PreloadConfig
7496                     	xdef	_TIM1_OC3PreloadConfig
7497                     	xdef	_TIM1_OC2PreloadConfig
7498                     	xdef	_TIM1_OC1PreloadConfig
7499                     	xdef	_TIM1_CCPreloadControl
7500                     	xdef	_TIM1_SelectCOM
7501                     	xdef	_TIM1_ARRPreloadConfig
7502                     	xdef	_TIM1_ForcedOC4Config
7503                     	xdef	_TIM1_ForcedOC3Config
7504                     	xdef	_TIM1_ForcedOC2Config
7505                     	xdef	_TIM1_ForcedOC1Config
7506                     	xdef	_TIM1_CounterModeConfig
7507                     	xdef	_TIM1_PrescalerConfig
7508                     	xdef	_TIM1_EncoderInterfaceConfig
7509                     	xdef	_TIM1_SelectMasterSlaveMode
7510                     	xdef	_TIM1_SelectSlaveMode
7511                     	xdef	_TIM1_SelectOutputTrigger
7512                     	xdef	_TIM1_SelectOnePulseMode
7513                     	xdef	_TIM1_SelectHallSensor
7514                     	xdef	_TIM1_UpdateRequestConfig
7515                     	xdef	_TIM1_UpdateDisableConfig
7516                     	xdef	_TIM1_SelectInputTrigger
7517                     	xdef	_TIM1_TIxExternalClockConfig
7518                     	xdef	_TIM1_ETRConfig
7519                     	xdef	_TIM1_ETRClockMode2Config
7520                     	xdef	_TIM1_ETRClockMode1Config
7521                     	xdef	_TIM1_InternalClockConfig
7522                     	xdef	_TIM1_ITConfig
7523                     	xdef	_TIM1_CtrlPWMOutputs
7524                     	xdef	_TIM1_Cmd
7525                     	xdef	_TIM1_PWMIConfig
7526                     	xdef	_TIM1_ICInit
7527                     	xdef	_TIM1_BDTRConfig
7528                     	xdef	_TIM1_OC4Init
7529                     	xdef	_TIM1_OC3Init
7530                     	xdef	_TIM1_OC2Init
7531                     	xdef	_TIM1_OC1Init
7532                     	xdef	_TIM1_TimeBaseInit
7533                     	xdef	_TIM1_DeInit
7552                     	end
