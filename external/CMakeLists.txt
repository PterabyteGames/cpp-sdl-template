# Copyright 2024 - David Brown <david.brown@pterabytegames.com>
# SPDX-License-Identifier: MIT
include (FetchContent)

if (PTB_ENABLE_TESTING)
	add_subdirectory (googletest)
endif ()

add_subdirectory (sdl)
