# CMAKE generated file: DO NOT EDIT!
# Generated by "MSYS Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /C/media_autobuild/msys64/mingw64/bin/cmake.exe

# The command to remove a file.
RM = /C/media_autobuild/msys64/mingw64/bin/cmake.exe -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /C/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /C/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir

# Include any dependencies generated for this target.
include CMakeFiles/SDL2main.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/SDL2main.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/SDL2main.dir/flags.make

CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj: CMakeFiles/SDL2main.dir/flags.make
CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj: C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/src/main/windows/SDL_windows_main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/C/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj"
	/C/media_autobuild/msys64/mingw64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj   -c /C/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/src/main/windows/SDL_windows_main.c

CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.i"
	/C/media_autobuild/msys64/mingw64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /C/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/src/main/windows/SDL_windows_main.c > CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.i

CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.s"
	/C/media_autobuild/msys64/mingw64/bin/gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /C/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/src/main/windows/SDL_windows_main.c -o CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.s

CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj.requires:

.PHONY : CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj.requires

CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj.provides: CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj.requires
	$(MAKE) -f CMakeFiles/SDL2main.dir/build.make CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj.provides.build
.PHONY : CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj.provides

CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj.provides.build: CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj


# Object files for target SDL2main
SDL2main_OBJECTS = \
"CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj"

# External object files for target SDL2main
SDL2main_EXTERNAL_OBJECTS =

libSDL2main.a: CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj
libSDL2main.a: CMakeFiles/SDL2main.dir/build.make
libSDL2main.a: CMakeFiles/SDL2main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/C/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C static library libSDL2main.a"
	$(CMAKE_COMMAND) -P CMakeFiles/SDL2main.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SDL2main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/SDL2main.dir/build: libSDL2main.a

.PHONY : CMakeFiles/SDL2main.dir/build

CMakeFiles/SDL2main.dir/requires: CMakeFiles/SDL2main.dir/src/main/windows/SDL_windows_main.c.obj.requires

.PHONY : CMakeFiles/SDL2main.dir/requires

CMakeFiles/SDL2main.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/SDL2main.dir/cmake_clean.cmake
.PHONY : CMakeFiles/SDL2main.dir/clean

CMakeFiles/SDL2main.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MSYS Makefiles" /C/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl /C/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl /C/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir /C/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir /C/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir/CMakeFiles/SDL2main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/SDL2main.dir/depend

