#include "stm32f10x.h"
#include "stm32f10x_rcc.h"
#include "stm32f10x_gpio.h"
#include "stm32f10x_usart.h"
#include "stm32f10x_spi.h"

#include "hal.h"

#define UART_BAUD_RATE 115200

static void SetupLED (void) {
  GPIO_InitTypeDef  GPIO_InitStructure;

  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);

  GPIO_InitStructure.GPIO_Pin   = GPIO_Pin_13;
  GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_Out_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
  GPIO_Init(GPIOC, &GPIO_InitStructure);

  HAL_LedOff();
}

static void SetupUART(void) {
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1 | RCC_APB2Periph_GPIOA, ENABLE);

  // Configure USART1 Tx (PA9) as output
  GPIO_InitTypeDef  GPIO_InitStructure;

  // Configure USART Tx (output) pin as alternate function push-pull
  GPIO_InitStructure.GPIO_Pin   = GPIO_Pin_9;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
  GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_AF_PP;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  USART_InitTypeDef USART_InitStructure;

  USART_InitStructure.USART_BaudRate            = UART_BAUD_RATE;
  USART_InitStructure.USART_WordLength          = USART_WordLength_8b;
  USART_InitStructure.USART_StopBits            = USART_StopBits_1;
  USART_InitStructure.USART_Parity              = USART_Parity_No;
  USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
  USART_InitStructure.USART_Mode                = USART_Mode_Tx;
  USART_Init(USART1, &USART_InitStructure);

  USART_ClockInitTypeDef USART_ClockInitStructure;
  USART_ClockInitStructure.USART_Clock          = USART_Clock_Disable;
  USART_ClockInitStructure.USART_CPOL           = USART_CPOL_Low;
  USART_ClockInitStructure.USART_CPHA           = USART_CPHA_2Edge;
  USART_ClockInitStructure.USART_LastBit        = USART_LastBit_Disable;
  USART_ClockInit(USART1, &USART_ClockInitStructure);   // write parameters

  USART_Cmd(USART1, ENABLE);
}

static void SetupSD(void) {
  SPI_InitTypeDef SPI_InitStructure;
  GPIO_InitTypeDef GPIO_InitStructure;

  RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB | RCC_APB2Periph_AFIO, ENABLE);
  RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2 ,ENABLE);

  GPIO_InitStructure.GPIO_Pin   = GPIO_Pin_12;                 // SS: output
  GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_Out_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOB, &GPIO_InitStructure);
  HAL_SDDeselect();

  GPIO_InitStructure.GPIO_Pin   = GPIO_Pin_13 | GPIO_Pin_15;    // CLK, MOSI: output
  GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_AF_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOB, &GPIO_InitStructure);

  GPIO_InitStructure.GPIO_Pin   = GPIO_Pin_14;                // MISO: input
  GPIO_InitStructure.GPIO_Mode  = GPIO_Mode_IPU;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(GPIOB, &GPIO_InitStructure);

  SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
  SPI_InitStructure.SPI_Mode     = SPI_Mode_Master;
  SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
  SPI_InitStructure.SPI_CPOL     = SPI_CPOL_Low;
  SPI_InitStructure.SPI_CPHA     = SPI_CPHA_1Edge;
  SPI_InitStructure.SPI_NSS      = SPI_NSS_Soft;
  // 60MHz/4 = 15MHz SPI bitrate (30MHz could possibly work ?)
  SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_4; 
  SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
  SPI_InitStructure.SPI_CRCPolynomial = 7;
  SPI_Init(SPI2, &SPI_InitStructure);
  SPI_CalculateCRC(SPI2, DISABLE);
  SPI_Cmd(SPI2, ENABLE);
}

void HAL_SetupHardware(void) {
  SetupLED();
  SetupUART();
  SetupSD();
}

void HAL_LedOn (void) {
  GPIO_ResetBits(GPIOC, GPIO_Pin_13); 
}

void HAL_LedOff (void) {
  GPIO_SetBits  (GPIOC, GPIO_Pin_13);
}

void HAL_ConsoleWrite(char ch) {
  // Wait until we can send the data
  while (USART_GetFlagStatus(USART1, USART_FLAG_TXE) != SET) continue;
  // Now send the character
  USART_SendData(USART1, ch);
}

uint8_t HAL_SDTransferByte(uint8_t Byte) {
  SPI_I2S_SendData(SPI2, Byte);
  while (SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_RXNE) == RESET);
  return SPI_I2S_ReceiveData(SPI2);
}

void HAL_SDFast(void) {
  SPI2->CR1 &= 0XFFC7;    // disable (?) the SPI and clear prescaler
  SPI2->CR1 |= SPI_BaudRatePrescaler_4;
  SPI2->CR1 |= 0x0040;   // re-enable the SPI
}

void HAL_SDSlow(void) {
  SPI2->CR1 &= 0XFFC7;
  SPI2->CR1 |= SPI_BaudRatePrescaler_128;
  SPI2->CR1 |= 0x0040;
}
