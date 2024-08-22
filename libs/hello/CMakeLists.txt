add_library (ptb_hello)
add_library (PtB::Hello ALIAS ptb_hello)

target_sources (
	ptb_hello

	PRIVATE
	include/ptb/hello/hello.hpp

	src/ptb/hello/hello.cpp
)

target_include_directories (
	ptb_hello

	PUBLIC
	$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
	$<INSTALL_INTERFACE:include>
)

target_link_libraries (
	ptb_hello

	PUBLIC
	PtB::CompilerFlags
)

if (PTB_ENABLE_TESTING)
	add_subdirectory (tests)
endif ()
