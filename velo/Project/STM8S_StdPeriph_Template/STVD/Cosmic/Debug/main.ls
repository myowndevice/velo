   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  21                     	bsct
  22  0000               _timeblue:
  23  0000 00000000      	dc.l	0
  24  0004               _timeblueoff:
  25  0004 00            	dc.b	0
  26  0005               _timehalt:
  27  0005 00            	dc.b	0
  28  0006               _timedelay:
  29  0006 0000          	dc.w	0
  30  0008               _time_errspeed:
  31  0008 00            	dc.b	0
  32  0009               _time_errcad:
  33  0009 00            	dc.b	0
  34  000a               _timeawu:
  35  000a 00            	dc.b	0
  36  000b               _flagclr:
  37  000b 00            	dc.b	0
  38  000c               _isawu:
  39  000c 00            	dc.b	0
  40  000d               _RXready:
  41  000d 00            	dc.b	0
  42  000e               _blueen:
  43  000e 00            	dc.b	0
  44  000f               _errspeed:
  45  000f 00            	dc.b	0
  46  0010               _errcad:
  47  0010 00            	dc.b	0
  48  0011               _errspeed32:
  49  0011 00000000      	dc.l	0
  50  0015               _errcad32:
  51  0015 00000000      	dc.l	0
  52  0019               _kn:
  53  0019 00            	dc.b	0
  54  001a               _RXtek:
  55  001a 00            	dc.b	0
 102                     ; 88 void clearlocal(void)
 102                     ; 89 {
 104                     .text:	section	.text,new
 105  0000               _clearlocal:
 107  0000 89            	pushw	x
 108       00000002      OFST:	set	2
 111                     ; 91 	for (i=0;i<10;i++) obs[i]=0;
 113  0001 5f            	clrw	x
 114  0002 1f01          	ldw	(OFST-1,sp),x
 116  0004               L72:
 119  0004 58            	sllw	x
 120  0005 58            	sllw	x
 121  0006 4f            	clr	a
 122  0007 e749          	ld	(_obs+3,x),a
 123  0009 e748          	ld	(_obs+2,x),a
 124  000b e747          	ld	(_obs+1,x),a
 125  000d e746          	ld	(_obs,x),a
 128  000f 1e01          	ldw	x,(OFST-1,sp)
 129  0011 5c            	incw	x
 130  0012 1f01          	ldw	(OFST-1,sp),x
 134  0014 a3000a        	cpw	x,#10
 135  0017 2feb          	jrslt	L72
 136                     ; 92 	hall[0]=0;hall[1]=0;
 138  0019 5f            	clrw	x
 139  001a bf40          	ldw	_hall+2,x
 140  001c bf3e          	ldw	_hall,x
 143  001e bf44          	ldw	_hall+6,x
 144  0020 bf42          	ldw	_hall+4,x
 145                     ; 93 	activetime=0;
 147  0022 bf3c          	ldw	_activetime+2,x
 148  0024 bf3a          	ldw	_activetime,x
 149                     ; 94 	power=0;
 151  0026 bf38          	ldw	_power+2,x
 152  0028 bf36          	ldw	_power,x
 153                     ; 95 	scor1=0;
 155  002a 3f35          	clr	_scor1
 156                     ; 96 	scor2=0;
 158  002c 3f34          	clr	_scor2
 159                     ; 97 	maxspeed=0;	
 161  002e bf32          	ldw	_maxspeed+2,x
 162  0030 bf30          	ldw	_maxspeed,x
 163                     ; 98 }
 166  0032 85            	popw	x
 167  0033 81            	ret	
 204                     ; 126 void playmusic(int t)
 204                     ; 127 {
 205                     .text:	section	.text,new
 206  0000               _playmusic:
 208  0000 89            	pushw	x
 209       00000000      OFST:	set	0
 212                     ; 130 	if (t==1) 
 214  0001 5a            	decw	x
 215  0002 261e          	jrne	L35
 216                     ; 133 		BEEP_Init(BEEP_FREQUENCY_1KHZ);
 218  0004 4f            	clr	a
 219  0005 cd0000        	call	_BEEP_Init
 221                     ; 134 		BEEP_Cmd(ENABLE);
 223  0008 a601          	ld	a,#1
 224  000a ad7e          	call	LC002
 226                     ; 136 		BEEP_Init(BEEP_FREQUENCY_2KHZ);
 228  000c a640          	ld	a,#64
 229  000e cd0000        	call	_BEEP_Init
 231                     ; 137 		Delay(200);
 233  0011 ae00c8        	ldw	x,#200
 234  0014 cd0000        	call	_Delay
 236                     ; 138 		BEEP_Init(BEEP_FREQUENCY_4KHZ);
 238  0017 a680          	ld	a,#128
 239  0019 cd0000        	call	_BEEP_Init
 241                     ; 139 		Delay(100);
 243  001c ae0064        	ldw	x,#100
 244  001f cd0000        	call	_Delay
 246  0022               L35:
 247                     ; 142 	if (t==2)
 249  0022 1e01          	ldw	x,(OFST+1,sp)
 250  0024 a30002        	cpw	x,#2
 251  0027 2611          	jrne	L55
 252                     ; 145 		BEEP_Init(BEEP_FREQUENCY_1KHZ);
 254  0029 4f            	clr	a
 255  002a cd0000        	call	_BEEP_Init
 257                     ; 146 		BEEP_Cmd(ENABLE);
 259  002d a601          	ld	a,#1
 260  002f ad50          	call	LC001
 262                     ; 148 		BEEP_Cmd(DISABLE);
 264  0031 4f            	clr	a
 265  0032 ad4d          	call	LC001
 267                     ; 150 		BEEP_Cmd(ENABLE);
 269  0034 a601          	ld	a,#1
 270  0036 ad49          	call	LC001
 272  0038 1e01          	ldw	x,(OFST+1,sp)
 273  003a               L55:
 274                     ; 154 	if (t==3)
 276  003a a30003        	cpw	x,#3
 277  003d 2612          	jrne	L75
 278                     ; 157 		BEEP_Init(BEEP_FREQUENCY_4KHZ);		
 280  003f a680          	ld	a,#128
 281  0041 cd0000        	call	_BEEP_Init
 283                     ; 158 		BEEP_Cmd(ENABLE);
 285  0044 a601          	ld	a,#1
 286  0046 ad39          	call	LC001
 288                     ; 160 		BEEP_Cmd(DISABLE);
 290  0048 4f            	clr	a
 291  0049 ad36          	call	LC001
 293                     ; 162 		BEEP_Cmd(ENABLE);
 295  004b a601          	ld	a,#1
 296  004d ad32          	call	LC001
 298  004f 1e01          	ldw	x,(OFST+1,sp)
 299  0051               L75:
 300                     ; 166 	if (t==4)
 302  0051 a30004        	cpw	x,#4
 303  0054 2612          	jrne	L16
 304                     ; 169 		BEEP_Init(BEEP_FREQUENCY_2KHZ);
 306  0056 a640          	ld	a,#64
 307  0058 cd0000        	call	_BEEP_Init
 309                     ; 170 		BEEP_Cmd(ENABLE);
 311  005b a601          	ld	a,#1
 312  005d ad2b          	call	LC002
 314                     ; 172 		BEEP_Cmd(DISABLE);
 316  005f 4f            	clr	a
 317  0060 ad28          	call	LC002
 319                     ; 174 		BEEP_Cmd(ENABLE);
 321  0062 a601          	ld	a,#1
 322  0064 ad24          	call	LC002
 324  0066 1e01          	ldw	x,(OFST+1,sp)
 325  0068               L16:
 326                     ; 178 	if (t==5)
 328  0068 a30005        	cpw	x,#5
 329  006b 2606          	jrne	L36
 330                     ; 181 		BEEP_Init(BEEP_FREQUENCY_4KHZ);
 332  006d a680          	ld	a,#128
 333  006f ad22          	call	LC003
 335  0071 1e01          	ldw	x,(OFST+1,sp)
 336  0073               L36:
 337                     ; 186 	if (t==6)
 339  0073 a30006        	cpw	x,#6
 340  0076 2603          	jrne	L56
 341                     ; 189 		BEEP_Init(BEEP_FREQUENCY_1KHZ);
 343  0078 4f            	clr	a
 344  0079 ad18          	call	LC003
 346  007b               L56:
 347                     ; 193 	BEEP_Cmd(DISABLE);
 349  007b 4f            	clr	a
 350  007c cd0000        	call	_BEEP_Cmd
 352                     ; 194 }
 355  007f 85            	popw	x
 356  0080 81            	ret	
 357  0081               LC001:
 358  0081 cd0000        	call	_BEEP_Cmd
 360                     ; 163 		Delay(300);						
 362  0084 ae012c        	ldw	x,#300
 363  0087 cc0000        	jp	_Delay
 364  008a               LC002:
 365  008a cd0000        	call	_BEEP_Cmd
 367                     ; 175 		Delay(100);						
 369  008d ae0064        	ldw	x,#100
 370  0090 cc0000        	jp	_Delay
 371  0093               LC003:
 372  0093 cd0000        	call	_BEEP_Init
 374                     ; 190 		BEEP_Cmd(ENABLE);
 376  0096 a601          	ld	a,#1
 377  0098 cd0000        	call	_BEEP_Cmd
 379                     ; 191 		Delay(700);
 381  009b ae02bc        	ldw	x,#700
 382  009e cc0000        	jp	_Delay
 437                     ; 196 void saveflash(u32 addrf,u32 addr,u8 nbyte)
 437                     ; 197 {
 438                     .text:	section	.text,new
 439  0000               _saveflash:
 441       00000000      OFST:	set	0
 444                     ; 198 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
 446  0000 a6f7          	ld	a,#247
 447  0002 cd0000        	call	_FLASH_Unlock
 450  0005 2021          	jra	L711
 451  0007               L511:
 452                     ; 202 		FLASH_ProgramByte(addrf, *((u8 *)addr));
 454  0007 1e09          	ldw	x,(OFST+9,sp)
 455  0009 f6            	ld	a,(x)
 456  000a 88            	push	a
 457  000b 1e06          	ldw	x,(OFST+6,sp)
 458  000d 89            	pushw	x
 459  000e 1e06          	ldw	x,(OFST+6,sp)
 460  0010 89            	pushw	x
 461  0011 cd0000        	call	_FLASH_ProgramByte
 463  0014 5b05          	addw	sp,#5
 464                     ; 203 		addr++;
 466  0016 96            	ldw	x,sp
 467  0017 1c0007        	addw	x,#OFST+7
 468  001a a601          	ld	a,#1
 469  001c cd0000        	call	c_lgadc
 471                     ; 204 		addrf++;
 473  001f 96            	ldw	x,sp
 474  0020 1c0003        	addw	x,#OFST+3
 475  0023 a601          	ld	a,#1
 476  0025 cd0000        	call	c_lgadc
 478  0028               L711:
 479                     ; 200 	while (nbyte--)
 481  0028 7b0b          	ld	a,(OFST+11,sp)
 482  002a 0a0b          	dec	(OFST+11,sp)
 483  002c 4d            	tnz	a
 484  002d 26d8          	jrne	L511
 485                     ; 207 	FLASH_Lock(FLASH_MEMTYPE_DATA);
 487  002f a6f7          	ld	a,#247
 489                     ; 208 }
 492  0031 cc0000        	jp	_FLASH_Lock
 547                     ; 210 void readflash(u32 addrf,u32 addr,u8 nbyte)
 547                     ; 211 {
 548                     .text:	section	.text,new
 549  0000               _readflash:
 551       00000000      OFST:	set	0
 554                     ; 212 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
 556  0000 a6f7          	ld	a,#247
 557  0002 cd0000        	call	_FLASH_Unlock
 560  0005 2020          	jra	L351
 561  0007               L151:
 562                     ; 216 		*((u8 *)addr) = FLASH_ReadByte(addrf);
 564  0007 1e05          	ldw	x,(OFST+5,sp)
 565  0009 89            	pushw	x
 566  000a 1e05          	ldw	x,(OFST+5,sp)
 567  000c 89            	pushw	x
 568  000d cd0000        	call	_FLASH_ReadByte
 570  0010 5b04          	addw	sp,#4
 571  0012 1e09          	ldw	x,(OFST+9,sp)
 572  0014 f7            	ld	(x),a
 573                     ; 217 		addr++;
 575  0015 96            	ldw	x,sp
 576  0016 1c0007        	addw	x,#OFST+7
 577  0019 a601          	ld	a,#1
 578  001b cd0000        	call	c_lgadc
 580                     ; 218 		addrf++;
 582  001e 96            	ldw	x,sp
 583  001f 1c0003        	addw	x,#OFST+3
 584  0022 a601          	ld	a,#1
 585  0024 cd0000        	call	c_lgadc
 587  0027               L351:
 588                     ; 214 	while (nbyte--)
 590  0027 7b0b          	ld	a,(OFST+11,sp)
 591  0029 0a0b          	dec	(OFST+11,sp)
 592  002b 4d            	tnz	a
 593  002c 26d9          	jrne	L151
 594                     ; 221 	FLASH_Lock(FLASH_MEMTYPE_DATA);
 596  002e a6f7          	ld	a,#247
 598                     ; 222 }
 601  0030 cc0000        	jp	_FLASH_Lock
 647                     ; 224 void cleareeprom(int i)
 647                     ; 225 {
 648                     .text:	section	.text,new
 649  0000               _cleareeprom:
 651  0000 89            	pushw	x
 652       00000002      OFST:	set	2
 655                     ; 226 	if (i)
 657  0001 5d            	tnzw	x
 658  0002 2708          	jreq	L102
 659                     ; 228 		param.ves = 80;
 661  0004 3550001c      	mov	_param,#80
 662                     ; 229 		param.dkoles = 105;
 664  0008 3569001d      	mov	_param+1,#105
 665  000c               L102:
 666                     ; 232 	param.probeg= 0;
 668  000c 5f            	clrw	x
 669  000d bf20          	ldw	_param+4,x
 670  000f bf1e          	ldw	_param+2,x
 671                     ; 233 	param.power= 0;		
 673  0011 bf24          	ldw	_param+8,x
 674  0013 bf22          	ldw	_param+6,x
 675                     ; 234 	param.numpoezdki=0;//текущая поездка куда пишем
 677  0015 3f26          	clr	_param+10
 678                     ; 235 	saveflash(0x4000,(u32)&param,14);
 680  0017 4b0e          	push	#14
 681  0019 351c0003      	mov	c_lreg+3,#_param
 682  001d 3f02          	clr	c_lreg+2
 683  001f 3f01          	clr	c_lreg+1
 684  0021 3f00          	clr	c_lreg
 685  0023 be02          	ldw	x,c_lreg+2
 686  0025 89            	pushw	x
 687  0026 be00          	ldw	x,c_lreg
 688  0028 89            	pushw	x
 689  0029 ae4000        	ldw	x,#16384
 690  002c 89            	pushw	x
 691  002d 5f            	clrw	x
 692  002e 89            	pushw	x
 693  002f cd0000        	call	_saveflash
 695  0032 5b09          	addw	sp,#9
 696                     ; 238 		int b=0;
 698                     ; 239 		poezdka.nump=0;
 700  0034 5f            	clrw	x
 701  0035 bf03          	ldw	_poezdka+3,x
 702  0037 bf01          	ldw	_poezdka+1,x
 703                     ; 240 		poezdka.fix=0;
 705  0039 3f00          	clr	_poezdka
 706                     ; 241 		for (b=0;b<NUMBERP;b++)
 708  003b 1f01          	ldw	(OFST-1,sp),x
 710  003d               L302:
 711                     ; 243 			saveflash(ADDRP+b*NUMBYTEP,(u32)&poezdka,NUMBYTEP);
 713  003d 4b1c          	push	#28
 714  003f 35000003      	mov	c_lreg+3,#_poezdka
 715  0043 3f02          	clr	c_lreg+2
 716  0045 3f01          	clr	c_lreg+1
 717  0047 3f00          	clr	c_lreg
 718  0049 be02          	ldw	x,c_lreg+2
 719  004b 89            	pushw	x
 720  004c be00          	ldw	x,c_lreg
 721  004e 89            	pushw	x
 722  004f 1e06          	ldw	x,(OFST+4,sp)
 723  0051 90ae001c      	ldw	y,#28
 724  0055 cd0000        	call	c_imul
 726  0058 1c400e        	addw	x,#16398
 727  005b cd0000        	call	c_itolx
 729  005e be02          	ldw	x,c_lreg+2
 730  0060 89            	pushw	x
 731  0061 be00          	ldw	x,c_lreg
 732  0063 89            	pushw	x
 733  0064 cd0000        	call	_saveflash
 735  0067 5b09          	addw	sp,#9
 736                     ; 241 		for (b=0;b<NUMBERP;b++)
 738  0069 1e01          	ldw	x,(OFST-1,sp)
 739  006b 5c            	incw	x
 740  006c 1f01          	ldw	(OFST-1,sp),x
 744  006e a30004        	cpw	x,#4
 745  0071 2fca          	jrslt	L302
 746                     ; 248 }
 749  0073 85            	popw	x
 750  0074 81            	ret	
 774                     ; 250 void nextp(void) {
 775                     .text:	section	.text,new
 776  0000               _nextp:
 780                     ; 251 	param.numpoezdki++;
 782  0000 3c26          	inc	_param+10
 783                     ; 253 	if (param.numpoezdki >= NUMBERP)
 785  0002 b626          	ld	a,_param+10
 786  0004 a104          	cp	a,#4
 787  0006 2502          	jrult	L122
 788                     ; 254 			param.numpoezdki=0;
 790  0008 3f26          	clr	_param+10
 791  000a               L122:
 792                     ; 255 }		
 795  000a 81            	ret	
 820                     ; 257 void printparam(void){
 821                     .text:	section	.text,new
 822  0000               _printparam:
 826                     ; 258 	printf("%i(ves-kg)%i (d-cm)%li (ks)%i (kk)%i (prob)%li (cal)%li\n\r",(int)param.numpoezdki,(int)param.ves,(long)param.dkoles,param.ks,param.kk,param.probeg,param.power);
 828  0000 be24          	ldw	x,_param+8
 829  0002 89            	pushw	x
 830  0003 be22          	ldw	x,_param+6
 831  0005 89            	pushw	x
 832  0006 be20          	ldw	x,_param+4
 833  0008 89            	pushw	x
 834  0009 be1e          	ldw	x,_param+2
 835  000b 89            	pushw	x
 836  000c be29          	ldw	x,_param+13
 837  000e 89            	pushw	x
 838  000f be27          	ldw	x,_param+11
 839  0011 89            	pushw	x
 840  0012 451d03        	mov	c_lreg+3,_param+1
 841  0015 3f02          	clr	c_lreg+2
 842  0017 3f01          	clr	c_lreg+1
 843  0019 3f00          	clr	c_lreg
 844  001b be02          	ldw	x,c_lreg+2
 845  001d 89            	pushw	x
 846  001e be00          	ldw	x,c_lreg
 847  0020 89            	pushw	x
 848  0021 b61c          	ld	a,_param
 849  0023 5f            	clrw	x
 850  0024 97            	ld	xl,a
 851  0025 89            	pushw	x
 852  0026 b626          	ld	a,_param+10
 853  0028 5f            	clrw	x
 854  0029 97            	ld	xl,a
 855  002a 89            	pushw	x
 856  002b ae00c3        	ldw	x,#L332
 857  002e cd0000        	call	_printf
 859  0031 5b14          	addw	sp,#20
 860                     ; 259 }	
 863  0033 81            	ret	
