################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/ui/images/ui_img_logo_png.c 

OBJS += \
./Core/Src/ui/images/ui_img_logo_png.o 

C_DEPS += \
./Core/Src/ui/images/ui_img_logo_png.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/ui/images/%.o Core/Src/ui/images/%.su Core/Src/ui/images/%.cyclo: ../Core/Src/ui/images/%.c Core/Src/ui/images/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/hangm/Documents/GitHub/-LVGLPersonal-Data/Boards/STM32/STM32F429I-DISC1" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-ui-2f-images

clean-Core-2f-Src-2f-ui-2f-images:
	-$(RM) ./Core/Src/ui/images/ui_img_logo_png.cyclo ./Core/Src/ui/images/ui_img_logo_png.d ./Core/Src/ui/images/ui_img_logo_png.o ./Core/Src/ui/images/ui_img_logo_png.su

.PHONY: clean-Core-2f-Src-2f-ui-2f-images

