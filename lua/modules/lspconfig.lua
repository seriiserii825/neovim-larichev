-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- rename
	keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- code action
	keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- got to declaration
	keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- go to implementation
	keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts) -- go to implementation
	keymap.set("n", "lf", vim.lsp.buf.format, opts) -- go to implementation
	keymap.set("n", "K", vim.lsp.buf.hover, opts) -- go to implementation

	-- if client.server_capabilities.document_formatting then
	--   vim.api.nvim_command [[augroup Format]]
	--   vim.api.nvim_command [[autocmd! * <buffer>]]
	--   vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
	--   vim.api.nvim_command [[augroup END]]
	-- end
	-- Add the below lines to `on_attach`
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["intelephense"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php" },
	settings = {
		intelephense = {
			files = {
				maxSize = 1000000,
			},
			environment = {
				includePaths = {
					"/home/serii/Sites/wordpress",
					"/home/serii/Sites/advanced-custom-fields-pro",
					"/home/serii/Sites/woocommerce",
				},
			},
		},
	},
})

-- configure css server
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "scss", "css" },
})

lspconfig["tsserver"].setup({
	capabilities = capabilities,
	single_file_support = true,
})

lspconfig["vuels"].setup({
	filetypes = { "vue" },
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = true
	end,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "php", "scss", "less", "svelte" },
})

-- configure lua server (with special settings)
lspconfig["ls_lua"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
