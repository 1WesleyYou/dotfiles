-- LuaSnip from_lua format: s, t, i, f, fmt etc. are provided as globals
return {
  s(
    "setup",
    fmt(
      [[
\documentclass{{article}}
\usepackage{{graphicx}}
\usepackage{{geometry}}
\usepackage{{biblatex}}
\usepackage{{amsmath,amssymb,amsfonts,mathtools}}
\title{{{}}}
\author{{{}}}
\date{{{}}}
\begin{{document}}
\maketitle
\section{{{}}}
{}
\end{{document}}]],
      {
        i(1, "Title"),
        i(2, "Yuchen You"),
        i(3, "\\today"),
        i(4, "Introduction"),
        i(5),
      }
    )
  ),
}
