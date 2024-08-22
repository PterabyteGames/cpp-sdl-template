add_executable (hello_tests)

target_sources (
	hello_tests

	PRIVATE
	hello_tests.cpp
)

target_link_libraries (
	hello_tests

	PRIVATE
	PtB::CompilerFlags
	PtB::Hello

	gtest
	gtest_main
)

add_test (
	NAME PtBHelloTests
	COMMAND hello_tests
)
