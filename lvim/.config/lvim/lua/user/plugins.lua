lvim.plugins = {
	{ "Mofiqul/dracula.nvim" },
	{ "mrjones2014/nvim-ts-rainbow" },
	{ "AckslD/swenv.nvim" },
	{ "stevearc/dressing.nvim" },
	{ "onsails/lspkind.nvim" },
	{ "ThePrimeagen/vim-be-good" }, -- For vim learning
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end
	},
}

lvim.builtin.treesittter.ensure_installed = {
	"python",
	"go",
	"rust"
}
