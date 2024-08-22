# Copyright 2024 - David Brown <david.brown@pterabytegames.com>
# SPDX-License-Identifier: MIT
FetchContent_Declare (
	SDL3
	GIT_REPOSITORY https://github.com/libsdl-org/SDL
	GIT_TAG 83adcb9d38930bb4dffab680aabe806ec3a8d5c1 # main as of 2024-08-16 16:47

	SYSTEM
	OVERRIDE_FIND_PACKAGE
)

find_package (SDL3)
