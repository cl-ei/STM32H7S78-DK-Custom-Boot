################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/main.c \
../Core/Src/stm32h7rsxx_hal_msp.c \
../Core/Src/stm32h7rsxx_it.c \
../Core/Src/system_stm32h7rsxx.c 

C_DEPS += \
./Core/Src/main.d \
./Core/Src/stm32h7rsxx_hal_msp.d \
./Core/Src/stm32h7rsxx_it.d \
./Core/Src/system_stm32h7rsxx.d 

OBJS += \
./Core/Src/main.o \
./Core/Src/stm32h7rsxx_hal_msp.o \
./Core/Src/stm32h7rsxx_it.o \
./Core/Src/system_stm32h7rsxx.o 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su Core/Src/%.cyclo: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H7S7xx -c -I../Core/Inc -IC:/Users/Administrator/STM32Cube/Repository/STM32Cube_FW_H7RS_V1.1.0/Drivers/STM32H7RSxx_HAL_Driver/Inc -IC:/Users/Administrator/STM32Cube/Repository/STM32Cube_FW_H7RS_V1.1.0/Drivers/STM32H7RSxx_HAL_Driver/Inc/Legacy -IC:/Users/Administrator/STM32Cube/Repository/STM32Cube_FW_H7RS_V1.1.0/Drivers/CMSIS/Device/ST/STM32H7RSxx/Include -IC:/Users/Administrator/STM32Cube/Repository/STM32Cube_FW_H7RS_V1.1.0/Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/main.cyclo ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/stm32h7rsxx_hal_msp.cyclo ./Core/Src/stm32h7rsxx_hal_msp.d ./Core/Src/stm32h7rsxx_hal_msp.o ./Core/Src/stm32h7rsxx_hal_msp.su ./Core/Src/stm32h7rsxx_it.cyclo ./Core/Src/stm32h7rsxx_it.d ./Core/Src/stm32h7rsxx_it.o ./Core/Src/stm32h7rsxx_it.su ./Core/Src/system_stm32h7rsxx.cyclo ./Core/Src/system_stm32h7rsxx.d ./Core/Src/system_stm32h7rsxx.o ./Core/Src/system_stm32h7rsxx.su

.PHONY: clean-Core-2f-Src

