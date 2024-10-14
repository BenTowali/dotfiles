return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	opts = {},
}
