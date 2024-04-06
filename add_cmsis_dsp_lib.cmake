include_guard()

# #######################################################################################################################
# Add CMSIS DSP                                               #
# #######################################################################################################################
# #######################################################################################################################
function(add_cmsis_dsp)
    set(oneValueArgs PATH)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES)
    set(options
        USE_BASIC_MATH_FUNCTION
        USE_BAYES_FUNCTION
        USE_COMMON_TABLES_FUNCTION
        USE_COMPLEX_MATH_FUNCTION
        USE_CONTROLLER_FUNCTION
        USE_DISTANCE_FUNCTION
        USE_FAST_MATH_FUNCTION
        USE_FILTERING_FUNCTION
        USE_INTERPOLATION_FUNCTION
        USE_MATRIX_FUNCTION
        USE_QUATERNION_MATH_FUNCTION
        USE_SUPPORT_FUNCTION
        USE_SVM_FUNCTION
        USE_TRANSFORM_FUNCTION
        USE_WINDOW_FUNCTION
    )
    cmake_parse_arguments(CMSISDSP "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if(NOT DEFINED CMSISDSP_PATH)
        message(FATAL_ERROR "PATH argument required when calling add_cmsis_dsp")
    endif()

    add_subdirectory(${CMSISDSP_PATH})

    foreach(DEPS ${CMSISDSP_DEPENDENCIES})
        target_link_libraries(CMSISDSP ${DEPS})
    endforeach()
endfunction()
