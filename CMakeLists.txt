# Copyright 2024 - David Brown <david.brown@pterabytegames.com>
# SPDX-License-Identifier: MIT
cmake_minimum_required (VERSION 3.25)

project (
	HelloSDL
	VERSION 0.1.0
	LANGUAGES C CXX
	DESCRIPTION "Template for creating SDL applications"
	HOMEPAGE_URL "https://github.com/PterabyteGames/cpp-sdl-template.git"
)

option (PTB_BUILD_DOCS "Generate documentation" OFF)
option (PTB_ENABLE_TESTING "Enable running tests" ON)
option (PTB_ENABLE_INSTALL "Enable packaging" ON)

list (PREPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/tools/cmake)

include (StageConfig)
include (CompilerFlagsTarget)

if (PTB_ENABLE_TESTING)
	enable_testing ()
endif ()

if (PTB_BUILD_DOCS)
	add_subdirectory (docs)
endif ()

add_subdirectory (external)
add_subdirectory (libs)
add_subdirectory (hello_sdl)

if (PTB_ENABLE_INSTALL)
	include (InstallRequiredSystemLibraries)
	install (
		TARGETS hello_sdl
		RUNTIME
	)

	get_target_property (SDL3InstallTarget SDL3::SDL3 ALIASED_TARGET)

	install (
		TARGETS ${SDL3InstallTarget}
		RUNTIME
	)

	set (CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
	set (CPACK_DEBIAN_PACKAGE_SECTION Miscellaneous)
	set (CPACK_DEBIAN_PACKAGE_MAINTAINER "Maintainer Name")
	include (CPack)
endif ()
