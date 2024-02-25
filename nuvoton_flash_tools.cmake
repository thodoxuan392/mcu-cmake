function(add_nuvoton_flash_target #[[cfgFile]] #[[hexFile]])
    if(${ARGC} GREATER 0)
        set(cfgFile ${ARGV0})
    else()
        message(FATAL_ERROR "Please specified a path of openocd cfg file for flashing")
    endif()

    if(${ARGC} GREATER 1)
        set(hexFile ${ARGV1})
    else()
        set(hexFile ${PROJECT_BINARY_DIR}/${PROJECT_NAME}.hex)
    endif()

    set(TARGET_NAME "flash")

    add_custom_target(${TARGET_NAME}
        COMMAND export PROJ_HEX_FILE=${hexFile}
        COMMAND export PROJ_ROOT=${PROJECT_SOURCE_DIR}
        COMMAND openocd -f ${cfgFile}
        VERBATIM USES_TERMINAL
    )
endfunction()
