-- palette {{{
local p = {
	--primary colors
	red = "#fd6883",
	orange = "#f38d70",
	yellow = "#f9cc6c",
	green = "#adda78",
	blue = "#85dacc",
	purple = "#a8a9eb",
	--base colors
	base0 = "#191515",
	base1 = "#211c1c",
	base2 = "#2c2525",
	base3 = "#403838",
	base4 = "#5b5353",
	base5 = "#72696a",
	base6 = "#8c8384",
	base7 = "#c3b7b8",
	base8 = "#fff1f3",
	--variants
	base8x0c = "#352e2e",
}
-- }}}

vim.cmd("hi clear")

if vim.fn.exists("syntax on") then
	vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "monokai-pro-ristretto"
vim.o.termguicolors = true

local set_hl = vim.api.nvim_set_hl
local get_hl = vim.api.nvim_get_hl

set_hl(0, "ColorColumn", { bg = p.base1 })
set_hl(0, "Conceal", {})
set_hl(0, "CurSearch", { link = "Visual" })
set_hl(0, "Cursor", { fg = p.base7 })
set_hl(0, "lCursor", {})
set_hl(0, "CursorIM", {})
set_hl(0, "CursorColumn", { link = "CursorLine" })
set_hl(0, "CursorLine", { bg = p.base1 })
set_hl(0, "Directory", {})
set_hl(0, "TermCursor", {})
set_hl(0, "Folded", { link = "Comment" })

-- statuscolumn
set_hl(0, "FoldColumn", { link = "SignColumn" })
set_hl(0, "SignColumn", { bg = p.base2 })
set_hl(0, "LineNr", { bg = p.base3 })
set_hl(0, "LineNrAbove", { fg = p.base5 })
set_hl(0, "LineNrBelow", { link = "LineNrAbove" })
set_hl(0, "CursorLineNr", { bg = p.base3 })
set_hl(0, "CursorLineFold", { link = "CursorLine" })
set_hl(0, "CursorLineSign", { link = "CursorLine" })
set_hl(0, "MatchParen", { link = "Search" })

set_hl(0, "MsgArea", { link = "Normal" })
set_hl(0, "MsgSeparator", {})
set_hl(0, "ErrorMsg", { fg = p.red })
set_hl(0, "WarningMsg", { fg = p.orange })
set_hl(0, "ModeMsg", { link = "Normal" })
set_hl(0, "MoreMsg", { link = "Comment" })
set_hl(0, "Question", {})

set_hl(0, "Normal", { bg = p.base2, fg = p.base8 })
set_hl(0, "NormalNC", { link = "Normal" })
set_hl(0, "Visual", { bg = p.base4 })
set_hl(0, "VisualNOS", {})
set_hl(0, "Whitespace", { fg = p.base5 })
set_hl(0, "EndOfBuffer", { fg = p.base5 })
set_hl(0, "NonText", { link = "Comment" })
set_hl(0, "WinSeparator", { fg = p.base7 })
set_hl(0, "Search", { bg = p.base4 })
set_hl(0, "IncSearch", { link = "Search" })
set_hl(0, "Substitute", { link = "Search" })

-- float/menu
set_hl(0, "NormalFloat", { bg = p.base3, foreground = p.base8, fg = p.base8 })
set_hl(0, "FloatBorder", { bg = get_hl(0, { name = "NormalFloat"}).bg, fg = p.base7  })
set_hl(0, "FloatTitle", { link = "NormalFloat" })
set_hl(0, "FloatFooter", { link = "NormalFloat" })
set_hl(0, "Pmenu", { link = "NormalFloat" })
set_hl(0, "PmenuSel", { bg = p.yellow, fg = p.base2 })
set_hl(0, "PmenuKind", { link = "Pmenu" })
set_hl(0, "PmenuKindSel", { link = "PmenuSel" })
set_hl(0, "PmenuExtra", { link = "Pmenu" })
set_hl(0, "PmenuExtraSel", { link = "PmenuSel" })
set_hl(0, "PmenuSbar", { link = "Pmenu" })
set_hl(0, "PmenuThumb", { bg = p.base8 })
set_hl(0, "PmenuMatch", {})
set_hl(0, "PmenuMatchSel", {})
set_hl(0, "WildMenu", { link = "Pmenu" })

