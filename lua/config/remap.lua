vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

local opts = { noremap = true, silent = true } 

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- Move the selection 1 line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts) -- Move the selection 1 line down
vim.keymap.set("v", "Y", "\"+y", opts)             -- Copy the selection into the system clipboard

vim.keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

vim.keymap.set("n", "<leader>h", ":noh<CR>", { noremap = true, silent = true }, opts)
