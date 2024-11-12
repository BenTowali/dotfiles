return {
	-- Catppuccin theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme catppuccin")
		end,
		opts = {
			integrations = {
				markdown = true,
				mason = false,
				telescope = {
					enabled = true,
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		},
	},

	-- Show indentation
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = { indent = { char = "┊" } },
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		opts = { options = { theme = "catppuccin" } },
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		after = "catppuccin",
		version = "*",
		opts = {
			options = {
				indicator = {
					icon = "",
					style = "none",
				},
				mode = "tabs",
			},
		},
	},

	-- Colorizer
	{ "norcalli/nvim-colorizer.lua", opts = {} },

	-- Icons
	"nvim-tree/nvim-web-devicons",
}
