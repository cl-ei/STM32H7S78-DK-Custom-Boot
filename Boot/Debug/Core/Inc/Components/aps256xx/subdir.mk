################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Inc/Components/aps256xx/aps256xx.c 

C_DEPS += \
./Core/Inc/Components/aps256xx/aps256xx.d 

OBJS += \
./Core/Inc/Components/aps256xx/aps256xx.o 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/Components/aps256xx/%.o Core/Inc/Components/aps256xx/%.su Core/Inc/Components/aps256xx/%.cyclo: ../Core/Inc/Components/aps256xx/%.c Core/Inc/Components/aps256xx/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32H7S7xx -c -I../Core/Inc -I../../Drivers/STM32H7RSxx_HAL_Driver/Inc -I../../Drivers/STM32H7RSxx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32H7RSxx/Include -I../../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-Components-2f-aps256xx

clean-Core-2f-Inc-2f-Components-2f-aps256xx:
	-$(RM) ./Core/Inc/Components/aps256xx/aps256xx.cyclo ./Core/Inc/Components/aps256xx/aps256xx.d ./Core/Inc/Components/aps256xx/aps256xx.o ./Core/Inc/Components/aps256xx/aps256xx.su

.PHONY: clean-Core-2f-Inc-2f-Components-2f-aps256xx

