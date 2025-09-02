vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
})

require("mason").setup({
	ensure_installed = {
		"lua_ls",
	},
})

require("mason-lspconfig").setup()

require("blink.cmp").setup({
	completion = {
		menu = {
			border = "none",
			draw = {
				columns = { { "label", "kind", gap = 1 } },
				components = {
					kind = {
						text = function(ctx)
							return ctx.kind:lower()
						end,
						highlight = "BlinkCmpKind",
					},
				},
			},
		},
		documentation = {
			auto_show = true,
		},
	},
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

		if not client then
			return
		end

		---@param method vim.lsp.protocol.Method.ClientToServer
		local function supports(method)
			return client:supports_method(method, args.buf)
		end

		if supports("textDocument/hover") then
			-- vim.keymap.del("n", "K")
			vim.keymap.set("n", "<leader>k", function()
				vim.lsp.buf.hover({
					border = "solid",
					title = "",
				})
			end, {
				desc = "Show docs for item under cursor",
			})
		end

		if supports("textDocument/rename") then
			-- vim.keymap.del("n", "grn")
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {
				desc = "Rename symbol",
			})
		end

		if supports("textDocument/codeAction") then
			-- vim.keymap.del("n", "gra")
			vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {
				desc = "Perform code action",
			})
		end
	end,
})
