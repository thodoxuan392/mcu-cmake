function(add_cmsis6_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES PREPROCESSOR)
    set(options)

    cmake_parse_arguments(CMSIS6 "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${CMSIS6_TARGET_NAME} INTERFACE)

    set(CMSIS6_INCLUDE_DIR ${CMSIS6_PATH}/CMSIS/Core/Include PARENT_SCOPE)

    target_include_directories(
        ${CMSIS6_TARGET_NAME}
        SYSTEM
        INTERFACE
        ${CMSIS6_INCLUDE_DIR}
    )
endfunction()
