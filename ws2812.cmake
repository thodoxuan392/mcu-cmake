function(add_ws2812_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES PREPROCESSOR)
    set(options)

    cmake_parse_arguments(WS2812 "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${WS2812_TARGET_NAME} STATIC)

    target_sources(
        ${WS2812_TARGET_NAME}
        PRIVATE
        ${WS2812_PATH}/light_ws2812_ARM/light_ws2812_cortex.c
    )

    # Extra includes
    foreach(INC ${WS2812_EXTRA_INCLUDES})
        target_include_directories(${WS2812_TARGET_NAME}
            PUBLIC
            ${INC}
        )
    endforeach()

    # Preprocessor
    foreach(PP ${WS2812_PREPROCESSOR})
        target_compile_definitions(${WS2812_TARGET_NAME}
            PUBLIC
            ${PP}
        )
    endforeach()

    target_include_directories(
        ${WS2812_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${WS2812_PATH}/light_ws2812_ARM
    )

    # Link dependencies libraries
    foreach(DEPENDENCY ${WS2812_DEPENDENCIES})
        target_link_libraries(${WS2812_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()
endfunction()
