--options {{{
vim.g.have_nerd_font = false

vim.opt.termsync = true
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.list = true
vim.opt.listchars = { tab = ">~", trail = "*", nbsp = "_" }

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Preview substitution
vim.opt.inccommand = "split"

vim.opt.wrap = true
vim.opt.breakindent = true

vim.opt.smartindent = true
vim.opt.expandtab = false --hate spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.colorcolumn = "80"

vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.winborder = "single"

vim.opt.completeopt = { "menuone", "noselect", "fuzzy", "popup" }

vim.opt.statusline = "%1(%)%f %h%q%r%m%=%l:%c%1(%)"
vim.opt.showmode = true

vim.opt.signcolumn = "yes"
vim.opt.statuscolumn = "%-2(%s%)%3(%l%)%#SignColumn#%1(%)"

vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 99

vim.opt.wildoptions:append("fuzzy")
vim.opt.wildmode = { "list:full", "noselect" }
--}}}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymaps {{{
vim.keymap.set("n", "<esc>", ":nohl<cr><esc>", { silent = true })
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', {
	desc = "Yank to system clipboard",
})
vim.keymap.set({ "n", "x" }, "<leader>Y", '"+Y', {
	desc = "Yank line to system clipboard",
})
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', {
	desc = "Paste clipboard after cursor",
})
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P', {
	desc = "Paste clipboard before cursor",
})
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, {
	desc = "Open diagnostic",
})
vim.keymap.set("n", "<leader>D", vim.diagnostic.setqflist, {
	desc = "Open workspace diagnostic",
})

-- lsp
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({
		border = "solid",
		title = "",
	})
end)
vim.keymap.set("n", "<c-w>d", function()
	vim.diagnostic.open_float({
		border = "solid",
		title = "",
	})
end)
-- }}}

require("feat.netrw")
require("feat.lsp")
require("feat.treesitter")
require("feat.editor")
require("feat.telescope")
require("feat.colorscheme")

-- vim:fdm=marker:fdl=0:
