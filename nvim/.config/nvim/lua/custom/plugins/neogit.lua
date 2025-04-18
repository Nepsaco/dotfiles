return {
	"NeogitOrg/neogit",
	keys = {
		{
			"<leader>gs",
			"<cmd>Neogit<cr>",
			desc = "[G]it [S]tatus",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = true,
}
