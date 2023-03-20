require('catppuccin').setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true,
})
require("tokyonight").setup({
    style = 'storm',
    transparent = true,
})

vim.cmd [[colorscheme catppuccin]]
-- vim.cmd[[colorscheme tokyonight]]
