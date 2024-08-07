
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
        COMMAND nrfjprog -f nrf52 --eraseall
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
        set(softDeviceHex ${ARGV1})
    else()
        message(FATAL_ERROR "Please specified a path to soft device hex file for flashing")
    endif()

    if(${ARGC} GREATER 2)
        set(mainAppHex ${ARGV2})
    else()
        message(FATAL_ERROR "Please specified a path to main application hex file for flashing")
    endif()

    if(${ARGC} GREATER 3)
        set(usbBootloaderHex ${ARGV3})
    else()
        message(FATAL_ERROR "Please specified a path to usb bootloader hex file for flashing")
    endif()

    if(${ARGC} GREATER 4)
        set(bleBootloaderSettingHex ${ARGV4})
    else()
        message(FATAL_ERROR "Please set bootloader setting hex file for flashing")
    endif()

    if(${ARGC} GREATER 5)
        set(mainAppVersion ${ARGV5})
    else()
        message(FATAL_ERROR "Please set mainApplication version")
    endif()

    if(${ARGC} GREATER 6)
        set(bootloaderVersion ${ARGV6})
    else()
        message(FATAL_ERROR "Please set bootloader version")
    endif()

    set(TARGET_NAME "flash_with_usb_bootloader")

    add_custom_target(${TARGET_NAME}
        COMMAND export PROJ_HEX_FILE=${mainAppHex}
        COMMAND export PROJ_ROOT=${PROJECT_SOURCE_DIR}
        COMMAND nrfutil settings generate --family NRF52 --application ${mainAppHex} --application-version-string ${mainAppVersion} --bootloader-version
        ${bootloaderVersion} --bl-settings-version 2 --start-address 0xFF000 ${bleBootloaderSettingHex} # Bootloader Setting version is same as bootloader version
        COMMAND nrfjprog -f nrf52 --eraseall
        COMMAND nrfjprog -f nrf52 --program ${softDeviceHex} --verify # Flash Soft Device
        COMMAND nrfjprog -f nrf52 --program ${usbBootloaderHex} --verify # Flash USB bootloader
        COMMAND nrfjprog -f nrf52 --program ${bleBootloaderSettingHex} --verify # Flash Bootloader Setting
        COMMAND nrfjprog -f nrf52 --program ${mainAppHex} --verify # Flash Main Application
        COMMAND nrfjprog --reset
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
        set(softDeviceHex ${ARGV1})
    else()
        message(FATAL_ERROR "Please specified a path to soft device hex file for flashing")
    endif()

    if(${ARGC} GREATER 2)
        set(mainAppHex ${ARGV2})
    else()
        message(FATAL_ERROR "Please specified a path to main application hex file for flashing")
    endif()

    if(${ARGC} GREATER 3)
        set(bleBootloaderHex ${ARGV3})
    else()
        message(FATAL_ERROR "Please specified a path to ble bootloader hex file for flashing")
    endif()

    if(${ARGC} GREATER 4)
        set(bleBootloaderSettingHex ${ARGV4})
    else()
        message(FATAL_ERROR "Please set bootloader setting hex file for flashing")
    endif()

    if(${ARGC} GREATER 5)
        set(mainAppVersion ${ARGV5})
    else()
        message(FATAL_ERROR "Please set mainApplication version")
    endif()

    if(${ARGC} GREATER 6)
        set(bootloaderVersion ${ARGV6})
    else()
        message(FATAL_ERROR "Please set bootloader version")
    endif()

    set(TARGET_NAME "flash_with_ble_bootloader")

    add_custom_target(${TARGET_NAME}
        COMMAND export PROJ_HEX_FILE=${mainAppHex}
        COMMAND export PROJ_ROOT=${PROJECT_SOURCE_DIR}
        COMMAND nrfutil settings generate --family NRF52 --application ${mainAppHex} --application-version-string ${mainAppVersion} --bootloader-version
        ${bootloaderVersion} --bl-settings-version 2 --start-address 0xFF000 ${bleBootloaderSettingHex} # Bootloader Setting version is same as bootloader version
        COMMAND nrfjprog -f nrf52 --eraseall
        COMMAND nrfjprog -f nrf52 --program ${softDeviceHex} --verify # Flash Soft Device
        COMMAND nrfjprog -f nrf52 --program ${bleBootloaderHex} --verify # Flash BLE bootloader
        COMMAND nrfjprog -f nrf52 --program ${bleBootloaderSettingHex} --verify # Flash Bootloader Setting
        COMMAND nrfjprog -f nrf52 --program ${mainAppHex} --verify # Flash Main Application
        COMMAND nrfjprog --reset
        VERBATIM USES_TERMINAL
    )
endfunction()

function(add_nrf_generate_usb_update_package)
    if(${ARGC} GREATER 0)
        set(mainAppHex ${ARGV0})
    else()
        message(FATAL_ERROR "Please specified a path to main application hex file for flashing")
    endif()

    if(${ARGC} GREATER 1)
        set(mainAppVersion ${ARGV1})
    else()
        message(FATAL_ERROR "Please set mainApplication version")
    endif()

    if(${ARGC} GREATER 2)
        set(privateKey ${ARGV2})
    else()
        message(FATAL_ERROR "Please set privateKey")
    endif()

    if(${ARGC} GREATER 3)
        set(dfuZipFile ${ARGV3})
    else()
        message(FATAL_ERROR "Please specified a dfuZipFile")
    endif()

    set(TARGET_NAME "generate_usb_update_package")

    add_custom_target(${TARGET_NAME}
        COMMAND nrfutil pkg generate --application ${mainAppHex} --application-version-string ${mainAppVersion} --hw-version 52 --sd-req 0x100 --key-file ${privateKey} ${dfuZipFile}
        VERBATIM USES_TERMINAL
    )
endfunction()

function(add_nrf_update_target_over_usb)
    if(${ARGC} GREATER 0)
        set(port ${ARGV0})
    else()
        message(FATAL_ERROR "Please specified a port to update")
    endif()

    if(${ARGC} GREATER 1)
        set(dfuZipFile ${ARGV1})
    else()
        message(FATAL_ERROR "Please specified a dfuZipFile")
    endif()

    set(TARGET_NAME "update_over_usb")

    add_custom_target(${TARGET_NAME}
        COMMAND nrfutil dfu usb-serial -p ${port} -pkg ${dfuZipFile}
        VERBATIM USES_TERMINAL
    )
endfunction()

function(add_nrf_generate_ble_update_package)
    if(${ARGC} GREATER 0)
        set(mainAppHex ${ARGV0})
    else()
        message(FATAL_ERROR "Please specified a path to main application hex file for flashing")
    endif()

    if(${ARGC} GREATER 1)
        set(mainAppVersion ${ARGV1})
    else()
        message(FATAL_ERROR "Please set mainApplication version")
    endif()

    if(${ARGC} GREATER 2)
        set(privateKey ${ARGV2})
    else()
        message(FATAL_ERROR "Please set privateKey")
    endif()

    if(${ARGC} GREATER 3)
        set(dfuZipFile ${ARGV3})
    else()
        message(FATAL_ERROR "Please specified a dfuZipFile")
    endif()

    set(TARGET_NAME "generate_ble_update_package")

    add_custom_target(${TARGET_NAME}
        COMMAND nrfutil pkg generate --application ${mainAppHex} --application-version-string ${mainAppVersion} --hw-version 52 --sd-req 0x100 --key-file ${privateKey} ${dfuZipFile}
        VERBATIM USES_TERMINAL
    )
endfunction()

function(add_nrf_update_target_over_ble)
    if(${ARGC} GREATER 0)
        set(bleAddress ${ARGV0})
    else()
        message(FATAL_ERROR "Please specified a BLE Mac Address to update")
    endif()

    if(${ARGC} GREATER 1)
        set(dfuZipFile ${ARGV1})
    else()
        message(FATAL_ERROR "Please specified a dfuZipFile")
    endif()

    set(TARGET_NAME "update_over_ble")

    add_custom_target(${TARGET_NAME}
        COMMAND nrfutil dfu ble -ic NRF52 -a ${bleAddress} -pkg ${dfuZipFile}
        VERBATIM USES_TERMINAL
    )
endfunction()
