return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local c = opts.sections.lualine_c

    opts.sections.lualine_c = c[#c - 1]
    opts.sections.lualine_z = {}

    return opts
  end,
}
