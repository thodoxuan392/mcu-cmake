function(add_dw1000_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES PREPROCESSOR)
    set(options)

    cmake_parse_arguments(DW1000 "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${DW1000_TARGET_NAME} STATIC)

    target_sources(
        ${DW1000_TARGET_NAME}
        PRIVATE
        ${DW1000_PATH}/src/DW1000.cpp
        ${DW1000_PATH}/src/DW1000Device.cpp
        ${DW1000_PATH}/src/DW1000Mac.cpp
        ${DW1000_PATH}/src/DW1000Ranging.cpp
        ${DW1000_PATH}/src/DW1000Time.cpp
    )

    # Extra includes
    foreach(INC ${DW1000_EXTRA_INCLUDES})
        target_include_directories(${DW1000_TARGET_NAME}
            PUBLIC
            ${INC}
        )
    endforeach()

    # Preprocessor
    foreach(PP ${DW1000_PREPROCESSOR})
        target_compile_definitions(${DW1000_TARGET_NAME}
            PUBLIC
            ${PP}
        )
    endforeach()

    target_include_directories(
        ${DW1000_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${DW1000_PATH}/src
    )

    # Link dependencies libraries
    foreach(DEPENDENCY ${DW1000_DEPENDENCIES})
        target_link_libraries(${DW1000_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()
endfunction()
