include_guard()

# #######################################################################################################################
# Hex file                                                         #
# #######################################################################################################################
function(add_hex_output target #[[hex_file_name]])
    set(hex_file_name $<TARGET_FILE_BASE_NAME:${target}>.hex)

    # Return the generated file name if needed
    if(${ARGC} GREATER 1)
        set(${ARGV1} ${hex_file_name} PARENT_SCOPE)
    endif()

    add_custom_command(TARGET ${target}
        POST_BUILD
        COMMAND
        ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE_NAME:${target}> ${hex_file_name}
        WORKING_DIRECTORY
        $<TARGET_FILE_DIR:${target}>
    )
endfunction()

# #######################################################################################################################
# Binary file                                                      #
# #######################################################################################################################
function(add_bin_output target #[[bin_file_name]])
    set(bin_file_name $<TARGET_FILE_BASE_NAME:${target}>.bin)

    # Return the generated file name if needed
    if(${ARGC} GREATER 1)
        set(${ARGV1} ${bin_file_name} PARENT_SCOPE)
    endif()

    add_custom_command(TARGET ${target}
        POST_BUILD
        COMMAND
        ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE_NAME:${target}> ${bin_file_name}
        WORKING_DIRECTORY
        $<TARGET_FILE_DIR:${target}>
    )
endfunction()

# #######################################################################################################################
# Map files                                                      #
# #######################################################################################################################
function(add_map_output #[[target]])
    if(${ARGC} GREATER 0)
        set(target ${ARGV0})
    else()
        set(target ${PROJECT_NAME})
    endif()

    target_link_options(${target}
        PRIVATE
        -Wl,-Map=$<TARGET_FILE_BASE_NAME:${target}>.map
    )
endfunction()

# #######################################################################################################################
# List output                                                      #
# #######################################################################################################################
function(add_list_output #[[target]])
    if(${ARGC} GREATER 0)
        set(target ${ARGV0})
    else()
        set(target ${PROJECT_NAME})
    endif()

    add_custom_command(TARGET ${target}
        POST_BUILD
        COMMAND
        ${CMAKE_OBJDUMP} -h -S $<TARGET_FILE_NAME:${target}> > $<TARGET_FILE_BASE_NAME:${target}>.list
        WORKING_DIRECTORY
        $<TARGET_FILE_DIR:${target}>
    )
endfunction()

# #######################################################################################################################
# Stack usage                                                      #
# #######################################################################################################################
function(add_stack_usage_information #[[target]])
    if(${ARGC} GREATER 0)
        set(target ${ARGV0})
    else()
        set(target ${PROJECT_NAME})
    endif()

    target_compile_options(${target}
        PRIVATE
        -fstack-usage
    )

    target_link_options(${target}
        PRIVATE
        -Wl,--print-memory-usage
    )
endfunction()
