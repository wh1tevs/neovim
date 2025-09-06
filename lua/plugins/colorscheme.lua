return {
  {
    "rebelot/kanagawa.nvim",
    opts = {
      theme = "dragon",
      overrides = function()
        return {
          WhichKey = { link = "WhichKeyNormal" },
          WhichKeyDesc = { link = "WhichKeyNormal" },
          WhichKeyGroup = { link = "WhichKeyNormal" },
        }
      end,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)

      vim.cmd.colorscheme("kanagawa")
    end,
  },
}
