-- Custom setup
vim.opt.expandtab = false -- use tabs instead of spaces
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true -- word wrap
vim.opt.ci = true   -- follow indentation of the previous line or structure
vim.opt.termguicolors = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.guicursor = "n-v-c-i-ci-ve-r-cr-o:hor20"
vim.opt.number = true

vim.opt.cursorline = false

-- Transparent UI elements and hiding end-of-buffer characters
vim.cmd("au ColorScheme * hi Normal ctermbg=none guibg=none")
vim.cmd("au ColorScheme * hi SignColumn ctermbg=none guibg=none")
vim.cmd("au ColorScheme * hi NormalNC ctermbg=none guibg=none")
vim.cmd("au ColorScheme * hi MsgArea ctermbg=none guibg=none")
vim.cmd("au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none")
vim.cmd("au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none")
vim.cmd("let &fcs='eob: '")

-- Vim + Tmux Navigation Setup
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", { silent = true })
