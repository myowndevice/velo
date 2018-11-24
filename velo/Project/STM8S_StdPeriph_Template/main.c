//#define SIMUL  //для работы в симуляторе
/**
  ******************************************************************************
  * @file    Project/main.c 
  * @author  MCD Application Team
  * @version V2.2.0
  * @date    30-September-2014
  * @brief   Main program body
   ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "stdio.h"

/* Private defines -----------------------------------------------------------*/

#define PUTCHAR_PROTOTYPE char putchar (char c)
#define GETCHAR_PROTOTYPE char getchar (void)


/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

//#define BTONLOW 1

#ifdef BTONLOW
//для экономии памяти напишем прямое обращение к регистрам
#define btoff   (GPIOD->ODR |= (uint8_t)0b100) //GPIO_WriteHigh(GPIOD,GPIO_PIN_2)
#define ifbton ((GPIOD->ODR & (uint8_t)0b100)==0) //((GPIO_ReadOutputData(GPIOD) & GPIO_PIN_2)==0)
#define bton    (GPIOD->ODR &= (uint8_t)(~0b100) ) // GPIO_WriteLow(GPIOD,GPIO_PIN_2))
#define btchange (GPIOD->ODR ^= (uint8_t)0b100)//GPIO_WriteReverse(GPIOD,GPIO_PIN_2)

#else

#define bton   (GPIOC->ODR |= (uint8_t)GPIO_PIN_3) //GPIO_WriteHigh(GPIOC,GPIO_PIN_4)
#define ifbton ((GPIOC->ODR & (uint8_t)GPIO_PIN_3)) //((GPIO_ReadOutputData(GPIOD) & GPIO_PIN_2)==0)
#define btoff    (GPIOC->ODR &= (uint8_t)(~GPIO_PIN_3) ) // GPIO_WriteLow(GPIOD,GPIO_PIN_2))
#define btchange (GPIOC->ODR ^= (uint8_t)GPIO_PIN_3)//GPIO_WriteReverse(GPIOD,GPIO_PIN_2)

#endif

//u32      current_millis = 0;
u32  timeblue=0;
u8   timeblueoff=0;
u8   timehalt=0;
u16  timedelay=0;
u8 	 time_errspeed=0;
u8 	 time_errcad=0;
u8 	 timeawu=0;

u8   flagclr=0;
u8   haltstart;
u8   isawu=0;
bool RXready=FALSE;
bool blueen=FALSE;

u8   errspeed=0;//контроль нарушения скорости и каденса
u8   errcad=0;
u32  errspeed32=0;
u32  errcad32=0;

u32  obs[10];//do 40km\h  po 4km\h

bool kn = FALSE;

u32 hall[2];
u32 activetime;
u32 power;

uint8_t scor1;//скорость по h1 
uint8_t scor2;//скорость по h2
u32 maxspeed;

uint8_t RXbuff[5];
uint8_t RXtek=0;

#define PI 314 //PI

void Delay (u16 nCount);
uint32_t LSIMeasurment(void);

#define US(us) ( 1000000.0 / 3000000.0 * us ) //FCPU / 3000
#define MS(ms) US(ms * 1000) // maximum 10ms

#define _delay( loops ) _asm("$N: \n decw X \n jrne $L \n nop", (u16)loops);
#define _delay_us(us) _delay(US(us))

#define IND_WIRE_1 GPIOB->ODR |= (uint8_t)GPIO_PIN_5//GPIO_WriteHigh(GPIOC,GPIO_PIN_6)
#define IND_WIRE_0 GPIOB->ODR &= (uint8_t)(~GPIO_PIN_5)  //GPIO_WriteLow(GPIOC,GPIO_PIN_6)

u8 b[4];


