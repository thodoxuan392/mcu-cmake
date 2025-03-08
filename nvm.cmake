function(add_nvm_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES)
    set(options)

    cmake_parse_arguments(NVM "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${NVM_TARGET_NAME} STATIC)

    target_sources(
        ${NVM_TARGET_NAME}
        PRIVATE
        ${NVM_PATH}/Nvm.c
    )

    # Extra includes
    foreach(INC ${NVM_EXTRA_INCLUDES})
        target_include_directories(${NVM_TARGET_NAME}
            PUBLIC
            ${INC}
        )
    endforeach()

    # Link dependencies libraries
    foreach(DEPENDENCY ${NVM_DEPENDENCIES})
        target_link_libraries(${NVM_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()

    target_include_directories(
        ${NVM_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${NVM_PATH}
    )
endfunction()
