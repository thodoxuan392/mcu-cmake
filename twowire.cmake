function(add_twowire_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES PREPROCESSOR)
    set(options)

    cmake_parse_arguments(TWOWIRE "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${TWOWIRE_TARGET_NAME} STATIC)

    target_sources(
        ${TWOWIRE_TARGET_NAME}
        PRIVATE
        ${TWOWIRE_PATH}/src/Wire.cpp
    )

    # Extra includes
    foreach(INC ${TWOWIRE_EXTRA_INCLUDES})
        target_include_directories(${TWOWIRE_TARGET_NAME}
            INTERFACE
            ${INC}
        )
    endforeach()

    # Preprocessor
    foreach(PP ${TWOWIRE_PREPROCESSOR})
        target_compile_definitions(${TWOWIRE_TARGET_NAME}
            PUBLIC
            ${PP}
        )
    endforeach()

    target_include_directories(
        ${TWOWIRE_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${TWOWIRE_PATH}/src
    )
endfunction()
