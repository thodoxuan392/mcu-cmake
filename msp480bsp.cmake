function(add_m480_lib)
    set(oneValueArgs PATH TARGET_NAME)
    set(multiValueArgs EXTRA_INCLUDES)
    set(options)

    cmake_parse_arguments(M480 "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    add_library(${M480_TARGET_NAME} STATIC)

    target_sources(
        ${M480_TARGET_NAME}
        PRIVATE
        ${M480_PATH}/Library/StdDriver/src/acmp.c
        ${M480_PATH}/Library/StdDriver/src/bpwm.c
        ${M480_PATH}/Library/StdDriver/src/can.c
        ${M480_PATH}/Library/StdDriver/src/ccap.c
        ${M480_PATH}/Library/StdDriver/src/clk.c
        ${M480_PATH}/Library/StdDriver/src/crc.c
        ${M480_PATH}/Library/StdDriver/src/crypto.c
        ${M480_PATH}/Library/StdDriver/src/dac.c
        ${M480_PATH}/Library/StdDriver/src/eadc.c
        ${M480_PATH}/Library/StdDriver/src/ebi.c
        ${M480_PATH}/Library/StdDriver/src/ecap.c
        ${M480_PATH}/Library/StdDriver/src/emac.c
        ${M480_PATH}/Library/StdDriver/src/epwm.c
        ${M480_PATH}/Library/StdDriver/src/fmc.c
        ${M480_PATH}/Library/StdDriver/src/gpio.c
        ${M480_PATH}/Library/StdDriver/src/hsusbd.c
        ${M480_PATH}/Library/StdDriver/src/i2c.c
        ${M480_PATH}/Library/StdDriver/src/i2s.c
        ${M480_PATH}/Library/StdDriver/src/pdma.c
        ${M480_PATH}/Library/StdDriver/src/qei.c
        ${M480_PATH}/Library/StdDriver/src/qspi.c
        ${M480_PATH}/Library/StdDriver/src/retarget.c
        ${M480_PATH}/Library/StdDriver/src/rtc.c
        ${M480_PATH}/Library/StdDriver/src/sc.c
        ${M480_PATH}/Library/StdDriver/src/scuart.c
        ${M480_PATH}/Library/StdDriver/src/sdh.c
        ${M480_PATH}/Library/StdDriver/src/spi.c
        ${M480_PATH}/Library/StdDriver/src/spim.c
        ${M480_PATH}/Library/StdDriver/src/sys.c
        ${M480_PATH}/Library/StdDriver/src/timer.c
        ${M480_PATH}/Library/StdDriver/src/timer_pwm.c
        ${M480_PATH}/Library/StdDriver/src/trng.c
        ${M480_PATH}/Library/StdDriver/src/uart.c
        ${M480_PATH}/Library/StdDriver/src/usbd.c
        ${M480_PATH}/Library/StdDriver/src/usci_i2c.c
        ${M480_PATH}/Library/StdDriver/src/usci_spi.c
        ${M480_PATH}/Library/StdDriver/src/usci_uart.c
        ${M480_PATH}/Library/StdDriver/src/wdt.c
        ${M480_PATH}/Library/StdDriver/src/wwdt.c
    )

    # Extra includes
    foreach(INC ${M480_EXTRA_INCLUDES})
        target_include_directories(${M480_TARGET_NAME}
            PUBLIC
            ${INC}
        )
    endforeach()

    target_include_directories(
        ${M480_TARGET_NAME}
        SYSTEM
        PUBLIC
        ${M480_PATH}/Library/Device/Nuvoton/M480/Include
        ${M480_PATH}/Library/StdDriver/inc
        ${M480_PATH}/Library/CMSIS/Include
    )
endfunction()
