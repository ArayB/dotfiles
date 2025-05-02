set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set inccommand=split
set nohlsearch

lua << EOF
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#931f29" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#aa7b22" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#1061a2" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#b17135" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#608d3f" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#76248f" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#2f7983" })
end)

require("ibl").setup { indent = { highlight = highlight } }
EOF

