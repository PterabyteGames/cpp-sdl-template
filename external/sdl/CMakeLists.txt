# Copyright 2024-2025 - David Brown <david.brown@pterabytegames.com>
# SPDX-License-Identifier: MIT
FetchContent_Declare (
	SDL3
	URL https://github.com/libsdl-org/SDL/archive/refs/tags/release-3.2.0.zip
	URL_HASH MD5=c8b5efd263936b157e63bf5c1fad4bc6 # v3.2.0

	SYSTEM
	OVERRIDE_FIND_PACKAGE
	DOWNLOAD_NO_PROGRESS TRUE
)

find_package (SDL3)
