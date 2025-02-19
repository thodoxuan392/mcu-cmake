function(add_stm32_f1xx_driver_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES PREPROCESSOR DEPENDENCES)
    set(options)

    cmake_parse_arguments(STM32_F1XX_DRIVER "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${STM32_F1XX_DRIVER_TARGET_NAME} STATIC)

    target_sources(
        ${STM32_F1XX_DRIVER_TARGET_NAME}
        PRIVATE
        ${STM32_F1XX_DRIVER_PATH}/Src/Legacy/stm32f1xx_hal_can.c

        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_adc.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_adc_ex.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_can.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_cec.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_cortex.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_crc.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_dac.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_dac_ex.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_dma.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_eth.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_exti.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_flash.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_flash_ex.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_gpio.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_gpio_ex.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_hcd.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_i2c.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_i2s.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_irda.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_iwdg.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_mmc.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_msp_template.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_nand.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_nor.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_pccard.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_pcd.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_pcd_ex.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_pwr.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_rcc.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_rcc_ex.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_rtc.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_rtc_ex.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_sd.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_smartcard.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_spi.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_sram.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_tim.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_timebase_rtc_alarm_template.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_timebase_tim_template.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_tim_ex.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_uart.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_usart.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_hal_wwdg.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_adc.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_crc.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_dac.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_dma.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_exti.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_fsmc.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_gpio.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_i2c.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_pwr.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_rcc.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_rtc.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_sdmmc.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_spi.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_tim.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_usart.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_usb.c
        ${STM32_F1XX_DRIVER_PATH}/Src/stm32f1xx_ll_utils.c
    )

    list(
        APPEND
        STM32_F1XX_DRIVER_INCLUDE_DIRS
        ${STM32_F1XX_DRIVER_PATH}/Inc/Legacy/stm32_hal_legacy.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/Legacy/stm32f1xx_hal_can_ex_legacy.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/Legacy/stm32f1xx_hal_can_legacy.h

        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32_assert_template.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_adc_ex.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_adc.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_can.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_cec.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_conf_template.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_cortex.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_crc.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_dac_ex.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_dac.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_def.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_dma_ex.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_dma.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_eth.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_exti.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_flash_ex.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_flash.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_gpio_ex.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_gpio.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/ stm32f1xx_hal.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_hcd.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_i2c.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_i2s.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_irda.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_iwdg.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_mmc.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_nand.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_nor.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_pccard.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_pcd_ex.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_pcd.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_pwr.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_rcc_ex.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_rcc.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_rtc_ex.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_rtc.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_sd.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_smartcard.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_spi.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_sram.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_tim_ex.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_tim.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_uart.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_usart.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_hal_wwdg.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_adc.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_bus.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_cortex.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_crc.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_dac.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_dma.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_exti.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_fsmc.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_gpio.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_i2c.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_iwdg.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_pwr.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_rcc.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_rtc.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_sdmmc.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_spi.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_system.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_tim.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_usart.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_usb.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_utils.h
        ${STM32_F1XX_DRIVER_PATH}/Inc/stm32f1xx_ll_wwdg.h
    )

    target_include_directories(
        ${STM32_F1XX_DRIVER_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${STM32_F1XX_DRIVER_INCLUDE_DIRS}
    )

    set(${STM32_F1XX_DRIVER_TARGET_NAME}_INCLUDE_DIRS ${STM32_F1XX_DRIVER_INCLUDE_DIRS} PARENT_SCOPE)

    target_compile_options(
        ${STM32_F1XX_DRIVER_TARGET_NAME}
        PRIVATE
        -O0
        -g3
    )

    # Extra includes
    foreach(INC ${STM32_F1XX_DRIVER_EXTRA_INCLUDES})
        target_include_directories(${STM32_F1XX_DRIVER_TARGET_NAME}
            PRIVATE
            ${INC}
        )
    endforeach()

    # Extra Preprocessor
    foreach(DEF ${STM32_F1XX_DRIVER_PREPROCESSOR})
        target_compile_definitions(${STM32_F1XX_DRIVER_TARGET_NAME}
            PRIVATE
            ${DEF}
        )
    endforeach()

    # Link dependencies libraries
    foreach(DEPENDENCY ${STM32_F1XX_DRIVER_DEPENDENCIES})
        target_link_libraries(${STM32_F1XX_DRIVER_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()
endfunction()
