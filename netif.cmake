function(add_netif_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES PREPROCESSOR DEPENDENCIES)
    set(options)

    cmake_parse_arguments(NETIF "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${NETIF_TARGET_NAME} STATIC)

    target_sources(
        ${NETIF_TARGET_NAME}
        PRIVATE
        ${NETIF_PATH}/src/apps/netif_http.c
        ${NETIF_PATH}/src/apps/netif_mqtt.c
        ${NETIF_PATH}/src/apps/netif_tcp.c
        ${NETIF_PATH}/src/core/atcmd/netif_atcmd_4g.c
        ${NETIF_PATH}/src/core/atcmd/netif_atcmd_ethernet.c
        ${NETIF_PATH}/src/core/atcmd/netif_atcmd_http.c
        ${NETIF_PATH}/src/core/atcmd/netif_atcmd_mqtt.c
        ${NETIF_PATH}/src/core/atcmd/netif_atcmd_wifi.c
        ${NETIF_PATH}/src/core/atcmd/netif_atcmd.c
        ${NETIF_PATH}/src/core/netif_core.c
        ${NETIF_PATH}/src/manager/netif_4g.c
        ${NETIF_PATH}/src/manager/netif_ethernet.c
        ${NETIF_PATH}/src/manager/netif_wifi.c
        ${NETIF_PATH}/src/manager/netif_manager.c
        ${NETIF_PATH}/src/netif.c
    )

    list(
        APPEND
        NRFSDK_INCLUDE_DIRS
        ${NETIF_PATH}/inc
    )

    target_include_directories(
        ${NETIF_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${NRFSDK_INCLUDE_DIRS}
    )

    set(${NETIF_TARGET_NAME}_INCLUDE_DIRS ${NRFSDK_INCLUDE_DIRS} PARENT_SCOPE)

    # Extra includes
    foreach(INC ${NETIF_EXTRA_INCLUDES})
        target_include_directories(${NETIF_TARGET_NAME}
            PRIVATE
            ${INC}
        )
    endforeach()

    # Extra Preprocessor
    foreach(DEF ${NETIF_PREPROCESSOR})
        target_compile_definitions(${NETIF_TARGET_NAME}
            PRIVATE
            ${DEF}
        )
    endforeach()

    # Link dependencies libraries
    foreach(DEPENDENCY ${NETIF_DEPENDENCIES})
        target_link_libraries(${NETIF_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()
endfunction()
