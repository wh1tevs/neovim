--options {{{
vim.g.mapleader = " "
vim.g.maplocalleader = " "
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
--}}}

--keymaps {{{
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
vim.keymap.set("n", "]b", vim.cmd.bnext, {
	desc = "Goto next buffer",
})
vim.keymap.set("n", "]B", vim.cmd.blast, {
	desc = "Goto last buffer",
})
vim.keymap.set("n", "[B", vim.cmd.bfirst, {
	desc = "Goto first buffer",
})
vim.keymap.set("n", "[q", vim.cmd.cprev, {
	desc = "Goto next quickfix item",
})
vim.keymap.set("n", "[Q", vim.cmd.cfirst, {
	desc = "Goto last quickfix item",
})
vim.keymap.set("n", "]q", vim.cmd.cnext, {
	desc = "Goto next quickfix item",
})
vim.keymap.set("n", "]Q", vim.cmd.clast, {
	desc = "Goto last quickfix item",
})
vim.keymap.set("n", "[l", vim.cmd.lprev, {
	desc = "Goto next loclist item",
})
vim.keymap.set("n", "[L", vim.cmd.lfirst, {
	desc = "Goto last loclist item",
})
vim.keymap.set("n", "]l", vim.cmd.lnext, {
	desc = "Goto next loclist item",
})
vim.keymap.set("n", "]L", vim.cmd.llast, {
	desc = "Goto last loclist item",
})
--}}}

require("feat.netrw")

--plugins {{{
local install_path = vim.fn.stdpath("data") .. "/site/pack/deps/start/mini.deps"
local repo = "https://github.com/echasnovski/mini.nvim"

if not vim.uv.fs_stat(install_path) then
	vim.notify("Installing plugin manager", vim.log.levels.INFO)
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, install_path })
	vim.cmd.packadd("mini.deps")
	vim.notify("Package manager installed", vim.log.levels.INFO)
end

require("mini.deps").setup()

---@diagnostic disable-next-line: undefined-global
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

--colorscheme
add({ source = "loctvl842/monokai-pro.nvim" })

now(function()
	require("monokai-pro").setup({
		filter = "ristretto",
		override = function(c)
			return {
				Directory = { link = "Normal" },
				BlinkCmpScrollBarThumb = { bg = c.base.white },
				BlinkCmpScrollBarGutter = { link = "BlinkCmpMenu" },
				BlinkCmpMenuSelection = { bg = c.base.yellow, fg = c.base.black },
				BlinkCmpLabel = { fg = c.base.white },
				BlinkCmpKind = { fg = c.base.white },
			}
		end,
	})
	vim.cmd.colorscheme("monokai-pro")
end)

--treesitter
add({ source = "nvim-treesitter/nvim-treesitter", checkout = "main" })
add({ source = "nvim-treesitter/nvim-treesitter-textobjects", checkout = "main" })

later(function()
	require("feat.treesitter")
end)

--lsp
add({ source = "mason-org/mason.nvim" })
add({ source = "mason-org/mason-lspconfig.nvim" })
add({ source = "neovim/nvim-lspconfig" })

later(function()
	require("mason").setup()
	require("mason-lspconfig").setup()
	require("feat.lsp")
end)

--telescope
add({ source = "nvim-telescope/telescope.nvim" })
add({ source = "nvim-lua/plenary.nvim" })

later(function()
	require("feat.telescope")
end)

--editing stuff
add({ source = "echasnovski/mini.pairs", checkout = "stable" })
add({ source = "echasnovski/mini.surround", checkout = "stable" })
add({ source = "echasnovski/mini.jump", checkout = "stable" })
add({ source = "saghen/blink.cmp", checkout = "v1.6.0" })

later(function()
	require("mini.pairs").setup({
		modes = { insert = true, command = true },
	})
	require("mini.surround").setup({
		mappings = {
			add = "gsa",
			delete = "gsd",
			find = "gsf",
			find_left = "gsF",
			highlight = "gsh",
			replace = "gsr",
			update_n_lines = "gsn",
		},
	})
	require("mini.jump").setup()
	require("feat.completion")
end)

--others
add({ source = "folke/which-key.nvim" })

later(function()
	require("feat.which-key")
end)
--}}}

--autocommands {{{
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "Config options",
	pattern = vim.fn.expand("~") .. "/.config/nvim/*",
	callback = function()
		vim.opt_local.foldmethod = "marker"
		vim.opt_local.foldmarker = "{{{,}}}"
		vim.opt_local.foldlevel = 99
	end,
})
--}}}

-- vim: fdl=0
