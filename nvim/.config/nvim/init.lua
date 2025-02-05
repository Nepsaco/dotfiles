require("custom")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"itchyny/vim-qfedit",
	"tpope/vim-sleuth",
	"tpope/vim-surround",
	"tpope/vim-unimpaired",
	require("custom.plugins.autopairs"),
	require("custom.plugins.colorscheme"),
	require("custom.plugins.conform"),
	require("custom.plugins.neogit"),
	require("custom.plugins.gitsigns"),
	require("custom.plugins.lazydev"),
	require("custom.plugins.lint"),
	require("custom.plugins.lsp-config"),
	require("custom.plugins.mini-nvim"),
	require("custom.plugins.nvim-cmp"),
	require("custom.plugins.oil"),
	require("custom.plugins.peek"),
	require("custom.plugins.telescope"),
	require("custom.plugins.todo-comments"),
	require("custom.plugins.treesitter"),
	require("custom.plugins.treesitter-context"),
	require("custom.plugins.undotree"),
	require("custom.plugins.vim-test"),
	require("custom.plugins.which-key"),
	require("custom.plugins.codium"),
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"dense-analysis/ale",
		config = function()
			-- Configuration goes here.
			local g = vim.g

			-- g.ale_ruby_rubocop_auto_correct_all = 1
			g.ale_disable_lsp = 1
			g.ale_completion_autoimport = 0
			g.ale_fix_on_save = 1

			g.ale_linters = {
				-- ruby = { "rubocop", "ruby" },
				javascript = { "xo", "javascript" },
				javascriptreact = { "xo", "javascriptreact" },
				typescript = { "xo", "typescript" },
				typescriptreact = { "xo", "typescriptreact" },
				lua = { "lua_language_server" },
			}

			g.ale_fixers = {
				javascript = { "xo" },
				javascriptreact = { "xo" },
				typescript = { "xo" },
				typescriptreact = { "xo" },
			}
		end,
	},
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
