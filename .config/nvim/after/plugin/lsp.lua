require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"bashls",
		"rust_analyzer",
		"tailwindcss",
		"tsserver",
		"svelte"
	},
})


require("lspconfig").lua_ls.setup {}
require("lspconfig").bashls.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").tailwindcss.setup {}
require("lspconfig").tsserver.setup {}
require("lspconfig").svelte.setup {}
