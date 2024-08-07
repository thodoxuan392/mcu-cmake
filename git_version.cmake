function(git_get_version VERSION_TAG VERSION_TAG_NO_DIRTY VERSION_COMMIT)
    find_package(Git)

    if(GIT_FOUND)
        message("Git found: ${GIT_EXECUTABLE} in version ${GIT_VERSION_STRING}")
    endif(GIT_FOUND)

    # Default version
    set(VERSION_TAG "UNKNOWN" PARENT_SCOPE)
    set(VERSION_TAG_NO_DIRTY "UNKNOWN" PARENT_SCOPE)
    set(VERSION_COMMIT "UNKNOWN" PARENT_SCOPE)

    execute_process(
        COMMAND ${GIT_EXECUTABLE} describe --long --dirty --tags
        RESULT_VARIABLE CMD_SUCCESS
        OUTPUT_VARIABLE VERSION_RAW)

    if(VERSION_RAW STREQUAL "")
        message(FATAL_ERROR "Please create a version tag")
    endif()

    message(${VERSION_RAW} ${VERSION_RAW})

    if(${CMD_SUCCESS} STREQUAL "0")
        # Replace '-' with ';' to be detected as separators by CMake
        string(REPLACE "-" ";" VERSION_RAW ${VERSION_RAW})
        list(GET VERSION_RAW 0 TAG)
        list(GET VERSION_RAW 1 COMMIT_FROM_TAG)
        list(GET VERSION_RAW 2 COMMIT)

        # Remove the 'g' at the beginning of the commit
        string(SUBSTRING ${COMMIT} 1 -1 COMMIT)

        # Strip the strings
        string(STRIP ${TAG} TAG)
        string(STRIP ${COMMIT_FROM_TAG} COMMIT_FROM_TAG)
        string(STRIP ${COMMIT} COMMIT)

        set(VERSION_TAG_NO_DIRTY "${TAG}" PARENT_SCOPE)

        if(COMMIT_FROM_TAG STREQUAL "0")
            set(VERSION_TAG "${TAG}" PARENT_SCOPE)
        else()
            set(VERSION_TAG "${TAG}+${COMMIT_FROM_TAG}" PARENT_SCOPE)
        endif()

        list(LENGTH VERSION_RAW VERSION_LENGTH)

        if(${VERSION_LENGTH} GREATER 3)
            set(VERSION_COMMIT "${COMMIT}+" PARENT_SCOPE)
        else()
            set(VERSION_COMMIT "${COMMIT}" PARENT_SCOPE)
        endif()

    else()
        message(WARNING "Cannot read the version from git: ${CMD_SUCCESS}")
    endif()
endfunction()
