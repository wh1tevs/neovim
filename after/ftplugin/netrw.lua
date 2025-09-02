vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 4
vim.g.netrw_browse_split = 0
vim.g.netrw_preview = 0
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 20
vim.g.netrw_hide = 1
vim.g.netrw_list_hide = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+," .. vim.fn.call("netrw_gitignore#Hide()", {})