//индикатор
void sendindicator(void) {
	//reset
	u8 dd;
	
	
	IND_WIRE_0;
	_delay_us(10);
	IND_WIRE_1;	
	_delay_us(480);
	
	{
		u8 i,j;
		disableInterrupts();
				
		for (j=0;j<4;j++) {
			dd = b[j];
			
			for (i=0;i<8;i++) {
				if (dd & 1) {
					IND_WIRE_0;			
					_delay_us(9);
					IND_WIRE_1;
					_delay_us(55);
				} else {
					IND_WIRE_0;			
					_delay_us(65);
					IND_WIRE_1;
					_delay_us(5);
				}
				dd >>= 1;
			}
		}
		//IND_WIRE_0;			
		//_delay_us(9);
		//IND_WIRE_1;
		enableInterrupts();
		
	}
}	



void clearlocal(void)
{
	u8 i;
	for (i=0;i<10;i++) obs[i]=0;
	hall[0]=0;hall[1]=0;
	activetime=0;
	power=0;
	scor1=0;
	scor2=0;
	maxspeed=0;	
}

struct s_param {
	u8 ves;
	u8 dkoles;
	u32 probeg;//пробег в метрах за все время пользования прибором
	u32 power;//потраченные калории за все время пользования прибором
	u8 numpoezdki;//номер последней поездки
	s8 ks;//контроль скорости
	s8 kk;//контроль каденса
	//итого 14байт!
} param;

struct s_poezdka {
	u8 fix;//1- поездка начата и не зафиксирована 2 - поездка зафиксирована
	u32 nump;//номер поездки по порядку
	u32 probeg;//пробег за поездку
	u32 power;//калории за поездку
	u8 obs[10];//время в процентах от активного времени на каждой скорости для экономии места!
	u8 maxspeed;//максимальная скорость в км\ч за время поездки
	u32 activetime;//активное время поездки в сек, когда скорость была больше 4 км\ч
	//итого 28 байта!  получается 5 поездок!!!
} poezdka;

#define NUMBERP 4  //колво поездок в памяти! вместе с параметрами итого 126байт!
#define ADDRP 0x4000+14  //адрес фо флеше когда начинаются поездки
#define NUMBYTEP 28 //колво байт в одной поездке

void playmusic(u8 t)
{
	//return;
	//играем музыку на разные лады..
	if (t==1) 
	{
		//turn on
		BEEP_Init(BEEP_FREQUENCY_1KHZ);
		BEEP_Cmd(ENABLE);
		Delay(100);
		BEEP_Init(BEEP_FREQUENCY_2KHZ);
		Delay(200);
		BEEP_Init(BEEP_FREQUENCY_4KHZ);
		Delay(100);
	}
	
	if (t==2)
	{
		//bluetooth on
		BEEP_Init(BEEP_FREQUENCY_1KHZ);
		BEEP_Cmd(ENABLE);
		Delay(300);
		BEEP_Cmd(DISABLE);
		Delay(300);			
		BEEP_Cmd(ENABLE);
		Delay(300);						
	}
	
	if (t==3)
	{
		//bluetooth off
		BEEP_Init(BEEP_FREQUENCY_4KHZ);		
		BEEP_Cmd(ENABLE);
		Delay(300);
		BEEP_Cmd(DISABLE);
		Delay(300);			
		BEEP_Cmd(ENABLE);
		Delay(300);						
	}		
	
	if (t==4)
	{
		//sleep
		BEEP_Init(BEEP_FREQUENCY_2KHZ);
		BEEP_Cmd(ENABLE);
		Delay(100);
		BEEP_Cmd(DISABLE);
		Delay(100);			
		BEEP_Cmd(ENABLE);
		Delay(100);						
	}	
	
	if (t==5)
	{
		//sleep
		BEEP_Init(BEEP_FREQUENCY_4KHZ);
		BEEP_Cmd(ENABLE);
		Delay(700);
	}	
	
	if (t==6)
	{
		//sleep
		BEEP_Init(BEEP_FREQUENCY_1KHZ);
		BEEP_Cmd(ENABLE);
		Delay(700);
	}	
	BEEP_Cmd(DISABLE);
}

void saveflash(u32 addrf,u32 addr,u8 nbyte)
{
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	
	while (nbyte--)
	{
		FLASH_ProgramByte(addrf, *((u8 *)addr));
		addr++;
		addrf++;
	}
	
	FLASH_Lock(FLASH_MEMTYPE_DATA);
}

