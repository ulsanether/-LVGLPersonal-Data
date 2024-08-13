################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/ui/components/ui_comp_hook.c 

OBJS += \
./Core/Src/ui/components/ui_comp_hook.o 

C_DEPS += \
./Core/Src/ui/components/ui_comp_hook.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/ui/components/%.o Core/Src/ui/components/%.su Core/Src/ui/components/%.cyclo: ../Core/Src/ui/components/%.c Core/Src/ui/components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/hangm/Documents/GitHub/-LVGLPersonal-Data/Boards/STM32/STM32F429I-DISC1" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-ui-2f-components

clean-Core-2f-Src-2f-ui-2f-components:
	-$(RM) ./Core/Src/ui/components/ui_comp_hook.cyclo ./Core/Src/ui/components/ui_comp_hook.d ./Core/Src/ui/components/ui_comp_hook.o ./Core/Src/ui/components/ui_comp_hook.su

.PHONY: clean-Core-2f-Src-2f-ui-2f-components

