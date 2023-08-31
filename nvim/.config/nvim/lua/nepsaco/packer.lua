-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Navigation
	use({ "nvim-telescope/telescope.nvim", version = "*", requires = { { "nvim-lua/plenary.nvim" } } })
	use("nvim-lua/popup.nvim")
	use("theprimeagen/harpoon")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("romgrk/nvim-treesitter-context")
	use("nvim-treesitter/playground")

	-- IDE
	use("vim-test/vim-test")
	use("preservim/vimux")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "tzachar/cmp-tabnine", run = "./install.sh" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	})
	-- Editing
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use("tpope/vim-surround")
	use("tpope/vim-commentary")
	use("junegunn/vim-peekaboo")
	use("mbbill/undotree")
	use("itchyny/vim-qfedit")

	-- General
	use("tpope/vim-fugitive")
	use("tpope/vim-repeat")
	use("tpope/vim-unimpaired")
	use("editorconfig/editorconfig-vim")

	-- Style
	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("airblade/vim-gitgutter")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
end)
