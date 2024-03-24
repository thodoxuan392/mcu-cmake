# ####################
# ## Target system ###
# ####################
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)

# #######################
# ## Select the tools ###
# #######################
if (WIN32 OR MSVC)
    set(CMAKE_C_COMPILER arm-none-eabi-gcc.exe)
    set(CMAKE_CXX_COMPILER arm-none-eabi-g++.exe)
    set(CMAKE_OBJCOPY arm-none-eabi-objcopy.exe)
    set(CMAKE_SIZE arm-none-eabi-size.exe)
elseif (UNIX)
    set(CMAKE_C_COMPILER arm-none-eabi-gcc)
    set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
    set(CMAKE_OBJCOPY arm-none-eabi-objcopy)
    set(CMAKE_SIZE arm-none-eabi-size) 
endif()


# ###########################################
# ## Set the default flags for the target ###
# ###########################################
# Default ASM Flags
set(CMAKE_ASM_FLAGS "-x assembler-with-cpp")

# Common options
add_compile_options(
    -mcpu=cortex-m4
    -mthumb
    -mfloat-abi=hard
    -mfpu=fpv4-sp-d16

    -fno-exceptions
    -ffunction-sections
    -fdata-sections
)

# C++ options
add_compile_options($<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>)

# Linker options
add_link_options(
    -mcpu=cortex-m4
    -mthumb
    -mfloat-abi=hard
    -mfpu=fpv4-sp-d16

    -fno-exceptions
    -fno-rtti
    -Xlinker
    --gc-sections
    --specs=nosys.specs
    --specs=nano.specs
)
