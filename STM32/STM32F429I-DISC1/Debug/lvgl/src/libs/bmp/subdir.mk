################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/libs/bmp/lv_bmp.c 

OBJS += \
./lvgl/src/libs/bmp/lv_bmp.o 

C_DEPS += \
./lvgl/src/libs/bmp/lv_bmp.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/libs/bmp/%.o lvgl/src/libs/bmp/%.su lvgl/src/libs/bmp/%.cyclo: ../lvgl/src/libs/bmp/%.c lvgl/src/libs/bmp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/hangm/Desktop/LVGL_429" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-libs-2f-bmp

clean-lvgl-2f-src-2f-libs-2f-bmp:
	-$(RM) ./lvgl/src/libs/bmp/lv_bmp.cyclo ./lvgl/src/libs/bmp/lv_bmp.d ./lvgl/src/libs/bmp/lv_bmp.o ./lvgl/src/libs/bmp/lv_bmp.su

.PHONY: clean-lvgl-2f-src-2f-libs-2f-bmp
