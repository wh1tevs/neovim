vim.pack.add({ { src = "https://github.com/rebelot/kanagawa.nvim" } })

require("kanagawa").setup({
	theme = "dragon",
	overrides = function()
		return {
			WhichKey = { link = "WhichKeyNormal" },
			WhichKeyDesc = { link = "WhichKeyNormal" },
			WhichKeyGroup = { link = "WhichKeyNormal" },
		}
	end,
})

vim.cmd.colorscheme("kanagawa")
