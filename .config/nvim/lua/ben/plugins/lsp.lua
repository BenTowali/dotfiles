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

	-- LSP
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"bashls",
				"mesonlsp",
			},
		},
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "onsails/lspkind.nvim" },
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				completion = {
					completeopt = "menu,menuone,preview,noselect",
				},
				mapping = {
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<C-e"] = cmp.mapping.abort(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				},
				formatting = {
					format = require("lspkind").cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			})
		end
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local keymap = vim.keymap
			local lspconfig = require('lspconfig')

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }

					-- Keymaps
					keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					keymap.set("n", "K", vim.lsp.buf.hover, opts)
					keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				end
			})

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			require('mason-lspconfig').setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({ capabilities = capabilities })
				end
			})
		end
	},

	{ "williamboman/mason.nvim", opts = {} },
	{ "folke/lazydev.nvim", opts = {} },
}
