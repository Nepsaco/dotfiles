local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	on_attach = function()
		vim.lsp.buf.format()
	end,
	sources = {
		formatting.stylua,
		formatting.black,
		formatting.prettierd,
		formatting.markdownlint,
		diagnostics.stylelint,
	},
})
