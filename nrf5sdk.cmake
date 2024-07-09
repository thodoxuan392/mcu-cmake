function(add_nrf52sdk_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES)
    set(options)

    cmake_parse_arguments(NRF5SDK "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${NRF5SDK_TARGET_NAME} STATIC)

    target_sources(
        ${NRF5SDK_TARGET_NAME}
        PRIVATE
    )

    # Extra includes
    foreach(INC ${NRF5SDK_EXTRA_INCLUDES})
        target_include_directories(${NRF5SDK_TARGET_NAME}
            PUBLIC
            ${INC}
        )
    endforeach()

    target_include_directories(
        ${NRF5SDK_TARGET_NAME}
        SYSTEM
        PUBLIC
    )
endfunction()
