function(add_jsmn_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES PREPROCESSOR DEPENDENCIES)
    set(options)

    cmake_parse_arguments(JSMN "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${JSMN_TARGET_NAME} INTERFACE)

    # Preprocessor
    foreach(PP ${JSMN_PREPROCESSOR})
        target_compile_definitions(${JSMN_TARGET_NAME}
            INTERFACE
            ${PP}
        )
    endforeach()

    target_include_directories(
        ${JSMN_TARGET_NAME}
        SYSTEM
        INTERFACE
        ${JSMN_PATH}
    )
endfunction()
