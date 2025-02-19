
function(add_stm32_flash_target #[[bootloader_hex_file]] #[[application_hex_file]])
    if(${ARGC} GREATER 0)
        set(bootloader_hex_file ${ARGV0})
    else()
        message(FATAL_ERROR "Please specified a script path for OpenOCD")
    endif()

    if(${ARGC} GREATER 1)
        set(application_hex_file ${ARGV1})
    else()
        message(FATAL_ERROR "Please specified a path to soft device hex file for flashing")
    endif()

    set(TARGET_NAME "flash")

    add_custom_target(${TARGET_NAME}
        COMMAND st-flash erase
        COMMAND st-flash --format ihex write ${bootloader_hex_file}
        COMMAND st-flash --format ihex write ${application_hex_file}
        COMMAND st-flash reset

        VERBATIM USES_TERMINAL
    )
endfunction()

function(add_stm32_flash_target_with_app_only #[[application_hex_file]])
    if(${ARGC} GREATER 0)
        set(application_hex_file ${ARGV0})
    else()
        message(FATAL_ERROR "Please specified a script path for OpenOCD")
    endif()

    set(TARGET_NAME "flash_with_app_only")

    add_custom_target(${TARGET_NAME}
        COMMAND st-flash erase
        COMMAND st-flash --format ihex write ${application_hex_file}
        COMMAND st-flash reset

        VERBATIM USES_TERMINAL
    )
endfunction()
