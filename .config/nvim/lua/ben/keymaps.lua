local keymap = vim.keymap.set
local command = vim.cmd

-- Leader
vim.g.mapleader = " "

--		Core
-- Window Navigation
keymap("n", "<c-k>", ":wincmd k<CR>")
keymap("n", "<c-j>", ":wincmd j<CR>")
keymap("n", "<c-h>", ":wincmd h<CR>")
keymap("n", "<c-l>", ":wincmd l<CR>")

-- Tabs
keymap("n", "<leader>tn", command.tabnew)
keymap("n", "<leader>tm", command.tabclose)
keymap("n", "<leader>th", command.tabp)
keymap("n", "<leader>tl", command.tabn)

-- Terminal
keymap("n", "<leader>tt", command.terminal)
keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

--		Plugins
-- Compile Mode
keymap("n", "<leader>cc", command.Compile)
keymap("n", "<leader>cr", command.Recompile)

-- File Explorer
keymap("n", "<leader>e", command.NvimTreeFindFileToggle)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap("n", "<leader>fs", "<cmd>Telescope grep_string<cr>")
