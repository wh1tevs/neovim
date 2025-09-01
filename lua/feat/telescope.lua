vim.pack.add({
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})

require("telescope").setup({
	defaults = {
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		selection_caret = " > ",
		entry_prefix = "   ",
		layout_config = {
			prompt_position = "top",
		},
		sorting_strategy = "ascending",
	},
})

local defaults = {
	prompt_title = false,
	prompt_prefix = "",
	results_title = false,
	preview_title = false,
}

local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

local function with(picker, ...)
	local opts = {}

	if select("#", ...) > 1 then
		opts = vim.tbl_deep_extend("force", ...)
	elseif select("#", ...) == 1 then
		opts = select(1, ...)
	end

	return function()
		picker(opts)
	end
end

local function find_files_in_buffer_dir()
	local picker = with(builtin.fd, defaults, { cwd = utils.buffer_dir() })
	picker()
end

vim.keymap.set("n", "<leader>f", with(builtin.fd, defaults), {
	desc = "Open files picker",
})

vim.keymap.set("n", "<leader>F", find_files_in_buffer_dir, {
	desc = "Open file picker at current working directory",
})

vim.keymap.set("n", "<leader>b", with(builtin.buffers, defaults), {
	desc = "Open buffers picker",
})

vim.keymap.set("n", "<leader>j", with(builtin.jumplist, defaults), {
	desc = "Open jumplist picker",
})

vim.keymap.set("n", "<leader>'", with(builtin.resume, defaults), {
	desc = "Open last picker",
})

vim.keymap.set("n", "<leader>/", with(builtin.live_grep, defaults), {
	desc = "Global search in workspace folder",
})

vim.keymap.set("n", "<leader>?", with(builtin.help_tags, defaults), {
	desc = "Search help tags",
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if not client then
			return
		end

		local function is_supported(method)
			return client:supports_method(method, args.buf)
		end

		if is_supported("textDocument/diagnostic") then
			vim.keymap.set("n", "<leader>d", with(builtin.diagnostics, defaults, { bufnr = args.buf }), {
				desc = "Open diagnostic picker",
			})

			vim.keymap.set("n", "<leader>D", with(builtin.diagnostics, defaults), {
				desc = "Open workspace diagnostic picker",
			})
		end

		if is_supported("textDocument/definition") then
			vim.keymap.set({ "n", "x" }, "<leader>gd", with(builtin.lsp_definitions, defaults), {
				desc = "Goto definition",
			})
		end

		if is_supported("textDocument/implementation") then
			vim.keymap.set({ "n", "x" }, "<leader>gi", with(builtin.lsp_impelementations, defaults), {
				desc = "Goto implementation",
			})
		end

		if is_supported("textDocument/references") then
			vim.keymap.set({ "n", "x" }, "<leader>gr", with(builtin.lsp_references, defaults), {
				desc = "Goto references",
			})
		end

		if is_supported("textDocument/typeDefinition") then
			vim.keymap.set({ "n", "x" }, "<leader>gy", with(builtin.lsp_type_definitions, defaults), {
				desc = "Goto type definition",
			})
		end
		if is_supported("textDocument/documentSymbol") then
			vim.keymap.set(
				{ "n", "x" },
				"<leader>s",
				with(builtin.lsp_document_symbols, defaults),
				{ desc = "Open symbol picker" }
			)
		end

		if is_supported("workspace/symbol") then
			vim.keymap.set(
				{ "n", "x" },
				"<leader>S",
				with(builtin.lsp_workspace_symbols, defaults),
				{ desc = "Open workspace symbol picker" }
			)
		end
	end,
})
