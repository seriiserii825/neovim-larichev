require("bufferline").setup {
    options = {
        buffer_close_icon = '',
        mode = 'buffers',
        offsets = {
            {
                filetype = "neo-tree",
                text = "File Explorer",
                separator = true,
                padding = 1
            }
        },
        diagnostics = "nvim_lsp",
        indicator = {
            icon = '  ', -- this should be omitted if indicator style is not 'icon'
            style = 'icon'
        },
        -- separator_style = "slope"
    }
}
vim.keymap.set("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>")
vim.keymap.set("n", "<leader>a", ":w <bar> %bd <bar> e# <bar> bd# <CR>")
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<S-A-h>", "<cmd>BufferLineMovePrev<cr>")
vim.keymap.set("n", "<S-A-l>", "<cmd>BufferLineMoveNext<cr>")
vim.keymap.set("n", "<leader>be", "<cmd>BufferLineSortByExtension<cr>")
vim.keymap.set("n", "<leader>bd", "<cmd>BufferLineSortByDirectory<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>")
vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>")
vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>")
vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>")
vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>")
vim.keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>")
vim.keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>")
vim.keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>")
vim.keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>")
vim.keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>")
