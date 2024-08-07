include_guard()

# #######################################################################################################################
# Add freeRTOS library                                                  #
# #######################################################################################################################
# #
# Single value arguments:                                                                                              #
# PATH            : Path to FreeRTOS sources                                                                     #
# TARGET_NAME     : Name of the created target (default: FreeRTOS)                                               #
# TARGET_COMPILER : Set which "portable" source should be used (Compiler)                                        #
# The name should match a folder in "FreeRTOS-Kernel/portable"                                 #
# TARGET_ARCH     : Set which "portable" source should be used (Architecture)                                    #
# The name should match a folder in "FreeRTOS-Kernel/portable/TARGET_COMPILER"                 #
# USE_HEAP        : Should be set to a number, from 1 to 5. Refer to FreeRTOS documentation for the differences  #
# between the heap implementations. Default: Do not use heap                                   #
# #
# Multiple values arguments:                                                                                           #
# EXTRA_INCLUDES  : List of extra directories to include. Useful to let FreeRTOS find FreeRTOSConfig.h           #
# #
# Options:                                                                                                             #
# USE_TIMERS                                                                                                     #
# USE_EVENT_GROUPS                                                                                               #
# USE_STREAM_BUFFERS    : Will include the respective feature.                                                   #
# Refer to FreeRTOS documentation for more information                                   #
# #
# #######################################################################################################################
function(add_freertos_lib)
    set(oneValueArgs PATH TARGET_NAME TARGET_ARCH TARGET_COMPILER USE_HEAP)
    set(multiValueArgs EXTRA_INCLUDES PREPROCESSOR)
    set(options USE_TIMERS USE_EVENT_GROUPS USE_STREAM_BUFFERS)
    cmake_parse_arguments(FREERTOS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    # #########################
    # Check arguments       #
    # #########################
    # Default target name
    if(NOT DEFINED FREERTOS_TARGET_NAME)
        set(FREERTOS_TARGET_NAME FreeRTOS)
    endif()

    if(NOT DEFINED FREERTOS_PATH)
        message(FATAL_ERROR "PATH argument required when calling add_freertos_lib")
    endif()

    if(NOT DEFINED FREERTOS_TARGET_ARCH)
        message(FATAL_ERROR "TARGET_ARCH argument required when calling add_freertos_lib")
    endif()

    # #########################
    # Detect compiler       #
    # #########################
    if(DEFINED FREERTOS_TARGET_COMPILER)
        message("FreeRTOS configured for compiler ${FREERTOS_TARGET_COMPILER}")
    elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
        set(FREERTOS_TARGET_COMPILER "GCC")
    else()
        message(FATAL_ERROR
            "Compler id \"${CMAKE_CXX_COMPILER_ID}\" is not supported. You can edit the add_freertos_lib to add its support"
        )
    endif()

    # #########################
    # Create target         #
    # #########################
    add_library(${FREERTOS_TARGET_NAME} STATIC)

    # #########################
    # Add includes          #
    # #########################
    list(
        APPEND
        FREERTOS_INCLUDE_DIRS
        ${FREERTOS_PATH}/include
        ${FREERTOS_PATH}/portable/${FREERTOS_TARGET_COMPILER}/${FREERTOS_TARGET_ARCH}
        ${FREERTOS_EXTRA_INCLUDES}
    )

    target_include_directories(${FREERTOS_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${FREERTOS_INCLUDE_DIRS}
    )

    set(${FREERTOS_TARGET_NAME}_INCLUDE_DIRS ${FREERTOS_INCLUDE_DIRS} PARENT_SCOPE)

    # # Extra includes
    # foreach(INC)
    # target_include_directories(${FREERTOS_TARGET_NAME}
    # PUBLIC
    # ${INC}
    # )
    # endforeach()

    # #########################
    # Add sources           #
    # #########################
    target_sources(${FREERTOS_TARGET_NAME}
        PRIVATE
        ${FREERTOS_PATH}/tasks.c
        ${FREERTOS_PATH}/queue.c
        ${FREERTOS_PATH}/list.c
        ${FREERTOS_PATH}/portable/${FREERTOS_TARGET_COMPILER}/${FREERTOS_TARGET_ARCH}/port.c
    )

    # Optional sources
    if(DEFINED FREERTOS_USE_HEAP)
        target_sources(${FREERTOS_TARGET_NAME}
            PRIVATE
            ${FREERTOS_PATH}/portable/MemMang/heap_${FREERTOS_USE_HEAP}.c
        )
    endif()

    if(FREERTOS_USE_TIMERS)
        target_sources(${FREERTOS_TARGET_NAME}
            PRIVATE
            ${FREERTOS_PATH}/timers.c
        )
    endif()

    if(FREERTOS_USE_EVENT_GROUPS)
        target_sources(${FREERTOS_TARGET_NAME}
            PRIVATE
            ${FREERTOS_PATH}/event_groups.c
        )
    endif()

    if(FREERTOS_USE_STREAM_BUFFERS)
        target_sources(${FREERTOS_TARGET_NAME}
            PRIVATE
            ${FREERTOS_PATH}/stream_buffer.c
        )
    endif()

    # Preprocessor
    foreach(PP ${FREERTOS_PREPROCESSOR})
        target_compile_definitions(${FREERTOS_TARGET_NAME}
            PUBLIC
            ${PP}
        )
    endforeach()

    # Remove warnings for FreeRTOS
    target_compile_options(${FREERTOS_TARGET_NAME}
        PRIVATE
        -w
    )
endfunction()

function(find_freertos)
    set(oneValueArgs PATH TARGET_NAME TARGET_ARCH TARGET_COMPILER USE_HEAP)
    set(multiValueArgs EXTRA_INCLUDES PREPROCESSOR)
    set(options USE_TIMERS USE_EVENT_GROUPS USE_STREAM_BUFFERS)
    cmake_parse_arguments(FREERTOS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    # #########################
    # Check arguments       #
    # #########################
    # Default target name
    if(NOT DEFINED FREERTOS_TARGET_NAME)
        set(FREERTOS_TARGET_NAME FreeRTOS)
    endif()

    if(NOT DEFINED FREERTOS_PATH)
        message(FATAL_ERROR "PATH argument required when calling add_freertos_lib")
    endif()

    if(NOT DEFINED FREERTOS_TARGET_ARCH)
        message(FATAL_ERROR "TARGET_ARCH argument required when calling add_freertos_lib")
    endif()

    # #########################
    # Detect compiler       #
    # #########################
    if(DEFINED FREERTOS_TARGET_COMPILER)
        message("FreeRTOS configured for compiler ${FREERTOS_TARGET_COMPILER}")
    elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
        set(FREERTOS_TARGET_COMPILER "GCC")
    else()
        message(FATAL_ERROR
            "Compler id \"${CMAKE_CXX_COMPILER_ID}\" is not supported. You can edit the add_freertos_lib to add its support"
        )
    endif()

    # #########################
    # Add includes          #
    # #########################
    list(
        APPEND
        FREERTOS_INCLUDE_DIRS
        ${FREERTOS_PATH}/include
        ${FREERTOS_PATH}/portable/${FREERTOS_TARGET_COMPILER}/${FREERTOS_TARGET_ARCH}
        ${FREERTOS_EXTRA_INCLUDES}
    )
    set(${FREERTOS_TARGET_NAME}_INCLUDE_DIRS ${FREERTOS_INCLUDE_DIRS} PARENT_SCOPE)
endfunction(find_freertos)
