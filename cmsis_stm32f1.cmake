function(add_cmsis6_stm32f1_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES PREPROCESSOR)
    set(options)

    cmake_parse_arguments(CMSIS_STM32F1 "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${CMSIS_STM32F1_TARGET_NAME} INTERFACE)

    target_include_directories(
        ${CMSIS_STM32F1_TARGET_NAME}
        SYSTEM
        INTERFACE
        ${CMSIS_STM32F1_PATH}/Include
    )

    # Extra includes
    foreach(INC ${CMSIS_STM32F1_EXTRA_INCLUDES})
        target_include_directories(${CMSIS_STM32F1_TARGET_NAME}
            SYSTEM
            INTERFACE
            ${INC}
        )
    endforeach()
endfunction()
