
function(add_nrf_flash_target #[[scriptPath]] #[[cfgFile]] #[[hexFile]] #[[softDeviceHex]])
    if(${ARGC} GREATER 0)
        set(scriptPath ${ARGV0})
    else()
        message(FATAL_ERROR "Please specified a script path for OpenOCD")
    endif()

    if(${ARGC} GREATER 1)
        set(softDeviceHex ${ARGV1})
    else()
        message(FATAL_ERROR "Please specified a path to soft device hex file for flashing")
    endif()

    if(${ARGC} GREATER 2)
        set(mainAppHex ${ARGV2})
    else()
        set(mainAppHex ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.hex)
    endif()

    set(TARGET_NAME "flash")

    add_custom_target(${TARGET_NAME}
        COMMAND export PROJ_HEX_FILE=${hexFile}
        COMMAND export PROJ_ROOT=${PROJECT_SOURCE_DIR}
        COMMAND nrfjprog -f nrf52 --chiperase
        COMMAND nrfjprog -f nrf52 --program ${softDeviceHex} --verify # Flash Soft Device
        COMMAND nrfjprog -f nrf52 --program ${mainAppHex} --verify # Flash Main Application
        VERBATIM USES_TERMINAL
    )
endfunction()

function(add_nrf_flash_target_with_dfu_over_usb)
    if(${ARGC} GREATER 0)
        set(scriptPath ${ARGV0})
    else()
        message(FATAL_ERROR "Please specified a script path for OpenOCD")
    endif()

    if(${ARGC} GREATER 1)
        set(mbrHex ${ARGV1})
    else()
        message(FATAL_ERROR "Please specified a path to mbr hex file for flashing")
    endif()

    if(${ARGC} GREATER 2)
        set(usbBootloaderHex ${ARGV2})
    else()
        message(FATAL_ERROR "Please specified a path to usb bootloader hex file for flashing")
    endif()

    if(${ARGC} GREATER 3)
        set(softDeviceHex ${ARGV3})
    else()
        message(FATAL_ERROR "Please specified a path to soft device hex file for flashing")
    endif()

    if(${ARGC} GREATER 4)
        set(mainAppHex ${ARGV4})
    else()
        set(mainAppHex ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.hex)
    endif()

    set(TARGET_NAME "flash_with_usb_bootloader")

    add_custom_target(${TARGET_NAME}
        COMMAND export PROJ_HEX_FILE=${hexFile}
        COMMAND export PROJ_ROOT=${PROJECT_SOURCE_DIR}
        COMMAND nrfjprog -f nrf52 --chiperase
        COMMAND nrfjprog -f nrf52 --program ${mbrHex} --verify # Flash Master Boot Record
        COMMAND nrfjprog -f nrf52 --program ${usbBootloaderHex} --verify # Flash USB bootloader
        COMMAND nrfjprog -f nrf52 --program ${softDeviceHex} --verify # Flash Soft Device
        COMMAND nrfjprog -f nrf52 --program ${mainAppHex} --verify # Flash Main Application
        VERBATIM USES_TERMINAL
    )
endfunction()

function(add_nrf_flash_target_with_dfu_over_ble)
    if(${ARGC} GREATER 0)
        set(scriptPath ${ARGV0})
    else()
        message(FATAL_ERROR "Please specified a script path for OpenOCD")
    endif()

    if(${ARGC} GREATER 1)
        set(mbrHex ${ARGV1})
    else()
        message(FATAL_ERROR "Please specified a path to mbr hex file for flashing")
    endif()

    if(${ARGC} GREATER 2)
        set(bleBootloaderHex ${ARGV2})
    else()
        message(FATAL_ERROR "Please specified a path to ble bootloader hex file for flashing")
    endif()

    if(${ARGC} GREATER 3)
        set(softDeviceHex ${ARGV3})
    else()
        message(FATAL_ERROR "Please specified a path to soft device hex file for flashing")
    endif()

    if(${ARGC} GREATER 4)
        set(mainAppHex ${ARGV4})
    else()
        set(mainAppHex ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.hex)
    endif()

    set(TARGET_NAME "flash_with_ble_bootloader")

    add_custom_target(${TARGET_NAME}
        COMMAND export PROJ_HEX_FILE=${hexFile}
        COMMAND export PROJ_ROOT=${PROJECT_SOURCE_DIR}
        COMMAND nrfjprog -f nrf52 --chiperase
        COMMAND nrfjprog -f nrf52 --program ${mbrHex} --verify # Flash Master Boot Record
        COMMAND nrfjprog -f nrf52 --program ${bleBootloaderHex} --verify # Flash BLE bootloader
        COMMAND nrfjprog -f nrf52 --program ${softDeviceHex} --verify # Flash Soft Device
        COMMAND nrfjprog -f nrf52 --program ${mainAppHex} --verify # Flash Main Application
        VERBATIM USES_TERMINAL
    )
endfunction()
