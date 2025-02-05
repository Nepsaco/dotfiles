return {
	"stevearc/oil.nvim",
	lazy = false,
	keys = { { "-", "<cmd>Oil<cr>", desc = "Toggle file explorer" } },
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
