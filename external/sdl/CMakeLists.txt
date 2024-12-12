# Copyright 2024 - David Brown <david.brown@pterabytegames.com>
# SPDX-License-Identifier: MIT
FetchContent_Declare (
	SDL3
	GIT_REPOSITORY https://github.com/libsdl-org/SDL
	GIT_TAG 2635239bbcbfdc9208427e7b18a26b771a2f6ac9 # main as of 2024-12-12 09:33

	SYSTEM
	OVERRIDE_FIND_PACKAGE
)

find_package (SDL3)
