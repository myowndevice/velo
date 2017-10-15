   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  84                     ; 48 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  84                     ; 49 {
  86                     .text:	section	.text,new
  87  0000               _IWDG_WriteAccessCmd:
  91                     ; 51   assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  93                     ; 53   IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  95  0000 c750e0        	ld	20704,a
  96                     ; 54 }
  99  0003 81            	ret	
 189                     ; 63 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 189                     ; 64 {
 190                     .text:	section	.text,new
 191  0000               _IWDG_SetPrescaler:
 195                     ; 66   assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 197                     ; 68   IWDG->PR = (uint8_t)IWDG_Prescaler;
 199  0000 c750e1        	ld	20705,a
 200                     ; 69 }
 203  0003 81            	ret	
 237                     ; 78 void IWDG_SetReload(uint8_t IWDG_Reload)
 237                     ; 79 {
 238                     .text:	section	.text,new
 239  0000               _IWDG_SetReload:
 243                     ; 80   IWDG->RLR = IWDG_Reload;
 245  0000 c750e2        	ld	20706,a
 246                     ; 81 }
 249  0003 81            	ret	
 272                     ; 89 void IWDG_ReloadCounter(void)
 272                     ; 90 {
 273                     .text:	section	.text,new
 274  0000               _IWDG_ReloadCounter:
 278                     ; 91   IWDG->KR = IWDG_KEY_REFRESH;
 280  0000 35aa50e0      	mov	20704,#170
 281                     ; 92 }
 284  0004 81            	ret	
 307                     ; 99 void IWDG_Enable(void)
 307                     ; 100 {
 308                     .text:	section	.text,new
 309  0000               _IWDG_Enable:
 313                     ; 101   IWDG->KR = IWDG_KEY_ENABLE;
 315  0000 35cc50e0      	mov	20704,#204
 316                     ; 102 }
 319  0004 81            	ret	
 332                     	xdef	_IWDG_Enable
 333                     	xdef	_IWDG_ReloadCounter
 334                     	xdef	_IWDG_SetReload
 335                     	xdef	_IWDG_SetPrescaler
 336                     	xdef	_IWDG_WriteAccessCmd
 355                     	end