void readflash(u32 addrf,u32 addr,u8 nbyte)
{
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	
	while (nbyte--)
	{
		*((u8 *)addr) = FLASH_ReadByte(addrf);
		addr++;
		addrf++;
	}
	
	FLASH_Lock(FLASH_MEMTYPE_DATA);
}

void cleareeprom(u8 i)
{
	if (i)
	{
		param.ves = 80;
		param.dkoles = 105;
		param.kk= 0;
		param.ks= 0;
	}

	param.probeg= 0;
	param.power= 0;		
	param.numpoezdki=0;//текущая поездка куда пишем
	saveflash(0x4000,(u32)&param,14);
	//еще очистить поездки!
	{
		u8 b=0;
		poezdka.nump=0;
		poezdka.fix=0;
		poezdka.probeg=0;
		poezdka.power=0;
		poezdka.activetime=0;
		for (b=0;b<NUMBERP;b++)
		{
			saveflash(ADDRP+b*NUMBYTEP,(u32)&poezdka,NUMBYTEP);
		}
	}
	clearlocal();
	
}

void nextp(void) {
	param.numpoezdki++;
	
	if (param.numpoezdki >= NUMBERP)
			param.numpoezdki=0;
}		

u32 calc_power(void) {
	return power*param.ves/3600;
}


void printparam(void){
	printf("%i(ves-kg)%i (d-cm)%li (ks)%i (kk)%i (prob)%li (cal)%li\n\r",(int)param.numpoezdki,(int)param.ves,(long)param.dkoles,(int)param.ks,(int)param.kk,(long)param.probeg,(long)param.power);
}	

