# Copyright - 2024 David Brown <d.brown@bigdavedev.com>
# SPDX-License-Identifier: MIT
include (FetchContent)

if (PTB_ENABLE_TESTING)
	add_subdirectory (googletest)
endif ()

add_subdirectory (sdl)
