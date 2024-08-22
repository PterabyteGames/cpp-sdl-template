# Copyright 2024 - David Brown <david.brown@pterabytegames.com>
# SPDX-License-Identifier: MIT
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
