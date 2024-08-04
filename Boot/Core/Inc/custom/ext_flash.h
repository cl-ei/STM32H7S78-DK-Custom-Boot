#ifndef __EXT_FLASH_H
#define __EXT_FLASH_H

#ifdef __cplusplus
extern "C" {
#endif

#include "stm32h7rsxx_hal.h"

#include "STM32H7S78-DK/stm32h7s78_discovery.h"
#include "STM32H7S78-DK/stm32h7s78_discovery_xspi.h"

UART_HandleTypeDef huart4;

void GreenLedBlink() {
	// RED LED -> PO1
	GPIO_InitTypeDef GPIO_InitStruct = {0};

	__HAL_RCC_GPIOM_CLK_ENABLE();
	GPIO_InitStruct.Pin = GPIO_PIN_1;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(GPIOO, &GPIO_InitStruct);


	while (1) {
		HAL_GPIO_WritePin(GPIOO, GPIO_PIN_1, GPIO_PIN_RESET);
		HAL_Delay(700);

		HAL_GPIO_WritePin(GPIOO, GPIO_PIN_1, GPIO_PIN_SET);
		HAL_Delay(20);

		HAL_GPIO_WritePin(GPIOO, GPIO_PIN_1, GPIO_PIN_RESET);
		HAL_Delay(100);

		HAL_GPIO_WritePin(GPIOO, GPIO_PIN_1, GPIO_PIN_SET);
		HAL_Delay(20);
	}
}

#define ENABLE_INT() __set_PRIMASK(0)
#define DISABLE_INT() __set_PRIMASK(1)

static void JumpToApp(void) {
	uint32_t i=0;
	void (*AppJump)(void);
	__IO uint32_t AppAddr = 0x70000000; /* APP 地址 */

	/* 关闭全局中断 */
	DISABLE_INT();

	// reset all rcc clock, use hsi
	HAL_RCC_DeInit();

	/* close and reset tick timer */
	SysTick->CTRL = 0;
	SysTick->LOAD = 0;
	SysTick->VAL = 0;

	/* 关闭所有中断，清除所有中断挂起标志 */
	for (i = 0; i < 8; i++) {
		NVIC->ICER[i]=0xFFFFFFFF;
		NVIC->ICPR[i]=0xFFFFFFFF;
	}

	/* 使能全局中断 */
	ENABLE_INT();

	/* 跳转到应用程序，首地址 AppAddr, AppAddr + 4 是复位中断服务程序地址 */
	AppJump = (void (*)(void)) (*((uint32_t *) (AppAddr + 4)));

	/* 设置主堆栈指针 */
	__set_MSP(*(uint32_t *)AppAddr);

	/* RTOS 工程，这条语句很重要，设置为特权级模式，使用 MSP 指针 */
	__set_CONTROL(0);

	AppJump();
}


void ConfigApMem() {
	BSP_XSPI_RAM_Cfg_t ramInit;

	ramInit.LatencyType = APS256XX_MR0_LATENCY_TYPE;
	ramInit.ReadLatencyCode = APS256XX_MR0_RLC_3;
	ramInit.WriteLatencyCode = APS256XX_MR4_WLC_3;
	ramInit.IOMode = APS256XX_MR8_X8_X16;

	int32_t state = BSP_XSPI_RAM_Init(0, &ramInit);
	if (state != HAL_OK) {
		print("Ram init failed. %d", state);
		GreenLedBlink();
	}

	state = BSP_XSPI_RAM_EnableMemoryMappedMode(0);
	if (state != HAL_OK) {
		print("Ram enter mem mapped mode failed. %d", state);
		GreenLedBlink();
	}
	print("Ram init succ. XSPI1_BASE: %x", XSPI1_BASE);

// #define TEST_MEM
#ifdef TEST_MEM
	uint8_t *addr = XSPI1_BASE;
	uint32_t j, err_cnt = 0;
	for (uint32_t i = 0; i < 1024*1024; i++) {
		for (j = 0; j < 32; j++) {
			*addr = (uint8_t)(i + j);
			addr += 1;
		}
		addr -= 32;

		for (j = 0; j < 32; j++) {
			if ((*addr) != (uint8_t)(i + j)) {
				i = 1024*1024 + 1;
				err_cnt++;
				break;
			}
			addr += 1;
		}
		if ((i % 100000) == 0) {
			print("ok: %x", addr);
		}
	}
	print("Ram test complete, err: %d", err_cnt);
#endif
}

void GotoExtFlash() {
	ConfigApMem();

	BSP_XSPI_NOR_Init_t norInit;
	norInit.InterfaceMode = MX66UW1G45G_OPI_MODE;
	norInit.TransferRate = MX66UW1G45G_DTR_TRANSFER;

	int32_t state = BSP_XSPI_NOR_Init(0, &norInit);
	if (state != 0) {
		GreenLedBlink();
	}

	state = BSP_XSPI_NOR_EnableMemoryMappedMode(0);
	if (state != 0) {
		GreenLedBlink();
	}

	print("Deinit uart and jump...");
	HAL_UART_DeInit(&huart4);
	JumpToApp();

	GreenLedBlink();
}

#ifdef __cplusplus
}
#endif

#endif
