   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 52 void TIM2_DeInit(void)
  49                     ; 53 {
  51                     .text:	section	.text,new
  52  0000               _TIM2_DeInit:
  56                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  58  0000 725f5300      	clr	21248
  59                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  61  0004 725f5303      	clr	21251
  62                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  64  0008 725f5305      	clr	21253
  65                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  67  000c 725f530a      	clr	21258
  68                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  70  0010 725f530b      	clr	21259
  71                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  73  0014 725f530a      	clr	21258
  74                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  76  0018 725f530b      	clr	21259
  77                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  79  001c 725f5307      	clr	21255
  80                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  82  0020 725f5308      	clr	21256
  83                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  85  0024 725f5309      	clr	21257
  86                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  88  0028 725f530c      	clr	21260
  89                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  91  002c 725f530d      	clr	21261
  92                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  94  0030 725f530e      	clr	21262
  95                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  97  0034 35ff530f      	mov	21263,#255
  98                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
 100  0038 35ff5310      	mov	21264,#255
 101                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 103  003c 725f5311      	clr	21265
 104                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 106  0040 725f5312      	clr	21266
 107                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 109  0044 725f5313      	clr	21267
 110                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 112  0048 725f5314      	clr	21268
 113                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 115  004c 725f5315      	clr	21269
 116                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 118  0050 725f5316      	clr	21270
 119                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 121  0054 725f5304      	clr	21252
 122                     ; 81 }
 125  0058 81            	ret	
 293                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 293                     ; 90                         uint16_t TIM2_Period)
 293                     ; 91 {
 294                     .text:	section	.text,new
 295  0000               _TIM2_TimeBaseInit:
 297  0000 88            	push	a
 298       00000000      OFST:	set	0
 301                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 303  0001 c7530e        	ld	21262,a
 304                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 306  0004 7b04          	ld	a,(OFST+4,sp)
 307  0006 c7530f        	ld	21263,a
 308                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 310  0009 7b05          	ld	a,(OFST+5,sp)
 311  000b c75310        	ld	21264,a
 312                     ; 97 }
 315  000e 84            	pop	a
 316  000f 81            	ret	
 473                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 473                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 473                     ; 110                   uint16_t TIM2_Pulse,
 473                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 473                     ; 112 {
 474                     .text:	section	.text,new
 475  0000               _TIM2_OC1Init:
 477  0000 89            	pushw	x
 478  0001 88            	push	a
 479       00000001      OFST:	set	1
 482                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 484                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 486                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 488                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 490  0002 c6530a        	ld	a,21258
 491  0005 a4fc          	and	a,#252
 492  0007 c7530a        	ld	21258,a
 493                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 493                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 495  000a 7b08          	ld	a,(OFST+7,sp)
 496  000c a402          	and	a,#2
 497  000e 6b01          	ld	(OFST+0,sp),a
 499  0010 9f            	ld	a,xl
 500  0011 a401          	and	a,#1
 501  0013 1a01          	or	a,(OFST+0,sp)
 502  0015 ca530a        	or	a,21258
 503  0018 c7530a        	ld	21258,a
 504                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 504                     ; 126                           (uint8_t)TIM2_OCMode);
 506  001b c65307        	ld	a,21255
 507  001e a48f          	and	a,#143
 508  0020 1a02          	or	a,(OFST+1,sp)
 509  0022 c75307        	ld	21255,a
 510                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 512  0025 7b06          	ld	a,(OFST+5,sp)
 513  0027 c75311        	ld	21265,a
 514                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 516  002a 7b07          	ld	a,(OFST+6,sp)
 517  002c c75312        	ld	21266,a
 518                     ; 131 }
 521  002f 5b03          	addw	sp,#3
 522  0031 81            	ret	
 586                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 586                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 586                     ; 144                   uint16_t TIM2_Pulse,
 586                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 586                     ; 146 {
 587                     .text:	section	.text,new
 588  0000               _TIM2_OC2Init:
 590  0000 89            	pushw	x
 591  0001 88            	push	a
 592       00000001      OFST:	set	1
 595                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 597                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 599                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 601                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 603  0002 c6530a        	ld	a,21258
 604  0005 a4cf          	and	a,#207
 605  0007 c7530a        	ld	21258,a
 606                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 606                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 608  000a 7b08          	ld	a,(OFST+7,sp)
 609  000c a420          	and	a,#32
 610  000e 6b01          	ld	(OFST+0,sp),a
 612  0010 9f            	ld	a,xl
 613  0011 a410          	and	a,#16
 614  0013 1a01          	or	a,(OFST+0,sp)
 615  0015 ca530a        	or	a,21258
 616  0018 c7530a        	ld	21258,a
 617                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 617                     ; 162                           (uint8_t)TIM2_OCMode);
 619  001b c65308        	ld	a,21256
 620  001e a48f          	and	a,#143
 621  0020 1a02          	or	a,(OFST+1,sp)
 622  0022 c75308        	ld	21256,a
 623                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 625  0025 7b06          	ld	a,(OFST+5,sp)
 626  0027 c75313        	ld	21267,a
 627                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 629  002a 7b07          	ld	a,(OFST+6,sp)
 630  002c c75314        	ld	21268,a
 631                     ; 168 }
 634  002f 5b03          	addw	sp,#3
 635  0031 81            	ret	
 699                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 699                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 699                     ; 181                   uint16_t TIM2_Pulse,
 699                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 699                     ; 183 {
 700                     .text:	section	.text,new
 701  0000               _TIM2_OC3Init:
 703  0000 89            	pushw	x
 704  0001 88            	push	a
 705       00000001      OFST:	set	1
 708                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 710                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 712                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 714                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 716  0002 c6530b        	ld	a,21259
 717  0005 a4fc          	and	a,#252
 718  0007 c7530b        	ld	21259,a
 719                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 719                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 721  000a 7b08          	ld	a,(OFST+7,sp)
 722  000c a402          	and	a,#2
 723  000e 6b01          	ld	(OFST+0,sp),a
 725  0010 9f            	ld	a,xl
 726  0011 a401          	and	a,#1
 727  0013 1a01          	or	a,(OFST+0,sp)
 728  0015 ca530b        	or	a,21259
 729  0018 c7530b        	ld	21259,a
 730                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 730                     ; 196                           (uint8_t)TIM2_OCMode);
 732  001b c65309        	ld	a,21257
 733  001e a48f          	and	a,#143
 734  0020 1a02          	or	a,(OFST+1,sp)
 735  0022 c75309        	ld	21257,a
 736                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 738  0025 7b06          	ld	a,(OFST+5,sp)
 739  0027 c75315        	ld	21269,a
 740                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 742  002a 7b07          	ld	a,(OFST+6,sp)
 743  002c c75316        	ld	21270,a
 744                     ; 201 }
 747  002f 5b03          	addw	sp,#3
 748  0031 81            	ret	
 941                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 941                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 941                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 941                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 941                     ; 216                  uint8_t TIM2_ICFilter)
 941                     ; 217 {
 942                     .text:	section	.text,new
 943  0000               _TIM2_ICInit:
 945  0000 89            	pushw	x
 946       00000000      OFST:	set	0
 949                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 951                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 953                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 955                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 957                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 959                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
 961  0001 9e            	ld	a,xh
 962  0002 4d            	tnz	a
 963  0003 2614          	jrne	L104
 964                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
 964                     ; 229                (uint8_t)TIM2_ICSelection,
 964                     ; 230                (uint8_t)TIM2_ICFilter);
 966  0005 7b07          	ld	a,(OFST+7,sp)
 967  0007 88            	push	a
 968  0008 7b06          	ld	a,(OFST+6,sp)
 969  000a 97            	ld	xl,a
 970  000b 7b03          	ld	a,(OFST+3,sp)
 971  000d 95            	ld	xh,a
 972  000e cd0000        	call	L3_TI1_Config
 974  0011 84            	pop	a
 975                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 977  0012 7b06          	ld	a,(OFST+6,sp)
 978  0014 cd0000        	call	_TIM2_SetIC1Prescaler
 981  0017 202b          	jra	L304
 982  0019               L104:
 983                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
 985  0019 7b01          	ld	a,(OFST+1,sp)
 986  001b 4a            	dec	a
 987  001c 2614          	jrne	L504
 988                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
 988                     ; 239                (uint8_t)TIM2_ICSelection,
 988                     ; 240                (uint8_t)TIM2_ICFilter);
 990  001e 7b07          	ld	a,(OFST+7,sp)
 991  0020 88            	push	a
 992  0021 7b06          	ld	a,(OFST+6,sp)
 993  0023 97            	ld	xl,a
 994  0024 7b03          	ld	a,(OFST+3,sp)
 995  0026 95            	ld	xh,a
 996  0027 cd0000        	call	L5_TI2_Config
 998  002a 84            	pop	a
 999                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1001  002b 7b06          	ld	a,(OFST+6,sp)
