set (INSTALL_GTEST OFF CACHE BOOL "Enable SDL installation target")

FetchContent_Declare (
	GTest
	GIT_REPOSITORY https://github.com/google/googletest
	GIT_TAG b514bdc898e2951020cbdca1304b75f5950d1f59 # v1.15.2

	SYSTEM
	OVERRIDE_FIND_PACKAGE
)

FetchContent_MakeAvailable (GTest)
