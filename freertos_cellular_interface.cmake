function(add_freertos_cellular_inteface_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES)
    set(options)

    cmake_parse_arguments(FREERTOS_CELLULAR_INTERFACE "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${FREERTOS_CELLULAR_INTERFACE_TARGET_NAME} STATIC)

    target_sources(
        ${FREERTOS_CELLULAR_INTERFACE_TARGET_NAME}
        PRIVATE
        ${FREERTOS_CELLULAR_INTERFACE_PATH}/source/cellular_3gpp_api.c
        ${FREERTOS_CELLULAR_INTERFACE_PATH}/source/cellular_3gpp_urc_handler.c
        ${FREERTOS_CELLULAR_INTERFACE_PATH}/source/cellular_at_core.c
        ${FREERTOS_CELLULAR_INTERFACE_PATH}/source/cellular_common_api.c
        ${FREERTOS_CELLULAR_INTERFACE_PATH}/source/cellular_common.c
        ${FREERTOS_CELLULAR_INTERFACE_PATH}/source/cellular_pkthandler.c
        ${FREERTOS_CELLULAR_INTERFACE_PATH}/source/cellular_pktio.c
    )

    list(
        APPEND
        FREERTOS_CELLULAR_INTERFACE_INCLUDE_DIRS
        ${FREERTOS_CELLULAR_INTERFACE_PATH}/source/include
        ${FREERTOS_CELLULAR_INTERFACE_PATH}/source/include/common
        ${FREERTOS_CELLULAR_INTERFACE_PATH}/source/include/private
        ${FREERTOS_CELLULAR_INTERFACE_PATH}/source/interface
        ${FREERTOS_CELLULAR_INTERFACE_PATH}/source
    )

    target_include_directories(
        ${FREERTOS_CELLULAR_INTERFACE_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${FREERTOS_CELLULAR_INTERFACE_INCLUDE_DIRS}
    )

    # Extra includes
    foreach(INC ${FREERTOS_CELLULAR_INTERFACE_EXTRA_INCLUDES})
        target_include_directories(${FREERTOS_CELLULAR_INTERFACE_TARGET_NAME}
            PUBLIC
            ${INC}
        )
    endforeach()

    # Link dependencies libraries
    foreach(DEPENDENCY ${FREERTOS_CELLULAR_INTERFACE_DEPENDENCIES})
        target_link_libraries(${FREERTOS_CELLULAR_INTERFACE_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()

    target_include_directories(
        ${FREERTOS_CELLULAR_INTERFACE_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${FREERTOS_CELLULAR_INTERFACE_PATH}
    )
endfunction()
