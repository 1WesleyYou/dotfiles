vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#FFBF00", fg = "NONE" })

if vim.o.background == "dark" then
  vim.cmd [[
    highlight clear RainbowDelimiterRed
    highlight RainbowDelimiterRed guifg=#f38ba8
    highlight clear RainbowDelimiterYellow
    highlight RainbowDelimiterYellow guifg=#fae3b0
    highlight clear RainbowDelimiterBlue
    highlight RainbowDelimiterBlue guifg=#89b4fa
    highlight clear RainbowDelimiterOrange
    highlight RainbowDelimiterOrange guifg=#f8bd96
    highlight clear RainbowDelimiterGreen
    highlight RainbowDelimiterGreen guifg=#abe9b3
    highlight clear RainbowDelimiterViolet
    highlight RainbowDelimiterViolet guifg=#cba6f7
    highlight clear RainbowDelimiterCyan
    highlight RainbowDelimiterCyan guifg=#89dceb
  ]]
else
  vim.cmd [[
    highlight clear RainbowDelimiterRed
    highlight RainbowDelimiterRed guifg=#de2c2e
    highlight clear RainbowDelimiterYellow
    highlight RainbowDelimiterYellow guifg=#b08800
    highlight clear RainbowDelimiterBlue
    highlight RainbowDelimiterBlue guifg=#015cc5
    highlight clear RainbowDelimiterOrange
    highlight RainbowDelimiterOrange guifg=#d15704
    highlight clear RainbowDelimiterGreen
    highlight RainbowDelimiterGreen guifg=#18654b
    highlight clear RainbowDelimiterViolet
    highlight RainbowDelimiterViolet guifg=#5b32a3
    highlight clear RainbowDelimiterCyan
    highlight RainbowDelimiterCyan guifg=#0798bc
  ]]
end
