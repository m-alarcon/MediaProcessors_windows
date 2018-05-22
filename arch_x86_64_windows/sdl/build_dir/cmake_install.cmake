# Install script for directory: C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/SDL2")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir/libSDL2-static.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir/libSDL2.dll.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir/libSDL2.dll")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/libSDL2.dll" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/libSDL2.dll")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "C:/media_autobuild/msys64/mingw64/bin/strip.exe" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/libSDL2.dll")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir/libSDL2main.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2Targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2Targets.cmake"
         "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir/CMakeFiles/Export/cmake/SDL2Targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2Targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/SDL2Targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir/CMakeFiles/Export/cmake/SDL2Targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir/CMakeFiles/Export/cmake/SDL2Targets-noconfig.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/SDL2Config.cmake"
    "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir/SDL2ConfigVersion.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SDL2" TYPE FILE FILES
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_assert.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_atomic.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_audio.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_bits.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_blendmode.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_clipboard.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_config_android.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_config_iphoneos.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_config_macosx.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_config_minimal.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_config_pandora.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_config_psp.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_config_windows.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_config_winrt.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_config_wiz.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_copying.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_cpuinfo.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_egl.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_endian.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_error.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_events.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_filesystem.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_gamecontroller.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_gesture.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_haptic.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_hints.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_joystick.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_keyboard.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_keycode.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_loadso.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_log.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_main.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_messagebox.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_mouse.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_mutex.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_name.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_opengl.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_opengl_glext.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_opengles.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_opengles2.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_opengles2_gl2.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_opengles2_gl2ext.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_opengles2_gl2platform.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_opengles2_khrplatform.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_pixels.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_platform.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_power.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_quit.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_rect.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_render.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_revision.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_rwops.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_scancode.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_shape.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_stdinc.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_surface.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_system.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_syswm.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_test.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_test_assert.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_test_common.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_test_compare.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_test_crc32.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_test_font.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_test_fuzzer.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_test_harness.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_test_images.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_test_log.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_test_md5.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_test_random.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_thread.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_timer.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_touch.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_types.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_version.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_video.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/SDL_vulkan.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/begin_code.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/3rdplibs/sdl/include/close_code.h"
    "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir/include/SDL_config.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "C:/media_autobuild/MediaProcessors_selfcontained/arch_x86_64_windows/sdl/build_dir/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
