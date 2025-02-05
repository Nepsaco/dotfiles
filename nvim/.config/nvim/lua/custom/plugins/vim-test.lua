return {
	"vim-test/vim-test",
	dependencies = { "preservim/vimux" },
	keys = {
		{ "<leader>tc", "<cmd>TestNearest RAILS_ENV=test<cr>", desc = "[T]est [C]ase" },
		{ "<leader>tf", "<cmd>TestFile RAILS_ENV=test<cr>", desc = "[T]est [F]ile" },
		{ "<leader>ta", "<cmd>TestSuite RAILS_ENV=test<cr>", desc = "[T]est [A]ll" },
		-- { "<leader>tcw", "<cmd>TestNearest --watch<cr>", desc = "[T]est [C]ase [W]atch" },
		-- { "<leader>tfw", "<cmd>TestNearest --watch<cr>", desc = "[T]est [F]ile [W]atch" },
		-- { "<leader>taw", "<cmd>TestNearest --watch<cr>", desc = "[T]est [A]ll [W]atch" },
	},
	config = function()
		vim.g["test#strategy"] = "vimux"
		vim.g["test#echo_command"] = 0
		vim.g["test#javascript#jest#executable"] = "yarn test --watchAll=false"
		vim.g["test#javascriptreact#jest#executable"] = "yarn test --watchAll=false"
		vim.g["test#typescript#jest#executable"] = "yarn test --watchAll=false"
		vim.g["test#typescriptreact#jest#executable"] = "yarn test --watchAll=false"
	end,
}
