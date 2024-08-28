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

	install (TARGETS hello_sdl RUNTIME)

	get_target_property (SDL3InstallTarget SDL3::SDL3 ALIASED_TARGET)
	install (TARGETS ${SDL3InstallTarget} RUNTIME)

	install (DIRECTORY data	TYPE DATA)

	set (CPACK_PACKAGE_CONTACT "David Brown <david.brown@pterabytegames.com>")
	set (CPACK_PACKAGE_EXECUTABLES "hello_sdl" "HelloSDL")

	if (LINUX)
		install (
			FILES extra/packaging/debian/icon.png
			DESTINATION ${CMAKE_INSTALL_DATADIR}/pixmaps
		)
		set (CPACK_DEBIAN_PACKAGE_SECTION "games")
		set (CPACK_PACKAGING_INSTALL_PREFIX "/opt/${PROJECT_NAME}")
		set (
			CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA
			${PROJECT_BINARY_DIR}/extra/packaging/debian/postinst
			${PROJECT_BINARY_DIR}/extra/packaging/debian/postrm
		)
		configure_file (
			extra/packaging/debian/template.desktop.in
			${PROJECT_BINARY_DIR}/extra/packaging/debian/PtB-${PROJECT_NAME}.desktop
			@ONLY
		)
		configure_file (
			extra/packaging/debian/postinst.in
			${PROJECT_BINARY_DIR}/extra/packaging/debian/postinst
			@ONLY
		)
		configure_file (
			extra/packaging/debian/postrm.in
			${PROJECT_BINARY_DIR}/extra/packaging/debian/postrm
			@ONLY
		)
		install (
			FILES ${PROJECT_BINARY_DIR}/extra/packaging/debian/PtB-${PROJECT_NAME}.desktop
			DESTINATION ${CMAKE_INSTALL_DATADIR}/applications
		)
	endif ()

	# Generate a GUID to use here. Open PowerShell and copy/paste the following:
	# [guid]::NewGuid()
	# Copy the GUID and insert in to the variables below
	#set (CPACK_WIX_UPGRADE_GUID "")
	#set (CPACK_WIX_PRODUCT_GUID "")
	set (CPACK_WIX_LICENSE_RTF  ${PROJECT_SOURCE_DIR}/extra/packaging/windows/licence.rtf)
	set (CPACK_WIX_UI_BANNER    ${PROJECT_SOURCE_DIR}/extra/packaging/windows/installer_banner.bmp)
	set (CPACK_WIX_UI_DIALOG    ${PROJECT_SOURCE_DIR}/extra/packaging/windows/installer_dialog.bmp)
	set (CPACK_WIX_PRODUCT_ICON ${PROJECT_SOURCE_DIR}/extra/packaging/windows/installer_icon.ico)
	include (CPack)
endif ()
