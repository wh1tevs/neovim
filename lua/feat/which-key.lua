vim.pack.add({ { src = "https://github.com/folke/which-key.nvim" } })

local wk = require("which-key")

wk.setup({
	preset = "helix",
	show_help = false,
	win = {
		border = "single",
	},
	icons = {
		breadcrumb = "",
		separator = "",
		group = "",
		ellipsis = "...",
		mappings = false,
		keys = {
			Up = "Up",
			Down = "Down",
			Left = "Larf",
			Right = "Right",
			C = "C-",
			M = "M-",
			D = "D-",
			S = "S-",
			CR = "Enter",
			Esc = "Esc",
			ScrollWheelDown = "WheelUp",
			ScrollWheelUp = "WheelDown",
			NL = "NL",
			BS = "Backspace",
			Space = "Space",
			Tab = "Tab",
			F1 = "F1",
			F2 = "F2",
			F3 = "F3",
			F4 = "F4",
			F5 = "F5",
			F6 = "F6",
			F7 = "F7",
			F8 = "F8",
			F9 = "F9",
			F10 = "F10",
			F11 = "F11",
			F12 = "F12",
		},
	},
})

wk.add({
	{ "g", group = "Global" },
	{ "<c-w>", group = "Window" },
	{ "z", group = "View" },
	{ "<leader>", group = "Space" },
	{ "<leader>g", group = "Goto" },
})
