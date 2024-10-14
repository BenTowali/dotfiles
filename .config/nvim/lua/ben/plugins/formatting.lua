return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			typescript = { "prettier" },
			yaml = { "prettier" },
			lua = { "stylua" },
			json = { "prettier" },
			rust = { "rustfmt" },
			cpp = { "clang-format" },
			go = { "gofumpt" },
			c = { "clang-format" },
			cmake = { "cmakelang" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		},
	},
}
