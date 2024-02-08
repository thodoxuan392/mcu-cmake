function(add_utils_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES)
    set(options)

    cmake_parse_arguments(UTILS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${UTILS_TARGET_NAME} STATIC)

    target_sources(
        ${UTILS_TARGET_NAME}
        PRIVATE
            ${UTILS_PATH}/utils_buffer.c
            ${UTILS_PATH}/utils_string.c
            ${UTILS_PATH}/utils_logger.c
    )

    # Extra includes
    foreach(INC ${UTILS_EXTRA_INCLUDES})
        target_include_directories(${UTILS_TARGET_NAME}
        PUBLIC
            ${INC}
        )
    endforeach()

    # Link dependencies libraries
    foreach(DEPENDENCY ${UTILS_DEPENDENCIES})
        target_link_libraries(${UTILS_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()

    target_include_directories(
        ${UTILS_TARGET_NAME}
        SYSTEM
        PUBLIC
            ${UTILS_PATH}
    )
endfunction()
