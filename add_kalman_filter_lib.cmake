include_guard()

# #######################################################################################################################
# Add CMSIS DSP                                               #
# #######################################################################################################################
# #######################################################################################################################
function(add_kalman_filter_lib)
    set(oneValueArgs TARGET_NAME PATH)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES)
    cmake_parse_arguments(KALMAN_FILTER "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if(NOT DEFINED KALMAN_FILTER_PATH)
        message(FATAL_ERROR "PATH argument required when calling add_kalman_filter_lib")
    endif()

    add_library(${KALMAN_FILTER_TARGET_NAME} STATIC)

    target_sources(${KALMAN_FILTER_TARGET_NAME}
        PRIVATE
        ${KALMAN_FILTER_PATH}/src/kalman_filter.c
    )

    target_include_directories(
        ${KALMAN_FILTER_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${KALMAN_FILTER_PATH}/src
    )
endfunction()