void main(void)
{
	//BitStatus kn;
	//uint8_t st;
	//uint32_t myclk;
	//int i;
	//char comand;
	
	//CLK->PCKENR1 = 0;
	//CLK->PCKENR1 = CLK_PCKENR1_UART2|CLK_PCKENR1_UART1|CLK_PCKENR1_TIM4;
	//CLK->PCKENR2 = 0b11110111;
	//оставим только TIM4 и UART1
	CLK->PCKENR1 = ~(CLK_PCKENR1_TIM1+CLK_PCKENR1_TIM2+CLK_PCKENR1_SPI+CLK_PCKENR1_I2C);
	CLK->PCKENR2 = ~(CLK_PCKENR2_ADC);
	clearlocal();
	
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	
	
	#ifndef SIMUL
	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
	CLK->CKDIVR |= (uint8_t)(0b11); //CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV8);
	#endif

	
	haltstart=1;
	GPIO_Init(GPIOD,GPIO_PIN_6,GPIO_MODE_IN_PU_NO_IT);//uart rx
	GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_IN_PU_IT);//knopka
	GPIO_Init(GPIOC,GPIO_PIN_7,GPIO_MODE_IN_PU_IT);//H1
	GPIO_Init(GPIOC,GPIO_PIN_6,GPIO_MODE_IN_PU_IT);//H2
	
	//прерывания по падающему фронту, напишем напрямую -меньше памяти
	//EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOD,EXTI_SENSITIVITY_FALL_ONLY);
	EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
	EXTI->CR1 |= (uint8_t)((uint8_t)(0x02) << 6);
    
	//EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC,EXTI_SENSITIVITY_FALL_ONLY);
	EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
	EXTI->CR1 |= (uint8_t)((uint8_t)(0x02) << 4);
    
	

	BEEP_Cmd(DISABLE);
	
	//миллисекундный таймер
	/* Time base configuration */
	TIM4_TimeBaseInit(TIM4_PRESCALER_64, 124); //надо 57-1!
	//TIM4_TimeBaseInit(TIM4_PRESCALER_64, 124);
	/* Clear TIM4 update flag */
	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	/* Enable update interrupt */
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);

	/* enable interrupts */
	enableInterrupts();
	
	/* Enable TIM4 */
	TIM4_Cmd(ENABLE);

	Delay(1000);//на всякий случай чтобы было время зайти в режим программирования без ресет
	
	
	//halt();

	
	//для экономии энергии все ноги в LOW или HIZ
	GPIO_Init(GPIOC,GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(GPIOB,GPIO_PIN_5|GPIO_PIN_4,GPIO_MODE_OUT_OD_HIZ_SLOW);
	//energo sber	
	GPIO_Init(GPIOD,GPIO_PIN_4,GPIO_MODE_OUT_PP_LOW_SLOW);//speaker
	GPIO_Init(GPIOC,GPIO_PIN_3,GPIO_MODE_OUT_PP_LOW_SLOW);//blue on off


	//нужно чтобы если сел аккумулятор при включении был минимальный расход энергии
	#ifndef SIMUL
	halt();//do knopki!!!
	#endif
	
	playmusic(1);
	haltstart = 0;

	
	bton;//включаем bluetooth
	blueen = TRUE;
	//сбросим кнопку потому что мы ей могли будить прибор
	kn = FALSE;
	
	timeblueoff = 255;
	timehalt    = 120;
	
	
	//прочитаем параметры поездки
	readflash(0x4000,(u32)&param,14);
	
	if (param.ves==255 || param.ves==0)
	{
		cleareeprom(1);
	}
	
	readflash(ADDRP+param.numpoezdki*NUMBYTEP,(u32)&poezdka,NUMBYTEP);
	if (poezdka.fix==1)
	{
		//закроем прошлую поездку.
		param.power+=poezdka.power;
		param.probeg+=poezdka.probeg;
		nextp();
		saveflash(0x4000,(u32)&param,14);
		//начнем новую поездку
		poezdka.fix = 0;
		poezdka.nump++;
		saveflash(ADDRP+param.numpoezdki*NUMBYTEP,(u32)&poezdka,NUMBYTEP);
		
	}

	UART1_DeInit();
  UART1_Init((uint32_t)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
              UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
	
	UART1_ITConfig(UART1_IT_RXNE_OR,ENABLE);
	
	//on indicator!
	GPIO_Init(GPIOD,GPIO_PIN_2,GPIO_MODE_OUT_PP_HIGH_SLOW);//blue on off
	
	/* Infinite loop */
  while (1)
  {
		#ifdef SIMUL
		//в симуляторе не работают прервания, поэтому делаем вид сами
		//activetime++;
		//current_millis++;
		//obs[activetime%10]++;
		//if (current_millis % 50==0){
			//if (timehalt) timehalt--;
		//}	
		#endif
		
		
		if (timeblue==0) {
			//каждые 2 сек будем выводить на экран что то и считать все подряд
			u8 indscor,indob;
			
			timeblue = 2;
		
			//indicator!
			if(1==1) {
				indscor=0;
				indob=0;
				//scor1 = 30;
				//scor2 = 90;
				
				if (scor1>4) {
					indscor = (scor1-4)/4;
					if (indscor > 8 ) indscor = 0xff;
					else indscor = 0xff >> (8-indscor);
				}	
				if (scor2>20) {
					indob = (scor2-20)/10;
					if (indob> 8 ) indob= 0xff;
					else indob= 0xff >> (8-indob);
				}
				
				//b[0]=0;
				b[1]=indscor;
				b[2]=indob;
				//b[3]=0;
				
				sendindicator();
			
			}
			
			if (blueen) {
				
				printf("(cad)%i (SCOR)%i (all)%li (ob)%li (prob)%li (cal)%li (atime)%li\n\r",(int)scor1,(int)scor2,(long)(hall[0]+hall[1]),(long)(hall[0]),(long)(hall[1]*(long)param.dkoles*PI/100/100),(long)calc_power(),activetime);
				printf("\n\r");
				
				
				printf("t");
				//printf("%i",(int)timehalt);
				{
					u8 j;
					for (j=0;j<10;j++){
						printf(":(%i)%li",(int)(j+1)*4,(long)obs[j]);
					}
					printf("\n\r");
				}
				
			}
		}	
		
		if (kn==TRUE) {
			//кнопка управляет блютус модулем и выводим из спящего режима
			kn = FALSE;
			btchange;
			
			if (ifbton)
				{
					blueen=TRUE;
					timeblueoff=120;
					playmusic(2);
				}
			else 	
				{
					blueen=FALSE;
					playmusic(3);
				}
		}	
		
		if (timeblueoff==0 && blueen==TRUE && 0)
		{
			//через 2 мин выключаем блютус!
			blueen=FALSE;
			btoff;
			playmusic(3);
		}
		
		if (timehalt==0) {
			flagclr=0;
			haltstart=1;
			timehalt=120;
			btoff;//выкл блютус
			blueen=FALSE;
			
			GPIO_Init(GPIOD,GPIO_PIN_2,GPIO_MODE_OUT_PP_LOW_SLOW);//blue on off
			
			//пришло время спать запишем данные поездки во флеш на всякий случай!!
			if (activetime>1200) //маленькие поездки не фиксируем!
			{
				u8 u;
				poezdka.activetime = activetime;
				poezdka.power = (u32)calc_power();//оставим целую часть от калорий
				for (u=0;u<10;u++)
				{
					poezdka.obs[u]=0;
					if(obs[u])
						poezdka.obs[u] = obs[u]*100/activetime;//переведем в проценты от общего активного времени!
						
				}
				poezdka.maxspeed = maxspeed;
				poezdka.probeg = (long)hall[1] * param.dkoles * 314 / 10000;
				poezdka.fix = 1;
				
				saveflash(ADDRP+param.numpoezdki*NUMBYTEP,(u32)&poezdka,NUMBYTEP);
				
				//readflash(ADDRP+param.numpoezdki*NUMBYTEP,(u32)&poezdka,NUMBYTEP);
			}
			
			
			playmusic(4);
			
			//на всякий случай включим прерывания! вдруг отключили!
			GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_IN_PU_IT);//knopka
			GPIO_Init(GPIOC,GPIO_PIN_7,GPIO_MODE_IN_PU_IT);//H1
			GPIO_Init(GPIOC,GPIO_PIN_6,GPIO_MODE_IN_PU_IT);//H2
	
			
			//current_millis=0;

			//переходим на LSI
			CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_LSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
	
			//калибровку можно не делать - особая точность не нужна
			//AWU_LSICalibrationConfig(LSIMeasurment());
			AWU_Init(AWU_TIMEBASE_30S);

			timeawu=255;//255 * 30 = 7600 сек = 2часа !!!
			
			/*
			halt();
			
			while (isawu)
			{
				u8 i=0;
				isawu = i;
				halt();
			}
			*/
			isawu=1;
			
			//halt after interrupt
			//CFG->GCR |= CFG_GCR_AL;
			
			do
			{
				halt();
				_asm("nop");
				_asm("nop");
				//playmusic(5);
			} while (isawu);
			
			
			//выключаем AWU режим
			isawu=0;
			AWU_DeInit();
			//включаем обратно HSE
			CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
			
			haltstart=0;
			
			playmusic(1);

			GPIO_Init(GPIOD,GPIO_PIN_2,GPIO_MODE_OUT_PP_HIGH_SLOW);//blue on off
			
			kn=FALSE;
		}	
		
		if ((errspeed > 20) && (time_errspeed == 0))
		{
			time_errspeed = 30;
			playmusic(5);
		}
		
		if ((errcad > 20) && (time_errcad == 0))
		{
			time_errcad= 30;
			playmusic(6);
		}
		

		#ifdef SIMUL
		//для тестирования разбора строки
		RXready = TRUE;
		RXbuff[0]='k';
		RXbuff[1]='1';
		RXbuff[2]='2';
		RXbuff[3]='3';
		RXbuff[4]='9';
		RXtek = 4;
		cleareeprom(0);
		#endif
		
		if (RXready) {
			//надо обработать команду
			u8 cmd=0;
			u8 start=0;
			s8 znak=1;
			u8* pp;
			
			if (flagclr==1 && RXbuff[0]=='y' && RXbuff[1]=='e' && RXbuff[2]=='s')
			{
				//сотрем все поездки
				cleareeprom(0);
				printf("clear\n\r");//printf("all cleared\n\r");
			}
			flagclr=0;
			
			switch (RXbuff[0]) {
			case 'c':
				flagclr = 1;
				printf("yes?\n\r");
				break;
			case 'i':
				if (RXbuff[1]=='n' && RXbuff[2]=='f' && RXbuff[3]=='o' && RXtek==4) 
				{
					u8 u;
					//выведем инфо о поездках
					printparam();
					
					for (u=0;u<NUMBERP;u++)
					{
						readflash(ADDRP+u*NUMBYTEP,(u32)&poezdka,NUMBYTEP);
						if(poezdka.fix){
							printf("\n\r");
							printf("(num)%li (time)%li (maxs)%li (cal)%li (km)%li\n\r",(long)poezdka.nump,(long)poezdka.activetime/60,(long)poezdka.maxspeed,(long)poezdka.power,(long)poezdka.probeg);
					
							printf("t");
							{
								u8 j;
								for (j=0;j<10;j++)
								{
									printf(":(%i)%i",(int)(j+1)*4,(int)poezdka.obs[j]);
								}
								printf("\n\r");
							}
							printf("\n\r");
						
						}
					}
					timeblue=10;
				}
				break;
			case 'v':
				cmd=3;
				start = 1;
				pp = &param.ves;
				break;
			case 'd':
				cmd=3;
				start = 1;
				pp = &param.dkoles;
				break;
			case 's':
				cmd=3;
				if(RXbuff[1]=='-') {
					start=2;
					znak=-1;
				} else start = 1;
				
				pp = (u8 *)&param.ks;
				break;
			case 'k':
				cmd=3;
				if(RXbuff[1]=='-') {
					start=2;
					znak=-1;
				} else start = 1;
				
				pp = (u8 *)&param.kk;
				break;
			default:
				break;
			}	
			
			if (cmd) 
			{
				u8 u;
				u8 rez=0;
				u8 r=1;
				u8 noerr=1;
				u8 ind = RXtek-1;
					
				//установка параметров
				for(u=start;u<RXtek;u++)
				{
					//v256  start = 2 Rxtek = 5
					if (RXbuff[ind] < 0x30 ||  RXbuff[ind] > 0x39)
					{
						//ошибка тут должно быть только число!
						noerr=0;
						break;
					}
					
					rez = rez + (RXbuff[ind] - 0x30) * r;
					r *= 10;
					ind--;
				}
				if (noerr)
				{
					//установим параметр и выведем сообщение о всех параметрах!
					if (znak>0) *pp = rez;
					else *(s8 *)pp = (s8)rez * (-1);

					saveflash(0x4000,(u32)&param,14);		

					printparam();					
				}
			}
			
			RXtek = 0;
			RXready = FALSE;		
		}	
  }
}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
uint32_t LSIMeasurment(void)
{

  uint32_t lsi_freq_hz = 0x0;
  uint32_t fmaster = 0x0;
  uint16_t ICValue1 = 0x0;
  uint16_t ICValue2 = 0x0;

  /* Get master frequency */
  fmaster = CLK_GetClockFreq();

  /* Enable the LSI measurement: LSI clock connected to timer Input Capture 1 */
  AWU->CSR |= AWU_CSR_MSR;

#if defined (STM8S903) || defined (STM8S103) || defined (STM8S003)
  /* Measure the LSI frequency with TIMER Input Capture 1 */
  
  /* Capture only every 8 events!!! */
  /* Enable capture of TI1 */
	TIM1_ICInit(TIM1_CHANNEL_1, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI, TIM1_ICPSC_DIV8, 0);
	
  /* Enable TIM1 */
  TIM1_Cmd(ENABLE);
  
  /* wait a capture on cc1 */
  while((TIM1->SR1 & TIM1_FLAG_CC1) != TIM1_FLAG_CC1);
  /* Get CCR1 value*/
  ICValue1 = TIM1_GetCapture1();
  TIM1_ClearFlag(TIM1_FLAG_CC1);
  
  /* wait a capture on cc1 */
  while((TIM1->SR1 & TIM1_FLAG_CC1) != TIM1_FLAG_CC1);
  /* Get CCR1 value*/
  ICValue2 = TIM1_GetCapture1();
  TIM1_ClearFlag(TIM1_FLAG_CC1);
  
  /* Disable IC1 input capture */
  TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
  /* Disable timer2 */
  TIM1_Cmd(DISABLE);
  
#else  
  /* Measure the LSI frequency with TIMER Input Capture 1 */
  
  /* Capture only every 8 events!!! */
  /* Enable capture of TI1 */
  TIM3_ICInit(TIM3_CHANNEL_1, TIM3_ICPOLARITY_RISING, TIM3_ICSELECTION_DIRECTTI, TIM3_ICPSC_DIV8, 0);

  /* Enable TIM3 */
  TIM3_Cmd(ENABLE);

	/* wait a capture on cc1 */
  while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
	/* Get CCR1 value*/
  ICValue1 = TIM3_GetCapture1();
  TIM3_ClearFlag(TIM3_FLAG_CC1);

  /* wait a capture on cc1 */
  while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
    /* Get CCR1 value*/
  ICValue2 = TIM3_GetCapture1();
	TIM3_ClearFlag(TIM3_FLAG_CC1);

  /* Disable IC1 input capture */
  TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
  /* Disable timer3 */
  TIM3_Cmd(DISABLE);
#endif

  /* Compute LSI clock frequency */
  lsi_freq_hz = (8 * fmaster) / (ICValue2 - ICValue1);
  
  /* Disable the LSI measurement: LSI clock disconnected from timer Input Capture 1 */
  AWU->CSR &= (uint8_t)(~AWU_CSR_MSR);

 return (lsi_freq_hz);
}

