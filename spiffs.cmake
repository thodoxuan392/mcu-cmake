function(add_spiffs_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES)
    set(options 
        USE_HAL_CALLBACK
        USE_SINGLETON
        USE_CACHE
        USE_CACHE_WR
        USE_READ_ONLY
        USE_MAGIC
        USE_MAGIC_LENGTH
        USE_TEMPORAL_FD_CACHE
        USE_IX_MAP)

    cmake_parse_arguments(SPIFFS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${SPIFFS_TARGET_NAME} STATIC)

    target_sources(
        ${SPIFFS_TARGET_NAME}
        PRIVATE
            ${SPIFFS_PATH}/src/spiffs_cache.c
            ${SPIFFS_PATH}/src/spiffs_check.c
            ${SPIFFS_PATH}/src/spiffs_gc.c
            ${SPIFFS_PATH}/src/spiffs_hydrogen.c
            ${SPIFFS_PATH}/src/spiffs_nucleus.c
    )

    target_compile_definitions(
        ${SPIFFS_TARGET_NAME}
        PRIVATE
            $<$<BOOL:SPIFFS_USE_HAL_CALLBACK>:SPIFFS_HAL_CALLBACK_EXTRA>
    )

    # Extra includes
    foreach(INC ${SPIFFS_EXTRA_INCLUDES})
        target_include_directories(${SPIFFS_TARGET_NAME}
        PUBLIC
            ${INC}
        )
    endforeach()

    # Link dependencies libraries
    foreach(DEPENDENCY ${SPIFFS_DEPENDENCIES})
        target_link_libraries(${SPIFFS_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()

    target_include_directories(
        ${SPIFFS_TARGET_NAME}
        SYSTEM
        PUBLIC
            ${SPIFFS_PATH}/src
    )
endfunction()