################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/examples/widgets/keyboard/lv_example_keyboard_1.c \
../lvgl/examples/widgets/keyboard/lv_example_keyboard_2.c 

OBJS += \
./lvgl/examples/widgets/keyboard/lv_example_keyboard_1.o \
./lvgl/examples/widgets/keyboard/lv_example_keyboard_2.o 

C_DEPS += \
./lvgl/examples/widgets/keyboard/lv_example_keyboard_1.d \
./lvgl/examples/widgets/keyboard/lv_example_keyboard_2.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/examples/widgets/keyboard/%.o lvgl/examples/widgets/keyboard/%.su lvgl/examples/widgets/keyboard/%.cyclo: ../lvgl/examples/widgets/keyboard/%.c lvgl/examples/widgets/keyboard/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/hangm/Documents/GitHub/-LVGLPersonal-Data/Boards/STM32/STM32F429I-DISC1" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-examples-2f-widgets-2f-keyboard

clean-lvgl-2f-examples-2f-widgets-2f-keyboard:
	-$(RM) ./lvgl/examples/widgets/keyboard/lv_example_keyboard_1.cyclo ./lvgl/examples/widgets/keyboard/lv_example_keyboard_1.d ./lvgl/examples/widgets/keyboard/lv_example_keyboard_1.o ./lvgl/examples/widgets/keyboard/lv_example_keyboard_1.su ./lvgl/examples/widgets/keyboard/lv_example_keyboard_2.cyclo ./lvgl/examples/widgets/keyboard/lv_example_keyboard_2.d ./lvgl/examples/widgets/keyboard/lv_example_keyboard_2.o ./lvgl/examples/widgets/keyboard/lv_example_keyboard_2.su

.PHONY: clean-lvgl-2f-examples-2f-widgets-2f-keyboard

