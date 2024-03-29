local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"phaazon/hop.nvim",
	-- { "justinmk/vim-sneak" },
	{ "tpope/vim-surround" },
	{ "tomtom/tcomment_vim" },
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = true },
	{ "windwp/nvim-ts-autotag" },
	{ "tpope/vim-fugitive" },
	{ "kyazdani42/nvim-web-devicons" },
	{ "nvim-tree/nvim-tree.lua" },
	{ "nvim-treesitter/nvim-treesitter" },
	{ "joshdick/onedark.vim" },
	{ "rebelot/kanagawa.nvim" },
	{ "folke/flash.nvim" },
	{ "github/copilot.vim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "akinsho/bufferline.nvim" },
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	-- cmp
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	-- snippets
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/vim-vsnip" },
	{ "hrsh7th/vim-vsnip-integ" },
	{ "rafamadriz/friendly-snippets" },
	--mason
	{ "folke/which-key.nvim" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "jay-babu/mason-null-ls.nvim" },
	{ "linrongbin16/lsp-progress.nvim" },
	{ "nvim-lualine/lualine.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{
		"mattn/emmet-vim",
		setup = function() -- load stuff before the plugin is loaded
			vim.g.user_emmet_leader_key = "<C-m>"

			vim.g.user_emmet_settings = {
				indent_blockelement = 1,
			}
		end,
	},
	{ "dcampos/cmp-emmet-vim" },
	-- { "hrsh7th/vim-vsnip-integ" },
	-- { "SirVer/ultisnips" },
	-- { "honza/vim-snippets" },
	-- { "quangnguyen30192/cmp-nvim-ultisnips" },
	-- { "dcampos/cmp-snippy" },
	-- { "dcampos/nvim-snippy" },
	{ "mg979/vim-visual-multi" },
})
