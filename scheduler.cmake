function(add_scheduler_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES)
    set(options)

    cmake_parse_arguments(SCHEDULER "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${SCHEDULER_TARGET_NAME} STATIC)

    target_sources(
        ${SCHEDULER_TARGET_NAME}
        PRIVATE
        ${SCHEDULER_PATH}/scheduler.c
    )

    # Extra includes
    foreach(INC ${SCHEDULER_EXTRA_INCLUDES})
        target_include_directories(${SCHEDULER_TARGET_NAME}
            PUBLIC
            ${INC}
        )
    endforeach()

    # Link dependencies libraries
    foreach(DEPENDENCY ${SCHEDULER_DEPENDENCIES})
        target_link_libraries(${SCHEDULER_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()

    target_include_directories(
        ${SCHEDULER_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${SCHEDULER_PATH}
    )
endfunction()