set_hl(0, "ComplMatchIns", { link = "Comment" })
set_hl(0, "QuickFixLine", { bg = p.yellow, fg = p.base2 })
set_hl(0, "SnippetTabstop", {})
set_hl(0, "SpecialKey", {})
set_hl(0, "TabLine", { bg = p.base0, fg = p.base5 })
set_hl(0, "TabLineFill", { bg = p.base1 })
set_hl(0, "TabLineSel", { bg = p.base2, fg = p.base8 })
set_hl(0, "Title", {})
set_hl(0, "WinBar", {})
set_hl(0, "WinBarNC", {})

--statusline
set_hl(0, "StatusLine", { bg = p.base4, fg = p.base8 })
set_hl(0, "StatusLineNC", { bg = p.base8x0c, fg = get_hl(0, { name = "StatusLine" }).fg })
set_hl(0, "StatusLineTerm", { link = "StatusLine" })
set_hl(0, "StatusLineTermNC", { link = "StatusLineNC" })

-- git
set_hl(0, "DiffAdd", { fg = p.green })
set_hl(0, "DiffChange", { bg = p.base3 })
set_hl(0, "DiffText", { bg = p.base4 })
set_hl(0, "DiffDelete", { fg = p.red })


-- spellong
set_hl(0, "SpellBad", {})
set_hl(0, "SpellCap", {})
set_hl(0, "SpellLocal", {})
set_hl(0, "SpellRare", {})

-- neovim
set_hl(0, "healthSectionDelim", { bg = p.base4 })
set_hl(0, "healthHeader", {})
set_hl(0, "healthError", { fg = p.red })
set_hl(0, "healthWarning", { fg = p.yellow })
set_hl(0, "healthSuccess", { fg = p.green })

-- syntax {{{
set_hl(0, "Comment", { fg = p.base5, italic = true })
set_hl(0, "Constant", { fg = p.orange })
set_hl(0, "String", { fg = p.yellow })
set_hl(0, "Character", { link = "String" })
set_hl(0, "Number", { fg = p.purple })
set_hl(0, "Boolean", { fg = p.red })
set_hl(0, "Float", { link = "Number" })
set_hl(0, "Identifier", { fg = p.base8 })
set_hl(0, "Function", { fg = p.green })
set_hl(0, "Statement", { fg = p.blue })
set_hl(0, "Conditional", {})
set_hl(0, "Repeat", {})
set_hl(0, "Label", {})
set_hl(0, "Operator", { fg = p.red })
set_hl(0, "Keyword", { fg = p.red })
set_hl(0, "Exception", {})
set_hl(0, "PreProc", { fg = p.yellow })
set_hl(0, "Include", {})
set_hl(0, "Define", {})
set_hl(0, "Macro", {})
set_hl(0, "PreCondit", {})
set_hl(0, "Type", { fg = p.blue })
set_hl(0, "StorageClass", {})
set_hl(0, "Structure", {})
set_hl(0, "Typedef", {})
set_hl(0, "Special", { fg = "#f59762" })
set_hl(0, "SpecialChar", { fg = p.blue })
set_hl(0, "Tag", { fg = p.base8 })
set_hl(0, "Delimiter", { fg = p.base6 })
set_hl(0, "SpecialComment", {})
set_hl(0, "Debug", {})
set_hl(0, "Underlined", { underline = true })
set_hl(0, "Ignore", {})
set_hl(0, "Error", { link = "ErrorMsg" })
set_hl(0, "Todo", {})
set_hl(0, "Added", { link = "DiffAdd" })
set_hl(0, "Changed", { link = "DiffChange" })
set_hl(0, "Removed", { link = "DiffDelete" })
-- }}}

-- diagnostic {{{
set_hl(0, "DiagnosticError", { link = "ErrorMsg" })
set_hl(0, "DiagnosticWarn", { link = "WarningMsg" })
set_hl(0, "DiagnosticInfo", { fg = p.base9 })
set_hl(0, "DiagnosticHint", { link = "DiagnosticInfo" })
set_hl(
	0,
	"DiagnosticUnderlineError",
	{ underline = true, undercurl = true, sp = get_hl(0, { name = "DiagnosticError" }).fg }
)
set_hl(
	0,
	"DiagnosticUnderlineWarn",
	{ underline = true, undercurl = true, sp = get_hl(0, { name = "DiagnosticWarn" }).fg }
)
set_hl(
	0,
	"DiagnosticUnderlineInfo",
	{ underline = true, undercurl = true, sp = get_hl(0, { name = "DiagnosticInfo" }).fg }
)
set_hl(
	0,
	"DiagnosticUnderlineHint",
	{ underline = true, undercurl = true, sp = get_hl(0, { name = "DiagnosticHint" }).fg }
)
--}}}

