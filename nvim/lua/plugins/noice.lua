return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    --cmdline = {
    --  view = "cmdline",
    --},
    views = {
      cmdline_popup = {
        border = {
          style = "none",
          padding = { 1, 2 },
        },
        filter_options = {},
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
  },
}
