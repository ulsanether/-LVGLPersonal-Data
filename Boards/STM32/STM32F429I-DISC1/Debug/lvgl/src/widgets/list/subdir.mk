################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/widgets/list/lv_list.c 

OBJS += \
./lvgl/src/widgets/list/lv_list.o 

C_DEPS += \
./lvgl/src/widgets/list/lv_list.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/widgets/list/%.o lvgl/src/widgets/list/%.su lvgl/src/widgets/list/%.cyclo: ../lvgl/src/widgets/list/%.c lvgl/src/widgets/list/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/hangm/Desktop/LVGL_429" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-widgets-2f-list

clean-lvgl-2f-src-2f-widgets-2f-list:
	-$(RM) ./lvgl/src/widgets/list/lv_list.cyclo ./lvgl/src/widgets/list/lv_list.d ./lvgl/src/widgets/list/lv_list.o ./lvgl/src/widgets/list/lv_list.su

.PHONY: clean-lvgl-2f-src-2f-widgets-2f-list

