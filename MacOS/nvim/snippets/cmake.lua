-- LuaSnip from_lua format: s, t, i, f, fmt etc. are provided as globals
return {
  -- basic CMakeLists.txt template
  s(
    "cmake",
    fmt(
      [[
cmake_minimum_required(VERSION {})
project({} LANGUAGES CXX)

set(CMAKE_CXX_STANDARD {})
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(${{PROJECT_NAME}} {})
]],
      {
        i(1, "3.20"),
        i(2, "MyProject"),
        i(3, "17"),
        i(4, "main.cpp"),
      }
    )
  ),

  -- CMake library project template
  s(
    "cmakelib",
    fmt(
      [[
cmake_minimum_required(VERSION {})
project({} LANGUAGES CXX)

set(CMAKE_CXX_STANDARD {})
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_library(${{PROJECT_NAME}} {})

target_include_directories(${{PROJECT_NAME}} PUBLIC
  $<BUILD_INTERFACE:${{CMAKE_CURRENT_SOURCE_DIR}}/include>
  $<INSTALL_INTERFACE:include>
)
]],
      {
        i(1, "3.20"),
        i(2, "MyLib"),
        i(3, "17"),
        i(4, "src/lib.cpp"),
      }
    )
  ),

  -- add_executable
  s("exe", fmt("add_executable({} {})", { i(1, "${PROJECT_NAME}"), i(2, "main.cpp") })),

  -- add_library
  s("lib", fmt("add_library({} {})", { i(1, "${PROJECT_NAME}"), i(2, "src/lib.cpp") })),

  -- find_package
  s("find", fmt("find_package({} {})", { i(1, "PackageName"), i(2, "REQUIRED") })),

  -- target_link_libraries
  s("link", fmt("target_link_libraries({} {})", { i(1, "${PROJECT_NAME}"), i(2, "PRIVATE lib") })),

  -- target_include_directories
  s("incdir", fmt("target_include_directories({} {} {})", { i(1, "${PROJECT_NAME}"), i(2, "PUBLIC"), i(3, "include") })),

  -- add_subdirectory
  s("sub", fmt("add_subdirectory({})", { i(1, "src") })),

  -- set variable
  s("set", fmt("set({} {})", { i(1, "VAR"), i(2, "value") })),

  -- option
  s("opt", fmt('option({} "{}" {})', { i(1, "USE_FEATURE"), i(2, "Enable feature"), i(3, "OFF") })),

  -- if block
  s(
    "if",
    fmt(
      [[
if({})
  {}
endif()
]],
      { i(1, "CONDITION"), i(2) }
    )
  ),

  -- FetchContent for external deps
  s(
    "fetch",
    fmt(
      [[
include(FetchContent)
FetchContent_Declare(
  {}
  GIT_REPOSITORY {}
  GIT_TAG {}
)
FetchContent_MakeAvailable({})
]],
      {
        i(1, "lib_name"),
        i(2, "https://github.com/user/repo.git"),
        i(3, "main"),
        rep(1),
      }
    )
  ),
}
