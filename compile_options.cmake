include_guard()

# Function add extra options
function(set_default_c_language #[[target]])
    if(${ARGC} GREATER 0)
        set(target ${ARGV0})
    else()
        set(target ${PROJECT_NAME})
    endif()

    set_target_properties(
        ${target}
        PROPERTIES
        C_STANDARD 11
        C_STANDARD_REQUIRED ON
        C_EXTENSIONS ON
    )
endfunction()

# Function set default cpp language
function(set_default_cxx_language #[[target]])
    if(${ARGC} GREATER 0)
        set(target ${ARGV0})
    else()
        set(target ${PROJECT_NAME})
    endif()

    set_target_properties(
        ${target}
        PROPERTIES
        CXX_STANDARD 17
        CXX_STANDARD_REQUIRED ON
        CXX_EXTENSIONS OFF
    )
endfunction()

# Function Set default gcc options to target
function(set_default_gcc_options #[[target]])
    if(${ARGC} GREATER 0)
        set(target ${ARGV0})
    else()
        set(target ${PROJECT_NAME})
    endif()

    target_compile_options(
        ${target}
        PRIVATE
        -ffunction-sections
        -fdata-sections
        -fsigned-char
        -fmessage-length=0
        -fshort-enums
    )
endfunction()

# Function Set linker script to target
function(set_linker_script #[[target]] #[[linkerScript]] #[[linkerFolder]])
    if(${ARGC} EQUAL 0)
        set(target ${PROJECT_NAME})
        set(linkerScript "${PROJECT_SOURCE_DIR}/LinkerScript.ld")
        set(linkerFolder "${PROJECT_SOURCE_DIR}")
    elseif(${ARGC} EQUAL 1)
        set(target ${ARGV0})
        set(linkerScript "${PROJECT_SOURCE_DIR}/LinkerScript.ld")
        set(linkerFolder "${PROJECT_SOURCE_DIR}")
    elseif(${ARGC} EQUAL 2)
        set(target ${ARGV0})
        set(linkerScript ${ARGV1})
        set(linkerFolder "${PROJECT_SOURCE_DIR}")
    else()
        set(target ${ARGV0})
        set(linkerScript ${ARGV1})
        set(linkerFolder ${ARGV2})
    endif()

    target_link_options(
        ${target}
        PRIVATE
        -L${linkerFolder}
        -T${linkerScript}
    )
    set_target_properties(
        ${target}
        PROPERTIES
        LINK_DEPENDS ${linkerScript}
    )
endfunction()
