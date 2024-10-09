# Define minimal required version of CMake.
cmake_minimum_required(VERSION "3.25")

# Project definition
project(
	npn_os
	VERSION 1.0
	LANGUAGES C CXX ASM
)

# Include the definition of the slc_npn_os target,
# which contains the content of the SLC project
include(npn_os.cmake)

add_executable(npn_os
    # Add additional sources here
)

target_include_directories(npn_os PUBLIC
    # Add additional include paths here
)

target_compile_definitions(npn_os PUBLIC
    # Add additional macros here
)

target_compile_options(npn_os PUBLIC
    # Set additional compiler flags here
)

target_link_options(npn_os PUBLIC
    # Set additional linker flags here
)

# Link with the content defined in the SLC project
target_link_libraries(npn_os PRIVATE
    slc_npn_os
)

# Include managed project content if available
include(npn_os_project.cmake OPTIONAL RESULT_VARIABLE managed_project)
if(managed_project)
    message(STATUS "Using managed project content from ${managed_project}")
endif()

# Force the gcc linker command
set_target_properties(npn_os PROPERTIES LINKER_LANGUAGE C)

# Create .bin, .hex and .s37 artifacts after building the project
add_custom_command(TARGET npn_os
    POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O srec "$<TARGET_FILE:npn_os>" "$<TARGET_FILE_DIR:npn_os>/$<TARGET_FILE_BASE_NAME:npn_os>.s37"
    COMMAND ${CMAKE_OBJCOPY} -O ihex "$<TARGET_FILE:npn_os>" "$<TARGET_FILE_DIR:npn_os>/$<TARGET_FILE_BASE_NAME:npn_os>.hex"
    COMMAND ${CMAKE_OBJCOPY} -O binary "$<TARGET_FILE:npn_os>" "$<TARGET_FILE_DIR:npn_os>/$<TARGET_FILE_BASE_NAME:npn_os>.bin" 
)

# Run post-build pipeline to perform additional post-processing
if(post_build_command)
add_custom_command(TARGET npn_os
    POST_BUILD
    WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/..
    COMMAND ${post_build_command}
)
endif()