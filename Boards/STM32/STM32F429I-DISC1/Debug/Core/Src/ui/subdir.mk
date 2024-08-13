################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/ui/ui.c \
../Core/Src/ui/ui_helpers.c 

OBJS += \
./Core/Src/ui/ui.o \
./Core/Src/ui/ui_helpers.o 

C_DEPS += \
./Core/Src/ui/ui.d \
./Core/Src/ui/ui_helpers.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/ui/%.o Core/Src/ui/%.su Core/Src/ui/%.cyclo: ../Core/Src/ui/%.c Core/Src/ui/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/hangm/Documents/GitHub/-LVGLPersonal-Data/Boards/STM32/STM32F429I-DISC1" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-ui

clean-Core-2f-Src-2f-ui:
	-$(RM) ./Core/Src/ui/ui.cyclo ./Core/Src/ui/ui.d ./Core/Src/ui/ui.o ./Core/Src/ui/ui.su ./Core/Src/ui/ui_helpers.cyclo ./Core/Src/ui/ui_helpers.d ./Core/Src/ui/ui_helpers.o ./Core/Src/ui/ui_helpers.su

.PHONY: clean-Core-2f-Src-2f-ui

