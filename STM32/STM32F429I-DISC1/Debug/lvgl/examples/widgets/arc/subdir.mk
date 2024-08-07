################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/examples/widgets/arc/lv_example_arc_1.c \
../lvgl/examples/widgets/arc/lv_example_arc_2.c 

OBJS += \
./lvgl/examples/widgets/arc/lv_example_arc_1.o \
./lvgl/examples/widgets/arc/lv_example_arc_2.o 

C_DEPS += \
./lvgl/examples/widgets/arc/lv_example_arc_1.d \
./lvgl/examples/widgets/arc/lv_example_arc_2.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/examples/widgets/arc/%.o lvgl/examples/widgets/arc/%.su lvgl/examples/widgets/arc/%.cyclo: ../lvgl/examples/widgets/arc/%.c lvgl/examples/widgets/arc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/hangm/Desktop/LVGL_429" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-examples-2f-widgets-2f-arc

clean-lvgl-2f-examples-2f-widgets-2f-arc:
	-$(RM) ./lvgl/examples/widgets/arc/lv_example_arc_1.cyclo ./lvgl/examples/widgets/arc/lv_example_arc_1.d ./lvgl/examples/widgets/arc/lv_example_arc_1.o ./lvgl/examples/widgets/arc/lv_example_arc_1.su ./lvgl/examples/widgets/arc/lv_example_arc_2.cyclo ./lvgl/examples/widgets/arc/lv_example_arc_2.d ./lvgl/examples/widgets/arc/lv_example_arc_2.o ./lvgl/examples/widgets/arc/lv_example_arc_2.su

.PHONY: clean-lvgl-2f-examples-2f-widgets-2f-arc

