return {
  {
    "rebelot/kanagawa.nvim",
    enabled = false,
    priority = 1000,
    opts = {
      overrides = function()
        return {
          WhichKey = { link = "WhichKeyNormal" },
          WhichKeyDesc = { link = "WhichKeyNormal" },
          WhichKeyGroup = { link = "WhichKeyNormal" },

          SnacksInputBorder = { link = "Normal" },
        }
      end,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)

      vim.cmd.colorscheme("kanagawa-dragon")
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      on_highlights = function(hl, c)
        hl.FloatBorder.fg = c.fg
        hl.FloatTitle.fg = c.fg

        hl.SnacksPicker = { link = "Normal" }
        hl.SnacksPickerBox = hl.SnacksPicker
        hl.SnacksPickerBoxBorder = { link = "SnacksPickerBox" }
        hl.SnacksPickerBoxTitle = hl.FloatTitle
        hl.SnacksPickerInputBorder = hl.SnacksPickerBoxBorder
        hl.SnacksPickerInputTitle = hl.SnacksPickerBoxTitle
        hl.SnacksPickerListBorder = hl.SnacksPickerBoxBorder
        hl.SnacksPickerPreviewBorder = hl.SnacksPickerBoxBorder
        hl.SnacksPickerPreviewTitle = hl.SnacksPickerBoxTitle
      end,
    },
  },
}
