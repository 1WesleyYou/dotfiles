-- LuaSnip from_lua format: s, t, i, f, fmt etc. are provided as globals
return {
  s("ios", { t "#include <iostream>" }),
  s("dio", { t "#include <cstdio>" }),
  s("ivec", { t "#include <vector>" }),
  s("ique", { t "#include <queue>" }),
  s("def", fmt("#define {} {}", { i(1, "NAME"), i(2, "value") })),
  s("once", { t "#pragma once" }),
  s("headerguard", { t "#pragma once" }),

  -- .cpp file template
  s(
    "cppfile",
    fmt(
      [[
// Author: Yuchen You
// Date: {}
// Description: {}

{}]],
      {
        f(function() return os.date "%Y-%m-%d" end),
        i(1, ""),
        i(2),
      }
    )
  ),

  -- .h / .hpp header file template
  s(
    "hfile",
    fmt(
      [[
// Author: Yuchen You
// Date: {}
// Description: {}

#pragma once

{}]],
      {
        f(function() return os.date "%Y-%m-%d" end),
        i(1, ""),
        i(2),
      }
    )
  ),

  s("cout", fmt("std::cout << {} << std::endl;", { i(1) })),
  s("endl", { t "std::endl;" }),

  s(
    "main",
    fmt(
      [[
int main(int argc, char *argv[]) {{
  {}
  return 0;
}}]],
      { i(1) }
    )
  ),

  s(
    "optget",
    fmt(
      [[
int choice;
int index = 0;
struct option long_options[] = {{
  {{"{}", required_argument, nullptr, '{}'}},
  {{nullptr, 0, nullptr, '\0'}},
}};
while ((choice = getopt_long(argc, argv, "{}", long_options, &index)) != -1) {{
  {}
}}]],
      { i(1, "name"), i(2, "c"), i(3, "c:"), i(4) }
    )
  ),
}
