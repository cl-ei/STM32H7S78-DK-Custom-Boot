################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/STM32H7S78-DK/stm32h7s78_discovery.c \
../Core/Inc/STM32H7S78-DK/stm32h7s78_discovery_xspi.c 

C_DEPS += \
./Core/Inc/STM32H7S78-DK/stm32h7s78_discovery.d \
./Core/Inc/STM32H7S78-DK/stm32h7s78_discovery_xspi.d 

OBJS += \
./Core/Inc/STM32H7S78-DK/stm32h7s78_discovery.o \
./Core/Inc/STM32H7S78-DK/stm32h7s78_discovery_xspi.o 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/STM32H7S78-DK/%.o Core/Inc/STM32H7S78-DK/%.su Core/Inc/STM32H7S78-DK/%.cyclo: ../Core/Inc/STM32H7S78-DK/%.c Core/Inc/STM32H7S78-DK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H7S7xx -c -I../Core/Inc -IC:/Users/Administrator/STM32Cube/Repository/STM32Cube_FW_H7RS_V1.1.0/Drivers/STM32H7RSxx_HAL_Driver/Inc -IC:/Users/Administrator/STM32Cube/Repository/STM32Cube_FW_H7RS_V1.1.0/Drivers/STM32H7RSxx_HAL_Driver/Inc/Legacy -IC:/Users/Administrator/STM32Cube/Repository/STM32Cube_FW_H7RS_V1.1.0/Drivers/CMSIS/Device/ST/STM32H7RSxx/Include -IC:/Users/Administrator/STM32Cube/Repository/STM32Cube_FW_H7RS_V1.1.0/Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-STM32H7S78-2d-DK

clean-Core-2f-Inc-2f-STM32H7S78-2d-DK:
	-$(RM) ./Core/Inc/STM32H7S78-DK/stm32h7s78_discovery.cyclo ./Core/Inc/STM32H7S78-DK/stm32h7s78_discovery.d ./Core/Inc/STM32H7S78-DK/stm32h7s78_discovery.o ./Core/Inc/STM32H7S78-DK/stm32h7s78_discovery.su ./Core/Inc/STM32H7S78-DK/stm32h7s78_discovery_xspi.cyclo ./Core/Inc/STM32H7S78-DK/stm32h7s78_discovery_xspi.d ./Core/Inc/STM32H7S78-DK/stm32h7s78_discovery_xspi.o ./Core/Inc/STM32H7S78-DK/stm32h7s78_discovery_xspi.su

.PHONY: clean-Core-2f-Inc-2f-STM32H7S78-2d-DK

