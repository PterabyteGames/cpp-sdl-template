# Copyright 2024 - David Brown <david.brown@pterabytegames.com>
# SPDX-License-Identifier: MIT

set (FMT_INSTALL OFF)

FetchContent_Declare (
	FMT
	GIT_REPOSITORY https://github.com/fmtlib/fmt
	GIT_TAG 0c9fce2ffefecfdce794e1859584e25877b7b592 # v11.0.2

	SYSTEM
	OVERRIDE_FIND_PACKAGE
)

find_package (FMT)
