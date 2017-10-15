   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 50 void SPI_DeInit(void)
  49                     ; 51 {
  51                     .text:	section	.text,new
  52  0000               _SPI_DeInit:
  56                     ; 52   SPI->CR1    = SPI_CR1_RESET_VALUE;
  58  0000 725f5200      	clr	20992
  59                     ; 53   SPI->CR2    = SPI_CR2_RESET_VALUE;
  61  0004 725f5201      	clr	20993
  62                     ; 54   SPI->ICR    = SPI_ICR_RESET_VALUE;
  64  0008 725f5202      	clr	20994
  65                     ; 55   SPI->SR     = SPI_SR_RESET_VALUE;
  67  000c 35025203      	mov	20995,#2
  68                     ; 56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  70  0010 35075205      	mov	20997,#7
  71                     ; 57 }
  74  0014 81            	ret	
 390                     ; 78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 390                     ; 79 {
 391                     .text:	section	.text,new
 392  0000               _SPI_Init:
 394  0000 89            	pushw	x
 395  0001 88            	push	a
 396       00000001      OFST:	set	1
 399                     ; 81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 401                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 403                     ; 83   assert_param(IS_SPI_MODE_OK(Mode));
 405                     ; 84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 407                     ; 85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
 409                     ; 86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 411                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 413                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 415                     ; 91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 415                     ; 92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 417  0002 7b07          	ld	a,(OFST+6,sp)
 418  0004 1a08          	or	a,(OFST+7,sp)
 419  0006 6b01          	ld	(OFST+0,sp),a
 421  0008 9f            	ld	a,xl
 422  0009 1a02          	or	a,(OFST+1,sp)
 423  000b 1a01          	or	a,(OFST+0,sp)
 424  000d c75200        	ld	20992,a
 425                     ; 95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 427  0010 7b09          	ld	a,(OFST+8,sp)
 428  0012 1a0a          	or	a,(OFST+9,sp)
 429  0014 c75201        	ld	20993,a
 430                     ; 97   if (Mode == SPI_MODE_MASTER)
 432  0017 7b06          	ld	a,(OFST+5,sp)
 433  0019 a104          	cp	a,#4
 434  001b 2606          	jrne	L302
 435                     ; 99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 437  001d 72105201      	bset	20993,#0
 439  0021 2004          	jra	L502
 440  0023               L302:
 441                     ; 103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 443  0023 72115201      	bres	20993,#0
 444  0027               L502:
 445                     ; 107   SPI->CR1 |= (uint8_t)(Mode);
 447  0027 c65200        	ld	a,20992
 448  002a 1a06          	or	a,(OFST+5,sp)
 449  002c c75200        	ld	20992,a
 450                     ; 110   SPI->CRCPR = (uint8_t)CRCPolynomial;
 452  002f 7b0b          	ld	a,(OFST+10,sp)
 453  0031 c75205        	ld	20997,a
 454                     ; 111 }
 457  0034 5b03          	addw	sp,#3
 458  0036 81            	ret	
 513                     ; 119 void SPI_Cmd(FunctionalState NewState)
 513                     ; 120 {
 514                     .text:	section	.text,new
 515  0000               _SPI_Cmd:
 519                     ; 122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 521                     ; 124   if (NewState != DISABLE)
 523  0000 4d            	tnz	a
 524  0001 2705          	jreq	L532
 525                     ; 126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 527  0003 721c5200      	bset	20992,#6
 530  0007 81            	ret	
 531  0008               L532:
 532                     ; 130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 534  0008 721d5200      	bres	20992,#6
 535                     ; 132 }
 538  000c 81            	ret	
 647                     ; 141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 647                     ; 142 {
 648                     .text:	section	.text,new
 649  0000               _SPI_ITConfig:
 651  0000 89            	pushw	x
 652  0001 88            	push	a
 653       00000001      OFST:	set	1
 656                     ; 143   uint8_t itpos = 0;
 658                     ; 145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 660                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 662                     ; 149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 664  0002 9e            	ld	a,xh
 665  0003 a40f          	and	a,#15
 666  0005 5f            	clrw	x
 667  0006 97            	ld	xl,a
 668  0007 a601          	ld	a,#1
 669  0009 5d            	tnzw	x
 670  000a 2704          	jreq	L41
 671  000c               L61:
 672  000c 48            	sll	a
 673  000d 5a            	decw	x
 674  000e 26fc          	jrne	L61
 675  0010               L41:
 676  0010 6b01          	ld	(OFST+0,sp),a
 678                     ; 151   if (NewState != DISABLE)
 680  0012 0d03          	tnz	(OFST+2,sp)
 681  0014 2707          	jreq	L113
 682                     ; 153     SPI->ICR |= itpos; /* Enable interrupt*/
 684  0016 c65202        	ld	a,20994
 685  0019 1a01          	or	a,(OFST+0,sp)
 687  001b 2004          	jra	L313
 688  001d               L113:
 689                     ; 157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 691  001d 43            	cpl	a
 692  001e c45202        	and	a,20994
 693  0021               L313:
 694  0021 c75202        	ld	20994,a
 695                     ; 159 }
 698  0024 5b03          	addw	sp,#3
 699  0026 81            	ret	
 733                     ; 166 void SPI_SendData(uint8_t Data)
 733                     ; 167 {
 734                     .text:	section	.text,new
 735  0000               _SPI_SendData:
 739                     ; 168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
 741  0000 c75204        	ld	20996,a
 742                     ; 169 }
 745  0003 81            	ret	
 768                     ; 176 uint8_t SPI_ReceiveData(void)
 768                     ; 177 {
 769                     .text:	section	.text,new
 770  0000               _SPI_ReceiveData:
 774                     ; 178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 776  0000 c65204        	ld	a,20996
 779  0003 81            	ret	
 815                     ; 187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 815                     ; 188 {
 816                     .text:	section	.text,new
 817  0000               _SPI_NSSInternalSoftwareCmd:
 821                     ; 190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 823                     ; 192   if (NewState != DISABLE)
 825  0000 4d            	tnz	a
 826  0001 2705          	jreq	L163
 827                     ; 194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 829  0003 72105201      	bset	20993,#0
 832  0007 81            	ret	
 833  0008               L163:
 834                     ; 198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 836  0008 72115201      	bres	20993,#0
 837                     ; 200 }
 840  000c 81            	ret	
 863                     ; 207 void SPI_TransmitCRC(void)
 863                     ; 208 {
 864                     .text:	section	.text,new
 865  0000               _SPI_TransmitCRC:
 869                     ; 209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 871  0000 72185201      	bset	20993,#4
 872                     ; 210 }
 875  0004 81            	ret	
 911                     ; 218 void SPI_CalculateCRCCmd(FunctionalState NewState)
 911                     ; 219 {
 912                     .text:	section	.text,new
 913  0000               _SPI_CalculateCRCCmd:
 917                     ; 221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 919                     ; 223   if (NewState != DISABLE)
 921  0000 4d            	tnz	a
 922  0001 2705          	jreq	L314
 923                     ; 225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 925  0003 721a5201      	bset	20993,#5
 928  0007 81            	ret	
 929  0008               L314:
 930                     ; 229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 932  0008 721b5201      	bres	20993,#5
 933                     ; 231 }
 936  000c 81            	ret	
1000                     ; 238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
1000                     ; 239 {
1001                     .text:	section	.text,new
1002  0000               _SPI_GetCRC:
1004  0000 88            	push	a
1005       00000001      OFST:	set	1
1008                     ; 240   uint8_t crcreg = 0;
1010                     ; 243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
1012                     ; 245   if (SPI_CRC != SPI_CRC_RX)
1014  0001 4d            	tnz	a
1015  0002 2705          	jreq	L154
1016                     ; 247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1018  0004 c65207        	ld	a,20999
1021  0007 2003          	jra	L354
1022  0009               L154:
1023                     ; 251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1025  0009 c65206        	ld	a,20998
1027  000c               L354:
1028                     ; 255   return crcreg;
1032  000c 5b01          	addw	sp,#1
1033  000e 81            	ret	
1058                     ; 263 void SPI_ResetCRC(void)
1058                     ; 264 {
1059                     .text:	section	.text,new
1060  0000               _SPI_ResetCRC:
1064                     ; 267   SPI_CalculateCRCCmd(ENABLE);
1066  0000 a601          	ld	a,#1
1067  0002 cd0000        	call	_SPI_CalculateCRCCmd
1069                     ; 270   SPI_Cmd(ENABLE);
1071  0005 a601          	ld	a,#1
1073                     ; 271 }
1076  0007 cc0000        	jp	_SPI_Cmd
1100                     ; 278 uint8_t SPI_GetCRCPolynomial(void)
1100                     ; 279 {
1101                     .text:	section	.text,new
1102  0000               _SPI_GetCRCPolynomial:
1106                     ; 280   return SPI->CRCPR; /* Return the CRC polynomial register */
1108  0000 c65205        	ld	a,20997
1111  0003 81            	ret	
1167                     ; 288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1167                     ; 289 {
1168                     .text:	section	.text,new
1169  0000               _SPI_BiDirectionalLineConfig:
1173                     ; 291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1175                     ; 293   if (SPI_Direction != SPI_DIRECTION_RX)
1177  0000 4d            	tnz	a
1178  0001 2705          	jreq	L325
1179                     ; 295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1181  0003 721c5201      	bset	20993,#6
1184  0007 81            	ret	
1185  0008               L325:
1186                     ; 299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1188  0008 721d5201      	bres	20993,#6
1189                     ; 301 }
1192  000c 81            	ret	
1313                     ; 311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1313                     ; 312 {
1314                     .text:	section	.text,new
1315  0000               _SPI_GetFlagStatus:
1317  0000 88            	push	a
1318       00000001      OFST:	set	1
1321                     ; 313   FlagStatus status = RESET;
1323                     ; 315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1325                     ; 318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1327  0001 c45203        	and	a,20995
1328  0004 2702          	jreq	L306
1329                     ; 320     status = SET; /* SPI_FLAG is set */
1331  0006 a601          	ld	a,#1
1334  0008               L306:
1335                     ; 324     status = RESET; /* SPI_FLAG is reset*/
1338                     ; 328   return status;
1342  0008 5b01          	addw	sp,#1
1343  000a 81            	ret	
1378                     ; 346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1378                     ; 347 {
1379                     .text:	section	.text,new
1380  0000               _SPI_ClearFlag:
1384                     ; 348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1386                     ; 350   SPI->SR = (uint8_t)(~SPI_FLAG);
1388  0000 43            	cpl	a
1389  0001 c75203        	ld	20995,a
1390                     ; 351 }
1393  0004 81            	ret	
1475                     ; 366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1475                     ; 367 {
1476                     .text:	section	.text,new
1477  0000               _SPI_GetITStatus:
1479  0000 88            	push	a
1480  0001 89            	pushw	x
1481       00000002      OFST:	set	2
1484                     ; 368   ITStatus pendingbitstatus = RESET;
1486                     ; 369   uint8_t itpos = 0;
1488                     ; 370   uint8_t itmask1 = 0;
1490                     ; 371   uint8_t itmask2 = 0;
1492                     ; 372   uint8_t enablestatus = 0;
1494                     ; 373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1496                     ; 375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1498  0002 a40f          	and	a,#15
1499  0004 5f            	clrw	x
1500  0005 97            	ld	xl,a
1501  0006 a601          	ld	a,#1
1502  0008 5d            	tnzw	x
1503  0009 2704          	jreq	L45
1504  000b               L65:
1505  000b 48            	sll	a
1506  000c 5a            	decw	x
1507  000d 26fc          	jrne	L65
1508  000f               L45:
1509  000f 6b01          	ld	(OFST-1,sp),a
1511                     ; 378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1513  0011 7b03          	ld	a,(OFST+1,sp)
1514  0013 4e            	swap	a
1515  0014 a40f          	and	a,#15
1516  0016 6b02          	ld	(OFST+0,sp),a
1518                     ; 380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1520  0018 5f            	clrw	x
1521  0019 97            	ld	xl,a
1522  001a a601          	ld	a,#1
1523  001c 5d            	tnzw	x
1524  001d 2704          	jreq	L06
1525  001f               L26:
1526  001f 48            	sll	a
1527  0020 5a            	decw	x
1528  0021 26fc          	jrne	L26
1529  0023               L06:
1531                     ; 382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1533  0023 c45203        	and	a,20995
1534  0026 6b02          	ld	(OFST+0,sp),a
1536                     ; 384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
1538  0028 c65202        	ld	a,20994
1539  002b 1501          	bcp	a,(OFST-1,sp)
1540  002d 2708          	jreq	L766
1542  002f 7b02          	ld	a,(OFST+0,sp)
1543  0031 2704          	jreq	L766
1544                     ; 387     pendingbitstatus = SET;
1546  0033 a601          	ld	a,#1
1549  0035 2001          	jra	L176
1550  0037               L766:
1551                     ; 392     pendingbitstatus = RESET;
1553  0037 4f            	clr	a
1555  0038               L176:
1556                     ; 395   return  pendingbitstatus;
1560  0038 5b03          	addw	sp,#3
1561  003a 81            	ret	
1606                     ; 412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1606                     ; 413 {
1607                     .text:	section	.text,new
1608  0000               _SPI_ClearITPendingBit:
1610  0000 88            	push	a
1611       00000001      OFST:	set	1
1614                     ; 414   uint8_t itpos = 0;
1616                     ; 415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1618                     ; 420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1620  0001 4e            	swap	a
1621  0002 a40f          	and	a,#15
1622  0004 5f            	clrw	x
1623  0005 97            	ld	xl,a
1624  0006 a601          	ld	a,#1
1625  0008 5d            	tnzw	x
1626  0009 2704          	jreq	L66
1627  000b               L07:
1628  000b 48            	sll	a
1629  000c 5a            	decw	x
1630  000d 26fc          	jrne	L07
1631  000f               L66:
1633                     ; 422   SPI->SR = (uint8_t)(~itpos);
1635  000f 43            	cpl	a
1636  0010 c75203        	ld	20995,a
1637                     ; 424 }
1640  0013 84            	pop	a
1641  0014 81            	ret	
1654                     	xdef	_SPI_ClearITPendingBit
1655                     	xdef	_SPI_GetITStatus
1656                     	xdef	_SPI_ClearFlag
1657                     	xdef	_SPI_GetFlagStatus
1658                     	xdef	_SPI_BiDirectionalLineConfig
1659                     	xdef	_SPI_GetCRCPolynomial
1660                     	xdef	_SPI_ResetCRC
1661                     	xdef	_SPI_GetCRC
1662                     	xdef	_SPI_CalculateCRCCmd
1663                     	xdef	_SPI_TransmitCRC
1664                     	xdef	_SPI_NSSInternalSoftwareCmd
1665                     	xdef	_SPI_ReceiveData
1666                     	xdef	_SPI_SendData
1667                     	xdef	_SPI_ITConfig
1668                     	xdef	_SPI_Cmd
1669                     	xdef	_SPI_Init
1670                     	xdef	_SPI_DeInit
1689                     	end
