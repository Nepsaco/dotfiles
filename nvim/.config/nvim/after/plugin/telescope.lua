require('telescope').setup {
    defaults = {
        path_display = { "smart" },
    },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pp', builtin.find_files, {})
vim.keymap.set('n', '<leader>pfg', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
