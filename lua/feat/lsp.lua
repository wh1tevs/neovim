vim.pack.add({ { src = "https://github.com/mason-org/mason.nvim" } })

require("mason").setup({
	ensure_installed = {
		"lua_ls",
	}
})

vim.diagnostic.config({
	float = {
		header = "",
		border = "solid",
	},
	jump = {
		float = true,
		wrap = true,
	},
	severity_sort = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	virtual_lines = false,
	virtual_text = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP configuration and keybinds",
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if not client then return end

		if client:supports_method("textDocument/completion", args.buf) then
			vim.lsp.completion.enable(true, client.id, args.buf, {
				autotrigger = true,
				convert = function(item)
					return {
						abbr = item.label
					}
				end
			})
		end
	end
})
