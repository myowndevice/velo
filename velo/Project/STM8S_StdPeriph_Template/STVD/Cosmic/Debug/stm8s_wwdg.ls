   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  69                     ; 53 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  69                     ; 54 {
  71                     .text:	section	.text,new
  72  0000               _WWDG_Init:
  74  0000 89            	pushw	x
  75       00000000      OFST:	set	0
  78                     ; 56   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  80                     ; 58   WWDG->WR = WWDG_WR_RESET_VALUE;
  82  0001 357f50d2      	mov	20690,#127
  83                     ; 59   WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  85  0005 9e            	ld	a,xh
  86  0006 aac0          	or	a,#192
  87  0008 c750d1        	ld	20689,a
  88                     ; 60   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  90  000b 7b02          	ld	a,(OFST+2,sp)
  91  000d a47f          	and	a,#127
  92  000f aa40          	or	a,#64
  93  0011 c750d2        	ld	20690,a
  94                     ; 61 }
  97  0014 85            	popw	x
  98  0015 81            	ret	
 132                     ; 69 void WWDG_SetCounter(uint8_t Counter)
 132                     ; 70 {
 133                     .text:	section	.text,new
 134  0000               _WWDG_SetCounter:
 138                     ; 72   assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 140                     ; 76   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 142  0000 a47f          	and	a,#127
 143  0002 c750d1        	ld	20689,a
 144                     ; 77 }
 147  0005 81            	ret	
 170                     ; 86 uint8_t WWDG_GetCounter(void)
 170                     ; 87 {
 171                     .text:	section	.text,new
 172  0000               _WWDG_GetCounter:
 176                     ; 88   return(WWDG->CR);
 178  0000 c650d1        	ld	a,20689
 181  0003 81            	ret	
 204                     ; 96 void WWDG_SWReset(void)
 204                     ; 97 {
 205                     .text:	section	.text,new
 206  0000               _WWDG_SWReset:
 210                     ; 98   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 212  0000 358050d1      	mov	20689,#128
 213                     ; 99 }
 216  0004 81            	ret	
 251                     ; 108 void WWDG_SetWindowValue(uint8_t WindowValue)
 251                     ; 109 {
 252                     .text:	section	.text,new
 253  0000               _WWDG_SetWindowValue:
 257                     ; 111   assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 259                     ; 113   WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 261  0000 a47f          	and	a,#127
 262  0002 aa40          	or	a,#64
 263  0004 c750d2        	ld	20690,a
 264                     ; 114 }
 267  0007 81            	ret	
 280                     	xdef	_WWDG_SetWindowValue
 281                     	xdef	_WWDG_SWReset
 282                     	xdef	_WWDG_GetCounter
 283                     	xdef	_WWDG_SetCounter
 284                     	xdef	_WWDG_Init
 303                     	end
