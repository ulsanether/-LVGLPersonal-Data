################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/others/msg/lv_msg.c 

OBJS += \
./lvgl/src/others/msg/lv_msg.o 

C_DEPS += \
./lvgl/src/others/msg/lv_msg.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/others/msg/%.o lvgl/src/others/msg/%.su lvgl/src/others/msg/%.cyclo: ../lvgl/src/others/msg/%.c lvgl/src/others/msg/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/hangm/Desktop/LVGL_429" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-others-2f-msg

clean-lvgl-2f-src-2f-others-2f-msg:
	-$(RM) ./lvgl/src/others/msg/lv_msg.cyclo ./lvgl/src/others/msg/lv_msg.d ./lvgl/src/others/msg/lv_msg.o ./lvgl/src/others/msg/lv_msg.su

.PHONY: clean-lvgl-2f-src-2f-others-2f-msg
