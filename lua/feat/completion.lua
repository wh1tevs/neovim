require("blink.cmp").setup({
	completion = {
		menu = {
			border = "none",
			draw = {
				columns = {
					{ "label", "kind", gap = 1 },
				},
				components = {
					kind = {
						text = function(ctx)
							return ctx.kind:lower()
						end,
					},
				},
			},
		},
		documentation = {
			auto_show = true,
			window = {
				border = "none",
				scrollbar = false,
			},
		},
	},
})
