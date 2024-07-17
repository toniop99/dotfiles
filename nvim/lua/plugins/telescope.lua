return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top", width = 0.9, height = 0.9 },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
    keys = {
      {
        "<leader>/",
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        desc = "Grep with args (root dir)",
      },
      {
        "<leader>cb",
        ":Telescope lsp_definitions<cr>",
        desc = "Go to definition",
      },
    },
    config = function(_, opts)
      local tele = require("telescope")
      tele.setup(opts)
      tele.load_extension("live_grep_args")
    end,
  },
}
