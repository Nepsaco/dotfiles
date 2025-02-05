return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<Leader>ga", ":Git add %:p<CR><CR>", { desc = "[G]it [A]dd" })
		vim.keymap.set("n", "<Leader>gs", ":Git<CR>", { desc = "[G]it [S]tatus" })
		vim.keymap.set("n", "<Leader>gc", ":Git commit -v -q<CR>", { desc = "[G]it [C]ommit" })
		vim.keymap.set("n", "<Leader>gp", ":!git push -u origin HEAD<CR>", { desc = "[G]it [P]ush" })
	end,
}
