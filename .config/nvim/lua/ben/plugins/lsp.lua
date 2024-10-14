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

	-- Lsp
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"clangd",
					"html",
					"hyprls",
					"jsonls",
					"lua_ls",
					"mesonlsp",
					"rust_analyzer",
				},
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"prettier",
					"cmakelang",
					"gofumpt",
					"stylua",
					"clang-format",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }

					opts.desc = "Show documentation for what is under cursor"
					vim.keymap.set("n", "D", vim.lsp.buf.hover, opts)

					opts.desc = "Go to previous diagnostic"
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

					opts.desc = "Go to next diagnostic"
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

					opts.desc = "See available code actions"
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({ capabilities = capabilities })
				end,
				["lua_ls"] = function()
					-- configure lua server (with special settings)
					lspconfig["lua_ls"].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								-- make the language server recognize "vim" global
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,
			})
		end,
	},
}