1002  002d cd0000        	call	_TIM2_SetIC2Prescaler
1005  0030 2012          	jra	L304
1006  0032               L504:
1007                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1007                     ; 249                (uint8_t)TIM2_ICSelection,
1007                     ; 250                (uint8_t)TIM2_ICFilter);
1009  0032 7b07          	ld	a,(OFST+7,sp)
1010  0034 88            	push	a
1011  0035 7b06          	ld	a,(OFST+6,sp)
1012  0037 97            	ld	xl,a
1013  0038 7b03          	ld	a,(OFST+3,sp)
1014  003a 95            	ld	xh,a
1015  003b cd0000        	call	L7_TI3_Config
1017  003e 84            	pop	a
1018                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1020  003f 7b06          	ld	a,(OFST+6,sp)
1021  0041 cd0000        	call	_TIM2_SetIC3Prescaler
1023  0044               L304:
1024                     ; 255 }
1027  0044 85            	popw	x
1028  0045 81            	ret	
1124                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1124                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1124                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1124                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1124                     ; 270                      uint8_t TIM2_ICFilter)
1124                     ; 271 {
1125                     .text:	section	.text,new
1126  0000               _TIM2_PWMIConfig:
1128  0000 89            	pushw	x
1129  0001 89            	pushw	x
1130       00000002      OFST:	set	2
1133                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1135                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1137                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1139                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1141                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1143                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1145                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1147  0002 9f            	ld	a,xl
1148  0003 a144          	cp	a,#68
1149  0005 2706          	jreq	L754
1150                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1152  0007 a644          	ld	a,#68
1153  0009 6b01          	ld	(OFST-1,sp),a
1156  000b 2002          	jra	L164
1157  000d               L754:
1158                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1160  000d 0f01          	clr	(OFST-1,sp)
1162  000f               L164:
1163                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1165  000f 7b07          	ld	a,(OFST+5,sp)
1166  0011 4a            	dec	a
1167  0012 2604          	jrne	L364
1168                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1170  0014 a602          	ld	a,#2
1172  0016 2002          	jra	L564
1173  0018               L364:
1174                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1176  0018 a601          	ld	a,#1
1177  001a               L564:
1178  001a 6b02          	ld	(OFST+0,sp),a
1180                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1182  001c 7b03          	ld	a,(OFST+1,sp)
1183  001e 2626          	jrne	L764
1184                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1184                     ; 305                (uint8_t)TIM2_ICFilter);
1186  0020 7b09          	ld	a,(OFST+7,sp)
1187  0022 88            	push	a
1188  0023 7b08          	ld	a,(OFST+6,sp)
1189  0025 97            	ld	xl,a
1190  0026 7b05          	ld	a,(OFST+3,sp)
1191  0028 95            	ld	xh,a
1192  0029 cd0000        	call	L3_TI1_Config
1194  002c 84            	pop	a
1195                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1197  002d 7b08          	ld	a,(OFST+6,sp)
1198  002f cd0000        	call	_TIM2_SetIC1Prescaler
1200                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1202  0032 7b09          	ld	a,(OFST+7,sp)
1203  0034 88            	push	a
1204  0035 7b03          	ld	a,(OFST+1,sp)
1205  0037 97            	ld	xl,a
1206  0038 7b02          	ld	a,(OFST+0,sp)
1207  003a 95            	ld	xh,a
1208  003b cd0000        	call	L5_TI2_Config
1210  003e 84            	pop	a
1211                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1213  003f 7b08          	ld	a,(OFST+6,sp)
1214  0041 cd0000        	call	_TIM2_SetIC2Prescaler
1217  0044 2024          	jra	L174
1218  0046               L764:
1219                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1219                     ; 320                (uint8_t)TIM2_ICFilter);
1221  0046 7b09          	ld	a,(OFST+7,sp)
1222  0048 88            	push	a
1223  0049 7b08          	ld	a,(OFST+6,sp)
1224  004b 97            	ld	xl,a
1225  004c 7b05          	ld	a,(OFST+3,sp)
1226  004e 95            	ld	xh,a
1227  004f cd0000        	call	L5_TI2_Config
1229  0052 84            	pop	a
1230                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1232  0053 7b08          	ld	a,(OFST+6,sp)
1233  0055 cd0000        	call	_TIM2_SetIC2Prescaler
1235                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1237  0058 7b09          	ld	a,(OFST+7,sp)
1238  005a 88            	push	a
1239  005b 7b03          	ld	a,(OFST+1,sp)
1240  005d 97            	ld	xl,a
1241  005e 7b02          	ld	a,(OFST+0,sp)
1242  0060 95            	ld	xh,a
1243  0061 cd0000        	call	L3_TI1_Config
1245  0064 84            	pop	a
1246                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1248  0065 7b08          	ld	a,(OFST+6,sp)
1249  0067 cd0000        	call	_TIM2_SetIC1Prescaler
1251  006a               L174:
1252                     ; 331 }
1255  006a 5b04          	addw	sp,#4
1256  006c 81            	ret	
1311                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1311                     ; 340 {
1312                     .text:	section	.text,new
1313  0000               _TIM2_Cmd:
1317                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1319                     ; 345   if (NewState != DISABLE)
1321  0000 4d            	tnz	a
1322  0001 2705          	jreq	L125
1323                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1325  0003 72105300      	bset	21248,#0
1328  0007 81            	ret	
1329  0008               L125:
1330                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1332  0008 72115300      	bres	21248,#0
1333                     ; 353 }
1336  000c 81            	ret	
1415                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1415                     ; 369 {
1416                     .text:	section	.text,new
1417  0000               _TIM2_ITConfig:
1419  0000 89            	pushw	x
1420       00000000      OFST:	set	0
1423                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1425                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1427                     ; 374   if (NewState != DISABLE)
1429  0001 9f            	ld	a,xl
1430  0002 4d            	tnz	a
1431  0003 2706          	jreq	L365
1432                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1434  0005 9e            	ld	a,xh
1435  0006 ca5303        	or	a,21251
1437  0009 2006          	jra	L565
1438  000b               L365:
1439                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1441  000b 7b01          	ld	a,(OFST+1,sp)
1442  000d 43            	cpl	a
1443  000e c45303        	and	a,21251
1444  0011               L565:
1445  0011 c75303        	ld	21251,a
1446                     ; 384 }
1449  0014 85            	popw	x
1450  0015 81            	ret	
1486                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1486                     ; 393 {
1487                     .text:	section	.text,new
1488  0000               _TIM2_UpdateDisableConfig:
1492                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1494                     ; 398   if (NewState != DISABLE)
1496  0000 4d            	tnz	a
1497  0001 2705          	jreq	L506
1498                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1500  0003 72125300      	bset	21248,#1
1503  0007 81            	ret	
1504  0008               L506:
1505                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1507  0008 72135300      	bres	21248,#1
1508                     ; 406 }
1511  000c 81            	ret	
1569                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1569                     ; 417 {
1570                     .text:	section	.text,new
1571  0000               _TIM2_UpdateRequestConfig:
1575                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1577                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1579  0000 4d            	tnz	a
1580  0001 2705          	jreq	L736
1581                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1583  0003 72145300      	bset	21248,#2
1586  0007 81            	ret	
1587  0008               L736:
1588                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1590  0008 72155300      	bres	21248,#2
1591                     ; 430 }
1594  000c 81            	ret	
1651                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1651                     ; 441 {
1652                     .text:	section	.text,new
1653  0000               _TIM2_SelectOnePulseMode:
1657                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1659                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1661  0000 4d            	tnz	a
1662  0001 2705          	jreq	L176
1663                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1665  0003 72165300      	bset	21248,#3
1668  0007 81            	ret	
1669  0008               L176:
1670                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1672  0008 72175300      	bres	21248,#3
1673                     ; 454 }
1676  000c 81            	ret	
1744                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1744                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1744                     ; 486 {
1745                     .text:	section	.text,new
1746  0000               _TIM2_PrescalerConfig:
1750                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1752                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1754                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
1756  0000 9e            	ld	a,xh
1757  0001 c7530e        	ld	21262,a
1758                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1760  0004 9f            	ld	a,xl
1761  0005 c75306        	ld	21254,a
1762                     ; 496 }
1765  0008 81            	ret	
1823                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1823                     ; 508 {
1824                     .text:	section	.text,new
1825  0000               _TIM2_ForcedOC1Config:
1827  0000 88            	push	a
1828       00000000      OFST:	set	0
1831                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1833                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1833                     ; 514                             | (uint8_t)TIM2_ForcedAction);
1835  0001 c65307        	ld	a,21255
1836  0004 a48f          	and	a,#143
1837  0006 1a01          	or	a,(OFST+1,sp)
1838  0008 c75307        	ld	21255,a
1839                     ; 515 }
1842  000b 84            	pop	a
1843  000c 81            	ret	
1879                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1879                     ; 527 {
1880                     .text:	section	.text,new
1881  0000               _TIM2_ForcedOC2Config:
1883  0000 88            	push	a
1884       00000000      OFST:	set	0
1887                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1889                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1889                     ; 533                           | (uint8_t)TIM2_ForcedAction);
1891  0001 c65308        	ld	a,21256
1892  0004 a48f          	and	a,#143
1893  0006 1a01          	or	a,(OFST+1,sp)
1894  0008 c75308        	ld	21256,a
1895                     ; 534 }
1898  000b 84            	pop	a
1899  000c 81            	ret	
1935                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1935                     ; 546 {
1936                     .text:	section	.text,new
1937  0000               _TIM2_ForcedOC3Config:
1939  0000 88            	push	a
1940       00000000      OFST:	set	0
1943                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1945                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1945                     ; 552                             | (uint8_t)TIM2_ForcedAction);
1947  0001 c65309        	ld	a,21257
1948  0004 a48f          	and	a,#143
1949  0006 1a01          	or	a,(OFST+1,sp)
1950  0008 c75309        	ld	21257,a
1951                     ; 553 }
1954  000b 84            	pop	a
1955  000c 81            	ret	
1991                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1991                     ; 562 {
1992                     .text:	section	.text,new
1993  0000               _TIM2_ARRPreloadConfig:
1997                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1999                     ; 567   if (NewState != DISABLE)
2001  0000 4d            	tnz	a
2002  0001 2705          	jreq	L7201
2003                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2005  0003 721e5300      	bset	21248,#7
2008  0007 81            	ret	
2009  0008               L7201:
2010                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2012  0008 721f5300      	bres	21248,#7
2013                     ; 575 }
2016  000c 81            	ret	
2052                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2052                     ; 584 {
2053                     .text:	section	.text,new
2054  0000               _TIM2_OC1PreloadConfig:
2058                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2060                     ; 589   if (NewState != DISABLE)
2062  0000 4d            	tnz	a
2063  0001 2705          	jreq	L1501
2064                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2066  0003 72165307      	bset	21255,#3
2069  0007 81            	ret	
2070  0008               L1501:
2071                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2073  0008 72175307      	bres	21255,#3
2074                     ; 597 }
2077  000c 81            	ret	
2113                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2113                     ; 606 {
2114                     .text:	section	.text,new
2115  0000               _TIM2_OC2PreloadConfig:
2119                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2121                     ; 611   if (NewState != DISABLE)
2123  0000 4d            	tnz	a
2124  0001 2705          	jreq	L3701
2125                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2127  0003 72165308      	bset	21256,#3
2130  0007 81            	ret	
2131  0008               L3701:
2132                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2134  0008 72175308      	bres	21256,#3
2135                     ; 619 }
2138  000c 81            	ret	
2174                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2174                     ; 628 {
2175                     .text:	section	.text,new
2176  0000               _TIM2_OC3PreloadConfig:
2180                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2182                     ; 633   if (NewState != DISABLE)
2184  0000 4d            	tnz	a
2185  0001 2705          	jreq	L5111
2186                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2188  0003 72165309      	bset	21257,#3
2191  0007 81            	ret	
2192  0008               L5111:
2193                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2195  0008 72175309      	bres	21257,#3
2196                     ; 641 }
2199  000c 81            	ret	
2272                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2272                     ; 654 {
2273                     .text:	section	.text,new
2274  0000               _TIM2_GenerateEvent:
2278                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2280                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2282  0000 c75306        	ld	21254,a
2283                     ; 660 }
2286  0003 81            	ret	
2322                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2322                     ; 671 {
2323                     .text:	section	.text,new
2324  0000               _TIM2_OC1PolarityConfig:
2328                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2330                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2332  0000 4d            	tnz	a
2333  0001 2705          	jreq	L1711
2334                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2336  0003 7212530a      	bset	21258,#1
2339  0007 81            	ret	
2340  0008               L1711:
2341                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2343  0008 7213530a      	bres	21258,#1
2344                     ; 684 }
2347  000c 81            	ret	
2383                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2383                     ; 695 {
2384                     .text:	section	.text,new
2385  0000               _TIM2_OC2PolarityConfig:
2389                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2391                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2393  0000 4d            	tnz	a
2394  0001 2705          	jreq	L3121
2395                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2397  0003 721a530a      	bset	21258,#5
2400  0007 81            	ret	
2401  0008               L3121:
2402                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2404  0008 721b530a      	bres	21258,#5
2405                     ; 708 }
2408  000c 81            	ret	
2444                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2444                     ; 719 {
2445                     .text:	section	.text,new
2446  0000               _TIM2_OC3PolarityConfig:
2450                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2452                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2454  0000 4d            	tnz	a
2455  0001 2705          	jreq	L5321
2456                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2458  0003 7212530b      	bset	21259,#1
2461  0007 81            	ret	
2462  0008               L5321:
2463                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2465  0008 7213530b      	bres	21259,#1
2466                     ; 732 }
2469  000c 81            	ret	
2514                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2514                     ; 746 {
2515                     .text:	section	.text,new
2516  0000               _TIM2_CCxCmd:
2518  0000 89            	pushw	x
2519       00000000      OFST:	set	0
2522                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2524                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2526                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
2528  0001 9e            	ld	a,xh
2529  0002 4d            	tnz	a
2530  0003 2610          	jrne	L3621
2531                     ; 754     if (NewState != DISABLE)
2533  0005 9f            	ld	a,xl
2534  0006 4d            	tnz	a
2535  0007 2706          	jreq	L5621
2536                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2538  0009 7210530a      	bset	21258,#0
2540  000d 2029          	jra	L1721
2541  000f               L5621:
2542                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2544  000f 7211530a      	bres	21258,#0
2545  0013 2023          	jra	L1721
2546  0015               L3621:
2547                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
2549  0015 7b01          	ld	a,(OFST+1,sp)
2550  0017 4a            	dec	a
2551  0018 2610          	jrne	L3721
2552                     ; 767     if (NewState != DISABLE)
2554  001a 7b02          	ld	a,(OFST+2,sp)
2555  001c 2706          	jreq	L5721
2556                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2558  001e 7218530a      	bset	21258,#4
2560  0022 2014          	jra	L1721
2561  0024               L5721:
2562                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2564  0024 7219530a      	bres	21258,#4
2565  0028 200e          	jra	L1721
2566  002a               L3721:
2567                     ; 779     if (NewState != DISABLE)
2569  002a 7b02          	ld	a,(OFST+2,sp)
2570  002c 2706          	jreq	L3031
2571                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2573  002e 7210530b      	bset	21259,#0
2575  0032 2004          	jra	L1721
2576  0034               L3031:
2577                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2579  0034 7211530b      	bres	21259,#0
2580  0038               L1721:
2581                     ; 788 }
2584  0038 85            	popw	x
2585  0039 81            	ret	
2630                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2630                     ; 811 {
2631                     .text:	section	.text,new
2632  0000               _TIM2_SelectOCxM:
2634  0000 89            	pushw	x
2635       00000000      OFST:	set	0
2638                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2640                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2642                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
2644  0001 9e            	ld	a,xh
2645  0002 4d            	tnz	a
2646  0003 2610          	jrne	L1331
2647                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2649  0005 7211530a      	bres	21258,#0
2650                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2650                     ; 823                             | (uint8_t)TIM2_OCMode);
2652  0009 c65307        	ld	a,21255
2653  000c a48f          	and	a,#143
2654  000e 1a02          	or	a,(OFST+2,sp)
2655  0010 c75307        	ld	21255,a
2657  0013 2023          	jra	L3331
2658  0015               L1331:
2659                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
2661  0015 7b01          	ld	a,(OFST+1,sp)
2662  0017 4a            	dec	a
2663  0018 2610          	jrne	L5331
2664                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2666  001a 7219530a      	bres	21258,#4
2667                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2667                     ; 832                             | (uint8_t)TIM2_OCMode);
2669  001e c65308        	ld	a,21256
2670  0021 a48f          	and	a,#143
2671  0023 1a02          	or	a,(OFST+2,sp)
2672  0025 c75308        	ld	21256,a
2674  0028 200e          	jra	L3331
2675  002a               L5331:
2676                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2678  002a 7211530b      	bres	21259,#0
2679                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2679                     ; 841                             | (uint8_t)TIM2_OCMode);
2681  002e c65309        	ld	a,21257
2682  0031 a48f          	and	a,#143
2683  0033 1a02          	or	a,(OFST+2,sp)
2684  0035 c75309        	ld	21257,a
2685  0038               L3331:
2686                     ; 843 }
2689  0038 85            	popw	x
2690  0039 81            	ret	
2724                     ; 851 void TIM2_SetCounter(uint16_t Counter)
2724                     ; 852 {
2725                     .text:	section	.text,new
2726  0000               _TIM2_SetCounter:
2730                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2732  0000 9e            	ld	a,xh
2733  0001 c7530c        	ld	21260,a
2734                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
2736  0004 9f            	ld	a,xl
2737  0005 c7530d        	ld	21261,a
2738                     ; 856 }
2741  0008 81            	ret	
2775                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
2775                     ; 865 {
2776                     .text:	section	.text,new
2777  0000               _TIM2_SetAutoreload:
2781                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2783  0000 9e            	ld	a,xh
2784  0001 c7530f        	ld	21263,a
2785                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
2787  0004 9f            	ld	a,xl
2788  0005 c75310        	ld	21264,a
2789                     ; 869 }
2792  0008 81            	ret	
2826                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
2826                     ; 878 {
2827                     .text:	section	.text,new
2828  0000               _TIM2_SetCompare1:
2832                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2834  0000 9e            	ld	a,xh
2835  0001 c75311        	ld	21265,a
2836                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
2838  0004 9f            	ld	a,xl
2839  0005 c75312        	ld	21266,a
2840                     ; 882 }
2843  0008 81            	ret	
2877                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
2877                     ; 891 {
2878                     .text:	section	.text,new
2879  0000               _TIM2_SetCompare2:
2883                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2885  0000 9e            	ld	a,xh
2886  0001 c75313        	ld	21267,a
2887                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
2889  0004 9f            	ld	a,xl
2890  0005 c75314        	ld	21268,a
2891                     ; 895 }
2894  0008 81            	ret	
2928                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
2928                     ; 904 {
2929                     .text:	section	.text,new
2930  0000               _TIM2_SetCompare3:
2934                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2936  0000 9e            	ld	a,xh
2937  0001 c75315        	ld	21269,a
2938                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
2940  0004 9f            	ld	a,xl
2941  0005 c75316        	ld	21270,a
2942                     ; 908 }
2945  0008 81            	ret	
2981                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2981                     ; 921 {
2982                     .text:	section	.text,new
2983  0000               _TIM2_SetIC1Prescaler:
2985  0000 88            	push	a
2986       00000000      OFST:	set	0
2989                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2991                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2991                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
2993  0001 c65307        	ld	a,21255
2994  0004 a4f3          	and	a,#243
2995  0006 1a01          	or	a,(OFST+1,sp)
2996  0008 c75307        	ld	21255,a
2997                     ; 928 }
3000  000b 84            	pop	a
3001  000c 81            	ret	
3037                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3037                     ; 941 {
3038                     .text:	section	.text,new
3039  0000               _TIM2_SetIC2Prescaler:
3041  0000 88            	push	a
3042       00000000      OFST:	set	0
3045                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3047                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3047                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3049  0001 c65308        	ld	a,21256
3050  0004 a4f3          	and	a,#243
3051  0006 1a01          	or	a,(OFST+1,sp)
3052  0008 c75308        	ld	21256,a
3053                     ; 948 }
3056  000b 84            	pop	a
3057  000c 81            	ret	
3093                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3093                     ; 961 {
3094                     .text:	section	.text,new
3095  0000               _TIM2_SetIC3Prescaler:
3097  0000 88            	push	a
3098       00000000      OFST:	set	0
3101                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3103                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3103                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3105  0001 c65309        	ld	a,21257
3106  0004 a4f3          	and	a,#243
3107  0006 1a01          	or	a,(OFST+1,sp)
3108  0008 c75309        	ld	21257,a
3109                     ; 968 }
3112  000b 84            	pop	a
3113  000c 81            	ret	
3165                     ; 975 uint16_t TIM2_GetCapture1(void)
3165                     ; 976 {
3166                     .text:	section	.text,new
3167  0000               _TIM2_GetCapture1:
3169  0000 5204          	subw	sp,#4
3170       00000004      OFST:	set	4
3173                     ; 978   uint16_t tmpccr1 = 0;
3175                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3179                     ; 981   tmpccr1h = TIM2->CCR1H;
3181  0002 c65311        	ld	a,21265
3182  0005 6b02          	ld	(OFST-2,sp),a
3184                     ; 982   tmpccr1l = TIM2->CCR1L;
3186  0007 c65312        	ld	a,21266
3187  000a 6b01          	ld	(OFST-3,sp),a
3189                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3191  000c 5f            	clrw	x
3192  000d 97            	ld	xl,a
3193  000e 1f03          	ldw	(OFST-1,sp),x
3195                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3197  0010 5f            	clrw	x
3198  0011 7b02          	ld	a,(OFST-2,sp)
3199  0013 97            	ld	xl,a
3200  0014 7b04          	ld	a,(OFST+0,sp)
3201  0016 01            	rrwa	x,a
3202  0017 1a03          	or	a,(OFST-1,sp)
3203  0019 01            	rrwa	x,a
3205                     ; 987   return (uint16_t)tmpccr1;
3209  001a 5b04          	addw	sp,#4
3210  001c 81            	ret	
3262                     ; 995 uint16_t TIM2_GetCapture2(void)
3262                     ; 996 {
3263                     .text:	section	.text,new
3264  0000               _TIM2_GetCapture2:
3266  0000 5204          	subw	sp,#4
3267       00000004      OFST:	set	4
3270                     ; 998   uint16_t tmpccr2 = 0;
3272                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3276                     ; 1001   tmpccr2h = TIM2->CCR2H;
3278  0002 c65313        	ld	a,21267
3279  0005 6b02          	ld	(OFST-2,sp),a
3281                     ; 1002   tmpccr2l = TIM2->CCR2L;
3283  0007 c65314        	ld	a,21268
3284  000a 6b01          	ld	(OFST-3,sp),a
3286                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3288  000c 5f            	clrw	x
3289  000d 97            	ld	xl,a
3290  000e 1f03          	ldw	(OFST-1,sp),x
3292                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3294  0010 5f            	clrw	x
3295  0011 7b02          	ld	a,(OFST-2,sp)
3296  0013 97            	ld	xl,a
3297  0014 7b04          	ld	a,(OFST+0,sp)
3298  0016 01            	rrwa	x,a
3299  0017 1a03          	or	a,(OFST-1,sp)
3300  0019 01            	rrwa	x,a
3302                     ; 1007   return (uint16_t)tmpccr2;
3306  001a 5b04          	addw	sp,#4
3307  001c 81            	ret	
3359                     ; 1015 uint16_t TIM2_GetCapture3(void)
3359                     ; 1016 {
3360                     .text:	section	.text,new
3361  0000               _TIM2_GetCapture3:
3363  0000 5204          	subw	sp,#4
3364       00000004      OFST:	set	4
3367                     ; 1018   uint16_t tmpccr3 = 0;
3369                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
3373                     ; 1021   tmpccr3h = TIM2->CCR3H;
3375  0002 c65315        	ld	a,21269
3376  0005 6b02          	ld	(OFST-2,sp),a
3378                     ; 1022   tmpccr3l = TIM2->CCR3L;
3380  0007 c65316        	ld	a,21270
3381  000a 6b01          	ld	(OFST-3,sp),a
3383                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
3385  000c 5f            	clrw	x
3386  000d 97            	ld	xl,a
3387  000e 1f03          	ldw	(OFST-1,sp),x
3389                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3391  0010 5f            	clrw	x
3392  0011 7b02          	ld	a,(OFST-2,sp)
3393  0013 97            	ld	xl,a
3394  0014 7b04          	ld	a,(OFST+0,sp)
3395  0016 01            	rrwa	x,a
3396  0017 1a03          	or	a,(OFST-1,sp)
3397  0019 01            	rrwa	x,a
3399                     ; 1027   return (uint16_t)tmpccr3;
3403  001a 5b04          	addw	sp,#4
3404  001c 81            	ret	
3438                     ; 1035 uint16_t TIM2_GetCounter(void)
3438                     ; 1036 {
3439                     .text:	section	.text,new
3440  0000               _TIM2_GetCounter:
3442  0000 89            	pushw	x
3443       00000002      OFST:	set	2
3446                     ; 1037   uint16_t tmpcntr = 0;
3448                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3450  0001 c6530c        	ld	a,21260
3451  0004 97            	ld	xl,a
3452  0005 4f            	clr	a
3453  0006 02            	rlwa	x,a
3454  0007 1f01          	ldw	(OFST-1,sp),x
3456                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3458  0009 c6530d        	ld	a,21261
3459  000c 5f            	clrw	x
3460  000d 97            	ld	xl,a
3461  000e 01            	rrwa	x,a
3462  000f 1a02          	or	a,(OFST+0,sp)
3463  0011 01            	rrwa	x,a
3464  0012 1a01          	or	a,(OFST-1,sp)
3465  0014 01            	rrwa	x,a
3468  0015 5b02          	addw	sp,#2
3469  0017 81            	ret	
3493                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3493                     ; 1050 {
3494                     .text:	section	.text,new
3495  0000               _TIM2_GetPrescaler:
3499                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3501  0000 c6530e        	ld	a,21262
3504  0003 81            	ret	
3643                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3643                     ; 1069 {
3644                     .text:	section	.text,new
3645  0000               _TIM2_GetFlagStatus:
3647  0000 89            	pushw	x
3648  0001 89            	pushw	x
3649       00000002      OFST:	set	2
3652                     ; 1070   FlagStatus bitstatus = RESET;
3654                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3658                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3660                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3662  0002 9f            	ld	a,xl
3663  0003 c45304        	and	a,21252
3664  0006 6b01          	ld	(OFST-1,sp),a
3666                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3668  0008 7b03          	ld	a,(OFST+1,sp)
3669  000a 6b02          	ld	(OFST+0,sp),a
3671                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3673  000c c45305        	and	a,21253
3674  000f 1a01          	or	a,(OFST-1,sp)
3675  0011 2702          	jreq	L5371
3676                     ; 1081     bitstatus = SET;
3678  0013 a601          	ld	a,#1
3681  0015               L5371:
3682                     ; 1085     bitstatus = RESET;
3685                     ; 1087   return (FlagStatus)bitstatus;
3689  0015 5b04          	addw	sp,#4
3690  0017 81            	ret	
3725                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3725                     ; 1104 {
3726                     .text:	section	.text,new
3727  0000               _TIM2_ClearFlag:
3731                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3733                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3735  0000 9f            	ld	a,xl
3736  0001 43            	cpl	a
3737  0002 c75304        	ld	21252,a
3738                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3740  0005 35ff5305      	mov	21253,#255
3741                     ; 1111 }
3744  0009 81            	ret	
3808                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3808                     ; 1124 {
3809                     .text:	section	.text,new
3810  0000               _TIM2_GetITStatus:
3812  0000 88            	push	a
3813  0001 89            	pushw	x
3814       00000002      OFST:	set	2
3817                     ; 1125   ITStatus bitstatus = RESET;
3819                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3823                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3825                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3827  0002 c45304        	and	a,21252
3828  0005 6b01          	ld	(OFST-1,sp),a
3830                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3832  0007 c65303        	ld	a,21251
3833  000a 1403          	and	a,(OFST+1,sp)
3834  000c 6b02          	ld	(OFST+0,sp),a
3836                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3838  000e 7b01          	ld	a,(OFST-1,sp)
3839  0010 2708          	jreq	L1102
3841  0012 7b02          	ld	a,(OFST+0,sp)
3842  0014 2704          	jreq	L1102
3843                     ; 1137     bitstatus = SET;
3845  0016 a601          	ld	a,#1
3848  0018 2001          	jra	L3102
3849  001a               L1102:
3850                     ; 1141     bitstatus = RESET;
3852  001a 4f            	clr	a
3854  001b               L3102:
3855                     ; 1143   return (ITStatus)(bitstatus);
3859  001b 5b03          	addw	sp,#3
3860  001d 81            	ret	
3896                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3896                     ; 1157 {
3897                     .text:	section	.text,new
3898  0000               _TIM2_ClearITPendingBit:
3902                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3904                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3906  0000 43            	cpl	a
3907  0001 c75304        	ld	21252,a
3908                     ; 1163 }
3911  0004 81            	ret	
3963                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
3963                     ; 1182                        uint8_t TIM2_ICSelection,
3963                     ; 1183                        uint8_t TIM2_ICFilter)
3963                     ; 1184 {
3964                     .text:	section	.text,new
3965  0000               L3_TI1_Config:
3967  0000 89            	pushw	x
3968  0001 88            	push	a
3969       00000001      OFST:	set	1
3972                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3974  0002 7211530a      	bres	21258,#0
3975                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3975                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3977  0006 7b06          	ld	a,(OFST+5,sp)
3978  0008 97            	ld	xl,a
3979  0009 a610          	ld	a,#16
3980  000b 42            	mul	x,a
3981  000c 9f            	ld	a,xl
3982  000d 1a03          	or	a,(OFST+2,sp)
3983  000f 6b01          	ld	(OFST+0,sp),a
3985  0011 c65307        	ld	a,21255
3986  0014 a40c          	and	a,#12
3987  0016 1a01          	or	a,(OFST+0,sp)
3988  0018 c75307        	ld	21255,a
3989                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3991  001b 7b02          	ld	a,(OFST+1,sp)
3992  001d 2706          	jreq	L1602
3993                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3995  001f 7212530a      	bset	21258,#1
3997  0023 2004          	jra	L3602
3998  0025               L1602:
3999                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
4001  0025 7213530a      	bres	21258,#1
4002  0029               L3602:
4003                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4005  0029 7210530a      	bset	21258,#0
4006                     ; 1203 }
4009  002d 5b03          	addw	sp,#3
4010  002f 81            	ret	
4062                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4062                     ; 1222                        uint8_t TIM2_ICSelection,
4062                     ; 1223                        uint8_t TIM2_ICFilter)
4062                     ; 1224 {
4063                     .text:	section	.text,new
4064  0000               L5_TI2_Config:
4066  0000 89            	pushw	x
4067  0001 88            	push	a
4068       00000001      OFST:	set	1
4071                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4073  0002 7219530a      	bres	21258,#4
4074                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4074                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4076  0006 7b06          	ld	a,(OFST+5,sp)
4077  0008 97            	ld	xl,a
4078  0009 a610          	ld	a,#16
4079  000b 42            	mul	x,a
4080  000c 9f            	ld	a,xl
4081  000d 1a03          	or	a,(OFST+2,sp)
4082  000f 6b01          	ld	(OFST+0,sp),a
4084  0011 c65308        	ld	a,21256
4085  0014 a40c          	and	a,#12
4086  0016 1a01          	or	a,(OFST+0,sp)
4087  0018 c75308        	ld	21256,a
4088                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4090  001b 7b02          	ld	a,(OFST+1,sp)
4091  001d 2706          	jreq	L3112
4092                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4094  001f 721a530a      	bset	21258,#5
4096  0023 2004          	jra	L5112
4097  0025               L3112:
4098                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4100  0025 721b530a      	bres	21258,#5
4101  0029               L5112:
4102                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4104  0029 7218530a      	bset	21258,#4
4105                     ; 1245 }
4108  002d 5b03          	addw	sp,#3
4109  002f 81            	ret	
4161                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4161                     ; 1262                        uint8_t TIM2_ICFilter)
4161                     ; 1263 {
4162                     .text:	section	.text,new
4163  0000               L7_TI3_Config:
4165  0000 89            	pushw	x
4166  0001 88            	push	a
4167       00000001      OFST:	set	1
4170                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4172  0002 7211530b      	bres	21259,#0
4173                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4173                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4175  0006 7b06          	ld	a,(OFST+5,sp)
4176  0008 97            	ld	xl,a
4177  0009 a610          	ld	a,#16
4178  000b 42            	mul	x,a
4179  000c 9f            	ld	a,xl
4180  000d 1a03          	or	a,(OFST+2,sp)
4181  000f 6b01          	ld	(OFST+0,sp),a
4183  0011 c65309        	ld	a,21257
4184  0014 a40c          	and	a,#12
4185  0016 1a01          	or	a,(OFST+0,sp)
4186  0018 c75309        	ld	21257,a
4187                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4189  001b 7b02          	ld	a,(OFST+1,sp)
4190  001d 2706          	jreq	L5412
4191                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4193  001f 7212530b      	bset	21259,#1
4195  0023 2004          	jra	L7412
4196  0025               L5412:
4197                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4199  0025 7213530b      	bres	21259,#1
4200  0029               L7412:
4201                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4203  0029 7210530b      	bset	21259,#0
4204                     ; 1283 }
4207  002d 5b03          	addw	sp,#3
4208  002f 81            	ret	
4221                     	xdef	_TIM2_ClearITPendingBit
4222                     	xdef	_TIM2_GetITStatus
4223                     	xdef	_TIM2_ClearFlag
4224                     	xdef	_TIM2_GetFlagStatus
4225                     	xdef	_TIM2_GetPrescaler
4226                     	xdef	_TIM2_GetCounter
4227                     	xdef	_TIM2_GetCapture3
4228                     	xdef	_TIM2_GetCapture2
4229                     	xdef	_TIM2_GetCapture1
4230                     	xdef	_TIM2_SetIC3Prescaler
4231                     	xdef	_TIM2_SetIC2Prescaler
4232                     	xdef	_TIM2_SetIC1Prescaler
4233                     	xdef	_TIM2_SetCompare3
4234                     	xdef	_TIM2_SetCompare2
4235                     	xdef	_TIM2_SetCompare1
4236                     	xdef	_TIM2_SetAutoreload
4237                     	xdef	_TIM2_SetCounter
4238                     	xdef	_TIM2_SelectOCxM
4239                     	xdef	_TIM2_CCxCmd
4240                     	xdef	_TIM2_OC3PolarityConfig
4241                     	xdef	_TIM2_OC2PolarityConfig
4242                     	xdef	_TIM2_OC1PolarityConfig
4243                     	xdef	_TIM2_GenerateEvent
4244                     	xdef	_TIM2_OC3PreloadConfig
4245                     	xdef	_TIM2_OC2PreloadConfig
4246                     	xdef	_TIM2_OC1PreloadConfig
4247                     	xdef	_TIM2_ARRPreloadConfig
4248                     	xdef	_TIM2_ForcedOC3Config
4249                     	xdef	_TIM2_ForcedOC2Config
4250                     	xdef	_TIM2_ForcedOC1Config
4251                     	xdef	_TIM2_PrescalerConfig
4252                     	xdef	_TIM2_SelectOnePulseMode
4253                     	xdef	_TIM2_UpdateRequestConfig
4254                     	xdef	_TIM2_UpdateDisableConfig
4255                     	xdef	_TIM2_ITConfig
4256                     	xdef	_TIM2_Cmd
4257                     	xdef	_TIM2_PWMIConfig
4258                     	xdef	_TIM2_ICInit
4259                     	xdef	_TIM2_OC3Init
4260                     	xdef	_TIM2_OC2Init
4261                     	xdef	_TIM2_OC1Init
4262                     	xdef	_TIM2_TimeBaseInit
4263                     	xdef	_TIM2_DeInit
4282                     	end
