################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/ui/screens/ui_Screen1.c 

OBJS += \
./Core/Src/ui/screens/ui_Screen1.o 

C_DEPS += \
./Core/Src/ui/screens/ui_Screen1.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/ui/screens/%.o Core/Src/ui/screens/%.su Core/Src/ui/screens/%.cyclo: ../Core/Src/ui/screens/%.c Core/Src/ui/screens/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/hangm/Desktop/LVGL_429" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-ui-2f-screens

clean-Core-2f-Src-2f-ui-2f-screens:
	-$(RM) ./Core/Src/ui/screens/ui_Screen1.cyclo ./Core/Src/ui/screens/ui_Screen1.d ./Core/Src/ui/screens/ui_Screen1.o ./Core/Src/ui/screens/ui_Screen1.su

.PHONY: clean-Core-2f-Src-2f-ui-2f-screens

