#include "ptb/hello/hello.hpp"

#include "gtest/gtest.h"

namespace ptb::hello::test
{
TEST(HelloTests, Greet)
{
	EXPECT_FALSE(greet().empty());
}
} // namespace ptb::hello::test
