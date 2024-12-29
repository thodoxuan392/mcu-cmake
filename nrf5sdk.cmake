function(add_nrf52sdk_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES PREPROCESSOR DEPENDENCES)
    set(options)

    cmake_parse_arguments(NRF5SDK "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${NRF5SDK_TARGET_NAME} STATIC)

    target_sources(
        ${NRF5SDK_TARGET_NAME}
        PRIVATE

        ${NRF5SDK_PATH}/modules/nrfx/soc/nrfx_atomic.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_clock.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_systick.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_ppi.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_saadc.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_gpiote.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_power.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/prs/nrfx_prs.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_uart.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_uarte.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_adc.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_twi.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_twim.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_qspi.c
        # ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_spi.c
        # ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_spim.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_timer.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_rtc.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_usbd.c
        ${NRF5SDK_PATH}/modules/nrfx/drivers/src/nrfx_wdt.c

        ${NRF5SDK_PATH}/integration/nrfx/legacy/nrf_drv_clock.c
        ${NRF5SDK_PATH}/integration/nrfx/legacy/nrf_drv_power.c
        ${NRF5SDK_PATH}/integration/nrfx/legacy/nrf_drv_ppi.c
        ${NRF5SDK_PATH}/integration/nrfx/legacy/nrf_drv_uart.c
        ${NRF5SDK_PATH}/integration/nrfx/legacy/nrf_drv_twi.c
        # ${NRF5SDK_PATH}/integration/nrfx/legacy/nrf_drv_spi.c

        ${NRF5SDK_PATH}/components/libraries/log/src/nrf_log_backend_rtt.c
        ${NRF5SDK_PATH}/components/libraries/log/src/nrf_log_backend_serial.c
        ${NRF5SDK_PATH}/components/libraries/log/src/nrf_log_default_backends.c
        ${NRF5SDK_PATH}/components/libraries/log/src/nrf_log_frontend.c
        ${NRF5SDK_PATH}/components/libraries/log/src/nrf_log_str_formatter.c
        ${NRF5SDK_PATH}/components/libraries/button/app_button.c
        ${NRF5SDK_PATH}/components/libraries/util/app_error.c
        ${NRF5SDK_PATH}/components/libraries/util/app_error_handler_gcc.c
        ${NRF5SDK_PATH}/components/libraries/util/app_error_weak.c
        ${NRF5SDK_PATH}/components/libraries/fifo/app_fifo.c
        ${NRF5SDK_PATH}/components/libraries/scheduler/app_scheduler.c

        ${NRF5SDK_PATH}/components/libraries/timer/app_timer_freertos.c
        ${NRF5SDK_PATH}/components/libraries/uart/app_uart_fifo.c
        ${NRF5SDK_PATH}/components/libraries/util/app_util_platform.c
        ${NRF5SDK_PATH}/components/libraries/timer/drv_rtc.c
        ${NRF5SDK_PATH}/components/libraries/hardfault/hardfault_implementation.c
        ${NRF5SDK_PATH}/components/libraries/util/nrf_assert.c
        ${NRF5SDK_PATH}/components/libraries/atomic_fifo/nrf_atfifo.c
        ${NRF5SDK_PATH}/components/libraries/atomic_flags/nrf_atflags.c
        ${NRF5SDK_PATH}/components/libraries/atomic/nrf_atomic.c
        ${NRF5SDK_PATH}/components/libraries/balloc/nrf_balloc.c
        ${NRF5SDK_PATH}/components/libraries/memobj/nrf_memobj.c
        ${NRF5SDK_PATH}/components/libraries/pwr_mgmt/nrf_pwr_mgmt.c
        ${NRF5SDK_PATH}/components/libraries/ringbuf/nrf_ringbuf.c
        ${NRF5SDK_PATH}/components/libraries/experimental_section_vars/nrf_section_iter.c
        ${NRF5SDK_PATH}/components/libraries/sortlist/nrf_sortlist.c
        ${NRF5SDK_PATH}/components/libraries/strerror/nrf_strerror.c
        ${NRF5SDK_PATH}/components/libraries/uart/retarget.c
        ${NRF5SDK_PATH}/components/libraries/bsp/bsp.c
        ${NRF5SDK_PATH}/components/libraries/bsp/bsp_btn_ble.c
        ${NRF5SDK_PATH}/components/libraries/usbd/app_usbd.c
        ${NRF5SDK_PATH}/components/libraries/usbd/class/cdc/acm/app_usbd_cdc_acm.c
        ${NRF5SDK_PATH}/components/libraries/usbd/app_usbd_core.c
        ${NRF5SDK_PATH}/components/libraries/usbd/app_usbd_serial_num.c
        ${NRF5SDK_PATH}/components/libraries/usbd/app_usbd_string_desc.c
        ${NRF5SDK_PATH}/components/libraries/bootloader/dfu/nrf_dfu_svci.c
        ${NRF5SDK_PATH}/components/boards/boards.c

        ${NRF5SDK_PATH}/external/fprintf/nrf_fprintf.c
        ${NRF5SDK_PATH}/external/fprintf/nrf_fprintf_format.c

        ${NRF5SDK_PATH}/components/ble/common/ble_advdata.c
        ${NRF5SDK_PATH}/components/ble/ble_advertising/ble_advertising.c
        ${NRF5SDK_PATH}/components/ble/common/ble_conn_params.c
        ${NRF5SDK_PATH}/components/ble/common/ble_conn_state.c
        ${NRF5SDK_PATH}/components/ble/ble_link_ctx_manager/ble_link_ctx_manager.c
        ${NRF5SDK_PATH}/components/ble/common/ble_srv_common.c
        ${NRF5SDK_PATH}/components/ble/nrf_ble_gatt/nrf_ble_gatt.c
        ${NRF5SDK_PATH}/components/ble/nrf_ble_qwr/nrf_ble_qwr.c
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_nus/ble_nus.c
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_dfu/ble_dfu.c
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_dfu/ble_dfu_bonded.c
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_dfu/ble_dfu_unbonded.c
        ${NRF5SDK_PATH}/components/ble/nrf_ble_qwr/nrf_ble_qwr.c
        ${NRF5SDK_PATH}/components/softdevice/common/nrf_sdh.c
        ${NRF5SDK_PATH}/components/softdevice/common/nrf_sdh_ble.c
        ${NRF5SDK_PATH}/components/softdevice/common/nrf_sdh_soc.c
        ${NRF5SDK_PATH}/components/softdevice/common/nrf_sdh_freertos.c
    )

    list(
        APPEND
        NRFSDK_INCLUDE_DIRS
        ${NRF5SDK_PATH}/modules/nrfx/hal
        ${NRF5SDK_PATH}/modules/nrfx/drivers/include
        ${NRF5SDK_PATH}/modules/nrfx/mdk
        ${NRF5SDK_PATH}/modules/nrfx

        ${NRF5SDK_PATH}/integration/nrfx/legacy

        ${NRF5SDK_PATH}/components/nfc/ndef/generic/message
        ${NRF5SDK_PATH}/components/nfc/t2t_lib
        ${NRF5SDK_PATH}/components/nfc/t4t_parser/hl_detection_procedure
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_ancs_c
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_ias_c
        ${NRF5SDK_PATH}/components/libraries/pwm
        ${NRF5SDK_PATH}/components/libraries/usbd/class/cdc/acm
        ${NRF5SDK_PATH}/components/libraries/usbd/class/hid/generic
        ${NRF5SDK_PATH}/components/libraries/usbd/class/msc
        ${NRF5SDK_PATH}/components/libraries/usbd/class/hid
        ${NRF5SDK_PATH}/components/nfc/ndef/conn_hand_parser/le_oob_rec_parser
        ${NRF5SDK_PATH}/components/libraries/log
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_gls
        ${NRF5SDK_PATH}/components/libraries/fstorage
        ${NRF5SDK_PATH}/components/nfc/ndef/text
        ${NRF5SDK_PATH}/components/libraries/mutex
        ${NRF5SDK_PATH}/components/libraries/gfx
        ${NRF5SDK_PATH}/components/libraries/bootloader/ble_dfu
        ${NRF5SDK_PATH}/components/libraries/bootloader/dfu
        ${NRF5SDK_PATH}/components/libraries/bootloader
        ${NRF5SDK_PATH}/components/nfc/ndef/connection_handover/common
        ${NRF5SDK_PATH}/components/libraries/fifo
        ${NRF5SDK_PATH}/components/boards
        ${NRF5SDK_PATH}/components/nfc/ndef/generic/record
        ${NRF5SDK_PATH}/components/nfc/t4t_parser/cc_file
        ${NRF5SDK_PATH}/components/ble/ble_advertising
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_bas_c
        ${NRF5SDK_PATH}/components/ble/nrf_ble_qwr
        ${NRF5SDK_PATH}/components/libraries/experimental_task_manager
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_hrs_c
        ${NRF5SDK_PATH}/components/softdevice/s140/headers/nrf52
        ${NRF5SDK_PATH}/components/nfc/ndef/connection_handover/le_oob_rec
        ${NRF5SDK_PATH}/components/libraries/queue
        ${NRF5SDK_PATH}/components/libraries/pwr_mgmt
        ${NRF5SDK_PATH}/components/ble/ble_dtm
        ${NRF5SDK_PATH}/components/toolchain/cmsis/include
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_rscs_c
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_dfu
        ${NRF5SDK_PATH}/components/ble/common
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_lls
        ${NRF5SDK_PATH}/components/nfc/platform
        ${NRF5SDK_PATH}/components/libraries/bsp
        ${NRF5SDK_PATH}/components/nfc/ndef/connection_handover/ac_rec
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_bas
        ${NRF5SDK_PATH}/components/libraries/mpu
        ${NRF5SDK_PATH}/components/libraries/experimental_section_vars
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_ans_c
        ${NRF5SDK_PATH}/components/libraries/slip
        ${NRF5SDK_PATH}/components/libraries/delay
        ${NRF5SDK_PATH}/components/libraries/csense_drv
        ${NRF5SDK_PATH}/components/libraries/memobj

        ${NRF5SDK_PATH}/components/libraries/usbd
        ${NRF5SDK_PATH}/components/libraries/usbd/class/cdc
        ${NRF5SDK_PATH}/components/libraries/usbd/class/cdc/acm
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_nus_c
        ${NRF5SDK_PATH}/components/softdevice/common
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_ias
        ${NRF5SDK_PATH}/components/libraries/usbd/class/hid/mouse
        ${NRF5SDK_PATH}/components/libraries/low_power_pwm
        ${NRF5SDK_PATH}/components/nfc/ndef/conn_hand_parser/ble_oob_advdata_parser
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_dfu
        ${NRF5SDK_PATH}/components/libraries/svc
        ${NRF5SDK_PATH}/components/libraries/atomic
        ${NRF5SDK_PATH}/components
        ${NRF5SDK_PATH}/components/libraries/scheduler
        ${NRF5SDK_PATH}/components/libraries/cli
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_lbs
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_hts
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_cts_c
        ${NRF5SDK_PATH}/components/libraries/crc16
        ${NRF5SDK_PATH}/components/nfc/t4t_parser/apdu
        ${NRF5SDK_PATH}/components/libraries/util
        ${NRF5SDK_PATH}/components/libraries/usbd/class/cdc
        ${NRF5SDK_PATH}/components/libraries/csense
        ${NRF5SDK_PATH}/components/libraries/balloc
        ${NRF5SDK_PATH}/components/libraries/ecc
        ${NRF5SDK_PATH}/components/libraries/hardfault
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_cscs
        ${NRF5SDK_PATH}/components/libraries/uart
        ${NRF5SDK_PATH}/components/libraries/hci
        ${NRF5SDK_PATH}/components/libraries/usbd/class/hid/kbd
        ${NRF5SDK_PATH}/components/libraries/timer
        ${NRF5SDK_PATH}/components/softdevice/s140/headers
        ${NRF5SDK_PATH}/components/nfc/t4t_parser/tlv
        ${NRF5SDK_PATH}/components/libraries/sortlist
        ${NRF5SDK_PATH}/components/libraries/spi_mngr
        ${NRF5SDK_PATH}/components/libraries/led_softblink
        ${NRF5SDK_PATH}/components/nfc/ndef/conn_hand_parser
        ${NRF5SDK_PATH}/components/libraries/sdcard
        ${NRF5SDK_PATH}/components/nfc/ndef/parser/record
        ${NRF5SDK_PATH}/components/ble/ble_link_ctx_manager
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_nus
        ${NRF5SDK_PATH}/components/libraries/twi_mngr
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_hids
        ${NRF5SDK_PATH}/components/libraries/strerror
        ${NRF5SDK_PATH}/components/libraries/crc32
        ${NRF5SDK_PATH}/components/nfc/ndef/connection_handover/ble_oob_advdata
        ${NRF5SDK_PATH}/components/nfc/t2t_parser
        ${NRF5SDK_PATH}/components/nfc/ndef/connection_handover/ble_pair_msg
        ${NRF5SDK_PATH}/components/libraries/usbd/class/audio
        ${NRF5SDK_PATH}/components/nfc/t4t_lib
        ${NRF5SDK_PATH}/components/ble/peer_manager
        ${NRF5SDK_PATH}/components/libraries/mem_manager
        ${NRF5SDK_PATH}/components/libraries/sensorsim
        ${NRF5SDK_PATH}/components/libraries/ringbuf
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_tps
        ${NRF5SDK_PATH}/components/nfc/ndef/parser/message
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_dis
        ${NRF5SDK_PATH}/components/nfc/ndef/uri
        ${NRF5SDK_PATH}/components/ble/nrf_ble_gatt
        ${NRF5SDK_PATH}/components/ble/nrf_ble_qwr
        ${NRF5SDK_PATH}/components/libraries/gpiote
        ${NRF5SDK_PATH}/components/libraries/button
        ${NRF5SDK_PATH}/components/libraries/twi_sensor
        ${NRF5SDK_PATH}/components/libraries/usbd
        ${NRF5SDK_PATH}/components/nfc/ndef/connection_handover/ep_oob_rec
        ${NRF5SDK_PATH}/components/libraries/atomic_fifo
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_lbs_c
        ${NRF5SDK_PATH}/components/nfc/ndef/connection_handover/ble_pair_lib
        ${NRF5SDK_PATH}/components/libraries/crypto
        ${NRF5SDK_PATH}/components/ble/ble_racp
        ${NRF5SDK_PATH}/components/libraries/fds
        ${NRF5SDK_PATH}/components/nfc/ndef/launchapp
        ${NRF5SDK_PATH}/components/libraries/atomic_flags
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_hrs
        ${NRF5SDK_PATH}/components/ble/ble_services/ble_rscs
        ${NRF5SDK_PATH}/components/nfc/ndef/connection_handover/hs_rec
        ${NRF5SDK_PATH}/components/nfc/ndef/conn_hand_parser/ac_rec_parser
        ${NRF5SDK_PATH}/components/libraries/stack_guard
        ${NRF5SDK_PATH}/components/libraries/log/src

        ${NRF5SDK_PATH}/external/utf_converter
        ${NRF5SDK_PATH}/external/fprintf
        ${NRF5SDK_PATH}/external/segger_rtt

        ${NRF5SDK_PATH}/components/ble/ble_services/ble_hrs_c
    )

    target_include_directories(
        ${NRF5SDK_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${NRFSDK_INCLUDE_DIRS}
    )

    set(${NRF5SDK_TARGET_NAME}_INCLUDE_DIRS ${NRFSDK_INCLUDE_DIRS} PARENT_SCOPE)

    target_compile_options(
        ${NRF5SDK_TARGET_NAME}
        PRIVATE
        -O0
        -g3
    )

    target_compile_definitions(
        ${NRF5SDK_TARGET_NAME}
        PRIVATE
        BOARD_PCA10056
        CONFIG_GPIO_AS_PINRESET
        FLOAT_ABI_HARD
        NRF52840_XXAA
        NRF_SD_BLE_API_VERSION=7
        S140
        SOFTDEVICE_PRESENT
        TWI_PRESENT
    )

    # Extra includes
    foreach(INC ${NRF5SDK_EXTRA_INCLUDES})
        target_include_directories(${NRF5SDK_TARGET_NAME}
            PRIVATE
            ${INC}
        )
    endforeach()

    # Extra Preprocessor
    foreach(DEF ${NRF5SDK_PREPROCESSOR})
        target_compile_definitions(${NRF5SDK_TARGET_NAME}
            PRIVATE
            ${DEF}
        )
    endforeach()

    # Link dependencies libraries
    foreach(DEPENDENCY ${NRF5SDK_DEPENDENCIES})
        target_link_libraries(${NRF5SDK_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()
endfunction()
