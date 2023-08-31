local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = true,
})
local util = require("lspconfig.util")

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local formatting_group = vim.api.nvim_create_augroup("LspFormatting", {})

lsp.setup_nvim_cmp({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "cmp_tabnine" },
		{ name = "luasnip", keyword_length = 2 },
	},
})

lsp.on_attach(function(client, bufnr)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
	end
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = formatting_group, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = formatting_group,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
end)

lsp.configure("eslint", {
	on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
	codeActionOnSave = {
		enable = true,
		mode = "all",
	},
	format = true,
})

lsp.configure("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = { maxLineLength = 200 },
			},
		},
	},
})

lsp.configure("pyright", {
	root_dir = function(fname)
		local root_files = {
			"pyproject.toml",
			"setup.py",
			"setup.cfg",
			"requirements.txt",
			"Pipfile",
			"pyrightconfig.json",
		}
		return util.find_git_ancestor(fname) or util.root_pattern(unpack(root_files))(fname) or util.path.dirname(fname)
	end,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
