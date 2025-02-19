function(add_modbus_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES)
    set(options)

    cmake_parse_arguments(MODBUS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${MODBUS_TARGET_NAME} STATIC)

    target_sources(
        ${MODBUS_TARGET_NAME}
        PRIVATE
        ${MODBUS_PATH}/src/modbus.c
    )

    # Extra includes
    foreach(INC ${MODBUS_EXTRA_INCLUDES})
        target_include_directories(${MODBUS_TARGET_NAME}
            PUBLIC
            ${INC}
        )
    endforeach()

    # Link dependencies libraries
    foreach(DEPENDENCY ${MODBUS_DEPENDENCIES})
        target_link_libraries(${MODBUS_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()

    target_include_directories(
        ${MODBUS_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${MODBUS_PATH}
    )
endfunction()
