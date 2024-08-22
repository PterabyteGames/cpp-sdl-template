// Copyright 2024 - David Brown <david.brown@pterabytegames.com>
// SPDX-License-Identifier: MPL-2.0
#include "ptb/hello/hello.hpp"

#include "gtest/gtest.h"

namespace ptb::hello::test
{
TEST(HelloTests, Greet)
{
	EXPECT_FALSE(greet().empty());
}
} // namespace ptb::hello::test
