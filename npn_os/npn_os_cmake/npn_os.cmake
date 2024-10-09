set(SDK_PATH "C:/Users/naphuong/NamNP33/32bit_SDK/simplicity_sdk")
set(COPIED_SDK_PATH "simplicity_sdk_2024.6.1")

add_library(slc_npn_os OBJECT
    "../${COPIED_SDK_PATH}/hardware/board/src/sl_board_control_gpio.c"
    "../${COPIED_SDK_PATH}/hardware/board/src/sl_board_init.c"
    "../${COPIED_SDK_PATH}/hardware/driver/configuration_over_swo/src/sl_cos.c"
    "../${COPIED_SDK_PATH}/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_usart/sl_mx25_flash_shutdown.c"
    "../${COPIED_SDK_PATH}/platform/common/src/sl_assert.c"
    "../${COPIED_SDK_PATH}/platform/common/src/sl_core_cortexm.c"
    "../${COPIED_SDK_PATH}/platform/common/src/sl_syscalls.c"
    "../${COPIED_SDK_PATH}/platform/Device/SiliconLabs/EFR32MG22/Source/startup_efr32mg22.c"
    "../${COPIED_SDK_PATH}/platform/Device/SiliconLabs/EFR32MG22/Source/system_efr32mg22.c"
    "../${COPIED_SDK_PATH}/platform/driver/debug/src/sl_debug_swo.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_cmu.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_core.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_emu.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_gpio.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_msc.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_system.c"
    "../${COPIED_SDK_PATH}/platform/emlib/src/em_usart.c"
    "../${COPIED_SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager.c"
    "../${COPIED_SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager_hal_s2.c"
    "../${COPIED_SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager_init.c"
    "../${COPIED_SDK_PATH}/platform/service/clock_manager/src/sl_clock_manager_init_hal_s2.c"
    "../${COPIED_SDK_PATH}/platform/service/device_init/src/sl_device_init_dcdc_s2.c"
    "../${COPIED_SDK_PATH}/platform/service/device_init/src/sl_device_init_emu_s2.c"
    "../${COPIED_SDK_PATH}/platform/service/device_manager/clocks/sl_device_clock_efr32xg22.c"
    "../${COPIED_SDK_PATH}/platform/service/device_manager/src/sl_device_clock.c"
    "../${COPIED_SDK_PATH}/platform/service/interrupt_manager/src/sl_interrupt_manager_cortexm.c"
    "../${COPIED_SDK_PATH}/platform/service/memory_manager/src/sl_memory_manager_region.c"
    "../${COPIED_SDK_PATH}/platform/service/system/src/sl_system_init.c"
    "../${COPIED_SDK_PATH}/platform/service/system/src/sl_system_process_action.c"
    "../${COPIED_SDK_PATH}/platform/service/udelay/src/sl_udelay.c"
    "../${COPIED_SDK_PATH}/platform/service/udelay/src/sl_udelay_armv6m_gcc.S"
    "../app.c"
    "../autogen/sl_board_default_init.c"
    "../autogen/sl_event_handler.c"
    "../main.c"
)

target_include_directories(slc_npn_os PUBLIC
   "../config"
   "../autogen"
   "../."
    "../${COPIED_SDK_PATH}/platform/Device/SiliconLabs/EFR32MG22/Include"
    "../${COPIED_SDK_PATH}/hardware/board/inc"
    "../${COPIED_SDK_PATH}/platform/service/clock_manager/inc"
    "../${COPIED_SDK_PATH}/platform/service/clock_manager/src"
    "../${COPIED_SDK_PATH}/platform/CMSIS/Core/Include"
    "../${COPIED_SDK_PATH}/platform/common/inc"
    "../${COPIED_SDK_PATH}/hardware/driver/configuration_over_swo/inc"
    "../${COPIED_SDK_PATH}/platform/driver/debug/inc"
    "../${COPIED_SDK_PATH}/platform/service/device_manager/inc"
    "../${COPIED_SDK_PATH}/platform/service/device_init/inc"
    "../${COPIED_SDK_PATH}/platform/emlib/inc"
    "../${COPIED_SDK_PATH}/platform/service/interrupt_manager/inc"
    "../${COPIED_SDK_PATH}/platform/service/interrupt_manager/inc/arm"
    "../${COPIED_SDK_PATH}/platform/service/memory_manager/inc"
    "../${COPIED_SDK_PATH}/hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart"
    "../${COPIED_SDK_PATH}/platform/common/toolchain/inc"
    "../${COPIED_SDK_PATH}/platform/service/system/inc"
    "../${COPIED_SDK_PATH}/platform/service/udelay/inc"
)

