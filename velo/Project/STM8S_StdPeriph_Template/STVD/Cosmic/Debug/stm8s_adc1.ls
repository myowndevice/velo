   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 52 void ADC1_DeInit(void)
  49                     ; 53 {
  51                     .text:	section	.text,new
  52  0000               _ADC1_DeInit:
  56                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  58  0000 725f5400      	clr	21504
  59                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  61  0004 725f5401      	clr	21505
  62                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  64  0008 725f5402      	clr	21506
  65                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  67  000c 725f5403      	clr	21507
  68                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  70  0010 725f5406      	clr	21510
  71                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  73  0014 725f5407      	clr	21511
  74                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  76  0018 35ff5408      	mov	21512,#255
  77                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  79  001c 35035409      	mov	21513,#3
  80                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  82  0020 725f540a      	clr	21514
  83                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  85  0024 725f540b      	clr	21515
  86                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  88  0028 725f540e      	clr	21518
  89                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  91  002c 725f540f      	clr	21519
  92                     ; 66 }
  95  0030 81            	ret	
 546                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 546                     ; 89 {
 547                     .text:	section	.text,new
 548  0000               _ADC1_Init:
 550  0000 89            	pushw	x
 551       00000000      OFST:	set	0
 554                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 556                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 558                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 560                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 562                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 564                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 566                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 568                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 570                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 572  0001 7b08          	ld	a,(OFST+8,sp)
 573  0003 88            	push	a
 574  0004 7b02          	ld	a,(OFST+2,sp)
 575  0006 95            	ld	xh,a
 576  0007 cd0000        	call	_ADC1_ConversionConfig
 578  000a 84            	pop	a
 579                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 581  000b 7b05          	ld	a,(OFST+5,sp)
 582  000d cd0000        	call	_ADC1_PrescalerConfig
 584                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 586  0010 7b07          	ld	a,(OFST+7,sp)
 587  0012 97            	ld	xl,a
 588  0013 7b06          	ld	a,(OFST+6,sp)
 589  0015 95            	ld	xh,a
 590  0016 cd0000        	call	_ADC1_ExternalTriggerConfig
 592                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 594  0019 7b0a          	ld	a,(OFST+10,sp)
 595  001b 97            	ld	xl,a
 596  001c 7b09          	ld	a,(OFST+9,sp)
 597  001e 95            	ld	xh,a
 598  001f cd0000        	call	_ADC1_SchmittTriggerConfig
 600                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 602  0022 72105401      	bset	21505,#0
 603                     ; 119 }
 606  0026 85            	popw	x
 607  0027 81            	ret	
 642                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 642                     ; 127 {
 643                     .text:	section	.text,new
 644  0000               _ADC1_Cmd:
 648                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 650                     ; 131   if (NewState != DISABLE)
 652  0000 4d            	tnz	a
 653  0001 2705          	jreq	L362
 654                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 656  0003 72105401      	bset	21505,#0
 659  0007 81            	ret	
 660  0008               L362:
 661                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 663  0008 72115401      	bres	21505,#0
 664                     ; 139 }
 667  000c 81            	ret	
 702                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 702                     ; 147 {
 703                     .text:	section	.text,new
 704  0000               _ADC1_ScanModeCmd:
 708                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 710                     ; 151   if (NewState != DISABLE)
 712  0000 4d            	tnz	a
 713  0001 2705          	jreq	L503
 714                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 716  0003 72125402      	bset	21506,#1
 719  0007 81            	ret	
 720  0008               L503:
 721                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 723  0008 72135402      	bres	21506,#1
 724                     ; 159 }
 727  000c 81            	ret	
 762                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 762                     ; 167 {
 763                     .text:	section	.text,new
 764  0000               _ADC1_DataBufferCmd:
 768                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 770                     ; 171   if (NewState != DISABLE)
 772  0000 4d            	tnz	a
 773  0001 2705          	jreq	L723
 774                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 776  0003 721e5403      	bset	21507,#7
 779  0007 81            	ret	
 780  0008               L723:
 781                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 783  0008 721f5403      	bres	21507,#7
 784                     ; 179 }
 787  000c 81            	ret	
 943                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 943                     ; 191 {
 944                     .text:	section	.text,new
 945  0000               _ADC1_ITConfig:
 947  0000 89            	pushw	x
 948       00000000      OFST:	set	0
 951                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 953                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 955                     ; 196   if (NewState != DISABLE)
 957  0001 7b05          	ld	a,(OFST+5,sp)
 958  0003 2706          	jreq	L714
 959                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 961  0005 9f            	ld	a,xl
 962  0006 ca5400        	or	a,21504
 964  0009 2006          	jra	L124
 965  000b               L714:
 966                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 968  000b 7b02          	ld	a,(OFST+2,sp)
 969  000d 43            	cpl	a
 970  000e c45400        	and	a,21504
 971  0011               L124:
 972  0011 c75400        	ld	21504,a
 973                     ; 206 }
 976  0014 85            	popw	x
 977  0015 81            	ret	
