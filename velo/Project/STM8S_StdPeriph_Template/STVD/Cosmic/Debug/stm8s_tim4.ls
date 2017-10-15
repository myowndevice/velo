   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 49 void TIM4_DeInit(void)
  49                     ; 50 {
  51                     .text:	section	.text,new
  52  0000               _TIM4_DeInit:
  56                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  58  0000 725f5340      	clr	21312
  59                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  61  0004 725f5343      	clr	21315
  62                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  64  0008 725f5346      	clr	21318
  65                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  67  000c 725f5347      	clr	21319
  68                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  70  0010 35ff5348      	mov	21320,#255
  71                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  73  0014 725f5344      	clr	21316
  74                     ; 57 }
  77  0018 81            	ret	
 183                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 183                     ; 66 {
 184                     .text:	section	.text,new
 185  0000               _TIM4_TimeBaseInit:
 189                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 191                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 193  0000 9e            	ld	a,xh
 194  0001 c75347        	ld	21319,a
 195                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
 197  0004 9f            	ld	a,xl
 198  0005 c75348        	ld	21320,a
 199                     ; 73 }
 202  0008 81            	ret	
 257                     ; 81 void TIM4_Cmd(FunctionalState NewState)
 257                     ; 82 {
 258                     .text:	section	.text,new
 259  0000               _TIM4_Cmd:
 263                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 265                     ; 87   if (NewState != DISABLE)
 267  0000 4d            	tnz	a
 268  0001 2705          	jreq	L511
 269                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
 271  0003 72105340      	bset	21312,#0
 274  0007 81            	ret	
 275  0008               L511:
 276                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 278  0008 72115340      	bres	21312,#0
 279                     ; 95 }
 282  000c 81            	ret	
 340                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 340                     ; 108 {
 341                     .text:	section	.text,new
 342  0000               _TIM4_ITConfig:
 344  0000 89            	pushw	x
 345       00000000      OFST:	set	0
 348                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 350                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 352                     ; 113   if (NewState != DISABLE)
 354  0001 9f            	ld	a,xl
 355  0002 4d            	tnz	a
 356  0003 2706          	jreq	L151
 357                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
 359  0005 9e            	ld	a,xh
 360  0006 ca5343        	or	a,21315
 362  0009 2006          	jra	L351
 363  000b               L151:
 364                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
 366  000b 7b01          	ld	a,(OFST+1,sp)
 367  000d 43            	cpl	a
 368  000e c45343        	and	a,21315
 369  0011               L351:
 370  0011 c75343        	ld	21315,a
 371                     ; 123 }
 374  0014 85            	popw	x
 375  0015 81            	ret	
 411                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 411                     ; 132 {
 412                     .text:	section	.text,new
 413  0000               _TIM4_UpdateDisableConfig:
 417                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 419                     ; 137   if (NewState != DISABLE)
 421  0000 4d            	tnz	a
 422  0001 2705          	jreq	L371
 423                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 425  0003 72125340      	bset	21312,#1
 428  0007 81            	ret	
 429  0008               L371:
 430                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 432  0008 72135340      	bres	21312,#1
 433                     ; 145 }
 436  000c 81            	ret	
 494                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 494                     ; 156 {
 495                     .text:	section	.text,new
 496  0000               _TIM4_UpdateRequestConfig:
 500                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 502                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 504  0000 4d            	tnz	a
 505  0001 2705          	jreq	L522
 506                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 508  0003 72145340      	bset	21312,#2
 511  0007 81            	ret	
 512  0008               L522:
 513                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 515  0008 72155340      	bres	21312,#2
 516                     ; 169 }
 519  000c 81            	ret	
 576                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 576                     ; 180 {
 577                     .text:	section	.text,new
 578  0000               _TIM4_SelectOnePulseMode:
 582                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 584                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 586  0000 4d            	tnz	a
 587  0001 2705          	jreq	L752
 588                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 590  0003 72165340      	bset	21312,#3
 593  0007 81            	ret	
 594  0008               L752:
 595                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 597  0008 72175340      	bres	21312,#3
 598                     ; 193 }
 601  000c 81            	ret	
 669                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 669                     ; 216 {
 670                     .text:	section	.text,new
 671  0000               _TIM4_PrescalerConfig:
 675                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 677                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 679                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 681  0000 9e            	ld	a,xh
 682  0001 c75347        	ld	21319,a
 683                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 685  0004 9f            	ld	a,xl
 686  0005 c75345        	ld	21317,a
 687                     ; 226 }
 690  0008 81            	ret	
 726                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 726                     ; 235 {
 727                     .text:	section	.text,new
 728  0000               _TIM4_ARRPreloadConfig:
 732                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 734                     ; 240   if (NewState != DISABLE)
 736  0000 4d            	tnz	a
 737  0001 2705          	jreq	L333
 738                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 740  0003 721e5340      	bset	21312,#7
 743  0007 81            	ret	
 744  0008               L333:
 745                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 747  0008 721f5340      	bres	21312,#7
 748                     ; 248 }
 751  000c 81            	ret	
 800                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 800                     ; 258 {
 801                     .text:	section	.text,new
 802  0000               _TIM4_GenerateEvent:
 806                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 808                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 810  0000 c75345        	ld	21317,a
 811                     ; 264 }
 814  0003 81            	ret	
 848                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 848                     ; 273 {
 849                     .text:	section	.text,new
 850  0000               _TIM4_SetCounter:
 854                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 856  0000 c75346        	ld	21318,a
 857                     ; 276 }
 860  0003 81            	ret	
 894                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 894                     ; 285 {
 895                     .text:	section	.text,new
 896  0000               _TIM4_SetAutoreload:
 900                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 902  0000 c75348        	ld	21320,a
 903                     ; 288 }
 906  0003 81            	ret	
 929                     ; 295 uint8_t TIM4_GetCounter(void)
 929                     ; 296 {
 930                     .text:	section	.text,new
 931  0000               _TIM4_GetCounter:
 935                     ; 298   return (uint8_t)(TIM4->CNTR);
 937  0000 c65346        	ld	a,21318
 940  0003 81            	ret	
 964                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 964                     ; 307 {
 965                     .text:	section	.text,new
 966  0000               _TIM4_GetPrescaler:
 970                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 972  0000 c65347        	ld	a,21319
 975  0003 81            	ret	
1054                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1054                     ; 320 {
1055                     .text:	section	.text,new
1056  0000               _TIM4_GetFlagStatus:
1058  0000 88            	push	a
1059       00000001      OFST:	set	1
1062                     ; 321   FlagStatus bitstatus = RESET;
1064                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1066                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1068  0001 c45344        	and	a,21316
1069  0004 2702          	jreq	L774
1070                     ; 328     bitstatus = SET;
1072  0006 a601          	ld	a,#1
1075  0008               L774:
1076                     ; 332     bitstatus = RESET;
1079                     ; 334   return ((FlagStatus)bitstatus);
1083  0008 5b01          	addw	sp,#1
1084  000a 81            	ret	
1119                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1119                     ; 345 {
1120                     .text:	section	.text,new
1121  0000               _TIM4_ClearFlag:
1125                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1127                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1129  0000 43            	cpl	a
1130  0001 c75344        	ld	21316,a
1131                     ; 351 }
1134  0004 81            	ret	
1198                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1198                     ; 361 {
1199                     .text:	section	.text,new
1200  0000               _TIM4_GetITStatus:
1202  0000 88            	push	a
1203  0001 89            	pushw	x
1204       00000002      OFST:	set	2
1207                     ; 362   ITStatus bitstatus = RESET;
1209                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1213                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1215                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1217  0002 c45344        	and	a,21316
1218  0005 6b01          	ld	(OFST-1,sp),a
1220                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1222  0007 c65343        	ld	a,21315
1223  000a 1403          	and	a,(OFST+1,sp)
1224  000c 6b02          	ld	(OFST+0,sp),a
1226                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1228  000e 7b01          	ld	a,(OFST-1,sp)
1229  0010 2708          	jreq	L355
1231  0012 7b02          	ld	a,(OFST+0,sp)
1232  0014 2704          	jreq	L355
1233                     ; 375     bitstatus = (ITStatus)SET;
1235  0016 a601          	ld	a,#1
1238  0018 2001          	jra	L555
1239  001a               L355:
1240                     ; 379     bitstatus = (ITStatus)RESET;
1242  001a 4f            	clr	a
1244  001b               L555:
1245                     ; 381   return ((ITStatus)bitstatus);
1249  001b 5b03          	addw	sp,#3
1250  001d 81            	ret	
1286                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1286                     ; 392 {
1287                     .text:	section	.text,new
1288  0000               _TIM4_ClearITPendingBit:
1292                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1294                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
1296  0000 43            	cpl	a
1297  0001 c75344        	ld	21316,a
1298                     ; 398 }
1301  0004 81            	ret	
1314                     	xdef	_TIM4_ClearITPendingBit
1315                     	xdef	_TIM4_GetITStatus
1316                     	xdef	_TIM4_ClearFlag
1317                     	xdef	_TIM4_GetFlagStatus
1318                     	xdef	_TIM4_GetPrescaler
1319                     	xdef	_TIM4_GetCounter
1320                     	xdef	_TIM4_SetAutoreload
1321                     	xdef	_TIM4_SetCounter
1322                     	xdef	_TIM4_GenerateEvent
1323                     	xdef	_TIM4_ARRPreloadConfig
1324                     	xdef	_TIM4_PrescalerConfig
1325                     	xdef	_TIM4_SelectOnePulseMode
1326                     	xdef	_TIM4_UpdateRequestConfig
1327                     	xdef	_TIM4_UpdateDisableConfig
1328                     	xdef	_TIM4_ITConfig
1329                     	xdef	_TIM4_Cmd
1330                     	xdef	_TIM4_TimeBaseInit
1331                     	xdef	_TIM4_DeInit
1350                     	end
