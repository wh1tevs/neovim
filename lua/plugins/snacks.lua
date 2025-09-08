return {
  "snacks.nvim",
  opts = {
    animate = { enabled = false },
    indent = { enabled = false },
    scope = { enabled = false },
    picker = {
      prompt = " ",
      layout = {
        preset = "helix",
      },
      layouts = {
        helix = {
          layout = {
            box = "horizontal",
            backdrop = false,
            width = 0.9,
            height = 0.9,
            border = "none",
            {
              box = "vertical",
              border = "single",
              {
                win = "input",
                height = 1,
                border = "bottom",
              },
              { win = "list" },
            },
            {
              win = "preview",
              width = 0.5,
              border = "single",
            },
          },
        },
      },
    },
  },
}
