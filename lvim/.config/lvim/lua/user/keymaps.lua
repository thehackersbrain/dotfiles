lvim.builtin.which_key.mappings["C"] = {
	name = "Python",
	c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}

lvim.builtin.which_key.mappings["t"] = {
	name = "Window Tabs",
	h = { "<cmd>split<cr>", "Horizontal Split" },
	v = { "<cmd>vsplit<cr>", "Vertical Split" },
	q = { "<cmd>q!<cr>", "Close the split, regardless of save" }
}
