vim.diagnostic.config({
	float = true,
	jump = {
		float = true,
		wrap = true,
	},
	severity_sort = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	virtual_lines = false,
	virtual_text = false,
})

vim.keymap.del("n", "gO") -- document_symbol
vim.keymap.del("n", "grr") -- references
vim.keymap.del("n", "gra") -- code actions
vim.keymap.del("n", "gri") -- implementation
vim.keymap.del("n", "grn") -- rename
vim.keymap.del("n", "grt") -- type_definition
vim.keymap.del("n", "<c-w>d") -- show diag under cursor

vim.lsp.config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					"${3rd}/luv/library",
				},
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP stuff",
	callback = function(event)
		local clients = vim.lsp.get_clients({ bufnr = event.buf })

		if #clients == 0 then
			return
		end

		for _, client in ipairs(clients) do
			local function is_supported(method)
				return client.supports_method(client, method, event.buf)
			end

			if client.server_capabilities.semanticTokensProvider ~= nil then
				client.server_capabilities.semanticTokensProvider.full = false
			end

			if is_supported("textDocument/definition") then
				vim.keymap.set({ "n", "x" }, "<leader>gd", vim.lsp.buf.definition, { desc = "Goto definition" })
			end

			if is_supported("textDocument/declaration") then
				vim.keymap.set({ "n", "x" }, "<leader>gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
			end

			if is_supported("textDocument/implementation") then
				vim.keymap.set({ "n", "x" }, "<leader>gi", vim.lsp.buf.implementation, { desc = "Goto implementation" })
			end

			if is_supported("textDocument/references") then
				vim.keymap.set({ "n", "x" }, "<leader>gr", vim.lsp.buf.references, { desc = "Goto references" })
			end

			if is_supported("textDocument/typeDefinition") then
				vim.keymap.set({ "n", "x" }, "<leader>gy", vim.lsp.buf.type_definition, { desc = "Goto type definition" })
			end
			--
			-- if is_supported("textDocument/documentSymbol") then
			-- 	local picker = require("picker")
			-- 	vim.keymap.set(
			-- 		{ "n", "x" },
			-- 		"<leader>s",
			-- 		picker.fcall("lsp_document_symbols"),
			-- 		{ desc = "Open symbol picker" }
			-- 	)
			-- end
			--
			-- if is_supported("workspace/symbol") then
			-- 	local picker = require("picker")
			-- 	vim.keymap.set(
			-- 		{ "n", "x" },
			-- 		"<leader>s",
			-- 		picker.fcall("lsp_workspace_symbols"),
			-- 		{ desc = "Open workspace symbol picker" }
			-- 	)
			-- end

			if is_supported("textDocument/hover") then
				vim.keymap.set({ "n", "x" }, "<leader>k", function()
					vim.lsp.buf.hover({ border = "solid" })
				end, { desc = "Show docs for item under cursor" })
			end

			if is_supported("textDocument/codeAction") then
				vim.keymap.set({ "n", "x" }, "<leader>a", vim.lsp.buf.code_action, { desc = "Perform code action" })
			end

			if is_supported("textDocument/rename") then
				vim.keymap.set({ "n", "x" }, "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
			end
		end
	end,
})

vim.api.nvim_create_autocmd("BufReadPre", {
	pattern = "*.vue",
	callback = function()
		local vue_language_server_path =
			vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server")

		vim.lsp.config("vtsls", {
			filetypes = vim.tbl_extend("force", vim.lsp.config.vtsls.filetypes, { "vue" }),
			settings = {
				vtsls = {
					tsserver = {
						globalPlugins = {
							{
								name = "@vue/typescript-plugin",
								location = vue_language_server_path,
								languages = { "vue" },
								configNamespace = "typescript",
							},
						},
					},
				},
			},
		})
	end,
})
