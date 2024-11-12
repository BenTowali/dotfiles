return {
	-- Autopair parentheses and curly braces
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},

	-- Syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { "windwp/nvim-ts-autotag" },
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"cmake",
				"cpp",
				"css",
				"git_config",
				"git_rebase",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"html",
				"json",
				"ini",
				"lua",
				"make",
				"meson",
				"regex",
				"rust",
				"typescript",
				"yaml",
			},
			indent = { enable = true },
			highlight = { enable = true },
		},
	},
}
