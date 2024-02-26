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
    {'justinmk/vim-sneak'},
    {'tpope/vim-surround'},
    {'numToStr/Comment.nvim'},
    {'windwp/nvim-autopairs',
  event = "InsertEnter",
    config = true
},
{'windwp/nvim-ts-autotag'},
    {'tpope/vim-fugitive'},
    {'kyazdani42/nvim-web-devicons'},
   {'nvim-tree/nvim-tree.lua'},
	{'nvim-treesitter/nvim-treesitter'},
	{'neovim/nvim-lspconfig'},
	{'joshdick/onedark.vim'},
	{'rebelot/kanagawa.nvim'},
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {'nvim-lua/plenary.nvim'}
    }, 
    {'akinsho/bufferline.nvim'},
{'akinsho/toggleterm.nvim', version = "*", config = true},

})
