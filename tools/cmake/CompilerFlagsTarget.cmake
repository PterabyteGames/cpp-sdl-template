# Copyright 2024 David Brown <d.brown@bigdavedev.com>
#
# SPDX-License-Identifier: MPL-2.0
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.
macro (ptb_create_compiler_flags_target)
	add_library (ptb_compiler_flags INTERFACE)
	add_library (PtB::CompilerFlags ALIAS ptb_compiler_flags)

	foreach (flag IN LISTS ptb_COMPILER_FLAGS_LIST)
		target_compile_options (ptb_compiler_flags INTERFACE ${flag})
	endforeach ()

	target_compile_features (ptb_compiler_flags INTERFACE cxx_std_23)
endmacro ()

macro (ptb_try_enable_ipo)
	include (CheckIPOSupported)

	check_ipo_supported(RESULT result OUTPUT output)
	if (result)
		set (CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE TRUE)
		set (CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELWITHDEBINFO TRUE)
		set (CMAKE_INTERPROCEDURAL_OPTIMIZATION_MINSIZEREL TRUE)
	else ()
		message (WARNING "IPO is not supported: ${output}")
	endif ()
endmacro ()

ptb_create_compiler_flags_target ()
