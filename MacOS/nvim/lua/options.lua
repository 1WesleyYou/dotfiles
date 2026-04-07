vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "100"
vim.opt.wrap = true
vim.opt.textwidth = 80

function ReplaceChinesePunctuation()
  vim.api.nvim_command "silent! %s/，/, /g"
  vim.api.nvim_command 'silent! %s/“\\|”/"/g'
  vim.api.nvim_command [[silent! %s/‘\|’/'/g]]
  vim.api.nvim_command "silent! %s/；/; /g"
  vim.api.nvim_command "silent! %s/：/: /g"
  vim.api.nvim_command "silent! %s/！/! /g"
  vim.api.nvim_command "silent! %s/？/? /g"
  vim.api.nvim_command "silent! %s/（/(/g"
  vim.api.nvim_command "silent! %s/）/)/g"
  vim.api.nvim_command "silent! %s/【/[/g"
  vim.api.nvim_command "silent! %s/】/]/g"
  vim.api.nvim_command "silent! %s/《/</g"
  vim.api.nvim_command "silent! %s/》/>/g"
  vim.api.nvim_command "silent! %s/、/, /g"
  vim.api.nvim_command "silent! %s/…/.../g"
  vim.api.nvim_command "silent! %s/·/`/g"
  vim.api.nvim_command "silent! %s/。/;/g"
  vim.api.nvim_command "silent! %s/～/~/g"
  vim.api.nvim_command "silent! :Format<CR>"
  vim.api.nvim_command "silent! %s/•/-/g"
  vim.api.nvim_command "silent! %s/＃/#/g"
  vim.api.nvim_command "silent! %s/％/%/g"
  vim.api.nvim_command "silent! %s/＆/&/g"
  vim.api.nvim_command "silent! %s/◦/-/g" -- TODO:
  vim.api.nvim_command "nohlsearch"
  -- save file
end

function ReplaceGreekUnicodeWithLaTex()
  vim.api.nvim_command [[silent! %s/α/$\\alpha$/g ]]
  vim.api.nvim_command [[silent! %s/β/$\\beta$/g ]]
  vim.api.nvim_command [[silent! %s/γ/$\\gamma$/g ]]
  vim.api.nvim_command [[silent! %s/δ/$\\delta$/g ]]
  vim.api.nvim_command [[silent! %s/ε/$\\epsilon$/g ]]
  vim.api.nvim_command [[silent! %s/ζ/$\\zeta$/g ]]
  vim.api.nvim_command [[silent! %s/η/$\\eta$/g ]]
  vim.api.nvim_command [[silent! %s/θ/$\\theta$/g ]]
  vim.api.nvim_command [[silent! %s/ι/$\\iota$/g ]]
  vim.api.nvim_command [[silent! %s/κ/$\\kappa$/g ]]
  vim.api.nvim_command [[silent! %s/λ/$\\lambda$/g ]]
  vim.api.nvim_command [[silent! %s/μ/$\\mu$/g ]]
  vim.api.nvim_command [[silent! %s/ν/$\\nu$/g ]]
  vim.api.nvim_command [[silent! %s/ξ/$\\xi$/g ]]
  vim.api.nvim_command [[silent! %s/ο/$\\omicron$/g ]]
  vim.api.nvim_command [[silent! %s/π/$\\pi$/g ]]
  vim.api.nvim_command [[silent! %s/ρ/$\\rho$/g]]
  vim.api.nvim_command [[ silent! %s/σ/$\\sigma$/g ]] -- NOTE:
  vim.api.nvim_command [[ silent! %s/τ/$\\tau$/g ]] -- FIXME:
  vim.api.nvim_command [[ silent! %s/υ/$\\upsilon$/g ]] -- INFO:
  vim.api.nvim_command [[ silent! %s/φ/$\\phi$/g ]] -- TODO:
  vim.api.nvim_command [[ silent! %s/χ/$\\chi$/g ]] -- WARN:
  vim.api.nvim_command [[ silent! %s/ψ/$\\psi$/g ]]
  vim.api.nvim_command [[ silent! %s/ω/$\\omega$/g ]]
  vim.api.nvim_command [[ silent! %s/Α/$\\Alpha$/g ]]
end

function ReplaceUnicodePunctuation()
  vim.api.nvim_command [[ silent! %s/×/$\\times$/g ]]
  vim.api.nvim_command [[ silent! %s/÷/$\\div$/g ]]
  vim.api.nvim_command [[ silent! %s/±/$\\pm$/g ]]
  vim.api.nvim_command [[ silent! %s/√/$\\sqrt$/g ]]
  vim.api.nvim_command [[ silent! %s/∞/$\\infty$/g ]]
  vim.api.nvim_command [[ silent! %s/≠/$\\neq$/g ]]
  vim.api.nvim_command [[ silent! %s/≈/$\\approx$/g ]]
  vim.api.nvim_command [[ silent! %s/≤/$\\leq$/g ]]
  vim.api.nvim_command [[ silent! %s/≥/$\\geq$/g ]]
  vim.api.nvim_command [[ silent! %s/∑/$\\sum$/g ]]
  vim.api.nvim_command [[ silent! %s/∏/$\\prod$/g ]]
  vim.api.nvim_command [[ silent! %s/∫/$\\int$/g ]]
  vim.api.nvim_command [[ silent! %s/∂/$\\partial$/g ]]
  vim.api.nvim_command [[ silent! %s/∇/$\\nabla$/g ]]
  vim.api.nvim_command [[ silent! %s/→/$\\rightarrow$/g ]]
  vim.api.nvim_command [[ silent! %s/←/$\\leftarrow$/g ]]
  vim.api.nvim_command [[ silent! %s/↑/$\\uparrow$/g ]]
  vim.api.nvim_command [[ silent! %s/↓/$\\downarrow$/g ]]
  vim.api.nvim_command [[ silent! %s/↔/$\\leftrightarrow$/g ]]
  vim.api.nvim_command [[ silent! %s/⇌/$\\rightleftharpoons$/g ]]
  vim.api.nvim_command [[ silent! %s/∈/$\\in$/g ]]
  vim.api.nvim_command [[ silent! %s/∉/$\\notin$/g ]]
  vim.api.nvim_command [[ silent! %s/∩/$\\cap$/g ]]
  vim.api.nvim_command [[ silent! %s/∪/$\\cup$/g ]]
  vim.api.nvim_command [[ silent! %s/⊂/$\\subset$/g ]]
  vim.api.nvim_command [[ silent! %s/⊃/$\\supset$/g ]]
  vim.api.nvim_command [[ silent! %s/⊆/$\\subseteq$/g ]]
  vim.api.nvim_command [[ silent! %s/⊇/$\\supseteq$/g ]]
  vim.api.nvim_command [[ silent! %s/∅/$\\emptyset$/g ]]
  vim.api.nvim_command [[ silent! %s/∧/$\\wedge$/g ]]
  vim.api.nvim_command [[ silent! %s/∨/$\\vee$/g ]]
  vim.api.nvim_command [[ silent! %s/¬/$\\neg$/g ]]
  vim.api.nvim_command [[ silent! %s/⇒/$\\Rightarrow$/g ]]
  vim.api.nvim_command [[ silent! %s/⇔/$\\Leftrightarrow$/g ]]
  vim.api.nvim_command [[ silent! %s/∀/$\\forall$/g ]]
  vim.api.nvim_command [[ silent! %s/∃/$\\exists$/g ]]
  vim.api.nvim_command [[ silent! %s/∴/$\\therefore$/g ]]
  vim.api.nvim_command [[ silent! %s/∵/$\\because$/g ]]
  vim.api.nvim_command [[ silent! %s/°/$\\degree$/g ]]
  vim.api.nvim_command [[ silent! %s/⋈/$\\bowtie$/g ]]
end

function ReplaceAll()
  ReplaceChinesePunctuation()
  ReplaceGreekUnicodeWithLaTex()
  ReplaceUnicodePunctuation()
end

-- 设置快捷键映射（Leader 键 + rp）
vim.keymap.set("n", "<leader>rp", ReplaceAll, { noremap = true, silent = true, desc = "Replace Chinese punctuation" })

-- 初始化 C++ 项目配置文件（.clang-tidy / .clang-format）
vim.api.nvim_create_user_command("CppInit", function()
  local template_dir = vim.fn.stdpath "config" .. "/templates/cpp"
  local target_dir = vim.fn.getcwd()
  local files = { ".clang-tidy", ".clang-format" }
  for _, file in ipairs(files) do
    local src = template_dir .. "/" .. file
    local dst = target_dir .. "/" .. file
    if vim.fn.filereadable(dst) == 1 then
      vim.notify(file .. " already exists, skipped", vim.log.levels.WARN)
    else
      vim.fn.system { "cp", src, dst }
      vim.notify("Created " .. dst, vim.log.levels.INFO)
    end
  end
end, { desc = "Init C++ project config files (.clang-tidy, .clang-format)" })
