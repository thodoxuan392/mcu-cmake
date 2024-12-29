function(add_max3010x_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES PREPROCESSOR)
    set(options)

    cmake_parse_arguments(MAX3010 "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${MAX3010_TARGET_NAME} STATIC)

    target_sources(
        ${MAX3010_TARGET_NAME}
        PRIVATE
        ${MAX3010_PATH}/src/heartRate.cpp
        ${MAX3010_PATH}/src/MAX30105.cpp
        ${MAX3010_PATH}/src/spo2_algorithm.cpp
    )

    # Extra includes
    foreach(INC ${MAX3010_EXTRA_INCLUDES})
        target_include_directories(${MAX3010_TARGET_NAME}
            PUBLIC
            ${INC}
        )
    endforeach()

    # Preprocessor
    foreach(PP ${MAX3010_PREPROCESSOR})
        target_compile_definitions(${MAX3010_TARGET_NAME}
            PUBLIC
            ${PP}
        )
    endforeach()

    target_include_directories(
        ${MAX3010_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${MAX3010_PATH}/src
    )

    # Link dependencies libraries
    foreach(DEPENDENCY ${MAX3010_DEPENDENCIES})
        target_link_libraries(${MAX3010_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()
endfunction()