void Delay(u16 nCount)
{
    /* Decrement nCount value */
    //uint32_t tm = current_millis+nCount;
		timedelay = nCount;
		
		#ifdef SIMUL
		return;
		#endif

		while (timedelay)
    {
    }
}


PUTCHAR_PROTOTYPE
{
  /* Write a character to the UART1 */
  UART1_SendData8(c);
  /* Loop until the end of transmission */
  while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);

  return (c);
}

GETCHAR_PROTOTYPE
{
#ifdef _COSMIC_
  char c = 0;
#else
  int c = 0;
#endif
   //Loop until the Read data register flag is SET 
  
	//while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
  //  c = UART1_ReceiveData8();
  return (c);
}


//-------interrupts

uint32_t nextsec=1000;
uint32_t kntime=0;
uint32_t h1time=0;
uint32_t h2time=0;

uint8_t h1=0;
uint8_t h2=0;


 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	
	//current_millis++;
	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	
	
	{
		//учтем мс временные интервалы и защиту от дребезга
		if (h1time)	
		{
			h1time++;
			if (h1time==200) //pedali
				{
					GPIO_ReadInputPin(GPIOC,GPIO_PIN_7);
					GPIO_Init(GPIOC,GPIO_PIN_7,GPIO_MODE_IN_PU_IT);
				}
		}
		if (h2time)	
		{	
			h2time++;
			if (h2time==40) 
			{
				GPIO_ReadInputPin(GPIOC,GPIO_PIN_6);
				GPIO_Init(GPIOC,GPIO_PIN_6,GPIO_MODE_IN_PU_IT);				
			}
				
		}		
		if (kntime)	
		{	
			kntime--;
			if (kntime==0) 
				GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_IN_PU_IT);
		}		
		
		if (nextsec)   nextsec--;
		if (timedelay) timedelay--;		
	}
	
	
  if (h2time > 3000) {
		scor2 = 0;
		h2time=0;
	}
	if (h1time > 5000) {
		scor1 = 0;
		h1time=0;
	}
	
	if (nextsec==0) {
		//раз в секунду! обработка того что раз в секунду
		//может быть в общем цикле
		nextsec = 1000;
		
		if (timehalt)		 		timehalt--;
		if (timeblue) 	 		timeblue--;
		if (timeblueoff) 		timeblueoff--;
		if (time_errspeed) 	time_errspeed--;
		if (time_errcad) 		time_errcad--;
		
		//раз в секунду
		//scor2 = 10;
		if (scor2)
		{
			uint32_t ind = scor2/4;
			if (ind>9) ind=9;
				
			//калории только когда педали крутим!
			if (scor1)
				power += scor2;
			
			if (scor2 > 3) {
				//едем быстрее 3км\ч
				activetime++;
				obs[ind]++;
				
				if (scor2>maxspeed) maxspeed=scor2;
			}	
			
			//контроль нарушений
			if (param.ks)	{
					if(errspeed32 & (1L <<31) ) {
						if(errspeed) errspeed--;
					}
					errspeed32 <<= 1;
					if ((param.ks > 0) ? (scor2 < (u8)param.ks) : (scor2 > (u8) (-param.ks)) ) {
						errspeed++;//есть нарушение скорости!
						errspeed32 |= 1;
					}
					
			}
			
			//scor1=10;
			if ( param.kk )	{
					if(errcad32 & (1L <<31) ) {
						if(errcad) errcad--;
					}
					
					errcad32 = errcad32 << 1;
					if ((param.kk > 0) ? (scor1 < (u8)param.kk) : (scor1 > (u8) (-param.kk)) ) {
						errcad++;//есть нарушение скорости!
						errcad32 |= 1;
					}
			}
		}
	}
 }


INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	//main prog after interrupt
	//CFG->GCR &= ~CFG_GCR_AL;
	isawu=0;
	
	if ((BitStatus)(GPIO_ReadInputPin(GPIOC,GPIO_PIN_7)) == RESET) {
			//h1++;
			//защита от дребезга контактов - отключим прервание на 50мс
			if (haltstart==0)
				GPIO_Init(GPIOC,GPIO_PIN_7,GPIO_MODE_IN_PU_NO_IT);
			
			if (h1time>1) {
				scor1 = 60000/(h1time - 1);//в оборотах в мин
			}	else scor1 = 0;
			
			h1time = 1;
			hall[0]++;
			timehalt=120;//сбросим таймер сна
	}
	
	if ((BitStatus)(GPIO_ReadInputPin(GPIOC,GPIO_PIN_6)) == RESET) {
			//h2++;
			//защита от дребезга контактов - отключим прервание на 50мс
			if (haltstart==0)
				GPIO_Init(GPIOC,GPIO_PIN_6,GPIO_MODE_IN_PU_NO_IT);
			
			if (h2time>1) {
				scor2 = (u8)(36*(u32)param.dkoles*314/100/(h2time - 1));//в км/ч
				//1/ms * dkol * 314/10 * 36 / 10
			}	else scor2 = 0;
			
			h2time = 1;
			hall[1]++;
			timehalt=120;//сбросим таймер сна !!!!
	}
}

INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	//main prog after interrupt
	//CFG->GCR &= ~CFG_GCR_AL;
	isawu=0;
	
	if ((BitStatus)(GPIO_ReadInputPin(GPIOD,GPIO_PIN_3)) == RESET) {
			//защита от дребезга контактов - отключим прервание на 50мс
			if( haltstart==0) GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_IN_PU_NO_IT);
			kn = TRUE;
			kntime = 200;
	}		
}

INTERRUPT_HANDLER(AWU_IRQHandler, 1)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	//надо просто прочитать регистр чтобы сбросить флаг прерывания
	AWU->CSR;   //AWU_GetFlagStatus();
	//isawu=1;
	
	if (timeawu) 
		timeawu--;
	else {
		//поездка закончилась! надо начать следующую!
		if (poezdka.fix) { //если есть поездка!
			poezdka.fix=2;
			saveflash(ADDRP+param.numpoezdki*NUMBYTEP,(u32)&poezdka,NUMBYTEP);

			nextp();
			param.power += poezdka.power;
			param.probeg += poezdka.probeg;
			saveflash(0x4000,(u32)&param,14);
			
			poezdka.fix = 0;
			poezdka.nump++;
			saveflash(ADDRP+param.numpoezdki*NUMBYTEP,(u32)&poezdka,NUMBYTEP);//первые 5 байт! только 2 переменные
		}
		//обнулим все данные по текущей поездке
		clearlocal();
		
		AWU_DeInit();
	}
}
