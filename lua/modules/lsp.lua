-- Setup language servers.
local lspconfig = require("lspconfig")
-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end
local capabilities = cmp_nvim_lsp.default_capabilities()
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
end
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})
lspconfig.intelephense.setup({
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

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
