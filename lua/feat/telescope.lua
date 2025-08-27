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

local function with(picker, opts)
	return function()
		picker(opts)
	end
end

vim.keymap.set("n", "<leader>f", with(builtin.fd, defaults), {
	desc = "Open files picker",
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
