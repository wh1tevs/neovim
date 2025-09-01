vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.pairs", version = "stable" },
	{ src = "https://github.com/echasnovski/mini.surround", version = "stable" },
	{ src = "https://github.com/echasnovski/mini.jump", version = "stable" },
})

require("mini.pairs").setup({ modes = { insert = true, command = true } })

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
