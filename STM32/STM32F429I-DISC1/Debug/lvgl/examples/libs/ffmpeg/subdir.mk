################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/examples/libs/ffmpeg/lv_example_ffmpeg_1.c \
../lvgl/examples/libs/ffmpeg/lv_example_ffmpeg_2.c 

OBJS += \
./lvgl/examples/libs/ffmpeg/lv_example_ffmpeg_1.o \
./lvgl/examples/libs/ffmpeg/lv_example_ffmpeg_2.o 

C_DEPS += \
./lvgl/examples/libs/ffmpeg/lv_example_ffmpeg_1.d \
./lvgl/examples/libs/ffmpeg/lv_example_ffmpeg_2.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/examples/libs/ffmpeg/%.o lvgl/examples/libs/ffmpeg/%.su lvgl/examples/libs/ffmpeg/%.cyclo: ../lvgl/examples/libs/ffmpeg/%.c lvgl/examples/libs/ffmpeg/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F429xx -c -I../Core/Inc -I"C:/Users/hangm/Desktop/LVGL_429" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-examples-2f-libs-2f-ffmpeg

clean-lvgl-2f-examples-2f-libs-2f-ffmpeg:
	-$(RM) ./lvgl/examples/libs/ffmpeg/lv_example_ffmpeg_1.cyclo ./lvgl/examples/libs/ffmpeg/lv_example_ffmpeg_1.d ./lvgl/examples/libs/ffmpeg/lv_example_ffmpeg_1.o ./lvgl/examples/libs/ffmpeg/lv_example_ffmpeg_1.su ./lvgl/examples/libs/ffmpeg/lv_example_ffmpeg_2.cyclo ./lvgl/examples/libs/ffmpeg/lv_example_ffmpeg_2.d ./lvgl/examples/libs/ffmpeg/lv_example_ffmpeg_2.o ./lvgl/examples/libs/ffmpeg/lv_example_ffmpeg_2.su

.PHONY: clean-lvgl-2f-examples-2f-libs-2f-ffmpeg

