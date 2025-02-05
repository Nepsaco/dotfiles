vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("v", "<C-c>", '"+y')

-- Buffer management
vim.keymap.set("n", "<leader>n", ":bn<CR>", { desc = "[B]uffer [N]ext" })
vim.keymap.set("n", "<leader>N", ":bp<CR>", { desc = "[B]uffer [P]revious" })
vim.keymap.set("n", "<leader>d", ":bdelete<CR>", { desc = "[B]uffer [D]elete" })
vim.keymap.set("n", "<Leader>D", ":bdelete!<CR>", { desc = "[B]uffer [D]elete Forever" })
vim.keymap.set("n", "<Leader><Tab>", ":b#<CR> ", { desc = "[B]uffer Last" })

-- Split navigation
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- Find and replace
vim.keymap.set("n", "<leader>fr", ":%s/", { desc = "[F]ind [R]eplace" })
vim.keymap.set("x", "<leader>fr", ":s/", { desc = "[F]ind [R]eplace" })
