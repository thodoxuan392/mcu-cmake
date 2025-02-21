function(add_freertos_cellular_module_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES)
    set(options)

    cmake_parse_arguments(FREERTOS_CELLULAR_MODULE "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${FREERTOS_CELLULAR_MODULE_TARGET_NAME} STATIC)

    target_sources(
        ${FREERTOS_CELLULAR_MODULE_TARGET_NAME}
        PRIVATE
        ${FREERTOS_CELLULAR_MODULE_PATH}/esp32/cellular_esp32_api.c
        ${FREERTOS_CELLULAR_MODULE_PATH}/esp32/cellular_esp32_urc_handler.c
        ${FREERTOS_CELLULAR_MODULE_PATH}/esp32/cellular_esp32_wrapper.c
        ${FREERTOS_CELLULAR_MODULE_PATH}/esp32/cellular_esp32.c
        ${FREERTOS_CELLULAR_MODULE_PATH}/sim7600/cellular_sim7600_api.c
        ${FREERTOS_CELLULAR_MODULE_PATH}/sim7600/cellular_sim7600_urc_handler.c
        ${FREERTOS_CELLULAR_MODULE_PATH}/sim7600/cellular_sim7600_wrapper.c
        ${FREERTOS_CELLULAR_MODULE_PATH}/sim7600/cellular_sim7600.c
    )

    list(
        APPEND
        FREERTOS_CELLULAR_MODULE_INCLUDE_DIRS
        ${FREERTOS_CELLULAR_MODULE_PATH}/esp32
        ${FREERTOS_CELLULAR_MODULE_PATH}/sim7600
    )

    target_include_directories(
        ${FREERTOS_CELLULAR_MODULE_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${FREERTOS_CELLULAR_MODULE_INCLUDE_DIRS}
    )

    # Extra includes
    foreach(INC ${FREERTOS_CELLULAR_MODULE_EXTRA_INCLUDES})
        target_include_directories(${FREERTOS_CELLULAR_MODULE_TARGET_NAME}
            PUBLIC
            ${INC}
        )
    endforeach()

    # Link dependencies libraries
    foreach(DEPENDENCY ${FREERTOS_CELLULAR_MODULE_DEPENDENCIES})
        target_link_libraries(${FREERTOS_CELLULAR_MODULE_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()

    target_include_directories(
        ${FREERTOS_CELLULAR_MODULE_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${FREERTOS_CELLULAR_MODULE_PATH}
    )
endfunction()
