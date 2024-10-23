reload('user.config')

-- Custom UI Configs
lvim.colorscheme = "dracula"
lvim.builtin.treesitter.rainbow.enable = true
-- lvim.transparent_window = false
lvim.transparent_window = true


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
	{ name = "black" },
	{ name = "gofumpt" },
	{ name = "rustfmt" },
}


local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
	{
		command = "flake8",
		args = { "--ignore=E203" },
		filetypes = { "python" }
	},
	{
		command = "golangci-lint",
		args = { "run", "--fix=true" },
		filetypes = { "go" }
	}
}

-- Which-key setup
lvim.builtin.which_key.setup = {
	window = {
		winblend = 30
	}
}

lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py", "*.go", "*.rs", "*.*" }
