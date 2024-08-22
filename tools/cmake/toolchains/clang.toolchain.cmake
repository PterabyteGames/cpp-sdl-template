# Copyright 2024 David Brown <d.brown@bigdavedev.com>
#
# SPDX-License-Identifier: MPL-2.0
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.
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
