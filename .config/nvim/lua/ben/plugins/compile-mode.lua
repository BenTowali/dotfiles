return {
	"ej-shafran/compile-mode.nvim",
	config = function()
		---@type CompileModeOpts
		vim.g.compile_mode = { default_command = "" }
	end,
}
