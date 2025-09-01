vim.keymap.set({ "n" }, "<leader>e", function()
	vim.cmd.Explore(vim.fn.getcwd())
end, { desc = "Open file explorer in workspace root" })

vim.keymap.set({ "n" }, "<leader>E", vim.cmd.Explore, {
	desc = "Open file explorer at currend buffer directory",
})
