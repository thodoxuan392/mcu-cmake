function(add_vl53l0x_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES PREPROCESSOR)
    set(options)

    cmake_parse_arguments(VL53L0X "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${VL53L0X_TARGET_NAME} STATIC)

    target_sources(
        ${VL53L0X_TARGET_NAME}
        PRIVATE
        ${VL53L0X_PATH}/VL53L0X.cpp
    )

    # Extra includes
    foreach(INC ${VL53L0X_EXTRA_INCLUDES})
        target_include_directories(${VL53L0X_TARGET_NAME}
            PUBLIC
            ${INC}
        )
    endforeach()

    # Preprocessor
    foreach(PP ${VL53L0X_PREPROCESSOR})
        target_compile_definitions(${VL53L0X_TARGET_NAME}
            PUBLIC
            ${PP}
        )
    endforeach()

    target_include_directories(
        ${VL53L0X_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${VL53L0X_PATH}
    )

    # Link dependencies libraries
    foreach(DEPENDENCY ${VL53L0X_DEPENDENCIES})
        target_link_libraries(${VL53L0X_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()
endfunction()
