   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
 123                     ; 54 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 123                     ; 55 {
 125                     .text:	section	.text,new
 126  0000               _RST_GetFlagStatus:
 130                     ; 57   assert_param(IS_RST_FLAG_OK(RST_Flag));
 132                     ; 60   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 134  0000 c450b3        	and	a,20659
 135  0003 2702          	jreq	L01
 136  0005 a601          	ld	a,#1
 137  0007               L01:
 140  0007 81            	ret	
 175                     ; 69 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 175                     ; 70 {
 176                     .text:	section	.text,new
 177  0000               _RST_ClearFlag:
 181                     ; 72   assert_param(IS_RST_FLAG_OK(RST_Flag));
 183                     ; 74   RST->SR = (uint8_t)RST_Flag;
 185  0000 c750b3        	ld	20659,a
 186                     ; 75 }
 189  0003 81            	ret	
 202                     	xdef	_RST_ClearFlag
 203                     	xdef	_RST_GetFlagStatus
 222                     	end
