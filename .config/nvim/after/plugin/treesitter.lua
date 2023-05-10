require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "lua", "html", "markdown", "rust", "svelte", "typescript", "query" },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
