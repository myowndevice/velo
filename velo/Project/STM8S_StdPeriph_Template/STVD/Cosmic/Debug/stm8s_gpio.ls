   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
 115                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 115                     ; 54 {
 117                     .text:	section	.text,new
 118  0000               _GPIO_DeInit:
 122                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 124  0000 7f            	clr	(x)
 125                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 127  0001 6f02          	clr	(2,x)
 128                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 130  0003 6f03          	clr	(3,x)
 131                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 133  0005 6f04          	clr	(4,x)
 134                     ; 59 }
 137  0007 81            	ret	
 377                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 377                     ; 72 {
 378                     .text:	section	.text,new
 379  0000               _GPIO_Init:
 381  0000 89            	pushw	x
 382       00000000      OFST:	set	0
 385                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 387                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 389                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 391  0001 7b05          	ld	a,(OFST+5,sp)
 392  0003 43            	cpl	a
 393  0004 e404          	and	a,(4,x)
 394  0006 e704          	ld	(4,x),a
 395                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 397  0008 7b06          	ld	a,(OFST+6,sp)
 398  000a 2a16          	jrpl	L771
 399                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 401  000c a510          	bcp	a,#16
 402  000e 2705          	jreq	L102
 403                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 405  0010 f6            	ld	a,(x)
 406  0011 1a05          	or	a,(OFST+5,sp)
 408  0013 2004          	jra	L302
 409  0015               L102:
 410                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 412  0015 7b05          	ld	a,(OFST+5,sp)
 413  0017 43            	cpl	a
 414  0018 f4            	and	a,(x)
 415  0019               L302:
 416  0019 f7            	ld	(x),a
 417                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 419  001a 1e01          	ldw	x,(OFST+1,sp)
 420  001c e602          	ld	a,(2,x)
 421  001e 1a05          	or	a,(OFST+5,sp)
 423  0020 2005          	jra	L502
 424  0022               L771:
 425                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 427  0022 7b05          	ld	a,(OFST+5,sp)
 428  0024 43            	cpl	a
 429  0025 e402          	and	a,(2,x)
 430  0027               L502:
 431  0027 e702          	ld	(2,x),a
 432                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 434  0029 7b06          	ld	a,(OFST+6,sp)
 435  002b a540          	bcp	a,#64
 436  002d 2706          	jreq	L702
 437                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 439  002f e603          	ld	a,(3,x)
 440  0031 1a05          	or	a,(OFST+5,sp)
 442  0033 2005          	jra	L112
 443  0035               L702:
 444                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 446  0035 7b05          	ld	a,(OFST+5,sp)
 447  0037 43            	cpl	a
 448  0038 e403          	and	a,(3,x)
 449  003a               L112:
 450  003a e703          	ld	(3,x),a
 451                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 453  003c 7b06          	ld	a,(OFST+6,sp)
 454  003e a520          	bcp	a,#32
 455  0040 2706          	jreq	L312
 456                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 458  0042 e604          	ld	a,(4,x)
 459  0044 1a05          	or	a,(OFST+5,sp)
 461  0046 2005          	jra	L512
 462  0048               L312:
 463                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 465  0048 7b05          	ld	a,(OFST+5,sp)
 466  004a 43            	cpl	a
 467  004b e404          	and	a,(4,x)
 468  004d               L512:
 469  004d e704          	ld	(4,x),a
 470                     ; 131 }
 473  004f 85            	popw	x
 474  0050 81            	ret	
 520                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 520                     ; 142 {
 521                     .text:	section	.text,new
 522  0000               _GPIO_Write:
 524  0000 89            	pushw	x
 525       00000000      OFST:	set	0
 528                     ; 143   GPIOx->ODR = PortVal;
 530  0001 7b05          	ld	a,(OFST+5,sp)
 531  0003 f7            	ld	(x),a
 532                     ; 144 }
 535  0004 85            	popw	x
 536  0005 81            	ret	
 583                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 583                     ; 155 {
 584                     .text:	section	.text,new
 585  0000               _GPIO_WriteHigh:
 587  0000 89            	pushw	x
 588       00000000      OFST:	set	0
 591                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 593  0001 f6            	ld	a,(x)
 594  0002 1a05          	or	a,(OFST+5,sp)
 595  0004 f7            	ld	(x),a
 596                     ; 157 }
 599  0005 85            	popw	x
 600  0006 81            	ret	
 647                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 647                     ; 168 {
 648                     .text:	section	.text,new
 649  0000               _GPIO_WriteLow:
 651  0000 89            	pushw	x
 652       00000000      OFST:	set	0
 655                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 657  0001 7b05          	ld	a,(OFST+5,sp)
 658  0003 43            	cpl	a
 659  0004 f4            	and	a,(x)
 660  0005 f7            	ld	(x),a
 661                     ; 170 }
 664  0006 85            	popw	x
 665  0007 81            	ret	
 712                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 712                     ; 181 {
 713                     .text:	section	.text,new
 714  0000               _GPIO_WriteReverse:
 716  0000 89            	pushw	x
 717       00000000      OFST:	set	0
 720                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 722  0001 f6            	ld	a,(x)
 723  0002 1805          	xor	a,(OFST+5,sp)
 724  0004 f7            	ld	(x),a
 725                     ; 183 }
 728  0005 85            	popw	x
 729  0006 81            	ret	
 767                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 767                     ; 192 {
 768                     .text:	section	.text,new
 769  0000               _GPIO_ReadOutputData:
 773                     ; 193   return ((uint8_t)GPIOx->ODR);
 775  0000 f6            	ld	a,(x)
 778  0001 81            	ret	
 815                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 815                     ; 203 {
 816                     .text:	section	.text,new
 817  0000               _GPIO_ReadInputData:
 821                     ; 204   return ((uint8_t)GPIOx->IDR);
 823  0000 e601          	ld	a,(1,x)
 826  0002 81            	ret	
 894                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 894                     ; 214 {
 895                     .text:	section	.text,new
 896  0000               _GPIO_ReadInputPin:
 898  0000 89            	pushw	x
 899       00000000      OFST:	set	0
 902                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 904  0001 e601          	ld	a,(1,x)
 905  0003 1405          	and	a,(OFST+5,sp)
 908  0005 85            	popw	x
 909  0006 81            	ret	
 987                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 987                     ; 226 {
 988                     .text:	section	.text,new
 989  0000               _GPIO_ExternalPullUpConfig:
 991  0000 89            	pushw	x
 992       00000000      OFST:	set	0
 995                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 997                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 999                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1001  0001 7b06          	ld	a,(OFST+6,sp)
1002  0003 2706          	jreq	L374
1003                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1005  0005 e603          	ld	a,(3,x)
1006  0007 1a05          	or	a,(OFST+5,sp)
1008  0009 2005          	jra	L574
1009  000b               L374:
1010                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1012  000b 7b05          	ld	a,(OFST+5,sp)
1013  000d 43            	cpl	a
1014  000e e403          	and	a,(3,x)
1015  0010               L574:
1016  0010 e703          	ld	(3,x),a
1017                     ; 238 }
1020  0012 85            	popw	x
1021  0013 81            	ret	
1034                     	xdef	_GPIO_ExternalPullUpConfig
1035                     	xdef	_GPIO_ReadInputPin
1036                     	xdef	_GPIO_ReadOutputData
1037                     	xdef	_GPIO_ReadInputData
1038                     	xdef	_GPIO_WriteReverse
1039                     	xdef	_GPIO_WriteLow
1040                     	xdef	_GPIO_WriteHigh
1041                     	xdef	_GPIO_Write
1042                     	xdef	_GPIO_Init
1043                     	xdef	_GPIO_DeInit
1062                     	end
