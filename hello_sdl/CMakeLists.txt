# Copyright 2024 - David Brown <david.brown@pterabytegames.com>
# SPDX-License-Identifier: MIT
add_executable (hello_sdl)

target_sources (
	hello_sdl

	PRIVATE
	src/main.cpp
)

set_target_properties (
	hello_sdl

	PROPERTIES
		CXX_STANDARD     23
		WIN32_EXECUTABLE $<PLATFORM_ID:Windows>
)

target_link_libraries (
	hello_sdl

	PRIVATE
	PtB::CompilerFlags
	PtB::Hello
	SDL3::SDL3
	fmt::fmt
)

