   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  50                     ; 62 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  50                     ; 63 {
  51                     .text:	section	.text,new
  52  0000               f_NonHandledInterrupt:
  56                     ; 67 }
  59  0000 80            	iret	
  81                     ; 75 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  81                     ; 76 {
  82                     .text:	section	.text,new
  83  0000               f_TRAP_IRQHandler:
  87                     ; 80 }
  90  0000 80            	iret	
 112                     ; 87 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 112                     ; 88 
 112                     ; 89 {
 113                     .text:	section	.text,new
 114  0000               f_TLI_IRQHandler:
 118                     ; 93 }
 121  0000 80            	iret	
 143                     ; 106 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 143                     ; 107 {
 144                     .text:	section	.text,new
 145  0000               f_CLK_IRQHandler:
 149                     ; 111 }
 152  0000 80            	iret	
 175                     ; 118 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 175                     ; 119 {
 176                     .text:	section	.text,new
 177  0000               f_EXTI_PORTA_IRQHandler:
 181                     ; 123 }
 184  0000 80            	iret	
 207                     ; 130 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 207                     ; 131 {
 208                     .text:	section	.text,new
 209  0000               f_EXTI_PORTB_IRQHandler:
 213                     ; 135 }
 216  0000 80            	iret	
 239                     ; 154 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 239                     ; 155 {
 240                     .text:	section	.text,new
 241  0000               f_EXTI_PORTE_IRQHandler:
 245                     ; 159 }
 248  0000 80            	iret	
 270                     ; 206 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 270                     ; 207 {
 271                     .text:	section	.text,new
 272  0000               f_SPI_IRQHandler:
 276                     ; 211 }
 279  0000 80            	iret	
 302                     ; 218 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 302                     ; 219 {
 303                     .text:	section	.text,new
 304  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 308                     ; 223 }
 311  0000 80            	iret	
 334                     ; 230 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 334                     ; 231 {
 335                     .text:	section	.text,new
 336  0000               f_TIM1_CAP_COM_IRQHandler:
 340                     ; 235 }
 343  0000 80            	iret	
 366                     ; 268  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 366                     ; 269  {
 367                     .text:	section	.text,new
 368  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 372                     ; 273  }
 375  0000 80            	iret	
 398                     ; 280  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 398                     ; 281  {
 399                     .text:	section	.text,new
 400  0000               f_TIM2_CAP_COM_IRQHandler:
 404                     ; 285  }
 407  0000 80            	iret	
 430                     ; 322  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 430                     ; 323  {
 431                     .text:	section	.text,new
 432  0000               f_UART1_TX_IRQHandler:
 436                     ; 327  }
 439  0000 80            	iret	
 478                     ; 334  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 478                     ; 335  {
 479                     .text:	section	.text,new
 480  0000               f_UART1_RX_IRQHandler:
 482  0000 8a            	push	cc
 483  0001 84            	pop	a
 484  0002 a4bf          	and	a,#191
 485  0004 88            	push	a
 486  0005 86            	pop	cc
 487       00000001      OFST:	set	1
 488  0006 3b0002        	push	c_x+2
 489  0009 be00          	ldw	x,c_x
 490  000b 89            	pushw	x
 491  000c 3b0002        	push	c_y+2
 492  000f be00          	ldw	x,c_y
 493  0011 89            	pushw	x
 494  0012 88            	push	a
 497                     ; 336     char c=0;
 499  0013 0f01          	clr	(OFST+0,sp)
 501                     ; 341 		if (UART1_GetFlagStatus(UART1_FLAG_RXNE) != RESET )
 503  0015 ae0020        	ldw	x,#32
 504  0018 cd0000        	call	_UART1_GetFlagStatus
 506  001b 4d            	tnz	a
 507  001c 2705          	jreq	L771
 508                     ; 342 			c = UART1_ReceiveData8();
 510  001e cd0000        	call	_UART1_ReceiveData8
 512  0021 6b01          	ld	(OFST+0,sp),a
 514  0023               L771:
 515                     ; 344 		if (RXready==FALSE) {
 517  0023 b600          	ld	a,_RXready
 518  0025 2626          	jrne	L102
 519                     ; 345 			if (c == '\n' || c == '\r') {
 521  0027 7b01          	ld	a,(OFST+0,sp)
 522  0029 a10a          	cp	a,#10
 523  002b 2704          	jreq	L502
 525  002d a10d          	cp	a,#13
 526  002f 2612          	jrne	L302
 527  0031               L502:
 528                     ; 346 				RXready=TRUE;
 530  0031 35010000      	mov	_RXready,#1
 532  0035               L702:
 533                     ; 350 			RXtek++;
 535  0035 3c00          	inc	_RXtek
 536                     ; 351 			if (RXtek==5) RXready=TRUE;
 538  0037 b600          	ld	a,_RXtek
 539  0039 a105          	cp	a,#5
 540  003b 2610          	jrne	L102
 543  003d 35010000      	mov	_RXready,#1
 544  0041 200a          	jra	L102
 545  0043               L302:
 546                     ; 349 				RXbuff[RXtek] = c;
 548  0043 b600          	ld	a,_RXtek
 549  0045 5f            	clrw	x
 550  0046 97            	ld	xl,a
 551  0047 7b01          	ld	a,(OFST+0,sp)
 552  0049 e700          	ld	(_RXbuff,x),a
 553  004b 20e8          	jra	L702
 554  004d               L102:
 555                     ; 353  }
 558  004d 84            	pop	a
 559  004e 85            	popw	x
 560  004f bf00          	ldw	c_y,x
 561  0051 320002        	pop	c_y+2
 562  0054 85            	popw	x
 563  0055 bf00          	ldw	c_x,x
 564  0057 320002        	pop	c_x+2
 565  005a 80            	iret	
 587                     ; 387 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 587                     ; 388 {
 588                     .text:	section	.text,new
 589  0000               f_I2C_IRQHandler:
 593                     ; 392 }
 596  0000 80            	iret	
 618                     ; 466  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 618                     ; 467  {
 619                     .text:	section	.text,new
 620  0000               f_ADC1_IRQHandler:
 624                     ; 471  }
 627  0000 80            	iret	
 650                     ; 479 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 650                     ; 480 {
 651                     .text:	section	.text,new
 652  0000               f_EEPROM_EEC_IRQHandler:
 656                     ; 484 }
 659  0000 80            	iret	
 671                     	xref.b	_RXready
 672                     	xref.b	_RXtek
 673                     	xref.b	_RXbuff
 674                     	xdef	f_EEPROM_EEC_IRQHandler
 675                     	xdef	f_ADC1_IRQHandler
 676                     	xdef	f_I2C_IRQHandler
 677                     	xdef	f_UART1_RX_IRQHandler
 678                     	xdef	f_UART1_TX_IRQHandler
 679                     	xdef	f_TIM2_CAP_COM_IRQHandler
 680                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 681                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 682                     	xdef	f_TIM1_CAP_COM_IRQHandler
 683                     	xdef	f_SPI_IRQHandler
 684                     	xdef	f_EXTI_PORTE_IRQHandler
 685                     	xdef	f_EXTI_PORTB_IRQHandler
 686                     	xdef	f_EXTI_PORTA_IRQHandler
 687                     	xdef	f_CLK_IRQHandler
 688                     	xdef	f_TLI_IRQHandler
 689                     	xdef	f_TRAP_IRQHandler
 690                     	xdef	f_NonHandledInterrupt
 691                     	xref	_UART1_GetFlagStatus
 692                     	xref	_UART1_ReceiveData8
 693                     	xref.b	c_x
 694                     	xref.b	c_y
 713                     	end
