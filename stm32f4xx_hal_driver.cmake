function(add_stm32_f4xx_driver_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES PREPROCESSOR DEPENDENCIES)
    set(options)

    cmake_parse_arguments(STM32_F4XX_DRIVER "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${STM32_F4XX_DRIVER_TARGET_NAME} STATIC)

    target_sources(
        ${STM32_F4XX_DRIVER_TARGET_NAME}
        PRIVATE
        ${STM32_F4XX_DRIVER_PATH}/Src/Legacy/stm32f4xx_hal_can.c
        ${STM32_F4XX_DRIVER_PATH}/Src/Legacy/stm32f4xx_hal_eth.c

        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_adc.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_adc_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_can.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_cec.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_cortex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_crc.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_cryp.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_cryp_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_dac.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_dac_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_dcmi.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_dcmi_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_dfsdm.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_dma2d.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_dma.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_dma_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_dsi.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_eth.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_exti.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_flash.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_flash_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_flash_ramfunc.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_fmpi2c.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_fmpi2c_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_fmpsmbus.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_fmpsmbus_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_gpio.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_hash.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_hash_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_hcd.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_i2c.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_i2c_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_i2s.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_i2s_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_irda.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_iwdg.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_lptim.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_ltdc.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_ltdc_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_mmc.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_msp_template.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_nand.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_nor.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_pccard.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_pcd.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_pcd_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_pwr.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_pwr_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_qspi.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_rcc.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_rcc_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_rng.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_rtc.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_rtc_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_sai.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_sai_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_sd.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_sdram.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_smartcard.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_smbus.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_spdifrx.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_spi.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_sram.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_tim.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_timebase_rtc_alarm_template.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_timebase_rtc_wakeup_template.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_timebase_tim_template.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_tim_ex.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_uart.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_usart.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_hal_wwdg.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_adc.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_crc.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_dac.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_dma2d.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_dma.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_exti.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_fmc.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_fmpi2c.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_fsmc.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_gpio.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_i2c.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_lptim.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_pwr.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_rcc.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_rng.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_rtc.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_sdmmc.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_spi.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_tim.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_usart.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_usb.c
        ${STM32_F4XX_DRIVER_PATH}/Src/stm32f4xx_ll_utils.c
    )

    list(
        APPEND
        STM32_F4XX_DRIVER_INCLUDE_DIRS
        ${STM32_F4XX_DRIVER_PATH}/Inc/Legacy
        ${STM32_F4XX_DRIVER_PATH}/Inc
    )

    target_include_directories(
        ${STM32_F4XX_DRIVER_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${STM32_F4XX_DRIVER_INCLUDE_DIRS}
    )

    set(${STM32_F4XX_DRIVER_TARGET_NAME}_INCLUDE_DIRS ${STM32_F4XX_DRIVER_INCLUDE_DIRS} PARENT_SCOPE)

    target_compile_options(
        ${STM32_F4XX_DRIVER_TARGET_NAME}
        PRIVATE
        -O0
        -g3
    )

    # Extra includes
    foreach(INC ${STM32_F4XX_DRIVER_EXTRA_INCLUDES})
        target_include_directories(${STM32_F4XX_DRIVER_TARGET_NAME}
            PRIVATE
            ${INC}
        )
    endforeach()

    # Extra Preprocessor
    foreach(DEF ${STM32_F4XX_DRIVER_PREPROCESSOR})
        target_compile_definitions(${STM32_F4XX_DRIVER_TARGET_NAME}
            PRIVATE
            ${DEF}
        )
    endforeach()

    # Link dependencies libraries
    foreach(DEPENDENCY ${STM32_F4XX_DRIVER_DEPENDENCIES})
        target_link_libraries(${STM32_F4XX_DRIVER_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()
endfunction()
