include (FetchContent)

block (SCOPE_FOR VARIABLES)
	set (NINJA_REPOSITORY https://github.com/ninja-build/ninja/releases/download)
	set (NINJA_VERSION "v1.12.1")
	string (TOLOWER "${CMAKE_HOST_SYSTEM_NAME}" host)
	FetchContent_Declare (ninja.Windows URL ${NINJA_REPOSITORY}/${NINJA_VERSION}/ninja-win.zip)
	FetchContent_Declare (ninja.Darwin URL ${NINJA_REPOSITORY}/${NINJA_VERSION}/ninja-mac.zip)
	FetchContent_Declare (ninja.Linux URL ${NINJA_REPOSITORY}/${NINJA_VERSION}/ninja-linux.zip)
	FetchContent_MakeAvailable (ninja.${CMAKE_HOST_SYSTEM_NAME})
	set (CMAKE_FIND_ROOT_PATH "${ninja.${host}_SOURCE_DIR}")
	find_program (CMAKE_MAKE_PROGRAM NAMES ninja)
endblock ()