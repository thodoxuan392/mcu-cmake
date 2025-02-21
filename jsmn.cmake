function(add_jsmn_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES)
    set(options)

    cmake_parse_arguments(JSMN "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${JSMN_TARGET_NAME} INTERFACE)

    target_include_directories(
        ${JSMN_TARGET_NAME}
        SYSTEM
        INTERFACE
        ${JSMN_PATH}
    )
endfunction()