target_compile_definitions(slc_npn_os PUBLIC
    "DEBUG_EFM=1"
    "EFR32MG22C224F512IM40=1"
    "SL_BOARD_NAME=\"BRD4182A\""
    "SL_BOARD_REV=\"B06\""
    "HARDWARE_BOARD_DEFAULT_RF_BAND_2400=1"
    "HARDWARE_BOARD_SUPPORTS_1_RF_BAND=1"
    "HARDWARE_BOARD_SUPPORTS_RF_BAND_2400=1"
    "HFXO_FREQ=38400000"
    "SL_COMPONENT_CATALOG_PRESENT=1"
    "CMSIS_NVIC_VIRTUAL=1"
    "CMSIS_NVIC_VIRTUAL_HEADER_FILE=\"cmsis_nvic_virtual.h\""
    "SL_CODE_COMPONENT_CORE=core"
)

target_link_libraries(slc_npn_os PUBLIC
    "-Wl,--start-group"
    "gcc"
    "c"
    "m"
    "nosys"
    "-Wl,--end-group"
)
target_compile_options(slc_npn_os PUBLIC
    $<$<COMPILE_LANGUAGE:C>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:C>:-mthumb>
    $<$<COMPILE_LANGUAGE:C>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:C>:-mfloat-abi=hard>
    $<$<COMPILE_LANGUAGE:C>:-Wall>
    $<$<COMPILE_LANGUAGE:C>:-Wextra>
    $<$<COMPILE_LANGUAGE:C>:-Os>
    $<$<COMPILE_LANGUAGE:C>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:C>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:C>:-fomit-frame-pointer>
    "$<$<COMPILE_LANGUAGE:C>:SHELL:-imacros sl_gcc_preinclude.h>"
    $<$<COMPILE_LANGUAGE:C>:-mcmse>
    $<$<COMPILE_LANGUAGE:C>:--specs=nano.specs>
    $<$<COMPILE_LANGUAGE:C>:-g>
    $<$<COMPILE_LANGUAGE:CXX>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:CXX>:-mthumb>
    $<$<COMPILE_LANGUAGE:CXX>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:CXX>:-mfloat-abi=hard>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
    $<$<COMPILE_LANGUAGE:CXX>:-Wall>
    $<$<COMPILE_LANGUAGE:CXX>:-Wextra>
    $<$<COMPILE_LANGUAGE:CXX>:-Os>
    $<$<COMPILE_LANGUAGE:CXX>:-fdata-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-ffunction-sections>
    $<$<COMPILE_LANGUAGE:CXX>:-fomit-frame-pointer>
    "$<$<COMPILE_LANGUAGE:CXX>:SHELL:-imacros sl_gcc_preinclude.h>"
    $<$<COMPILE_LANGUAGE:CXX>:-mcmse>
    $<$<COMPILE_LANGUAGE:CXX>:--specs=nano.specs>
    $<$<COMPILE_LANGUAGE:CXX>:-g>
    $<$<COMPILE_LANGUAGE:ASM>:-mcpu=cortex-m33>
    $<$<COMPILE_LANGUAGE:ASM>:-mthumb>
    $<$<COMPILE_LANGUAGE:ASM>:-mfpu=fpv5-sp-d16>
    $<$<COMPILE_LANGUAGE:ASM>:-mfloat-abi=hard>
    "$<$<COMPILE_LANGUAGE:ASM>:SHELL:-imacros sl_gcc_preinclude.h>"
    "$<$<COMPILE_LANGUAGE:ASM>:SHELL:-x assembler-with-cpp>"
)

set(post_build_command )
set_property(TARGET slc_npn_os PROPERTY C_STANDARD 17)
set_property(TARGET slc_npn_os PROPERTY CXX_STANDARD 17)
set_property(TARGET slc_npn_os PROPERTY CXX_EXTENSIONS OFF)

target_link_options(slc_npn_os INTERFACE
    -mcpu=cortex-m33
    -mthumb
    -mfpu=fpv5-sp-d16
    -mfloat-abi=hard
    -T${CMAKE_CURRENT_LIST_DIR}/../autogen/linkerfile.ld
    --specs=nano.specs
    "SHELL:-Xlinker -Map=$<TARGET_FILE_DIR:npn_os>/npn_os.map"
    -Wl,--gc-sections
    -Wl,--no-warn-rwx-segments
)

# BEGIN_SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
