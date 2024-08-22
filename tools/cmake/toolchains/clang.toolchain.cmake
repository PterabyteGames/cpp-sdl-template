# Copyright 2024 - David Brown <david.brown@pterabytegames.com>
# SPDX-License-Identifier: MIT
set (CMAKE_C_COMPILER clang)
set (CMAKE_CXX_COMPILER clang++)

set (
	PTB_COMPILER_FLAGS_LIST
	-Weverything
	-Wno-c++98-compat-pedantic
	-Wno-c++20-compat
	-Wno-padded
	-Wno-exit-time-destructors
	-Wno-missing-prototypes
	-Wno-weak-vtables
	-Wno-global-constructors
)
