local ensure_installed = {
	"query",
	"vim",
	"vimdoc",
	"lua",
	"luadoc",
	"bash",
	"diff",
}

local treesitter = require("nvim-treesitter")
local installed = treesitter.get_installed("parsers")

local function is_not_installed(parser)
	return not vim.tbl_contains(installed, parser)
end

local to_install = vim.iter(ensure_installed):filter(is_not_installed):totable()

if #to_install > 0 then
	treesitter.install(to_install):await(function()
		treesitter.update()
	end)
else
	treesitter.update()
end

require("nvim-treesitter-textobjects").setup()

local ts_select = require("nvim-treesitter-textobjects.select")
local ts_move = require("nvim-treesitter-textobjects.move")

local function select(identifier, scope)
	return function()
		ts_select.select_textobject(identifier, scope or "textobjects")
	end
end

local function move(method, identifier, scope)
	return function()
		ts_move[method](identifier, scope or "textobjects")
	end
end

vim.keymap.set({ "x", "o" }, "af", select("@function.outer"), {
	desc = "function",
})
vim.keymap.set({ "x", "o" }, "if", select("@function.inner"), {
	desc = "function",
})
vim.keymap.set({ "x", "o" }, "aa", select("@parameter.outer"), {
	desc = "function",
})
vim.keymap.set({ "x", "o" }, "ia", select("@parameter.inner"), {
	desc = "function",
})

vim.keymap.set({ "n", "x", "o" }, "]f", move("goto_next_start", "@function.outer"), {
	desc = "Goto next function",
})
vim.keymap.set({ "n", "x", "o" }, "[f", move("goto_previous_start", "@function.outer"), {
	desc = "Goto previous function",
})
vim.keymap.set({ "n", "x", "o" }, "]a", move("goto_next_start", "@parameter.inner"), {
	desc = "Goto next parameter",
})
vim.keymap.set({ "n", "x", "o" }, "[a", move("goto_previous_start", "@parameter.inner"), {
	desc = "Goto previous parameter",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function(args)
		if args.match == "" then
			return
		end

		local available = treesitter.get_available()
		---@diagnostic disable-next-line: redefined-local
		local installed = treesitter.get_installed()

		if not vim.tbl_contains(available, args.match) then
			return
		end

		local function _start()
			vim.treesitter.start(args.buf, args.match)
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
		end

		if not vim.tbl_contains(installed, args.match) then
			vim.notify("Installing treesitter parser for " .. args.match)

			treesitter.install({ args.match }):await(_start)
		end

		_start()
	end,
})
