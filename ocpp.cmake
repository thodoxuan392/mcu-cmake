function(add_ocpp_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES DEPENDENCIES)
    set(options)

    cmake_parse_arguments(OCPP "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${OCPP_TARGET_NAME} STATIC)

    target_sources(
        ${OCPP_TARGET_NAME}
        PRIVATE
        ${OCPP_PATH}/src/Ocpp.c
        ${OCPP_PATH}/src/OcppDateTime.c
        ${OCPP_PATH}/src/message/OcppAuthorize.c
        ${OCPP_PATH}/src/message/OcppBootNotification.c
        ${OCPP_PATH}/src/message/OcppCancelReservation.c
        ${OCPP_PATH}/src/message/OcppChangeAvailability.c
        ${OCPP_PATH}/src/message/OcppChangeConfiguration.c
        ${OCPP_PATH}/src/message/OcppClearCache.c
        ${OCPP_PATH}/src/message/OcppClearChargingProfile.c
        ${OCPP_PATH}/src/message/OcppDataTransfer.c
        ${OCPP_PATH}/src/message/OcppDiagnosticStatusNotification.c
        ${OCPP_PATH}/src/message/OcppFirmwareStatusNotification.c
        ${OCPP_PATH}/src/message/OcppGetCompositeSchedule.c
        ${OCPP_PATH}/src/message/OcppGetConfiguration.c
        ${OCPP_PATH}/src/message/OcppGetDiagnostics.c
        ${OCPP_PATH}/src/message/OcppGetLocalListVersion.c
        ${OCPP_PATH}/src/message/OcppHeartBeat.c
        ${OCPP_PATH}/src/message/OcppMeterValue.c
        ${OCPP_PATH}/src/message/OcppRemoteStartTransaction.c
        ${OCPP_PATH}/src/message/OcppRemoteStopTransaction.c
        ${OCPP_PATH}/src/message/OcppReserveNow.c
        ${OCPP_PATH}/src/message/OcppReset.c
        ${OCPP_PATH}/src/message/OcppSendLocalList.c
        ${OCPP_PATH}/src/message/OcppSetChargingProfile.c
        ${OCPP_PATH}/src/message/OcppStartTransaction.c
        ${OCPP_PATH}/src/message/OcppStatusNotification.c
        ${OCPP_PATH}/src/message/OcppStopTransaction.c
        ${OCPP_PATH}/src/message/OcppTriggerMessage.c
        ${OCPP_PATH}/src/message/OcppUnlockConnector.c
        ${OCPP_PATH}/src/message/OcppUpdateFirmware.c
    )

    # Extra includes
    foreach(INC ${OCPP_EXTRA_INCLUDES})
        target_include_directories(${OCPP_TARGET_NAME}
            PUBLIC
            ${INC}
        )
    endforeach()

    # Link dependencies libraries
    foreach(DEPENDENCY ${OCPP_DEPENDENCIES})
        target_link_libraries(${OCPP_TARGET_NAME}
            ${DEPENDENCY}
        )
    endforeach()

    target_include_directories(
        ${OCPP_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${OCPP_PATH}/include
        ${OCPP_PATH}/include/message
    )
endfunction()
