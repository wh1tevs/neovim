-- black = "#211c1c",
-- blue = "#f38d70",
-- cyan = "#85dacc",
-- dark = "#191515",
-- dimmed1 = "#c3b7b8",
-- dimmed2 = "#948a8b",
-- dimmed3 = "#72696a",
-- dimmed4 = "#5b5353",
-- dimmed5 = "#403838",
-- green = "#adda78",
-- magenta = "#a8a9eb",
-- red = "#fd6883",
-- white = "#fff1f3",
-- yellow = "#f9cc6c"

require("monokai-pro").setup({
	filter = "ristretto",
	plugins = {
		telescope = false,
	},
	override = function (c)
		return {
			NormalFloat = { bg = c.base.dimmed5, fg = c.base.white },
			FloatBorder = { link = "NormalFloat" },

			Pmenu = { link = "NormalFloat" },
			PmenuSel = { bg = c.base.yellow, fg = c.base.black },
			PmenuSbar = { link = "NormalFloat" },
			PmenuThumb = { bg = c.white },

			netrwDir = { bg = "NONE", fg = "NONE" },

			TelescopeNormal = { link = "Normal" },
			TelescopeBorder = { fg = c.base.white },
			TelescopeMatching = { link = "Special" },
			TelescopeSelection = { bg = "NONE", fg = c.base.yellow, bold = true },
			TelescopeSelectionCaret = { link = "TelescopeSelection" },
			TelescopePromptNormal = { link = "Normal" },
			TelescopePromptBorder = { link = "TelescopeBorder" },
			TelescopePromptCounter = { link = "TelescopePromptNormal" },
			TelescopeResultsNormal = { link = "Normal" },
			TelescopeResultsLineNr = { link = "TelescopeSelection" },
			TelescopeResultsNumber = { link = "TelescopeSelection" },
			TelescopeResultsComment = { link = "TelescopeSelection" },
			TelescopeResultsBorder = { link = "TelescopeBorder" },
			TelescopePreviewBorder = { link = "TelescopeBorder" },



			BlinkCmpMenu = { link = "Pmenu" },
			BlinkCmpMenuBorder = { link = "Pmenu" },
			BlinkCmpMenuSelection = { link = "PmenuSel" },
			BlinkCmpScrollBarThumb = { link = "PmenuThumb" },
			BlinkCmpScrollBarGutter = { link = "PmenuSbar" },
			BlinkCmpLabel = { link = "Pmenu" },
			BlinkCmpLabelDeprecated = { link = "PmenuExtra" },
			BlinkCmpLabelMatch = { link = "Pmenu" },
			BlinkCmpLabelDetail = { link = "PmenuExtra" },
			BlinkCmpLabelDescription = { link = "PmenuExtra" },
			BlinkCmpKind = { link = "PmenuKind" },
			BlinkCmpSource = { link = "PmenuExtra" },
			BlinkCmpGhostText = { link = "NonText" },
			BlinkCmpDoc = { link = "NormalFloat" },
			BlinkCmpDocBorder = { link = "NormalFloat" },
			BlinkCmpDocSeparator = { link = "NormalFloat" },
			BlinkCmpDocCursorLine = { link = "Visual" },
			BlinkCmpSignatureHelp = { link = "NormalFloat" },
			BlinkCmpSignatureHelpBorder = { link = "NormalFloat" },
			BlinkCmpSignatureHelpActiveParameter = { link = "LspSignatureActiveParameter" },

			WhichKey = { link = "WhichKeyNormal" },
			WhichKeyBorder = { link = "FloatBorder" },
			WhichKeyDesc = { link = "WhichKeyNormal" },
			WhichKeyGroup = { link = "WhichKeyNormal" },
			WhichKeyIcon = { link = "WhichKeyNormal" },
			WhichKeyIconAzure = { link = "WhichKeyNormal" },
			WhichKeyIconBlue = { link = "WhichKeyNormal" },
			WhichKeyIconCyan = { link = "WhichKeyNormal" },
			WhichKeyIconGreen = { link = "WhichKeyNormal" },
			WhichKeyIconGrey = { link = "WhichKeyNormal" },
			WhichKeyIconOrange = { link = "WhichKeyNormal" },
			WhichKeyIconPurple = { link = "WhichKeyNormal" },
			WhichKeyIconRed = { link = "WhichKeyNormal" },
			WhichKeyIconYellow = { link = "WhichKeyNormal" },
			WhichKeyNormal = { link = "NormalFloat" },
			WhichKeySeparator = { link = "WhichKeyNormal" },
			WhichKeyTitle = { link = "WhichKeyNormal" },
			WhichKeyValue = { link = "WhichKeyNormal" },
		}
	end
})

vim.cmd.colorscheme("monokai-pro")
