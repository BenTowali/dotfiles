-- Leader
vim.g.mapleader = " "

-- File Explorer
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)

-- Window Navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Tab Navigation
vim.keymap.set("n", "<leader>to", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tm", ":tabn<CR>")
vim.keymap.set("n", "<leader>tn", ":tabp<CR>")
