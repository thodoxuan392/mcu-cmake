function(add_wic_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES)
    set(options)

    cmake_parse_arguments(WIC "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${WIC_TARGET_NAME} STATIC)

    target_sources(
        ${WIC_TARGET_NAME}
        PRIVATE
        ${WIC_PATH}/src/http_parser.c
        ${WIC_PATH}/src/wic.c
    )

    list(
        APPEND
        WIC_INCLUDE_DIRS
        ${WIC_PATH}/include
    )

    target_include_directories(
        ${WIC_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${WIC_INCLUDE_DIRS}
    )

    # Extra includes
    foreach(INC ${WIC_EXTRA_INCLUDES})
        target_include_directories(${WIC_TARGET_NAME}
            PUBLIC
            ${INC}
        )
    endforeach()

    # Link dependencies libraries
    foreach(DEPENDENCY ${WIC_DEPENDENCIES})
        target_link_libraries(${WIC_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()

    target_include_directories(
        ${WIC_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${WIC_PATH}
    )
endfunction()
