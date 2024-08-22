// Copyright - 2024 David Brown <d.brown@bigdavedev.com>
// SPDX-License-Identifier: MIT
#include "ptb/hello/hello.hpp"

#include "SDL3/SDL_init.h"
#include "SDL3/SDL_main.h"
#include "SDL3/SDL_messagebox.h"
#include "SDL3/SDL_error.h"

#include <format>
#include <iostream>

int main(int /*argc*/, char** /*argv*/)
{
	if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_EVENTS) != 0)
	{
		std::cerr << std::format("Error initialising SDL: {}\n",
		                         SDL_GetError());
		return -1;
	}

	auto title = ptb::hello::greet();
	SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_INFORMATION,
	                         title.c_str(),
	                         "You have successfully setup SDL.",
	                         nullptr);

	SDL_Quit();

	return 0;
}
