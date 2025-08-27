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
						highlight = "BlinkCmpKind",
					},
				},
			},
		},
	},
})