1066                     .const:	section	.text
1067  0000               L242:
1068  0000 0000013a      	dc.l	314
1069  0004               L442:
1070  0004 00002710      	dc.l	10000
1071  0008               L062:
1072  0008 000004b1      	dc.l	1201
1073  000c               L033:
1074  000c 0000003c      	dc.l	60
1075                     ; 261 void main(void)
1075                     ; 262 {
1076                     .text:	section	.text,new
1077  0000               _main:
1079  0000 5213          	subw	sp,#19
1080       00000013      OFST:	set	19
1083                     ; 269 	CLK->PCKENR1 = 0;
1085  0002 725f50c7      	clr	20679
1086                     ; 270 	CLK->PCKENR1 |= CLK_PCKENR1_UART2|CLK_PCKENR1_TIM4;
1088  0006 c650c7        	ld	a,20679
1089  0009 aa18          	or	a,#24
1090  000b c750c7        	ld	20679,a
1091                     ; 271 	CLK->PCKENR2 = 0xFF & 0b01110111;
1093  000e 357750ca      	mov	20682,#119
1094                     ; 273 	clearlocal();
1096  0012 cd0000        	call	_clearlocal
1098                     ; 275 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
1100  0015 4f            	clr	a
1101  0016 cd0000        	call	_CLK_HSIPrescalerConfig
1103                     ; 277 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
1105  0019 4b00          	push	#0
1106  001b 4b00          	push	#0
1107  001d ae01b4        	ldw	x,#436
1108  0020 cd0000        	call	_CLK_ClockSwitchConfig
1110  0023 c650c6        	ld	a,20678
1111  0026 aa03          	or	a,#3
1112  0028 c750c6        	ld	20678,a
1113  002b 3501006e      	mov	_haltstart,#1
1114  002f 85            	popw	x
1115                     ; 278 	CLK->CKDIVR |= (uint8_t)(0b11); //CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV8);
1117                     ; 281 	haltstart=1;
1119                     ; 282 	GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_IN_PU_IT);//knopka
1121  0030 cd055c        	call	LC008
1122                     ; 284 	GPIO_Init(GPIOC,GPIO_PIN_6,GPIO_MODE_IN_PU_IT);//H2
1124  0033 4b60          	push	#96
1125  0035 4b40          	push	#64
1126  0037 ae500a        	ldw	x,#20490
1127  003a cd0000        	call	_GPIO_Init
1129  003d c650a0        	ld	a,20640
1130  0040 a43f          	and	a,#63
1131  0042 c750a0        	ld	20640,a
1132  0045 721e50a0      	bset	20640,#7
1133  0049 c650a0        	ld	a,20640
1134  004c a4cf          	and	a,#207
1135  004e c750a0        	ld	20640,a
1136  0051 721a50a0      	bset	20640,#5
1137  0055 4f            	clr	a
1138  0056 85            	popw	x
1139                     ; 288 	EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
1141                     ; 289 	EXTI->CR1 |= (uint8_t)((uint8_t)(0x02) << 6);
1143                     ; 292 	EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
1145                     ; 293 	EXTI->CR1 |= (uint8_t)((uint8_t)(0x02) << 4);
1147                     ; 297 	BEEP_Cmd(DISABLE);
1149  0057 cd0000        	call	_BEEP_Cmd
1151                     ; 299 	UART1_DeInit();
1153  005a cd0000        	call	_UART1_DeInit
1155                     ; 300   UART1_Init((uint32_t)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
1155                     ; 301               UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
1157  005d 4b0c          	push	#12
1158  005f 4b80          	push	#128
1159  0061 4b00          	push	#0
1160  0063 4b00          	push	#0
1161  0065 4b00          	push	#0
1162  0067 ae2580        	ldw	x,#9600
1163  006a 89            	pushw	x
1164  006b 5f            	clrw	x
1165  006c 89            	pushw	x
1166  006d cd0000        	call	_UART1_Init
1168  0070 5b09          	addw	sp,#9
1169                     ; 303 	UART1_ITConfig(UART1_IT_RXNE_OR,ENABLE);
1171  0072 4b01          	push	#1
1172  0074 ae0205        	ldw	x,#517
1173  0077 cd0000        	call	_UART1_ITConfig
1175  007a ae0739        	ldw	x,#1849
1176  007d 84            	pop	a
1177                     ; 307 	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 57);
1179  007e cd0000        	call	_TIM4_TimeBaseInit
1181                     ; 310 	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
1183  0081 a601          	ld	a,#1
1184  0083 cd0000        	call	_TIM4_ClearFlag
1186                     ; 312 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
1188  0086 ae0101        	ldw	x,#257
1189  0089 cd0000        	call	_TIM4_ITConfig
1191                     ; 315 	enableInterrupts();
1194  008c 9a            	rim	
1196                     ; 318 	TIM4_Cmd(ENABLE);
1199  008d a601          	ld	a,#1
1200  008f cd0000        	call	_TIM4_Cmd
1202                     ; 320 	Delay(1000);//на всякий случай чтобы было время зайти в режим программирования без ресет
1204  0092 ae03e8        	ldw	x,#1000
1205  0095 cd0000        	call	_Delay
1207                     ; 322 	GPIO_Init(GPIOC,GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_SLOW);
1209  0098 4bc0          	push	#192
1210  009a 4b38          	push	#56
1211  009c ae500a        	ldw	x,#20490
1212  009f cd0000        	call	_GPIO_Init
1214  00a2 85            	popw	x
1215                     ; 323 	GPIO_Init(GPIOB,GPIO_PIN_5|GPIO_PIN_4,GPIO_MODE_OUT_OD_HIZ_SLOW);
1217  00a3 4b90          	push	#144
1218  00a5 4b30          	push	#48
1219  00a7 ae5005        	ldw	x,#20485
1220  00aa cd0000        	call	_GPIO_Init
1222  00ad 85            	popw	x
1223                     ; 325 	GPIO_Init(GPIOD,GPIO_PIN_4,GPIO_MODE_OUT_PP_LOW_SLOW);//speaker
1225  00ae 4bc0          	push	#192
1226  00b0 4b10          	push	#16
1227  00b2 ae500f        	ldw	x,#20495
1228  00b5 cd0000        	call	_GPIO_Init
1230  00b8 85            	popw	x
1231                     ; 326 	GPIO_Init(GPIOD,GPIO_PIN_2,GPIO_MODE_OUT_OD_HIZ_SLOW);//blue on off
1233  00b9 4b90          	push	#144
1234  00bb 4b04          	push	#4
1235  00bd ae500f        	ldw	x,#20495
1236  00c0 cd0000        	call	_GPIO_Init
1238  00c3 8e            	halt	
1239  00c4 85            	popw	x
1240                     ; 331 	halt();//do knopki!!!
1244                     ; 334 	playmusic(1);
1247  00c5 ae0001        	ldw	x,#1
1248  00c8 cd0000        	call	_playmusic
1250                     ; 335 	haltstart = 0;
1252  00cb 3f6e          	clr	_haltstart
1253                     ; 338 	bton;//включаем bluetooth
1255  00cd 7215500f      	bres	20495,#2
1256                     ; 339 	blueen = TRUE;
1258  00d1 3501000e      	mov	_blueen,#1
1259                     ; 341 	kn = FALSE;
1261  00d5 3f19          	clr	_kn
1262                     ; 343 	timeblueoff = 120;
1264  00d7 35780004      	mov	_timeblueoff,#120
1265                     ; 344 	timehalt    = 120;
1267  00db 35780005      	mov	_timehalt,#120
1268                     ; 348 	readflash(0x4000,(u32)&param,14);
1270  00df 4b0e          	push	#14
1271  00e1 351c0003      	mov	c_lreg+3,#_param
1272  00e5 cd0573        	call	LC009
1273  00e8 89            	pushw	x
1274  00e9 be00          	ldw	x,c_lreg
1275  00eb 89            	pushw	x
1276  00ec ae4000        	ldw	x,#16384
1277  00ef 89            	pushw	x
1278  00f0 5f            	clrw	x
1279  00f1 89            	pushw	x
1280  00f2 cd0000        	call	_readflash
1282  00f5 5b09          	addw	sp,#9
1283                     ; 350 	if (param.ves==255 || param.ves==0)
1285  00f7 b61c          	ld	a,_param
1286  00f9 4c            	inc	a
1287  00fa 2704          	jreq	L753
1289  00fc b61c          	ld	a,_param
1290  00fe 2606          	jrne	L553
1291  0100               L753:
1292                     ; 352 		cleareeprom(1);
1294  0100 ae0001        	ldw	x,#1
1295  0103 cd0000        	call	_cleareeprom
1297  0106               L553:
1298                     ; 355 	readflash(ADDRP+param.numpoezdki*NUMBYTEP,(u32)&poezdka,NUMBYTEP);
1300  0106 4b1c          	push	#28
1301  0108 35000003      	mov	c_lreg+3,#_poezdka
1302  010c cd0573        	call	LC009
1303  010f 89            	pushw	x
1304  0110 be00          	ldw	x,c_lreg
1305  0112 89            	pushw	x
1306  0113 b626          	ld	a,_param+10
1307  0115 97            	ld	xl,a
1308  0116 a61c          	ld	a,#28
1309  0118 42            	mul	x,a
1310  0119 cd057c        	call	LC010
1311  011c 89            	pushw	x
1312  011d be00          	ldw	x,c_lreg
1313  011f 89            	pushw	x
1314  0120 cd0000        	call	_readflash
1316  0123 5b09          	addw	sp,#9
1317                     ; 356 	if (poezdka.fix==1)
1319  0125 b600          	ld	a,_poezdka
1320  0127 4a            	dec	a
1321  0128 262b          	jrne	L363
1322                     ; 359 		param.power+=poezdka.power;
1324  012a ae0009        	ldw	x,#_poezdka+9
1325  012d cd0000        	call	c_ltor
1327  0130 ae0022        	ldw	x,#_param+6
1328  0133 cd0000        	call	c_lgadd
1330                     ; 360 		param.probeg+=poezdka.probeg;
1332  0136 ae0005        	ldw	x,#_poezdka+5
1333  0139 cd0000        	call	c_ltor
1335  013c ae001e        	ldw	x,#_param+2
1336  013f cd0000        	call	c_lgadd
1338                     ; 361 		nextp();
1340  0142 cd0000        	call	_nextp
1342                     ; 362 		saveflash(0x4000,(u32)&param,14);
1344  0145 cd0544        	call	LC007
1345                     ; 364 		poezdka.fix = 0;
1347  0148 3f00          	clr	_poezdka
1348                     ; 365 		poezdka.nump++;
1350  014a ae0001        	ldw	x,#_poezdka+1
1351  014d a601          	ld	a,#1
1352  014f cd0000        	call	c_lgadc
1354                     ; 366 		saveflash(ADDRP+param.numpoezdki*NUMBYTEP,(u32)&poezdka,NUMBYTEP);
1356  0152 cd0526        	call	LC006
1357  0155               L363:
1358                     ; 384 		if (timeblue==0 && blueen) {
1360  0155 ae0000        	ldw	x,#_timeblue
1361  0158 cd0000        	call	c_lzmp
1363  015b 2703cc01f1    	jrne	L763
1365  0160 b60e          	ld	a,_blueen
1366  0162 27f9          	jreq	L763
1367                     ; 386 			timeblue = 2;
1369  0164 ae0002        	ldw	x,#2
1370  0167 bf02          	ldw	_timeblue+2,x
1371  0169 5f            	clrw	x
1372  016a bf00          	ldw	_timeblue,x
1373                     ; 388 			printf("(cad)%i (SCOR)%i (all)%li (ob)%li (prob)%li (cal)%li (atime)%li\n\r",(int)scor1,(int)scor2,(long)(hall[0]+hall[1]),(long)(hall[0]),(long)(hall[1]*(long)param.dkoles*PI/100/100),(long)power,activetime);
1375  016c be3c          	ldw	x,_activetime+2
1376  016e 89            	pushw	x
1377  016f be3a          	ldw	x,_activetime
1378  0171 89            	pushw	x
1379  0172 cd0592        	call	LC012
1381  0175 be02          	ldw	x,c_lreg+2
1382  0177 89            	pushw	x
1383  0178 be00          	ldw	x,c_lreg
1384  017a 89            	pushw	x
1385  017b 451d03        	mov	c_lreg+3,_param+1
1386  017e 3f02          	clr	c_lreg+2
1387  0180 3f01          	clr	c_lreg+1
1388  0182 3f00          	clr	c_lreg
1389  0184 ae0042        	ldw	x,#_hall+4
1390  0187 cd0585        	call	LC011
1391  018a cd0000        	call	c_ludv
1393  018d be02          	ldw	x,c_lreg+2
1394  018f 89            	pushw	x
1395  0190 be00          	ldw	x,c_lreg
1396  0192 89            	pushw	x
1397  0193 be40          	ldw	x,_hall+2
1398  0195 89            	pushw	x
1399  0196 be3e          	ldw	x,_hall
1400  0198 89            	pushw	x
1401  0199 ae003e        	ldw	x,#_hall
1402  019c cd0000        	call	c_ltor
1404  019f ae0042        	ldw	x,#_hall+4
1405  01a2 cd0000        	call	c_ladd
1407  01a5 be02          	ldw	x,c_lreg+2
1408  01a7 89            	pushw	x
1409  01a8 be00          	ldw	x,c_lreg
1410  01aa 89            	pushw	x
1411  01ab b634          	ld	a,_scor2
1412  01ad 5f            	clrw	x
1413  01ae 97            	ld	xl,a
1414  01af 89            	pushw	x
1415  01b0 b635          	ld	a,_scor1
1416  01b2 5f            	clrw	x
1417  01b3 97            	ld	xl,a
1418  01b4 89            	pushw	x
1419  01b5 ae0081        	ldw	x,#L173
1420  01b8 cd0000        	call	_printf
1422  01bb 5b18          	addw	sp,#24
1423                     ; 390 			printf("t");
1425  01bd ae007f        	ldw	x,#L373
1426  01c0 cd0000        	call	_printf
1428                     ; 394 				for (j=0;j<10;j++){
1430  01c3 5f            	clrw	x
1431  01c4 1f12          	ldw	(OFST-1,sp),x
1433  01c6               L573:
1434                     ; 395 					printf(":(%i)%li",(int)(j+1)*4,(long)obs[j]);
1436  01c6 58            	sllw	x
1437  01c7 58            	sllw	x
1438  01c8 9093          	ldw	y,x
1439  01ca ee48          	ldw	x,(_obs+2,x)
1440  01cc 89            	pushw	x
1441  01cd 93            	ldw	x,y
1442  01ce ee46          	ldw	x,(_obs,x)
1443  01d0 89            	pushw	x
1444  01d1 1e16          	ldw	x,(OFST+3,sp)
1445  01d3 58            	sllw	x
1446  01d4 58            	sllw	x
1447  01d5 1c0004        	addw	x,#4
1448  01d8 89            	pushw	x
1449  01d9 ae0076        	ldw	x,#L304
1450  01dc cd0000        	call	_printf
1452  01df 5b06          	addw	sp,#6
1453                     ; 394 				for (j=0;j<10;j++){
1455  01e1 1e12          	ldw	x,(OFST-1,sp)
1456  01e3 5c            	incw	x
1457  01e4 1f12          	ldw	(OFST-1,sp),x
1461  01e6 a3000a        	cpw	x,#10
1462  01e9 2fdb          	jrslt	L573
1463                     ; 397 				printf("\n\r");
1465  01eb ae0073        	ldw	x,#L504
1466  01ee cd0000        	call	_printf
1468  01f1               L763:
1469                     ; 401 		if (kn==TRUE) {
1471  01f1 b619          	ld	a,_kn
1472  01f3 4a            	dec	a
1473  01f4 2620          	jrne	L704
1474                     ; 403 			kn = FALSE;
1476  01f6 b719          	ld	_kn,a
1477                     ; 404 			btchange;
1479  01f8 9014500f      	bcpl	20495,#2
1480                     ; 406 			if (ifbtoff)
1482  01fc 7204500f0d    	btjt	20495,#2,L114
1483                     ; 408 					blueen=TRUE;
1485  0201 3501000e      	mov	_blueen,#1
1486                     ; 409 					timeblueoff=120;
1488  0205 35780004      	mov	_timeblueoff,#120
1489                     ; 410 					playmusic(2);
1491  0209 ae0002        	ldw	x,#2
1494  020c 2005          	jp	LC004
1495  020e               L114:
1496                     ; 414 					blueen=FALSE;
1498  020e 3f0e          	clr	_blueen
1499                     ; 415 					playmusic(3);
1501  0210 ae0003        	ldw	x,#3
1502  0213               LC004:
1503  0213 cd0000        	call	_playmusic
1505  0216               L704:
1506                     ; 427 		if (timehalt==0) {
1508  0216 b605          	ld	a,_timehalt
1509  0218 2703cc02f7    	jrne	L514
1510                     ; 428 			flagclr=0;
1512  021d b70b          	ld	_flagclr,a
1513                     ; 429 			haltstart=1;
1515  021f 3501006e      	mov	_haltstart,#1
1516                     ; 430 			timehalt=120;
1518  0223 35780005      	mov	_timehalt,#120
1519                     ; 431 			btoff;//выкл блютус
1521  0227 7214500f      	bset	20495,#2
1522                     ; 432 			blueen=FALSE;
1524  022b b70e          	ld	_blueen,a
1525                     ; 435 			if (activetime>1200) //маленькие поездки не фиксируем!
1527  022d ae003a        	ldw	x,#_activetime
1528  0230 cd0000        	call	c_ltor
1530  0233 ae0008        	ldw	x,#L062
1531  0236 cd0000        	call	c_lcmp
1533  0239 2571          	jrult	L714
1534                     ; 438 				poezdka.activetime = activetime;
1536  023b be3c          	ldw	x,_activetime+2
1537  023d bf1a          	ldw	_poezdka+26,x
1538  023f be3a          	ldw	x,_activetime
1539  0241 bf18          	ldw	_poezdka+24,x
1540                     ; 439 				poezdka.power = (u32)power;//оставим целую часть от калорий
1542  0243 cd0592        	call	LC012
1544  0246 ae0009        	ldw	x,#_poezdka+9
1545  0249 cd0000        	call	c_rtol
1547                     ; 440 				for (u=0;u<10;u++)
1549  024c 5f            	clrw	x
1550  024d 1f12          	ldw	(OFST-1,sp),x
1552  024f               L124:
1553                     ; 442 					poezdka.obs[u]=0;
1555  024f 6f0d          	clr	(_poezdka+13,x)
1556                     ; 443 					if(obs[u])
1558  0251 58            	sllw	x
1559  0252 58            	sllw	x
1560  0253 1c0046        	addw	x,#_obs
1561  0256 cd0000        	call	c_lzmp
1563  0259 271b          	jreq	L724
1564                     ; 444 						poezdka.obs[u] = obs[u]*100/activetime;//переведем в проценты от общего активного времени!
1566  025b 1e12          	ldw	x,(OFST-1,sp)
1567  025d 58            	sllw	x
1568  025e 58            	sllw	x
1569  025f 1c0046        	addw	x,#_obs
1570  0262 cd0000        	call	c_ltor
1572  0265 a664          	ld	a,#100
1573  0267 cd0000        	call	c_smul
1575  026a ae003a        	ldw	x,#_activetime
1576  026d cd0000        	call	c_ludv
1578  0270 1e12          	ldw	x,(OFST-1,sp)
1579  0272 b603          	ld	a,c_lreg+3
1580  0274 e70d          	ld	(_poezdka+13,x),a
1581  0276               L724:
1582                     ; 440 				for (u=0;u<10;u++)
1584  0276 1e12          	ldw	x,(OFST-1,sp)
1585  0278 5c            	incw	x
1586  0279 1f12          	ldw	(OFST-1,sp),x
1590  027b a3000a        	cpw	x,#10
1591  027e 2fcf          	jrslt	L124
1592                     ; 447 				poezdka.maxspeed = maxspeed;
1594  0280 453317        	mov	_poezdka+23,_maxspeed+3
1595                     ; 448 				poezdka.probeg = (long)hall[1] * param.dkoles * 314 / 10000;
1597  0283 451d03        	mov	c_lreg+3,_param+1
1598  0286 3f02          	clr	c_lreg+2
1599  0288 3f01          	clr	c_lreg+1
1600  028a 3f00          	clr	c_lreg
1601  028c 96            	ldw	x,sp
1602  028d 5c            	incw	x
1603  028e cd0000        	call	c_rtol
1606  0291 ae0042        	ldw	x,#_hall+4
1607  0294 cd0000        	call	c_ltor
1609  0297 96            	ldw	x,sp
1610  0298 5c            	incw	x
1611  0299 cd0585        	call	LC011
1612  029c cd0000        	call	c_ldiv
1614  029f ae0005        	ldw	x,#_poezdka+5
1615  02a2 cd0000        	call	c_rtol
1617                     ; 449 				poezdka.fix = 1;
1619  02a5 35010000      	mov	_poezdka,#1
1620                     ; 451 				saveflash(ADDRP+param.numpoezdki*NUMBYTEP,(u32)&poezdka,NUMBYTEP);
1622  02a9 cd0526        	call	LC006
1623  02ac               L714:
1624                     ; 457 			playmusic(4);
1626  02ac ae0004        	ldw	x,#4
1627  02af cd0000        	call	_playmusic
1629                     ; 460 			GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_IN_PU_IT);//knopka
1631  02b2 cd055c        	call	LC008
1632                     ; 462 			GPIO_Init(GPIOC,GPIO_PIN_6,GPIO_MODE_IN_PU_IT);//H2
1634  02b5 4b60          	push	#96
1635  02b7 4b40          	push	#64
1636  02b9 ae500a        	ldw	x,#20490
1637  02bc cd0000        	call	_GPIO_Init
1639  02bf 85            	popw	x
1640                     ; 468 			CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_LSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
1642  02c0 4b00          	push	#0
1643  02c2 4b00          	push	#0
1644  02c4 ae01d2        	ldw	x,#466
1645  02c7 cd0000        	call	_CLK_ClockSwitchConfig
1647  02ca a610          	ld	a,#16
1648  02cc 85            	popw	x
1649                     ; 472 			AWU_Init(AWU_TIMEBASE_30S);
1651  02cd cd0000        	call	_AWU_Init
1653                     ; 474 			timeawu=255;//255 * 30 = 7600 сек = 2часа !!!
1655  02d0 35ff000a      	mov	_timeawu,#255
1656                     ; 476 			halt();
1662  02d4 2002          	jra	L334
1663  02d6               L134:
1664                     ; 480 				int i=0;
1666                     ; 481 				isawu = i;
1668  02d6 3f0c          	clr	_isawu
1669                     ; 482 				halt();
1674  02d8               L334:
1675  02d8 8e            	halt	
1676                     ; 478 			while (isawu)
1678  02d9 b60c          	ld	a,_isawu
1679  02db 26f9          	jrne	L134
1680                     ; 486 			isawu=0;
1682  02dd b70c          	ld	_isawu,a
1683                     ; 487 			AWU_DeInit();
1685  02df cd0000        	call	_AWU_DeInit
1687                     ; 489 			CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
1689  02e2 4b00          	push	#0
1690  02e4 4b00          	push	#0
1691  02e6 ae01b4        	ldw	x,#436
1692  02e9 cd0000        	call	_CLK_ClockSwitchConfig
1694  02ec 3f6e          	clr	_haltstart
1695  02ee 85            	popw	x
1696                     ; 491 			haltstart=0;
1698                     ; 493 			playmusic(1);
1700  02ef ae0001        	ldw	x,#1
1701  02f2 cd0000        	call	_playmusic
1703                     ; 495 			kn=FALSE;
1705  02f5 3f19          	clr	_kn
1706  02f7               L514:
1707                     ; 498 		if (errspeed > 20 && time_errspeed == 0)
1709  02f7 b60f          	ld	a,_errspeed
1710  02f9 a115          	cp	a,#21
1711  02fb 250e          	jrult	L734
1713  02fd b608          	ld	a,_time_errspeed
1714  02ff 260a          	jrne	L734
1715                     ; 500 			time_errspeed = 30;
1717  0301 351e0008      	mov	_time_errspeed,#30
1718                     ; 501 			playmusic(5);
1720  0305 ae0005        	ldw	x,#5
1721  0308 cd0000        	call	_playmusic
1723  030b               L734:
1724                     ; 504 		if (errcad > 20 && time_errcad == 0)
1726  030b b610          	ld	a,_errcad
1727  030d a115          	cp	a,#21
1728  030f 250e          	jrult	L144
1730  0311 b609          	ld	a,_time_errcad
1731  0313 260a          	jrne	L144
1732                     ; 506 			time_errcad= 30;
1734  0315 351e0009      	mov	_time_errcad,#30
1735                     ; 507 			playmusic(6);
1737  0319 ae0006        	ldw	x,#6
1738  031c cd0000        	call	_playmusic
1740  031f               L144:
1741                     ; 522 		if (RXready) {
1743  031f b60d          	ld	a,_RXready
1744  0321 2603cc0155    	jreq	L363
1745                     ; 524 			int cmd=0;
1747  0326 5f            	clrw	x
1748  0327 1f12          	ldw	(OFST-1,sp),x
1750                     ; 525 			int start=0;
1752  0329 1f10          	ldw	(OFST-3,sp),x
1754                     ; 526 			int znak=1;
1756  032b 5c            	incw	x
1757  032c 1f0c          	ldw	(OFST-7,sp),x
1759                     ; 529 			if (flagclr==1 && RXbuff[0]=='y' && RXbuff[1]=='e' && RXbuff[2]=='s')
1761  032e b60b          	ld	a,_flagclr
1762  0330 4a            	dec	a
1763  0331 261c          	jrne	L544
1765  0333 b62b          	ld	a,_RXbuff
1766  0335 a179          	cp	a,#121
1767  0337 2616          	jrne	L544
1769  0339 b62c          	ld	a,_RXbuff+1
1770  033b a165          	cp	a,#101
1771  033d 2610          	jrne	L544
1773  033f b62d          	ld	a,_RXbuff+2
1774  0341 a173          	cp	a,#115
1775  0343 260a          	jrne	L544
1776                     ; 532 				cleareeprom(0);
1778  0345 5f            	clrw	x
1779  0346 cd0000        	call	_cleareeprom
1781                     ; 533 				printf("clear\n\r");//printf("all cleared\n\r");
1783  0349 ae006b        	ldw	x,#L744
1784  034c cd0000        	call	_printf
1786  034f               L544:
1787                     ; 535 			flagclr=0;
1789  034f 3f0b          	clr	_flagclr
1790                     ; 537 			switch (RXbuff[0]) {
1792  0351 b62b          	ld	a,_RXbuff
1794                     ; 600 			default:
1794                     ; 601 				break;
1795  0353 a063          	sub	a,#99
1796  0355 2722          	jreq	L532
1797  0357 4a            	dec	a
1798  0358 2603cc0460    	jreq	L342
1799  035d a005          	sub	a,#5
1800  035f 2725          	jreq	L732
1801  0361 a002          	sub	a,#2
1802  0363 2603cc048e    	jreq	L742
1803  0368 a008          	sub	a,#8
1804  036a 2603cc046f    	jreq	L542
1805  036f a003          	sub	a,#3
1806  0371 2603cc0451    	jreq	L142
1807  0376 cc04ad        	jra	L354
1808  0379               L532:
1809                     ; 538 			case 'c':
1809                     ; 539 				flagclr = 1;
1811  0379 3501000b      	mov	_flagclr,#1
1812                     ; 540 				printf("yes?\n\r");
1814  037d ae0064        	ldw	x,#L554
1815  0380 cd0000        	call	_printf
1817                     ; 541 				break;
1819  0383 cc04ad        	jra	L354
1820  0386               L732:
1821                     ; 542 			case 'i':
1821                     ; 543 				if (RXbuff[1]=='n' && RXbuff[2]=='f' && RXbuff[3]=='o' && RXtek==5) 
1823  0386 b62c          	ld	a,_RXbuff+1
1824  0388 a16e          	cp	a,#110
1825  038a 26f7          	jrne	L354
1827  038c b62d          	ld	a,_RXbuff+2
1828  038e a166          	cp	a,#102
1829  0390 26f1          	jrne	L354
1831  0392 b62e          	ld	a,_RXbuff+3
1832  0394 a16f          	cp	a,#111
1833  0396 26eb          	jrne	L354
1835  0398 b61a          	ld	a,_RXtek
1836  039a a105          	cp	a,#5
1837  039c 26e5          	jrne	L354
1838                     ; 547 					printparam();
1840  039e cd0000        	call	_printparam
1842                     ; 549 					for (u=0;u<NUMBERP;u++)
1844  03a1 5f            	clrw	x
1845  03a2 1f0a          	ldw	(OFST-9,sp),x
1847  03a4               L164:
1848                     ; 551 						readflash(ADDRP+u*NUMBYTEP,(u32)&poezdka,NUMBYTEP);
1850  03a4 4b1c          	push	#28
1851  03a6 35000003      	mov	c_lreg+3,#_poezdka
1852  03aa cd0573        	call	LC009
1853  03ad 89            	pushw	x
1854  03ae be00          	ldw	x,c_lreg
1855  03b0 89            	pushw	x
1856  03b1 1e0f          	ldw	x,(OFST-4,sp)
1857  03b3 90ae001c      	ldw	y,#28
1858  03b7 cd0000        	call	c_imul
1860  03ba cd057c        	call	LC010
1861  03bd 89            	pushw	x
1862  03be be00          	ldw	x,c_lreg
1863  03c0 89            	pushw	x
1864  03c1 cd0000        	call	_readflash
1866  03c4 5b09          	addw	sp,#9
1867                     ; 552 						if(poezdka.fix){
1869  03c6 b600          	ld	a,_poezdka
1870  03c8 2770          	jreq	L764
1871                     ; 553 							printf("\n\r");
1873  03ca ae0073        	ldw	x,#L504
1874  03cd cd0000        	call	_printf
1876                     ; 554 							printf("(num)%li (time)%li (maxs)%li (cal)%li (km)%li\n\r",(long)poezdka.nump,(long)poezdka.activetime/60,(long)poezdka.maxspeed,(long)poezdka.power,(long)poezdka.probeg);
1878  03d0 be07          	ldw	x,_poezdka+7
1879  03d2 89            	pushw	x
1880  03d3 be05          	ldw	x,_poezdka+5
1881  03d5 89            	pushw	x
1882  03d6 be0b          	ldw	x,_poezdka+11
1883  03d8 89            	pushw	x
1884  03d9 be09          	ldw	x,_poezdka+9
1885  03db 89            	pushw	x
1886  03dc 451703        	mov	c_lreg+3,_poezdka+23
1887  03df cd0573        	call	LC009
1888  03e2 89            	pushw	x
1889  03e3 be00          	ldw	x,c_lreg
1890  03e5 89            	pushw	x
1891  03e6 ae0018        	ldw	x,#_poezdka+24
1892  03e9 cd0000        	call	c_ltor
1894  03ec ae000c        	ldw	x,#L033
1895  03ef cd0000        	call	c_ldiv
1897  03f2 be02          	ldw	x,c_lreg+2
1898  03f4 89            	pushw	x
1899  03f5 be00          	ldw	x,c_lreg
1900  03f7 89            	pushw	x
1901  03f8 be03          	ldw	x,_poezdka+3
1902  03fa 89            	pushw	x
1903  03fb be01          	ldw	x,_poezdka+1
1904  03fd 89            	pushw	x
1905  03fe ae0034        	ldw	x,#L174
1906  0401 cd0000        	call	_printf
1908  0404 5b14          	addw	sp,#20
1909                     ; 556 							printf("t");
1911  0406 ae007f        	ldw	x,#L373
1912  0409 cd0000        	call	_printf
1914                     ; 559 								for (j=0;j<10;j++)
1916  040c 5f            	clrw	x
1917  040d 1f08          	ldw	(OFST-11,sp),x
1919  040f               L374:
1920                     ; 561 									printf(":(%i)%i",(int)(j+1)*4,(int)poezdka.obs[j]);
1922  040f e60d          	ld	a,(_poezdka+13,x)
1923  0411 5f            	clrw	x
1924  0412 97            	ld	xl,a
1925  0413 89            	pushw	x
1926  0414 1e0a          	ldw	x,(OFST-9,sp)
1927  0416 58            	sllw	x
1928  0417 58            	sllw	x
1929  0418 1c0004        	addw	x,#4
1930  041b 89            	pushw	x
1931  041c ae002c        	ldw	x,#L105
1932  041f cd0000        	call	_printf
1934  0422 5b04          	addw	sp,#4
1935                     ; 559 								for (j=0;j<10;j++)
1937  0424 1e08          	ldw	x,(OFST-11,sp)
1938  0426 5c            	incw	x
1939  0427 1f08          	ldw	(OFST-11,sp),x
1943  0429 a3000a        	cpw	x,#10
1944  042c 2fe1          	jrslt	L374
1945                     ; 563 								printf("\n\r");
1947  042e ae0073        	ldw	x,#L504
1948  0431 cd0000        	call	_printf
1950                     ; 565 							printf("\n\r");
1952  0434 ae0073        	ldw	x,#L504
1953  0437 cd0000        	call	_printf
1955  043a               L764:
1956                     ; 549 					for (u=0;u<NUMBERP;u++)
1958  043a 1e0a          	ldw	x,(OFST-9,sp)
1959  043c 5c            	incw	x
1960  043d 1f0a          	ldw	(OFST-9,sp),x
1964  043f a30004        	cpw	x,#4
1965  0442 2e03cc03a4    	jrslt	L164
1966                     ; 569 					timeblue=10;
1968  0447 ae000a        	ldw	x,#10
1969  044a bf02          	ldw	_timeblue+2,x
1970  044c 5f            	clrw	x
1971  044d bf00          	ldw	_timeblue,x
1972  044f 205c          	jra	L354
1973  0451               L142:
1974                     ; 572 			case 'v':
1974                     ; 573 				cmd=3;
1976  0451 ae0003        	ldw	x,#3
1977  0454 1f12          	ldw	(OFST-1,sp),x
1979                     ; 574 				start = 1;
1981  0456 ae0001        	ldw	x,#1
1982  0459 1f10          	ldw	(OFST-3,sp),x
1984                     ; 575 				pp = &param.ves;
1986  045b ae001c        	ldw	x,#_param
1987                     ; 576 				break;
1989  045e 204b          	jp	LC005
1990  0460               L342:
1991                     ; 577 			case 'd':
1991                     ; 578 				cmd=3;
1993  0460 ae0003        	ldw	x,#3
1994  0463 1f12          	ldw	(OFST-1,sp),x
1996                     ; 579 				start = 1;
1998  0465 ae0001        	ldw	x,#1
1999  0468 1f10          	ldw	(OFST-3,sp),x
2001                     ; 580 				pp = &param.dkoles;
2003  046a ae001d        	ldw	x,#_param+1
2004                     ; 581 				break;
2006  046d 203c          	jp	LC005
2007  046f               L542:
2008                     ; 582 			case 's':
2008                     ; 583 				cmd=3;
2010  046f ae0003        	ldw	x,#3
2011  0472 1f12          	ldw	(OFST-1,sp),x
2013                     ; 584 				if(RXbuff[1]='-') {
2015  0474 a62d          	ld	a,#45
2016  0476 b72c          	ld	_RXbuff+1,a
2017  0478 270a          	jreq	L305
2018                     ; 585 					start=2;
2020  047a 5a            	decw	x
2021  047b 1f10          	ldw	(OFST-3,sp),x
2023                     ; 586 					znak=-1;
2025  047d aeffff        	ldw	x,#65535
2026  0480 1f0c          	ldw	(OFST-7,sp),x
2029  0482 2005          	jra	L505
2030  0484               L305:
2031                     ; 587 				} else start = 1;
2033  0484 ae0001        	ldw	x,#1
2034  0487 1f10          	ldw	(OFST-3,sp),x
2036  0489               L505:
2037                     ; 589 				pp = (u8 *)&param.ks;
2039  0489 ae0027        	ldw	x,#_param+11
2040                     ; 590 				break;
2042  048c 201d          	jp	LC005
2043  048e               L742:
2044                     ; 591 			case 'k':
2044                     ; 592 				cmd=3;
2046  048e ae0003        	ldw	x,#3
2047  0491 1f12          	ldw	(OFST-1,sp),x
2049                     ; 593 				if(RXbuff[1]='-') {
2051  0493 a62d          	ld	a,#45
2052  0495 b72c          	ld	_RXbuff+1,a
2053  0497 270a          	jreq	L705
2054                     ; 594 					start=2;
2056  0499 5a            	decw	x
2057  049a 1f10          	ldw	(OFST-3,sp),x
2059                     ; 595 					znak=-1;
2061  049c aeffff        	ldw	x,#65535
2062  049f 1f0c          	ldw	(OFST-7,sp),x
2065  04a1 2005          	jra	L115
2066  04a3               L705:
2067                     ; 596 				} else start = 1;
2069  04a3 ae0001        	ldw	x,#1
2070  04a6 1f10          	ldw	(OFST-3,sp),x
2072  04a8               L115:
2073                     ; 598 				pp = (u8 *)&param.kk;
2075  04a8 ae0029        	ldw	x,#_param+13
2076  04ab               LC005:
2077  04ab 1f0e          	ldw	(OFST-5,sp),x
2079                     ; 599 				break;
2081                     ; 600 			default:
2081                     ; 601 				break;
2083  04ad               L354:
2084                     ; 604 			if (cmd) 
2086  04ad 1e12          	ldw	x,(OFST-1,sp)
2087  04af 276e          	jreq	L315
2088                     ; 607 				u8 rez=0;
2090  04b1 0f09          	clr	(OFST-10,sp)
2092                     ; 608 				int r=1;
2094  04b3 ae0001        	ldw	x,#1
2095  04b6 1f07          	ldw	(OFST-12,sp),x
2097                     ; 609 				int noerr=1;
2099  04b8 1f05          	ldw	(OFST-14,sp),x
2101                     ; 610 				int ind = RXtek-2;
2103  04ba 5f            	clrw	x
2104  04bb b61a          	ld	a,_RXtek
2105  04bd 97            	ld	xl,a
2106  04be 1d0002        	subw	x,#2
2107  04c1 1f0a          	ldw	(OFST-9,sp),x
2109                     ; 613 				for(u=start;u<RXtek-1;u++)
2111  04c3 1e10          	ldw	x,(OFST-3,sp)
2113  04c5 203d          	jra	L125
2114  04c7               L515:
2115                     ; 616 					if (RXbuff[ind] < 0x30 ||  RXbuff[ind] > 0x39)
2117  04c7 1e0a          	ldw	x,(OFST-9,sp)
2118  04c9 e62b          	ld	a,(_RXbuff,x)
2119  04cb a130          	cp	a,#48
2120  04cd 2504          	jrult	L725
2122  04cf a13a          	cp	a,#58
2123  04d1 2513          	jrult	L525
2124  04d3               L725:
2125                     ; 619 						noerr=0;
2127  04d3 5f            	clrw	x
2128  04d4 1f05          	ldw	(OFST-14,sp),x
2130                     ; 620 						break;
2131  04d6               L325:
2132                     ; 627 				if (noerr)
2134  04d6 1e05          	ldw	x,(OFST-14,sp)
2135  04d8 2745          	jreq	L315
2136                     ; 630 					if (znak>0) *pp = rez;
2138  04da 9c            	rvf	
2139  04db 1e0c          	ldw	x,(OFST-7,sp)
2140  04dd 2d32          	jrsle	L335
2143  04df 1e0e          	ldw	x,(OFST-5,sp)
2144  04e1 7b09          	ld	a,(OFST-10,sp)
2145  04e3 f7            	ld	(x),a
2147  04e4 2034          	jra	L535
2148  04e6               L525:
2149                     ; 623 					rez = rez + (RXbuff[ind] - 0x30) * r;
2151  04e6 a030          	sub	a,#48
2152  04e8 97            	ld	xl,a
2153  04e9 7b08          	ld	a,(OFST-11,sp)
2154  04eb 42            	mul	x,a
2155  04ec 9f            	ld	a,xl
2156  04ed 1b09          	add	a,(OFST-10,sp)
2157  04ef 6b09          	ld	(OFST-10,sp),a
2159                     ; 624 					r *= 10;
2161  04f1 90ae000a      	ldw	y,#10
2162  04f5 1e07          	ldw	x,(OFST-12,sp)
2163  04f7 cd0000        	call	c_imul
2165  04fa 1f07          	ldw	(OFST-12,sp),x
2167                     ; 625 					ind--;
2169  04fc 1e0a          	ldw	x,(OFST-9,sp)
2170  04fe 5a            	decw	x
2171  04ff 1f0a          	ldw	(OFST-9,sp),x
2173                     ; 613 				for(u=start;u<RXtek-1;u++)
2175  0501 1e12          	ldw	x,(OFST-1,sp)
2176  0503 5c            	incw	x
2177  0504               L125:
2178  0504 1f12          	ldw	(OFST-1,sp),x
2182  0506 5f            	clrw	x
2183  0507 b61a          	ld	a,_RXtek
2184  0509 97            	ld	xl,a
2185  050a 5a            	decw	x
2186  050b 1312          	cpw	x,(OFST-1,sp)
2187  050d 2cb8          	jrsgt	L515
2188  050f 20c5          	jra	L325
2189  0511               L335:
2190                     ; 631 					else *(int *)pp = (int)rez * (-1);
2192  0511 7b09          	ld	a,(OFST-10,sp)
2193  0513 5f            	clrw	x
2194  0514 97            	ld	xl,a
2195  0515 160e          	ldw	y,(OFST-5,sp)
2196  0517 50            	negw	x
2197  0518 90ff          	ldw	(y),x
2198  051a               L535:
2199                     ; 633 					saveflash(0x4000,(u32)&param,14);		
2201  051a ad28          	call	LC007
2202                     ; 635 					printparam();					
2204  051c cd0000        	call	_printparam
2206  051f               L315:
2207                     ; 639 			RXtek = 0;
2209  051f 3f1a          	clr	_RXtek
2210                     ; 640 			RXready = FALSE;		
2212  0521 3f0d          	clr	_RXready
2213  0523 cc0155        	jra	L363
2214  0526               LC006:
2215  0526 4b1c          	push	#28
2216  0528 35000003      	mov	c_lreg+3,#_poezdka
2217  052c ad45          	call	LC009
2218  052e 89            	pushw	x
2219  052f be00          	ldw	x,c_lreg
2220  0531 89            	pushw	x
2221  0532 b626          	ld	a,_param+10
2222  0534 97            	ld	xl,a
2223  0535 a61c          	ld	a,#28
2224  0537 42            	mul	x,a
2225  0538 ad42          	call	LC010
2226  053a 89            	pushw	x
2227  053b be00          	ldw	x,c_lreg
2228  053d 89            	pushw	x
2229  053e cd0000        	call	_saveflash
2231  0541 5b09          	addw	sp,#9
2232  0543 81            	ret	
2233  0544               LC007:
2234  0544 4b0e          	push	#14
2235  0546 351c0003      	mov	c_lreg+3,#_param
2236  054a ad27          	call	LC009
2237  054c 89            	pushw	x
2238  054d be00          	ldw	x,c_lreg
2239  054f 89            	pushw	x
2240  0550 ae4000        	ldw	x,#16384
2241  0553 89            	pushw	x
2242  0554 5f            	clrw	x
2243  0555 89            	pushw	x
2244  0556 cd0000        	call	_saveflash
2246  0559 5b09          	addw	sp,#9
2247  055b 81            	ret	
2248  055c               LC008:
2249  055c 4b60          	push	#96
2250  055e 4b08          	push	#8
2251  0560 ae500f        	ldw	x,#20495
2252  0563 cd0000        	call	_GPIO_Init
2254  0566 85            	popw	x
2255                     ; 283 	GPIO_Init(GPIOC,GPIO_PIN_7,GPIO_MODE_IN_PU_IT);//H1
2257  0567 4b60          	push	#96
2258  0569 4b80          	push	#128
2259  056b ae500a        	ldw	x,#20490
2260  056e cd0000        	call	_GPIO_Init
2262  0571 85            	popw	x
2263  0572 81            	ret	
2264  0573               LC009:
2265  0573 3f02          	clr	c_lreg+2
2266  0575 3f01          	clr	c_lreg+1
2267  0577 3f00          	clr	c_lreg
2268  0579 be02          	ldw	x,c_lreg+2
2269  057b 81            	ret	
2270  057c               LC010:
2271  057c 1c400e        	addw	x,#16398
2272  057f cd0000        	call	c_itolx
2274  0582 be02          	ldw	x,c_lreg+2
2275  0584 81            	ret	
2276  0585               LC011:
2277  0585 cd0000        	call	c_lmul
2279  0588 ae0000        	ldw	x,#L242
2280  058b cd0000        	call	c_lmul
2282  058e ae0004        	ldw	x,#L442
2283  0591 81            	ret	
2284  0592               LC012:
2285  0592 ae0036        	ldw	x,#_power
2286  0595 cd0000        	call	c_ltor
2288  0598 cc0000        	jp	c_ftol
2354                     ; 668 uint32_t LSIMeasurment(void)
2354                     ; 669 {
2355                     .text:	section	.text,new
2356  0000               _LSIMeasurment:
2358  0000 520c          	subw	sp,#12
2359       0000000c      OFST:	set	12
2362                     ; 671   uint32_t lsi_freq_hz = 0x0;
2364                     ; 672   uint32_t fmaster = 0x0;
2366                     ; 673   uint16_t ICValue1 = 0x0;
2368                     ; 674   uint16_t ICValue2 = 0x0;
2370                     ; 677   fmaster = CLK_GetClockFreq();
2372  0002 cd0000        	call	_CLK_GetClockFreq
2374  0005 96            	ldw	x,sp
2375  0006 1c0009        	addw	x,#OFST-3
2376  0009 cd0000        	call	c_rtol
2379                     ; 680   AWU->CSR |= AWU_CSR_MSR;
2381  000c 721050f0      	bset	20720,#0
2382                     ; 687 	TIM1_ICInit(TIM1_CHANNEL_1, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI, TIM1_ICPSC_DIV8, 0);
2384  0010 4b00          	push	#0
2385  0012 4b0c          	push	#12
2386  0014 4b01          	push	#1
2387  0016 5f            	clrw	x
2388  0017 cd0000        	call	_TIM1_ICInit
2390  001a 5b03          	addw	sp,#3
2391                     ; 690   TIM1_Cmd(ENABLE);
2393  001c a601          	ld	a,#1
2394  001e cd0000        	call	_TIM1_Cmd
2397  0021               L375:
2398                     ; 693   while((TIM1->SR1 & TIM1_FLAG_CC1) != TIM1_FLAG_CC1);
2400  0021 72035255fb    	btjf	21077,#1,L375
2401                     ; 695   ICValue1 = TIM1_GetCapture1();
2403  0026 cd0000        	call	_TIM1_GetCapture1
2405  0029 1f05          	ldw	(OFST-7,sp),x
2407                     ; 696   TIM1_ClearFlag(TIM1_FLAG_CC1);
2409  002b ae0002        	ldw	x,#2
2410  002e cd0000        	call	_TIM1_ClearFlag
2413  0031               L106:
2414                     ; 699   while((TIM1->SR1 & TIM1_FLAG_CC1) != TIM1_FLAG_CC1);
2416  0031 72035255fb    	btjf	21077,#1,L106
2417                     ; 701   ICValue2 = TIM1_GetCapture1();
2419  0036 cd0000        	call	_TIM1_GetCapture1
2421  0039 1f07          	ldw	(OFST-5,sp),x
2423                     ; 702   TIM1_ClearFlag(TIM1_FLAG_CC1);
2425  003b ae0002        	ldw	x,#2
2426  003e cd0000        	call	_TIM1_ClearFlag
2428                     ; 705   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2430  0041 7211525c      	bres	21084,#0
2431                     ; 707   TIM1_Cmd(DISABLE);
2433  0045 4f            	clr	a
2434  0046 cd0000        	call	_TIM1_Cmd
2436                     ; 738   lsi_freq_hz = (8 * fmaster) / (ICValue2 - ICValue1);
2438  0049 1e07          	ldw	x,(OFST-5,sp)
2439  004b 72f005        	subw	x,(OFST-7,sp)
2440  004e cd0000        	call	c_uitolx
2442  0051 96            	ldw	x,sp
2443  0052 5c            	incw	x
2444  0053 cd0000        	call	c_rtol
2447  0056 96            	ldw	x,sp
2448  0057 1c0009        	addw	x,#OFST-3
2449  005a cd0000        	call	c_ltor
2451  005d a603          	ld	a,#3
2452  005f cd0000        	call	c_llsh
2454  0062 96            	ldw	x,sp
2455  0063 5c            	incw	x
2456  0064 cd0000        	call	c_ludv
2458  0067 96            	ldw	x,sp
2459  0068 1c0009        	addw	x,#OFST-3
2460  006b cd0000        	call	c_rtol
2463                     ; 741   AWU->CSR &= (uint8_t)(~AWU_CSR_MSR);
2465  006e 721150f0      	bres	20720,#0
2466                     ; 743  return (lsi_freq_hz);
2468  0072 96            	ldw	x,sp
2469  0073 1c0009        	addw	x,#OFST-3
2470  0076 cd0000        	call	c_ltor
2474  0079 5b0c          	addw	sp,#12
2475  007b 81            	ret	
2510                     ; 746 void Delay(u16 nCount)
2510                     ; 747 {
2511                     .text:	section	.text,new
2512  0000               _Delay:
2516                     ; 750 		timedelay = nCount;
2518  0000 bf06          	ldw	_timedelay,x
2520  0002               L726:
2521                     ; 756 		while (timedelay)
2523  0002 be06          	ldw	x,_timedelay
2524  0004 26fc          	jrne	L726
2525                     ; 759 }
2528  0006 81            	ret	
2564                     ; 762 PUTCHAR_PROTOTYPE
2564                     ; 763 {
2565                     .text:	section	.text,new
2566  0000               _putchar:
2568  0000 88            	push	a
2569       00000000      OFST:	set	0
2572                     ; 765   UART1_SendData8(c);
2574  0001 cd0000        	call	_UART1_SendData8
2577  0004               L356:
2578                     ; 767   while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
2580  0004 ae0080        	ldw	x,#128
2581  0007 cd0000        	call	_UART1_GetFlagStatus
2583  000a 4d            	tnz	a
2584  000b 27f7          	jreq	L356
2585                     ; 769   return (c);
2587  000d 7b01          	ld	a,(OFST+1,sp)
2590  000f 5b01          	addw	sp,#1
2591  0011 81            	ret	
2625                     ; 772 GETCHAR_PROTOTYPE
2625                     ; 773 {
2626                     .text:	section	.text,new
2627  0000               _getchar:
2629  0000 88            	push	a
2630       00000001      OFST:	set	1
2633                     ; 775   char c = 0;
2635                     ; 783   return (c);
2637  0001 4f            	clr	a
2640  0002 5b01          	addw	sp,#1
2641  0004 81            	ret	
2644                     	bsct
2645  001b               _nextsec:
2646  001b 000003e8      	dc.l	1000
2647  001f               _kntime:
2648  001f 00000000      	dc.l	0
2649  0023               _h1time:
2650  0023 00000000      	dc.l	0
2651  0027               _h2time:
2652  0027 00000000      	dc.l	0
2653  002b               _h1:
2654  002b 00            	dc.b	0
2655  002c               _h2:
2656  002c 00            	dc.b	0
2712                     	switch	.const
2713  0010               L604:
2714  0010 0000001e      	dc.l	30
2715  0014               L224:
2716  0014 00000bb9      	dc.l	3001
2717  0018               L424:
2718  0018 00001389      	dc.l	5001
2719  001c               L624:
2720  001c 0000000a      	dc.l	10
2721                     ; 798  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
2721                     ; 799  {
2722                     	scross	on
2723                     .text:	section	.text,new
2724  0000               f_TIM4_UPD_OVF_IRQHandler:
2726  0000 8a            	push	cc
2727  0001 84            	pop	a
2728  0002 a4bf          	and	a,#191
2729  0004 88            	push	a
2730  0005 86            	pop	cc
2731       00000008      OFST:	set	8
2732  0006 3b0002        	push	c_x+2
2733  0009 be00          	ldw	x,c_x
2734  000b 89            	pushw	x
2735  000c 3b0002        	push	c_y+2
2736  000f be00          	ldw	x,c_y
2737  0011 89            	pushw	x
2738  0012 be02          	ldw	x,c_lreg+2
2739  0014 89            	pushw	x
2740  0015 be00          	ldw	x,c_lreg
2741  0017 89            	pushw	x
2742  0018 5208          	subw	sp,#8
2745                     ; 805 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
2747  001a a601          	ld	a,#1
2748  001c cd0000        	call	_TIM4_ClearITPendingBit
2750                     ; 810 		if (h1time)	
2752  001f ae0023        	ldw	x,#_h1time
2753  0022 cd0000        	call	c_lzmp
2755  0025 271a          	jreq	L317
2756                     ; 812 			h1time++;
2758  0027 8d050205      	callf	LC017
2760  002b 2614          	jrne	L317
2761                     ; 815 					GPIO_ReadInputPin(GPIOC,GPIO_PIN_7);
2763  002d 4b80          	push	#128
2764  002f ae500a        	ldw	x,#20490
2765  0032 cd0000        	call	_GPIO_ReadInputPin
2767  0035 84            	pop	a
2768                     ; 816 					GPIO_Init(GPIOC,GPIO_PIN_7,GPIO_MODE_IN_PU_IT);
2770  0036 4b60          	push	#96
2771  0038 4b80          	push	#128
2772  003a ae500a        	ldw	x,#20490
2773  003d cd0000        	call	_GPIO_Init
2775  0040 85            	popw	x
2776  0041               L317:
2777                     ; 819 		if (h2time)	
2779  0041 ae0027        	ldw	x,#_h2time
2780  0044 cd0000        	call	c_lzmp
2782  0047 271a          	jreq	L717
2783                     ; 821 			h2time++;
2785  0049 8d050205      	callf	LC017
2787  004d 2614          	jrne	L717
2788                     ; 824 				GPIO_ReadInputPin(GPIOC,GPIO_PIN_6);
2790  004f 4b40          	push	#64
2791  0051 ae500a        	ldw	x,#20490
2792  0054 cd0000        	call	_GPIO_ReadInputPin
2794  0057 84            	pop	a
2795                     ; 825 				GPIO_Init(GPIOC,GPIO_PIN_6,GPIO_MODE_IN_PU_IT);				
2797  0058 4b60          	push	#96
2798  005a 4b40          	push	#64
2799  005c ae500a        	ldw	x,#20490
2800  005f cd0000        	call	_GPIO_Init
2802  0062 85            	popw	x
2803  0063               L717:
2804                     ; 829 		if (kntime)	
2806  0063 ae001f        	ldw	x,#_kntime
2807  0066 cd0000        	call	c_lzmp
2809  0069 2715          	jreq	L327
2810                     ; 831 			kntime--;
2812  006b a601          	ld	a,#1
2813  006d cd0000        	call	c_lgsbc
2815                     ; 832 			if (kntime==0) 
2817  0070 cd0000        	call	c_lzmp
2819  0073 260b          	jrne	L327
2820                     ; 833 				GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_IN_PU_IT);
2822  0075 4b60          	push	#96
2823  0077 4b08          	push	#8
2824  0079 ae500f        	ldw	x,#20495
2825  007c cd0000        	call	_GPIO_Init
2827  007f 85            	popw	x
2828  0080               L327:
2829                     ; 836 		if (nextsec)   nextsec--;
2831  0080 ae001b        	ldw	x,#_nextsec
2832  0083 cd0000        	call	c_lzmp
2834  0086 2705          	jreq	L727
2837  0088 a601          	ld	a,#1
2838  008a cd0000        	call	c_lgsbc
2840  008d               L727:
2841                     ; 837 		if (timedelay) timedelay--;		
2843  008d be06          	ldw	x,_timedelay
2844  008f 2703          	jreq	L137
2847  0091 5a            	decw	x
2848  0092 bf06          	ldw	_timedelay,x
2849  0094               L137:
2850                     ; 841   if (h2time > 3000) {
2852  0094 ae0027        	ldw	x,#_h2time
2853  0097 cd0000        	call	c_ltor
2855  009a ae0014        	ldw	x,#L224
2856  009d cd0000        	call	c_lcmp
2858  00a0 2507          	jrult	L337
2859                     ; 842 		scor2 = 0;
2861  00a2 3f34          	clr	_scor2
2862                     ; 843 		h2time=0;
2864  00a4 5f            	clrw	x
2865  00a5 bf29          	ldw	_h2time+2,x
2866  00a7 bf27          	ldw	_h2time,x
2867  00a9               L337:
2868                     ; 845 	if (h1time > 5000) {
2870  00a9 ae0023        	ldw	x,#_h1time
2871  00ac cd0000        	call	c_ltor
2873  00af ae0018        	ldw	x,#L424
2874  00b2 cd0000        	call	c_lcmp
2876  00b5 2507          	jrult	L537
2877                     ; 846 		scor1 = 0;
2879  00b7 3f35          	clr	_scor1
2880                     ; 847 		h1time=0;
2882  00b9 5f            	clrw	x
2883  00ba bf25          	ldw	_h1time+2,x
2884  00bc bf23          	ldw	_h1time,x
2885  00be               L537:
2886                     ; 850 	if (nextsec==0) {
2888  00be ae001b        	ldw	x,#_nextsec
2889  00c1 cd0000        	call	c_lzmp
2891  00c4 2704acf001f0  	jrne	L737
2892                     ; 853 		nextsec = 1000;
2894  00ca ae03e8        	ldw	x,#1000
2895  00cd bf1d          	ldw	_nextsec+2,x
2896  00cf 5f            	clrw	x
2897  00d0 bf1b          	ldw	_nextsec,x
2898                     ; 855 		if (timehalt)		 		timehalt--;
2900  00d2 b605          	ld	a,_timehalt
2901  00d4 2702          	jreq	L147
2904  00d6 3a05          	dec	_timehalt
2905  00d8               L147:
2906                     ; 856 		if (timeblue) 	 		timeblue--;
2908  00d8 ae0000        	ldw	x,#_timeblue
2909  00db cd0000        	call	c_lzmp
2911  00de 2705          	jreq	L347
2914  00e0 a601          	ld	a,#1
2915  00e2 cd0000        	call	c_lgsbc
2917  00e5               L347:
2918                     ; 857 		if (timeblueoff) 		timeblueoff--;
2920  00e5 b604          	ld	a,_timeblueoff
2921  00e7 2702          	jreq	L547
2924  00e9 3a04          	dec	_timeblueoff
2925  00eb               L547:
2926                     ; 858 		if (time_errspeed) 	time_errspeed--;
2928  00eb b608          	ld	a,_time_errspeed
2929  00ed 2702          	jreq	L747
2932  00ef 3a08          	dec	_time_errspeed
2933  00f1               L747:
2934                     ; 859 		if (time_errcad) 		time_errcad--;
2936  00f1 b609          	ld	a,_time_errcad
2937  00f3 2702          	jreq	L157
2940  00f5 3a09          	dec	_time_errcad
2941  00f7               L157:
2942                     ; 862 		if (scor2)
2944  00f7 b634          	ld	a,_scor2
2945  00f9 27cb          	jreq	L737
2946                     ; 864 			uint32_t ind = scor2/4;
2948  00fb 5f            	clrw	x
2949  00fc 97            	ld	xl,a
2950  00fd 57            	sraw	x
2951  00fe 57            	sraw	x
2952  00ff cd0000        	call	c_itolx
2954  0102 96            	ldw	x,sp
2955  0103 1c0005        	addw	x,#OFST-3
2956  0106 cd0000        	call	c_rtol
2959                     ; 865 			if (ind>9) ind=9;
2961  0109 96            	ldw	x,sp
2962  010a 1c0005        	addw	x,#OFST-3
2963  010d cd0000        	call	c_ltor
2965  0110 ae001c        	ldw	x,#L624
2966  0113 cd0000        	call	c_lcmp
2968  0116 2508          	jrult	L557
2971  0118 ae0009        	ldw	x,#9
2972  011b 1f07          	ldw	(OFST-1,sp),x
2973  011d 5f            	clrw	x
2974  011e 1f05          	ldw	(OFST-3,sp),x
2976  0120               L557:
2977                     ; 868 			if (scor1)
2979  0120 b635          	ld	a,_scor1
2980  0122 2724          	jreq	L757
2981                     ; 869 				power += (float)param.ves * (float)scor2 / 3600;
2983  0124 b634          	ld	a,_scor2
2984  0126 5f            	clrw	x
2985  0127 97            	ld	xl,a
2986  0128 cd0000        	call	c_itof
2988  012b 96            	ldw	x,sp
2989  012c 5c            	incw	x
2990  012d cd0000        	call	c_rtol
2993  0130 b61c          	ld	a,_param
2994  0132 5f            	clrw	x
2995  0133 97            	ld	xl,a
2996  0134 cd0000        	call	c_itof
2998  0137 96            	ldw	x,sp
2999  0138 5c            	incw	x
3000  0139 cd0000        	call	c_fmul
3002  013c ae0028        	ldw	x,#L567
3003  013f cd0000        	call	c_fdiv
3005  0142 ae0036        	ldw	x,#_power
3006  0145 cd0000        	call	c_fgadd
3008  0148               L757:
3009                     ; 871 			if (scor2 > 3) {
3011  0148 b634          	ld	a,_scor2
3012  014a a104          	cp	a,#4
3013  014c 252e          	jrult	L177
3014                     ; 873 				activetime++;
3016  014e ae003a        	ldw	x,#_activetime
3017  0151 a601          	ld	a,#1
3018  0153 cd0000        	call	c_lgadc
3020                     ; 874 				obs[ind]++;
3022  0156 1e07          	ldw	x,(OFST-1,sp)
3023  0158 58            	sllw	x
3024  0159 58            	sllw	x
3025  015a 1c0046        	addw	x,#_obs
3026  015d a601          	ld	a,#1
3027  015f cd0000        	call	c_lgadc
3029                     ; 876 				if (scor2>maxspeed) maxspeed=scor2;
3031  0162 453403        	mov	c_lreg+3,_scor2
3032  0165 3f02          	clr	c_lreg+2
3033  0167 3f01          	clr	c_lreg+1
3034  0169 3f00          	clr	c_lreg
3035  016b ae0030        	ldw	x,#_maxspeed
3036  016e cd0000        	call	c_lcmp
3038  0171 2309          	jrule	L177
3041  0173 453433        	mov	_maxspeed+3,_scor2
3042  0176 3f32          	clr	_maxspeed+2
3043  0178 3f31          	clr	_maxspeed+1
3044  017a 3f30          	clr	_maxspeed
3045  017c               L177:
3046                     ; 880 			if (param.ks)	{
3048  017c be27          	ldw	x,_param+11
3049  017e 273a          	jreq	L577
3050                     ; 881 					errspeed = errspeed - (u8)((errspeed32 & (1L <<31))?1:0);
3052  0180 720f001104    	btjf	_errspeed32,#7,L034
3053  0185 a601          	ld	a,#1
3054  0187 2001          	jra	L234
3055  0189               L034:
3056  0189 4f            	clr	a
3057  018a               L234:
3058  018a b00f          	sub	a,_errspeed
3059  018c 40            	neg	a
3060  018d b70f          	ld	_errspeed,a
3061                     ; 882 					errspeed32 <<= 1;
3063  018f 3814          	sll	_errspeed32+3
3064  0191 3913          	rlc	_errspeed32+2
3065  0193 3912          	rlc	_errspeed32+1
3066  0195 3911          	rlc	_errspeed32
3067                     ; 883 					if ((param.ks > 0) ? (scor2 < (u8)param.ks) : (scor2 > (u8) (-param.ks)) ) {
3069  0197 9c            	rvf	
3070  0198 be27          	ldw	x,_param+11
3071  019a 2d0b          	jrsle	L434
3072  019c b634          	ld	a,_scor2
3073  019e b128          	cp	a,_param+12
3074  01a0 240c          	jruge	L444
3075  01a2               LC014:
3076  01a2 ae0001        	ldw	x,#1
3077  01a5 2008          	jra	L644
3078  01a7               L434:
3079  01a7 b628          	ld	a,_param+12
3080  01a9 40            	neg	a
3081  01aa b134          	cp	a,_scor2
3082  01ac 25f4          	jrult	LC014
3083  01ae               L444:
3084  01ae 5f            	clrw	x
3085  01af               L644:
3086  01af a30000        	cpw	x,#0
3087  01b2 2706          	jreq	L577
3088                     ; 884 						errspeed++;//есть нарушение скорости!
3090  01b4 3c0f          	inc	_errspeed
3091                     ; 885 						errspeed32 |= 1;
3093  01b6 72100014      	bset	_errspeed32+3,#0
3094  01ba               L577:
3095                     ; 890 			if ( param.kk )	{
3097  01ba be29          	ldw	x,_param+13
3098  01bc 2732          	jreq	L737
3099                     ; 891 					errcad= errcad- (u8)(errcad& (1L <<31))?1:0;
3101  01be b610          	ld	a,_errcad
3102  01c0 5f            	clrw	x
3103  01c1 97            	ld	xl,a
3104  01c2 5d            	tnzw	x
3105  01c3 2704          	jreq	L054
3106  01c5 a601          	ld	a,#1
3107  01c7 2001          	jra	L254
3108  01c9               L054:
3109  01c9 4f            	clr	a
3110  01ca               L254:
3111  01ca 48            	sll	a
3112  01cb b710          	ld	_errcad,a
3113                     ; 892 					errcad = errcad << 1;
3115                     ; 893 					if ((param.kk > 0) ? (scor2 < (u8)param.kk) : (scor2 > (u8) (-param.kk)) ) {
3117  01cd 9c            	rvf	
3118  01ce be29          	ldw	x,_param+13
3119  01d0 2d0b          	jrsle	L454
3120  01d2 b634          	ld	a,_scor2
3121  01d4 b12a          	cp	a,_param+14
3122  01d6 240c          	jruge	L464
3123  01d8               LC016:
3124  01d8 ae0001        	ldw	x,#1
3125  01db 2008          	jra	L664
3126  01dd               L454:
3127  01dd b62a          	ld	a,_param+14
3128  01df 40            	neg	a
3129  01e0 b134          	cp	a,_scor2
3130  01e2 25f4          	jrult	LC016
3131  01e4               L464:
3132  01e4 5f            	clrw	x
3133  01e5               L664:
3134  01e5 a30000        	cpw	x,#0
3135  01e8 2706          	jreq	L737
3136                     ; 894 						errcad++;//есть нарушение скорости!
3138  01ea 3c10          	inc	_errcad
3139                     ; 895 						errcad |= 1;
3141  01ec 72100010      	bset	_errcad,#0
3142  01f0               L737:
3143                     ; 900  }
3146  01f0 5b08          	addw	sp,#8
3147  01f2 85            	popw	x
3148  01f3 bf00          	ldw	c_lreg,x
3149  01f5 85            	popw	x
3150  01f6 bf02          	ldw	c_lreg+2,x
3151  01f8 85            	popw	x
3152  01f9 bf00          	ldw	c_y,x
3153  01fb 320002        	pop	c_y+2
3154  01fe 85            	popw	x
3155  01ff bf00          	ldw	c_x,x
3156  0201 320002        	pop	c_x+2
3157  0204 80            	iret	
3158  0205               LC017:
3159  0205 a601          	ld	a,#1
3160  0207 cd0000        	call	c_lgadc
3162                     ; 822 			if (h2time==30) 
3164  020a cd0000        	call	c_ltor
3166  020d ae0010        	ldw	x,#L604
3167  0210 cd0000        	call	c_lcmp
3168  0213 87            	retf	
3201                     	switch	.const
3202  0020               L674:
3203  0020 00000002      	dc.l	2
3204  0024               L405:
3205  0024 00000064      	dc.l	100
3206                     ; 903 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
3206                     ; 904 {
3207                     .text:	section	.text,new
3208  0000               f_EXTI_PORTC_IRQHandler:
3210  0000 8a            	push	cc
3211  0001 84            	pop	a
3212  0002 a4bf          	and	a,#191
3213  0004 88            	push	a
3214  0005 86            	pop	cc
3215       00000004      OFST:	set	4
3216  0006 3b0002        	push	c_x+2
3217  0009 be00          	ldw	x,c_x
3218  000b 89            	pushw	x
3219  000c 3b0002        	push	c_y+2
3220  000f be00          	ldw	x,c_y
3221  0011 89            	pushw	x
3222  0012 be02          	ldw	x,c_lreg+2
3223  0014 89            	pushw	x
3224  0015 be00          	ldw	x,c_lreg
3225  0017 89            	pushw	x
3226  0018 5204          	subw	sp,#4
3229                     ; 908 	if ((BitStatus)(GPIO_ReadInputPin(GPIOC,GPIO_PIN_7)) == RESET) {
3231  001a 4b80          	push	#128
3232  001c ae500a        	ldw	x,#20490
3233  001f cd0000        	call	_GPIO_ReadInputPin
3235  0022 5b01          	addw	sp,#1
3236  0024 4d            	tnz	a
3237  0025 2655          	jrne	L5101
3238                     ; 911 			if (haltstart==0)
3240  0027 b66e          	ld	a,_haltstart
3241  0029 260b          	jrne	L7101
3242                     ; 912 				GPIO_Init(GPIOC,GPIO_PIN_7,GPIO_MODE_IN_PU_NO_IT);
3244  002b 4b40          	push	#64
3245  002d 4b80          	push	#128
3246  002f ae500a        	ldw	x,#20490
3247  0032 cd0000        	call	_GPIO_Init
3249  0035 85            	popw	x
3250  0036               L7101:
3251                     ; 914 			if (h1time>1) {
3253  0036 ae0023        	ldw	x,#_h1time
3254  0039 cd0000        	call	c_ltor
3256  003c ae0020        	ldw	x,#L674
3257  003f cd0000        	call	c_lcmp
3259  0042 2522          	jrult	L1201
3260                     ; 915 				scor1 = 60000/(h1time - 1);//в оборотах в мин
3262  0044 ae0023        	ldw	x,#_h1time
3263  0047 cd0000        	call	c_ltor
3265  004a a601          	ld	a,#1
3266  004c cd0000        	call	c_lsbc
3268  004f 96            	ldw	x,sp
3269  0050 5c            	incw	x
3270  0051 cd0000        	call	c_rtol
3273  0054 aeea60        	ldw	x,#60000
3274  0057 bf02          	ldw	c_lreg+2,x
3275  0059 5f            	clrw	x
3276  005a bf00          	ldw	c_lreg,x
3277  005c 96            	ldw	x,sp
3278  005d 5c            	incw	x
3279  005e cd0000        	call	c_ludv
3281  0061 450335        	mov	_scor1,c_lreg+3
3283  0064 2002          	jra	L3201
3284  0066               L1201:
3285                     ; 916 			}	else scor1 = 0;
3287  0066 3f35          	clr	_scor1
3288  0068               L3201:
3289                     ; 918 			h1time = 1;
3291  0068 ae0001        	ldw	x,#1
3292  006b bf25          	ldw	_h1time+2,x
3293  006d 5f            	clrw	x
3294  006e bf23          	ldw	_h1time,x
3295                     ; 919 			hall[0]++;
3297  0070 ae003e        	ldw	x,#_hall
3298  0073 a601          	ld	a,#1
3299  0075 cd0000        	call	c_lgadc
3301                     ; 920 			timehalt=120;//сбросим таймер сна
3303  0078 35780005      	mov	_timehalt,#120
3304  007c               L5101:
3305                     ; 923 	if ((BitStatus)(GPIO_ReadInputPin(GPIOC,GPIO_PIN_6)) == RESET) {
3307  007c 4b40          	push	#64
3308  007e ae500a        	ldw	x,#20490
3309  0081 cd0000        	call	_GPIO_ReadInputPin
3311  0084 5b01          	addw	sp,#1
3312  0086 4d            	tnz	a
3313  0087 265e          	jrne	L5201
3314                     ; 926 			if (haltstart==0)
3316  0089 b66e          	ld	a,_haltstart
3317  008b 260b          	jrne	L7201
3318                     ; 927 				GPIO_Init(GPIOC,GPIO_PIN_6,GPIO_MODE_IN_PU_NO_IT);
3320  008d 4b40          	push	#64
3321  008f 4b40          	push	#64
3322  0091 ae500a        	ldw	x,#20490
3323  0094 cd0000        	call	_GPIO_Init
3325  0097 85            	popw	x
3326  0098               L7201:
3327                     ; 929 			if (h2time>1) {
3329  0098 ae0027        	ldw	x,#_h2time
3330  009b cd0000        	call	c_ltor
3332  009e ae0020        	ldw	x,#L674
3333  00a1 cd0000        	call	c_lcmp
3335  00a4 252b          	jrult	L1301
3336                     ; 930 				scor2 = (u8)(36*(u32)param.dkoles*314/100/(h2time - 1));//в км/ч
3338  00a6 ae0027        	ldw	x,#_h2time
3339  00a9 cd0000        	call	c_ltor
3341  00ac a601          	ld	a,#1
3342  00ae cd0000        	call	c_lsbc
3344  00b1 96            	ldw	x,sp
3345  00b2 5c            	incw	x
3346  00b3 cd0000        	call	c_rtol
3349  00b6 b61d          	ld	a,_param+1
3350  00b8 5f            	clrw	x
3351  00b9 97            	ld	xl,a
3352  00ba 90ae2c28      	ldw	y,#11304
3353  00be cd0000        	call	c_umul
3355  00c1 ae0024        	ldw	x,#L405
3356  00c4 cd0000        	call	c_ludv
3358  00c7 96            	ldw	x,sp
3359  00c8 5c            	incw	x
3360  00c9 cd0000        	call	c_ludv
3362  00cc 450334        	mov	_scor2,c_lreg+3
3364  00cf 2002          	jra	L3301
3365  00d1               L1301:
3366                     ; 932 			}	else scor2 = 0;
3368  00d1 3f34          	clr	_scor2
3369  00d3               L3301:
3370                     ; 934 			h2time = 1;
3372  00d3 ae0001        	ldw	x,#1
3373  00d6 bf29          	ldw	_h2time+2,x
3374  00d8 5f            	clrw	x
3375  00d9 bf27          	ldw	_h2time,x
3376                     ; 935 			hall[1]++;
3378  00db ae0042        	ldw	x,#_hall+4
3379  00de a601          	ld	a,#1
3380  00e0 cd0000        	call	c_lgadc
3382                     ; 936 			timehalt=120;//сбросим таймер сна !!!!
3384  00e3 35780005      	mov	_timehalt,#120
3385  00e7               L5201:
3386                     ; 938 }
3389  00e7 5b04          	addw	sp,#4
3390  00e9 85            	popw	x
3391  00ea bf00          	ldw	c_lreg,x
3392  00ec 85            	popw	x
3393  00ed bf02          	ldw	c_lreg+2,x
3394  00ef 85            	popw	x
3395  00f0 bf00          	ldw	c_y,x
3396  00f2 320002        	pop	c_y+2
3397  00f5 85            	popw	x
3398  00f6 bf00          	ldw	c_x,x
3399  00f8 320002        	pop	c_x+2
3400  00fb 80            	iret	
3428                     ; 940 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
3428                     ; 941 {
3429                     .text:	section	.text,new
3430  0000               f_EXTI_PORTD_IRQHandler:
3432  0000 8a            	push	cc
3433  0001 84            	pop	a
3434  0002 a4bf          	and	a,#191
3435  0004 88            	push	a
3436  0005 86            	pop	cc
3437  0006 3b0002        	push	c_x+2
3438  0009 be00          	ldw	x,c_x
3439  000b 89            	pushw	x
3440  000c 3b0002        	push	c_y+2
3441  000f be00          	ldw	x,c_y
3442  0011 89            	pushw	x
3445                     ; 945 	if ((BitStatus)(GPIO_ReadInputPin(GPIOD,GPIO_PIN_3)) == RESET) {
3447  0012 4b08          	push	#8
3448  0014 ae500f        	ldw	x,#20495
3449  0017 cd0000        	call	_GPIO_ReadInputPin
3451  001a 5b01          	addw	sp,#1
3452  001c 4d            	tnz	a
3453  001d 261b          	jrne	L5401
3454                     ; 947 			if( haltstart==0) GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_IN_PU_NO_IT);
3456  001f b66e          	ld	a,_haltstart
3457  0021 260b          	jrne	L7401
3460  0023 4b40          	push	#64
3461  0025 4b08          	push	#8
3462  0027 ae500f        	ldw	x,#20495
3463  002a cd0000        	call	_GPIO_Init
3465  002d 85            	popw	x
3466  002e               L7401:
3467                     ; 948 			kn = TRUE;
3469  002e 35010019      	mov	_kn,#1
3470                     ; 949 			kntime = 200;
3472  0032 ae00c8        	ldw	x,#200
3473  0035 bf21          	ldw	_kntime+2,x
3474  0037 5f            	clrw	x
3475  0038 bf1f          	ldw	_kntime,x
3476  003a               L5401:
3477                     ; 951 }
3480  003a 85            	popw	x
3481  003b bf00          	ldw	c_y,x
3482  003d 320002        	pop	c_y+2
3483  0040 85            	popw	x
3484  0041 bf00          	ldw	c_x,x
3485  0043 320002        	pop	c_x+2
3486  0046 80            	iret	
3516                     ; 953 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
3516                     ; 954 {
3517                     .text:	section	.text,new
3518  0000               f_AWU_IRQHandler:
3520  0000 8a            	push	cc
3521  0001 84            	pop	a
3522  0002 a4bf          	and	a,#191
3523  0004 88            	push	a
3524  0005 86            	pop	cc
3525  0006 3b0002        	push	c_x+2
3526  0009 be00          	ldw	x,c_x
3527  000b 89            	pushw	x
3528  000c 3b0002        	push	c_y+2
3529  000f be00          	ldw	x,c_y
3530  0011 89            	pushw	x
3531  0012 be02          	ldw	x,c_lreg+2
3532  0014 89            	pushw	x
3533  0015 be00          	ldw	x,c_lreg
3534  0017 89            	pushw	x
3537                     ; 959 	isawu = AWU->CSR;   //AWU_GetFlagStatus();
3539  0018 5550f0000c    	mov	_isawu,20720
3540                     ; 960 	isawu=1;
3542  001d 3501000c      	mov	_isawu,#1
3543                     ; 961 	if (timeawu) 
3545  0021 b60a          	ld	a,_timeawu
3546  0023 2704          	jreq	L1601
3547                     ; 962 		timeawu--;
3549  0025 3a0a          	dec	_timeawu
3551  0027 2058          	jra	L3601
3552  0029               L1601:
3553                     ; 965 		if (poezdka.fix) { //если есть поездка!
3555  0029 b600          	ld	a,_poezdka
3556  002b 274e          	jreq	L5601
3557                     ; 966 			poezdka.fix=2;
3559  002d 35020000      	mov	_poezdka,#2
3560                     ; 967 			saveflash(ADDRP+param.numpoezdki*NUMBYTEP,(u32)&poezdka,NUMBYTEP);
3562  0031 8d940094      	callf	LC018
3563                     ; 969 			nextp();
3565  0035 cd0000        	call	_nextp
3567                     ; 970 			param.power += poezdka.power;
3569  0038 ae0009        	ldw	x,#_poezdka+9
3570  003b cd0000        	call	c_ltor
3572  003e ae0022        	ldw	x,#_param+6
3573  0041 cd0000        	call	c_lgadd
3575                     ; 971 			param.probeg += poezdka.probeg;
3577  0044 ae0005        	ldw	x,#_poezdka+5
3578  0047 cd0000        	call	c_ltor
3580  004a ae001e        	ldw	x,#_param+2
3581  004d cd0000        	call	c_lgadd
3583                     ; 972 			saveflash(0x4000,(u32)&param,14);
3585  0050 4b0e          	push	#14
3586  0052 351c0003      	mov	c_lreg+3,#_param
3587  0056 3f02          	clr	c_lreg+2
3588  0058 3f01          	clr	c_lreg+1
3589  005a 3f00          	clr	c_lreg
3590  005c be02          	ldw	x,c_lreg+2
3591  005e 89            	pushw	x
3592  005f be00          	ldw	x,c_lreg
3593  0061 89            	pushw	x
3594  0062 ae4000        	ldw	x,#16384
3595  0065 89            	pushw	x
3596  0066 5f            	clrw	x
3597  0067 89            	pushw	x
3598  0068 cd0000        	call	_saveflash
3600  006b 5b09          	addw	sp,#9
3601                     ; 974 			poezdka.fix = 0;
3603  006d 3f00          	clr	_poezdka
3604                     ; 975 			poezdka.nump++;
3606  006f ae0001        	ldw	x,#_poezdka+1
3607  0072 a601          	ld	a,#1
3608  0074 cd0000        	call	c_lgadc
3610                     ; 976 			saveflash(ADDRP+param.numpoezdki*NUMBYTEP,(u32)&poezdka,NUMBYTEP);//первые 5 байт! только 2 переменные
3612  0077 8d940094      	callf	LC018
3613  007b               L5601:
3614                     ; 979 		clearlocal();
3616  007b cd0000        	call	_clearlocal
3618                     ; 981 		AWU_DeInit();
3620  007e cd0000        	call	_AWU_DeInit
3622  0081               L3601:
3623                     ; 983 }
3626  0081 85            	popw	x
3627  0082 bf00          	ldw	c_lreg,x
3628  0084 85            	popw	x
3629  0085 bf02          	ldw	c_lreg+2,x
3630  0087 85            	popw	x
3631  0088 bf00          	ldw	c_y,x
3632  008a 320002        	pop	c_y+2
3633  008d 85            	popw	x
3634  008e bf00          	ldw	c_x,x
3635  0090 320002        	pop	c_x+2
3636  0093 80            	iret	
3637  0094               LC018:
3638  0094 4b1c          	push	#28
3639  0096 35000003      	mov	c_lreg+3,#_poezdka
3640  009a 3f02          	clr	c_lreg+2
3641  009c 3f01          	clr	c_lreg+1
3642  009e 3f00          	clr	c_lreg
3643  00a0 be02          	ldw	x,c_lreg+2
3644  00a2 89            	pushw	x
3645  00a3 be00          	ldw	x,c_lreg
3646  00a5 89            	pushw	x
3647  00a6 b626          	ld	a,_param+10
3648  00a8 97            	ld	xl,a
3649  00a9 a61c          	ld	a,#28
3650  00ab 42            	mul	x,a
3651  00ac 1c400e        	addw	x,#16398
3652  00af cd0000        	call	c_itolx
3654  00b2 be02          	ldw	x,c_lreg+2
3655  00b4 89            	pushw	x
3656  00b5 be00          	ldw	x,c_lreg
3657  00b7 89            	pushw	x
3658  00b8 cd0000        	call	_saveflash
3660  00bb 5b09          	addw	sp,#9
3661  00bd 87            	retf	
4124                     	xdef	f_AWU_IRQHandler
4125                     	xdef	f_EXTI_PORTD_IRQHandler
4126                     	xdef	f_EXTI_PORTC_IRQHandler
4127                     	xdef	f_TIM4_UPD_OVF_IRQHandler
4128                     	xdef	_h2
4129                     	xdef	_h1
4130                     	xdef	_h2time
4131                     	xdef	_h1time
4132                     	xdef	_kntime
4133                     	xdef	_nextsec
4134                     	xdef	_main
4135                     	xdef	_printparam
4136                     	xdef	_nextp
4137                     	xdef	_cleareeprom
4138                     	xdef	_readflash
4139                     	xdef	_saveflash
4140                     	xdef	_playmusic
4141                     	switch	.ubsct
4142  0000               _poezdka:
4143  0000 000000000000  	ds.b	28
4144                     	xdef	_poezdka
4145  001c               _param:
4146  001c 000000000000  	ds.b	15
4147                     	xdef	_param
4148                     	xdef	_clearlocal
4149                     	xdef	_LSIMeasurment
4150                     	xdef	_Delay
4151                     	xdef	_RXtek
4152  002b               _RXbuff:
4153  002b 0000000000    	ds.b	5
4154                     	xdef	_RXbuff
4155  0030               _maxspeed:
4156  0030 00000000      	ds.b	4
4157                     	xdef	_maxspeed
4158  0034               _scor2:
4159  0034 00            	ds.b	1
4160                     	xdef	_scor2
4161  0035               _scor1:
4162  0035 00            	ds.b	1
4163                     	xdef	_scor1
4164  0036               _power:
4165  0036 00000000      	ds.b	4
4166                     	xdef	_power
4167  003a               _activetime:
4168  003a 00000000      	ds.b	4
4169                     	xdef	_activetime
4170  003e               _hall:
4171  003e 000000000000  	ds.b	8
4172                     	xdef	_hall
4173                     	xdef	_kn
4174  0046               _obs:
4175  0046 000000000000  	ds.b	40
4176                     	xdef	_obs
4177                     	xdef	_errcad32
4178                     	xdef	_errspeed32
4179                     	xdef	_errcad
4180                     	xdef	_errspeed
4181                     	xdef	_blueen
4182                     	xdef	_RXready
4183                     	xdef	_isawu
4184  006e               _haltstart:
4185  006e 00            	ds.b	1
4186                     	xdef	_haltstart
4187                     	xdef	_flagclr
4188                     	xdef	_timeawu
4189                     	xdef	_time_errcad
4190                     	xdef	_time_errspeed
4191                     	xdef	_timedelay
4192                     	xdef	_timehalt
4193                     	xdef	_timeblueoff
4194                     	xdef	_timeblue
4195                     	xdef	_putchar
4196                     	xref	_printf
4197                     	xdef	_getchar
4198                     	xref	_UART1_GetFlagStatus
4199                     	xref	_UART1_SendData8
4200                     	xref	_UART1_ITConfig
4201                     	xref	_UART1_Init
4202                     	xref	_UART1_DeInit
4203                     	xref	_TIM4_ClearITPendingBit
4204                     	xref	_TIM4_ClearFlag
4205                     	xref	_TIM4_ITConfig
4206                     	xref	_TIM4_Cmd
4207                     	xref	_TIM4_TimeBaseInit
4208                     	xref	_TIM1_ClearFlag
4209                     	xref	_TIM1_GetCapture1
4210                     	xref	_TIM1_Cmd
4211                     	xref	_TIM1_ICInit
4212                     	xref	_GPIO_ReadInputPin
4213                     	xref	_GPIO_Init
4214                     	xref	_FLASH_ReadByte
4215                     	xref	_FLASH_ProgramByte
4216                     	xref	_FLASH_Lock
4217                     	xref	_FLASH_Unlock
4218                     	xref	_CLK_GetClockFreq
4219                     	xref	_CLK_HSIPrescalerConfig
4220                     	xref	_CLK_ClockSwitchConfig
4221                     	xref	_BEEP_Cmd
4222                     	xref	_BEEP_Init
4223                     	xref	_AWU_Init
4224                     	xref	_AWU_DeInit
4225                     	switch	.const
4226  0028               L567:
4227  0028 45610000      	dc.w	17761,0
4228  002c               L105:
4229  002c 3a2825692925  	dc.b	":(%i)%i",0
4230  0034               L174:
4231  0034 286e756d2925  	dc.b	"(num)%li (time)%li"
4232  0046 20286d617873  	dc.b	" (maxs)%li (cal)%l"
4233  0058 6920286b6d29  	dc.b	"i (km)%li",10
4234  0062 0d00          	dc.b	13,0
4235  0064               L554:
4236  0064 7965733f0a    	dc.b	"yes?",10
4237  0069 0d00          	dc.b	13,0
4238  006b               L744:
4239  006b 636c6561720a  	dc.b	"clear",10
4240  0071 0d00          	dc.b	13,0
4241  0073               L504:
4242  0073 0a0d00        	dc.b	10,13,0
4243  0076               L304:
4244  0076 3a2825692925  	dc.b	":(%i)%li",0
4245  007f               L373:
4246  007f 7400          	dc.b	"t",0
4247  0081               L173:
4248  0081 286361642925  	dc.b	"(cad)%i (SCOR)%i ("
4249  0093 616c6c29256c  	dc.b	"all)%li (ob)%li (p"
4250  00a5 726f6229256c  	dc.b	"rob)%li (cal)%li ("
4251  00b7 6174696d6529  	dc.b	"atime)%li",10
4252  00c1 0d00          	dc.b	13,0
4253  00c3               L332:
4254  00c3 256928766573  	dc.b	"%i(ves-kg)%i (d-cm"
4255  00d5 29256c692028  	dc.b	")%li (ks)%i (kk)%i"
4256  00e7 202870726f62  	dc.b	" (prob)%li (cal)%l"
4257  00f9 690a          	dc.b	"i",10
4258  00fb 0d00          	dc.b	13,0
4259                     	xref.b	c_lreg
4260                     	xref.b	c_x
4261                     	xref.b	c_y
4281                     	xref	c_umul
4282                     	xref	c_lsbc
4283                     	xref	c_fgadd
4284                     	xref	c_fdiv
4285                     	xref	c_fmul
4286                     	xref	c_itof
4287                     	xref	c_lgsbc
4288                     	xref	c_uitolx
4289                     	xref	c_llsh
4290                     	xref	c_ldiv
4291                     	xref	c_smul
4292                     	xref	c_rtol
4293                     	xref	c_lcmp
4294                     	xref	c_ladd
4295                     	xref	c_ludv
4296                     	xref	c_lmul
4297                     	xref	c_ftol
4298                     	xref	c_lzmp
4299                     	xref	c_lgadd
4300                     	xref	c_ltor
4301                     	xref	c_itolx
4302                     	xref	c_imul
4303                     	xref	c_lgadc
4304                     	end
