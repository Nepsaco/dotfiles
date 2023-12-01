local autocmd = vim.api.nvim_create_autocmd

vim.cmd(":TSInstall all")

vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("v", "<C-c>", '"+y')

-- Buffer management
vim.keymap.set("n", "<leader>n", ":bn<CR>")
vim.keymap.set("n", "<leader>N", ":bp<CR>")
vim.keymap.set("n", "<leader>d", ":bdelete<CR>")
vim.keymap.set("n", "<Leader>D", ":bdelete!<CR>")
vim.keymap.set("n", "<Leader><Tab>", ":b#<CR> ")

-- Split navigation
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- Find and replace
vim.keymap.set("n", "<leader>fr", ":%s/")
vim.keymap.set("x", "<leader>fr", ":s/")