1013                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1013                     ; 215 {
1014                     .text:	section	.text,new
1015  0000               _ADC1_PrescalerConfig:
1017  0000 88            	push	a
1018       00000000      OFST:	set	0
1021                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1023                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1025  0001 c65401        	ld	a,21505
1026  0004 a48f          	and	a,#143
1027  0006 c75401        	ld	21505,a
1028                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1030  0009 c65401        	ld	a,21505
1031  000c 1a01          	or	a,(OFST+1,sp)
1032  000e c75401        	ld	21505,a
1033                     ; 223 }
1036  0011 84            	pop	a
1037  0012 81            	ret	
1084                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1084                     ; 234 {
1085                     .text:	section	.text,new
1086  0000               _ADC1_SchmittTriggerConfig:
1088  0000 89            	pushw	x
1089       00000000      OFST:	set	0
1092                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1094                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1096                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1098  0001 9e            	ld	a,xh
1099  0002 4c            	inc	a
1100  0003 261d          	jrne	L364
1101                     ; 241     if (NewState != DISABLE)
1103  0005 9f            	ld	a,xl
1104  0006 4d            	tnz	a
1105  0007 270a          	jreq	L564
1106                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1108  0009 725f5407      	clr	21511
1109                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1111  000d 725f5406      	clr	21510
1113  0011 2059          	jra	L174
1114  0013               L564:
1115                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1117  0013 c65407        	ld	a,21511
1118  0016 aaff          	or	a,#255
1119  0018 c75407        	ld	21511,a
1120                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1122  001b c65406        	ld	a,21510
1123  001e aaff          	or	a,#255
1124  0020 2047          	jp	LC001
1125  0022               L364:
1126                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1128  0022 7b01          	ld	a,(OFST+1,sp)
1129  0024 a108          	cp	a,#8
1130  0026 0d02          	tnz	(OFST+2,sp)
1131  0028 2420          	jruge	L374
1132                     ; 254     if (NewState != DISABLE)
1134  002a 2711          	jreq	L574
1135                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1137  002c ad40          	call	LC003
1138  002e 2704          	jreq	L43
1139  0030               L63:
1140  0030 48            	sll	a
1141  0031 5a            	decw	x
1142  0032 26fc          	jrne	L63
1143  0034               L43:
1144  0034 43            	cpl	a
1145  0035 c45407        	and	a,21511
1146  0038               LC002:
1147  0038 c75407        	ld	21511,a
1149  003b 202f          	jra	L174
1150  003d               L574:
1151                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1153  003d ad2f          	call	LC003
1154  003f 2704          	jreq	L04
1155  0041               L24:
1156  0041 48            	sll	a
1157  0042 5a            	decw	x
1158  0043 26fc          	jrne	L24
1159  0045               L04:
1160  0045 ca5407        	or	a,21511
1161  0048 20ee          	jp	LC002
1162  004a               L374:
1163                     ; 265     if (NewState != DISABLE)
1165  004a 2710          	jreq	L305
1166                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1168  004c a008          	sub	a,#8
1169  004e ad1e          	call	LC003
1170  0050 2704          	jreq	L44
1171  0052               L64:
1172  0052 48            	sll	a
1173  0053 5a            	decw	x
1174  0054 26fc          	jrne	L64
1175  0056               L44:
1176  0056 43            	cpl	a
1177  0057 c45406        	and	a,21510
1179  005a 200d          	jp	LC001
1180  005c               L305:
1181                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1183  005c a008          	sub	a,#8
1184  005e ad0e          	call	LC003
1185  0060 2704          	jreq	L05
1186  0062               L25:
1187  0062 48            	sll	a
1188  0063 5a            	decw	x
1189  0064 26fc          	jrne	L25
1190  0066               L05:
1191  0066 ca5406        	or	a,21510
1192  0069               LC001:
1193  0069 c75406        	ld	21510,a
1194  006c               L174:
1195                     ; 274 }
1198  006c 85            	popw	x
1199  006d 81            	ret	
1200  006e               LC003:
1201  006e 5f            	clrw	x
1202  006f 97            	ld	xl,a
1203  0070 a601          	ld	a,#1
1204  0072 5d            	tnzw	x
1205  0073 81            	ret	
1262                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1262                     ; 287 {
1263                     .text:	section	.text,new
1264  0000               _ADC1_ConversionConfig:
1266  0000 89            	pushw	x
1267       00000000      OFST:	set	0
1270                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1272                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1274                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1276                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1278  0001 72175402      	bres	21506,#3
1279                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1281  0005 c65402        	ld	a,21506
1282  0008 1a05          	or	a,(OFST+5,sp)
1283  000a c75402        	ld	21506,a
1284                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1286  000d 9e            	ld	a,xh
1287  000e 4a            	dec	a
1288  000f 2606          	jrne	L535
1289                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1291  0011 72125401      	bset	21505,#1
1293  0015 2004          	jra	L735
1294  0017               L535:
1295                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1297  0017 72135401      	bres	21505,#1
1298  001b               L735:
1299                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1301  001b c65400        	ld	a,21504
1302  001e a4f0          	and	a,#240
1303  0020 c75400        	ld	21504,a
1304                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1306  0023 c65400        	ld	a,21504
1307  0026 1a02          	or	a,(OFST+2,sp)
1308  0028 c75400        	ld	21504,a
1309                     ; 313 }
1312  002b 85            	popw	x
1313  002c 81            	ret	
1359                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1359                     ; 326 {
1360                     .text:	section	.text,new
1361  0000               _ADC1_ExternalTriggerConfig:
1363  0000 89            	pushw	x
1364       00000000      OFST:	set	0
1367                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1369                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1371                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1373  0001 c65402        	ld	a,21506
1374  0004 a4cf          	and	a,#207
1375  0006 c75402        	ld	21506,a
1376                     ; 334   if (NewState != DISABLE)
1378  0009 9f            	ld	a,xl
1379  000a 4d            	tnz	a
1380  000b 2706          	jreq	L365
1381                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1383  000d 721c5402      	bset	21506,#6
1385  0011 2004          	jra	L565
1386  0013               L365:
1387                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1389  0013 721d5402      	bres	21506,#6
1390  0017               L565:
1391                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1393  0017 c65402        	ld	a,21506
1394  001a 1a01          	or	a,(OFST+1,sp)
1395  001c c75402        	ld	21506,a
1396                     ; 347 }
1399  001f 85            	popw	x
1400  0020 81            	ret	
1424                     ; 358 void ADC1_StartConversion(void)
1424                     ; 359 {
1425                     .text:	section	.text,new
1426  0000               _ADC1_StartConversion:
1430                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1432  0000 72105401      	bset	21505,#0
1433                     ; 361 }
1436  0004 81            	ret	
1480                     ; 370 uint16_t ADC1_GetConversionValue(void)
1480                     ; 371 {
1481                     .text:	section	.text,new
1482  0000               _ADC1_GetConversionValue:
1484  0000 5205          	subw	sp,#5
1485       00000005      OFST:	set	5
1488                     ; 372   uint16_t temph = 0;
1490                     ; 373   uint8_t templ = 0;
1492                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1494  0002 720754020e    	btjf	21506,#3,L126
1495                     ; 378     templ = ADC1->DRL;
1497  0007 c65405        	ld	a,21509
1498  000a 6b03          	ld	(OFST-2,sp),a
1500                     ; 380     temph = ADC1->DRH;
1502  000c c65404        	ld	a,21508
1503  000f 97            	ld	xl,a
1505                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1507  0010 7b03          	ld	a,(OFST-2,sp)
1508  0012 02            	rlwa	x,a
1511  0013 201a          	jra	L326
1512  0015               L126:
1513                     ; 387     temph = ADC1->DRH;
1515  0015 c65404        	ld	a,21508
1516  0018 97            	ld	xl,a
1518                     ; 389     templ = ADC1->DRL;
1520  0019 c65405        	ld	a,21509
1521  001c 6b03          	ld	(OFST-2,sp),a
1523                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1525  001e 4f            	clr	a
1526  001f 02            	rlwa	x,a
1527  0020 1f01          	ldw	(OFST-4,sp),x
1529  0022 7b03          	ld	a,(OFST-2,sp)
1530  0024 97            	ld	xl,a
1531  0025 a640          	ld	a,#64
1532  0027 42            	mul	x,a
1533  0028 01            	rrwa	x,a
1534  0029 1a02          	or	a,(OFST-3,sp)
1535  002b 01            	rrwa	x,a
1536  002c 1a01          	or	a,(OFST-4,sp)
1537  002e 01            	rrwa	x,a
1539  002f               L326:
1540                     ; 394   return ((uint16_t)temph);
1544  002f 5b05          	addw	sp,#5
1545  0031 81            	ret	
1591                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1591                     ; 406 {
1592                     .text:	section	.text,new
1593  0000               _ADC1_AWDChannelConfig:
1595  0000 89            	pushw	x
1596       00000000      OFST:	set	0
1599                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1601                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1603                     ; 411   if (Channel < (uint8_t)8)
1605  0001 9e            	ld	a,xh
1606  0002 a108          	cp	a,#8
1607  0004 2425          	jruge	L746
1608                     ; 413     if (NewState != DISABLE)
1610  0006 9f            	ld	a,xl
1611  0007 4d            	tnz	a
1612  0008 270e          	jreq	L156
1613                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1615  000a 9e            	ld	a,xh
1616  000b ad48          	call	LC006
1617  000d 2704          	jreq	L66
1618  000f               L07:
1619  000f 48            	sll	a
1620  0010 5a            	decw	x
1621  0011 26fc          	jrne	L07
1622  0013               L66:
1623  0013 ca540f        	or	a,21519
1625  0016 200e          	jp	LC005
1626  0018               L156:
1627                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1629  0018 7b01          	ld	a,(OFST+1,sp)
1630  001a ad39          	call	LC006
1631  001c 2704          	jreq	L27
1632  001e               L47:
1633  001e 48            	sll	a
1634  001f 5a            	decw	x
1635  0020 26fc          	jrne	L47
1636  0022               L27:
1637  0022 43            	cpl	a
1638  0023 c4540f        	and	a,21519
1639  0026               LC005:
1640  0026 c7540f        	ld	21519,a
1641  0029 2028          	jra	L556
1642  002b               L746:
1643                     ; 424     if (NewState != DISABLE)
1645  002b 7b02          	ld	a,(OFST+2,sp)
1646  002d 2711          	jreq	L756
1647                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1649  002f 7b01          	ld	a,(OFST+1,sp)
1650  0031 a008          	sub	a,#8
1651  0033 ad20          	call	LC006
1652  0035 2704          	jreq	L67
1653  0037               L001:
1654  0037 48            	sll	a
1655  0038 5a            	decw	x
1656  0039 26fc          	jrne	L001
1657  003b               L67:
1658  003b ca540e        	or	a,21518
1660  003e 2010          	jp	LC004
1661  0040               L756:
1662                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1664  0040 7b01          	ld	a,(OFST+1,sp)
1665  0042 a008          	sub	a,#8
1666  0044 ad0f          	call	LC006
1667  0046 2704          	jreq	L201
1668  0048               L401:
1669  0048 48            	sll	a
1670  0049 5a            	decw	x
1671  004a 26fc          	jrne	L401
1672  004c               L201:
1673  004c 43            	cpl	a
1674  004d c4540e        	and	a,21518
1675  0050               LC004:
1676  0050 c7540e        	ld	21518,a
1677  0053               L556:
1678                     ; 433 }
1681  0053 85            	popw	x
1682  0054 81            	ret	
1683  0055               LC006:
1684  0055 5f            	clrw	x
1685  0056 97            	ld	xl,a
1686  0057 a601          	ld	a,#1
1687  0059 5d            	tnzw	x
1688  005a 81            	ret	
1723                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1723                     ; 442 {
1724                     .text:	section	.text,new
1725  0000               _ADC1_SetHighThreshold:
1727  0000 89            	pushw	x
1728       00000000      OFST:	set	0
1731                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1733  0001 54            	srlw	x
1734  0002 54            	srlw	x
1735  0003 9f            	ld	a,xl
1736  0004 c75408        	ld	21512,a
1737                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1739  0007 7b02          	ld	a,(OFST+2,sp)
1740  0009 c75409        	ld	21513,a
1741                     ; 445 }
1744  000c 85            	popw	x
1745  000d 81            	ret	
1780                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1780                     ; 454 {
1781                     .text:	section	.text,new
1782  0000               _ADC1_SetLowThreshold:
1786                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1788  0000 9f            	ld	a,xl
1789  0001 c7540b        	ld	21515,a
1790                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1792  0004 54            	srlw	x
1793  0005 54            	srlw	x
1794  0006 9f            	ld	a,xl
1795  0007 c7540a        	ld	21514,a
1796                     ; 457 }
1799  000a 81            	ret	
1852                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1852                     ; 467 {
1853                     .text:	section	.text,new
1854  0000               _ADC1_GetBufferValue:
1856  0000 88            	push	a
1857  0001 5205          	subw	sp,#5
1858       00000005      OFST:	set	5
1861                     ; 468   uint16_t temph = 0;
1863                     ; 469   uint8_t templ = 0;
1865                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1867                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1869  0003 48            	sll	a
1870  0004 5f            	clrw	x
1871  0005 97            	ld	xl,a
1872  0006 7207540213    	btjf	21506,#3,L547
1873                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1875  000b d653e1        	ld	a,(21473,x)
1876  000e 6b03          	ld	(OFST-2,sp),a
1878                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1880  0010 7b06          	ld	a,(OFST+1,sp)
1881  0012 48            	sll	a
1882  0013 5f            	clrw	x
1883  0014 97            	ld	xl,a
1884  0015 d653e0        	ld	a,(21472,x)
1885  0018 97            	ld	xl,a
1887                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1889  0019 7b03          	ld	a,(OFST-2,sp)
1890  001b 02            	rlwa	x,a
1893  001c 2024          	jra	L747
1894  001e               L547:
1895                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1897  001e d653e0        	ld	a,(21472,x)
1898  0021 5f            	clrw	x
1899  0022 97            	ld	xl,a
1900  0023 1f04          	ldw	(OFST-1,sp),x
1902                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1904  0025 7b06          	ld	a,(OFST+1,sp)
1905  0027 48            	sll	a
1906  0028 5f            	clrw	x
1907  0029 97            	ld	xl,a
1908  002a d653e1        	ld	a,(21473,x)
1909  002d 6b03          	ld	(OFST-2,sp),a
1911                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1913  002f 4f            	clr	a
1914  0030 1e04          	ldw	x,(OFST-1,sp)
1915  0032 02            	rlwa	x,a
1916  0033 1f01          	ldw	(OFST-4,sp),x
1918  0035 7b03          	ld	a,(OFST-2,sp)
1919  0037 97            	ld	xl,a
1920  0038 a640          	ld	a,#64
1921  003a 42            	mul	x,a
1922  003b 01            	rrwa	x,a
1923  003c 1a02          	or	a,(OFST-3,sp)
1924  003e 01            	rrwa	x,a
1925  003f 1a01          	or	a,(OFST-4,sp)
1926  0041 01            	rrwa	x,a
1928  0042               L747:
1929                     ; 493   return ((uint16_t)temph);
1933  0042 5b06          	addw	sp,#6
1934  0044 81            	ret	
2000                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2000                     ; 503 {
2001                     .text:	section	.text,new
2002  0000               _ADC1_GetAWDChannelStatus:
2004  0000 88            	push	a
2005  0001 88            	push	a
2006       00000001      OFST:	set	1
2009                     ; 504   uint8_t status = 0;
2011                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2013                     ; 509   if (Channel < (uint8_t)8)
2015  0002 a108          	cp	a,#8
2016  0004 2410          	jruge	L3001
2017                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2019  0006 5f            	clrw	x
2020  0007 97            	ld	xl,a
2021  0008 a601          	ld	a,#1
2022  000a 5d            	tnzw	x
2023  000b 2704          	jreq	L611
2024  000d               L021:
2025  000d 48            	sll	a
2026  000e 5a            	decw	x
2027  000f 26fc          	jrne	L021
2028  0011               L611:
2029  0011 c4540d        	and	a,21517
2032  0014 2010          	jra	L5001
2033  0016               L3001:
2034                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2036  0016 a008          	sub	a,#8
2037  0018 5f            	clrw	x
2038  0019 97            	ld	xl,a
2039  001a a601          	ld	a,#1
2040  001c 5d            	tnzw	x
2041  001d 2704          	jreq	L221
2042  001f               L421:
2043  001f 48            	sll	a
2044  0020 5a            	decw	x
2045  0021 26fc          	jrne	L421
2046  0023               L221:
2047  0023 c4540c        	and	a,21516
2049  0026               L5001:
2050                     ; 518   return ((FlagStatus)status);
2054  0026 85            	popw	x
2055  0027 81            	ret	
2213                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2213                     ; 528 {
2214                     .text:	section	.text,new
2215  0000               _ADC1_GetFlagStatus:
2217  0000 88            	push	a
2218  0001 88            	push	a
2219       00000001      OFST:	set	1
2222                     ; 529   uint8_t flagstatus = 0;
2224                     ; 530   uint8_t temp = 0;
2226                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2228                     ; 535   if ((Flag & 0x0F) == 0x01)
2230  0002 a40f          	and	a,#15
2231  0004 4a            	dec	a
2232  0005 2607          	jrne	L5701
2233                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2235  0007 c65403        	ld	a,21507
2236  000a a440          	and	a,#64
2239  000c 2039          	jra	L7701
2240  000e               L5701:
2241                     ; 540   else if ((Flag & 0xF0) == 0x10)
2243  000e 7b02          	ld	a,(OFST+1,sp)
2244  0010 a4f0          	and	a,#240
2245  0012 a110          	cp	a,#16
2246  0014 262c          	jrne	L1011
2247                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2249  0016 7b02          	ld	a,(OFST+1,sp)
2250  0018 a40f          	and	a,#15
2251  001a 6b01          	ld	(OFST+0,sp),a
2253                     ; 544     if (temp < 8)
2255  001c a108          	cp	a,#8
2256  001e 2410          	jruge	L3011
2257                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2259  0020 5f            	clrw	x
2260  0021 97            	ld	xl,a
2261  0022 a601          	ld	a,#1
2262  0024 5d            	tnzw	x
2263  0025 2704          	jreq	L031
2264  0027               L231:
2265  0027 48            	sll	a
2266  0028 5a            	decw	x
2267  0029 26fc          	jrne	L231
2268  002b               L031:
2269  002b c4540d        	and	a,21517
2272  002e 2017          	jra	L7701
2273  0030               L3011:
2274                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2276  0030 a008          	sub	a,#8
2277  0032 5f            	clrw	x
2278  0033 97            	ld	xl,a
2279  0034 a601          	ld	a,#1
2280  0036 5d            	tnzw	x
2281  0037 2704          	jreq	L431
2282  0039               L631:
2283  0039 48            	sll	a
2284  003a 5a            	decw	x
2285  003b 26fc          	jrne	L631
2286  003d               L431:
2287  003d c4540c        	and	a,21516
2289  0040 2005          	jra	L7701
2290  0042               L1011:
2291                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2293  0042 c65400        	ld	a,21504
2294  0045 1402          	and	a,(OFST+1,sp)
2296  0047               L7701:
2297                     ; 557   return ((FlagStatus)flagstatus);
2301  0047 85            	popw	x
2302  0048 81            	ret	
2346                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2346                     ; 568 {
2347                     .text:	section	.text,new
2348  0000               _ADC1_ClearFlag:
2350  0000 88            	push	a
2351  0001 88            	push	a
2352       00000001      OFST:	set	1
2355                     ; 569   uint8_t temp = 0;
2357                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2359                     ; 574   if ((Flag & 0x0F) == 0x01)
2361  0002 a40f          	and	a,#15
2362  0004 4a            	dec	a
2363  0005 2606          	jrne	L3311
2364                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2366  0007 721d5403      	bres	21507,#6
2368  000b 2045          	jra	L5311
2369  000d               L3311:
2370                     ; 579   else if ((Flag & 0xF0) == 0x10)
2372  000d 7b02          	ld	a,(OFST+1,sp)
2373  000f a4f0          	and	a,#240
2374  0011 a110          	cp	a,#16
2375  0013 2634          	jrne	L7311
2376                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2378  0015 7b02          	ld	a,(OFST+1,sp)
2379  0017 a40f          	and	a,#15
2380  0019 6b01          	ld	(OFST+0,sp),a
2382                     ; 583     if (temp < 8)
2384  001b a108          	cp	a,#8
2385  001d 2414          	jruge	L1411
2386                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2388  001f 5f            	clrw	x
2389  0020 97            	ld	xl,a
2390  0021 a601          	ld	a,#1
2391  0023 5d            	tnzw	x
2392  0024 2704          	jreq	L241
2393  0026               L441:
2394  0026 48            	sll	a
2395  0027 5a            	decw	x
2396  0028 26fc          	jrne	L441
2397  002a               L241:
2398  002a 43            	cpl	a
2399  002b c4540d        	and	a,21517
2400  002e c7540d        	ld	21517,a
2402  0031 201f          	jra	L5311
2403  0033               L1411:
2404                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2406  0033 a008          	sub	a,#8
2407  0035 5f            	clrw	x
2408  0036 97            	ld	xl,a
2409  0037 a601          	ld	a,#1
2410  0039 5d            	tnzw	x
2411  003a 2704          	jreq	L641
2412  003c               L051:
2413  003c 48            	sll	a
2414  003d 5a            	decw	x
2415  003e 26fc          	jrne	L051
2416  0040               L641:
2417  0040 43            	cpl	a
2418  0041 c4540c        	and	a,21516
2419  0044 c7540c        	ld	21516,a
2420  0047 2009          	jra	L5311
2421  0049               L7311:
2422                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2424  0049 7b02          	ld	a,(OFST+1,sp)
2425  004b 43            	cpl	a
2426  004c c45400        	and	a,21504
2427  004f c75400        	ld	21504,a
2428  0052               L5311:
2429                     ; 596 }
2432  0052 85            	popw	x
2433  0053 81            	ret	
2488                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2488                     ; 617 {
2489                     .text:	section	.text,new
2490  0000               _ADC1_GetITStatus:
2492  0000 89            	pushw	x
2493  0001 88            	push	a
2494       00000001      OFST:	set	1
2497                     ; 618   ITStatus itstatus = RESET;
2499                     ; 619   uint8_t temp = 0;
2501                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2503                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2505  0002 01            	rrwa	x,a
2506  0003 a4f0          	and	a,#240
2507  0005 5f            	clrw	x
2508  0006 02            	rlwa	x,a
2509  0007 a30010        	cpw	x,#16
2510  000a 262c          	jrne	L5711
2511                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2513  000c 7b03          	ld	a,(OFST+2,sp)
2514  000e a40f          	and	a,#15
2515  0010 6b01          	ld	(OFST+0,sp),a
2517                     ; 628     if (temp < 8)
2519  0012 a108          	cp	a,#8
2520  0014 2410          	jruge	L7711
2521                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2523  0016 5f            	clrw	x
2524  0017 97            	ld	xl,a
2525  0018 a601          	ld	a,#1
2526  001a 5d            	tnzw	x
2527  001b 2704          	jreq	L451
2528  001d               L651:
2529  001d 48            	sll	a
2530  001e 5a            	decw	x
2531  001f 26fc          	jrne	L651
2532  0021               L451:
2533  0021 c4540d        	and	a,21517
2536  0024 2017          	jra	L3021
2537  0026               L7711:
2538                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2540  0026 a008          	sub	a,#8
2541  0028 5f            	clrw	x
2542  0029 97            	ld	xl,a
2543  002a a601          	ld	a,#1
2544  002c 5d            	tnzw	x
2545  002d 2704          	jreq	L061
2546  002f               L261:
2547  002f 48            	sll	a
2548  0030 5a            	decw	x
2549  0031 26fc          	jrne	L261
2550  0033               L061:
2551  0033 c4540c        	and	a,21516
2553  0036 2005          	jra	L3021
2554  0038               L5711:
2555                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2557  0038 c65400        	ld	a,21504
2558  003b 1403          	and	a,(OFST+2,sp)
2560  003d               L3021:
2561                     ; 641   return ((ITStatus)itstatus);
2565  003d 5b03          	addw	sp,#3
2566  003f 81            	ret	
2611                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2611                     ; 663 {
2612                     .text:	section	.text,new
2613  0000               _ADC1_ClearITPendingBit:
2615  0000 89            	pushw	x
2616  0001 88            	push	a
2617       00000001      OFST:	set	1
2620                     ; 664   uint8_t temp = 0;
2622                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2624                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2626  0002 01            	rrwa	x,a
2627  0003 a4f0          	and	a,#240
2628  0005 5f            	clrw	x
2629  0006 02            	rlwa	x,a
2630  0007 a30010        	cpw	x,#16
2631  000a 2634          	jrne	L7221
2632                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2634  000c 7b03          	ld	a,(OFST+2,sp)
2635  000e a40f          	and	a,#15
2636  0010 6b01          	ld	(OFST+0,sp),a
2638                     ; 673     if (temp < 8)
2640  0012 a108          	cp	a,#8
2641  0014 2414          	jruge	L1321
2642                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2644  0016 5f            	clrw	x
2645  0017 97            	ld	xl,a
2646  0018 a601          	ld	a,#1
2647  001a 5d            	tnzw	x
2648  001b 2704          	jreq	L661
2649  001d               L071:
2650  001d 48            	sll	a
2651  001e 5a            	decw	x
2652  001f 26fc          	jrne	L071
2653  0021               L661:
2654  0021 43            	cpl	a
2655  0022 c4540d        	and	a,21517
2656  0025 c7540d        	ld	21517,a
2658  0028 201f          	jra	L5321
2659  002a               L1321:
2660                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2662  002a a008          	sub	a,#8
2663  002c 5f            	clrw	x
2664  002d 97            	ld	xl,a
2665  002e a601          	ld	a,#1
2666  0030 5d            	tnzw	x
2667  0031 2704          	jreq	L271
2668  0033               L471:
2669  0033 48            	sll	a
2670  0034 5a            	decw	x
2671  0035 26fc          	jrne	L471
2672  0037               L271:
2673  0037 43            	cpl	a
2674  0038 c4540c        	and	a,21516
2675  003b c7540c        	ld	21516,a
2676  003e 2009          	jra	L5321
2677  0040               L7221:
2678                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2680  0040 7b03          	ld	a,(OFST+2,sp)
2681  0042 43            	cpl	a
2682  0043 c45400        	and	a,21504
2683  0046 c75400        	ld	21504,a
2684  0049               L5321:
2685                     ; 686 }
2688  0049 5b03          	addw	sp,#3
2689  004b 81            	ret	
2702                     	xdef	_ADC1_ClearITPendingBit
2703                     	xdef	_ADC1_GetITStatus
2704                     	xdef	_ADC1_ClearFlag
2705                     	xdef	_ADC1_GetFlagStatus
2706                     	xdef	_ADC1_GetAWDChannelStatus
2707                     	xdef	_ADC1_GetBufferValue
2708                     	xdef	_ADC1_SetLowThreshold
2709                     	xdef	_ADC1_SetHighThreshold
2710                     	xdef	_ADC1_GetConversionValue
2711                     	xdef	_ADC1_StartConversion
2712                     	xdef	_ADC1_AWDChannelConfig
2713                     	xdef	_ADC1_ExternalTriggerConfig
2714                     	xdef	_ADC1_ConversionConfig
2715                     	xdef	_ADC1_SchmittTriggerConfig
2716                     	xdef	_ADC1_PrescalerConfig
2717                     	xdef	_ADC1_ITConfig
2718                     	xdef	_ADC1_DataBufferCmd
2719                     	xdef	_ADC1_ScanModeCmd
2720                     	xdef	_ADC1_Cmd
2721                     	xdef	_ADC1_Init
2722                     	xdef	_ADC1_DeInit
2741                     	end
