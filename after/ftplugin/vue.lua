local vue_language_server_path =
	vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server")

vim.lsp.config("vtsls", {
	filetypes = { "vue" },
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

vim.lsp.enable({ "vue_ls", "vtsls" })
