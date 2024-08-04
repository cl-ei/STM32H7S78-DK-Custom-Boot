################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/custom/debug.c 

C_DEPS += \
./Core/Inc/custom/debug.d 

OBJS += \
./Core/Inc/custom/debug.o 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/custom/%.o Core/Inc/custom/%.su Core/Inc/custom/%.cyclo: ../Core/Inc/custom/%.c Core/Inc/custom/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H7S7xx -c -I../Core/Inc -IC:/Users/Administrator/STM32Cube/Repository/STM32Cube_FW_H7RS_V1.1.0/Drivers/STM32H7RSxx_HAL_Driver/Inc -IC:/Users/Administrator/STM32Cube/Repository/STM32Cube_FW_H7RS_V1.1.0/Drivers/STM32H7RSxx_HAL_Driver/Inc/Legacy -IC:/Users/Administrator/STM32Cube/Repository/STM32Cube_FW_H7RS_V1.1.0/Drivers/CMSIS/Device/ST/STM32H7RSxx/Include -IC:/Users/Administrator/STM32Cube/Repository/STM32Cube_FW_H7RS_V1.1.0/Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-custom

clean-Core-2f-Inc-2f-custom:
	-$(RM) ./Core/Inc/custom/debug.cyclo ./Core/Inc/custom/debug.d ./Core/Inc/custom/debug.o ./Core/Inc/custom/debug.su

.PHONY: clean-Core-2f-Inc-2f-custom

