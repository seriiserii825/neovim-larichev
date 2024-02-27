require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "intelephense", "tsserver", "emmet_ls", "cssls" },
	automatic_installation = true,
})
