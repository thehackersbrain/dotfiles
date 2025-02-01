lvim.plugins = {
	{ "Mofiqul/dracula.nvim" },
	{ "mrjones2014/nvim-ts-rainbow" },
	{ "AckslD/swenv.nvim" },
	{ "stevearc/dressing.nvim" },
	{ "onsails/lspkind.nvim" },
	{ "ThePrimeagen/vim-be-good" },      -- For vim learning
	{ 'christoomey/vim-tmux-navigator' }, -- For easier vim and tmux navigation
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