--treesitter {{{
set_hl(0, "@attribute", { fg = p.blue })
set_hl(0, "@variable.parameter", { fg = p.orange })
set_hl(0, "@variable.builtin", { fg = p.red })
set_hl(0, "@constant.builtin", { fg = p.red })
set_hl(0, "@type.builtin", { fg = p.red })

set_hl(0, "@label", { fg = p.base6 })
set_hl(0, "@constructor", { fg = p.blue })
set_hl(0, "@function.builtin", { fg = p.blue })

set_hl(0, "@tag.attribute", { fg = p.blue })
set_hl(0, "@tag.delimiter", { link = "@punctuation" })

set_hl(0, "@markup.heading", { fg = p.green })

set_hl(0, "@function.builtin.lua", { link = "@function" })

-- javacript/typescript {{{
--
-- }}}
-- }}}

-- telescope {{{
set_hl(0, "TelescopePromptBorder", { fg = get_hl(0, { name = "FloatBorder" }).fg })
set_hl(0, "TelescopeSelection", { fg = p.yellow, bold = true })
set_hl(0, "TelescopeSelectionCaret", { link = "TelescopeSelection" })

set_hl(0, "TelescopeMatching", { link = "Special" })

set_hl(0, "TelescopeResultsBorder", { fg = get_hl(0, { name = "FloatBorder" }).fg })
set_hl(0, "TelescopeResultsLineNr", { link = "TelescopeSelection" })
set_hl(0, "TelescopeResultsNumber", { link = "TelescopeSelection" })
set_hl(0, "TelescopeResultsComment", { link = "TelescopeSelection" })

set_hl(0, "TelescopePreviewBorder", { fg = get_hl(0, { name = "FloatBorder" }).fg })
-- }}}

-- netrw {{{
local netrw_ns = vim.api.nvim_create_namespace("netrw_ns")

set_hl(netrw_ns, "SignColumn", { link = "Normal" })
set_hl(netrw_ns, "LineNr", { link = "Normal" })
set_hl(netrw_ns, "CursorLineNr", { link = "CursorLine" })

vim.api.nvim_create_autocmd("FileType", {
	desc = "Setup highlights for netrw",
	pattern = "netrw",
	callback = function(args)
		local wins = vim.fn.win_findbuf(args.buf)
		for _, winid in ipairs(wins) do
			vim.api.nvim_win_set_hl_ns(winid, netrw_ns)
		end
	end,
})
-- }}}

-- which-key {{{
set_hl(0, "WhichKey", { link = "WhichKeyNormal" })
set_hl(0, "WhichKeyBorder", { link = "FloatBorder" })
set_hl(0, "WhichKeyDesc", { link = "WhichKeyNormal" })
set_hl(0, "WhichKeyGroup", { link = "WhichKeyNormal" })
set_hl(0, "WhichKeyIcon", { link = "WhichKeyNormal" })
set_hl(0, "WhichKeyIconAzure", { link = "WhichKeyNormal" })
set_hl(0, "WhichKeyIconBlue", { link = "WhichKeyNormal" })
set_hl(0, "WhichKeyIconCyan", { link = "WhichKeyNormal" })
set_hl(0, "WhichKeyIconGreen", { link = "WhichKeyNormal" })
set_hl(0, "WhichKeyIconGrey", { link = "WhichKeyNormal" })
set_hl(0, "WhichKeyIconOrange", { link = "WhichKeyNormal" })
set_hl(0, "WhichKeyIconPurple", { link = "WhichKeyNormal" })
set_hl(0, "WhichKeyIconRed", { link = "WhichKeyNormal" })
set_hl(0, "WhichKeyIconYellow", { link = "WhichKeyNormal" })
set_hl(0, "WhichKeyNormal", { link = "NormalFloat" })
set_hl(0, "WhichKeySeparator", { link = "WhichKeyNormal" })
set_hl(0, "WhichKeyTitle", { link = "WhichKeyBorder" })
set_hl(0, "WhichKeyValue", { link = "WhichKeyNormal" })
-- }}}

-- vim: fdl=0
