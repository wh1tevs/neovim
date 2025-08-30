local function open_in_ws_root()
	vim.cmd.Explore(vim.fn.getcwd())
end

vim.keymap.set({ "n" }, "<leader>e", open_in_ws_root, {
	desc = "Open file explorer in workspace root",
})
vim.keymap.set({ "n" }, "<leader>E", vim.cmd.Explore, {
	desc = "Open file explorer at currend buffer directory",
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Configure netrw",
	pattern = "netrw",
	callback = function()
		vim.g.netrw_banner = 0
		vim.g.netrw_liststyle = 4
		vim.g.netrw_browse_split = 0
		vim.g.netrw_preview = 0
		vim.g.netrw_altv = 1
		vim.g.netrw_winsize = 20
		vim.g.netrw_hide = 1
		vim.g.netrw_list_hide = "\\(^\\|\\s\\s\\)\\zs\\.\\S\\+," .. vim.fn.call("netrw_gitignore#Hide()", {})

		local opts = { remap = true, buffer = true, silent = true }

		vim.keymap.set("n", "l", "<cr>", opts)
		vim.keymap.set("n", "h", "-", opts)

		local ok, wk = pcall(require, "which-key")

		if ok then
			wk.add({
				mode = { "n" },
				"gh",
				desc = "Toggle hidden files",
				buffer = true,
			})
		end
	end,
})
