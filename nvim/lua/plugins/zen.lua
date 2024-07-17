return {
  "folke/zen-mode.nvim",
  dependencies = {
    "folke/twilight.nvim",
  },
  keys = {
    {
      "<leader>z",
      "",
      desc = "+zen",
    },
    {
      "<leader>zz",
      ":ZenMode<cr>",
      desc = "Toggle ZenMode",
    },
    { "<leader>zt", ":Twilight<cr>", desc = "Dims inactive code" },
  },
  opts = {
    window = {
      backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      width = 100, -- width of the Zen window
      options = {
        signcolumn = "no", -- disable signcolumn
        number = false, -- disable number column
        relativenumber = false, -- disable relative numbers
        cursorline = false, -- disable cursorline
        cursorcolumn = false, -- disable cursor column
      },
    },
    plugins = {
      alacritty = {
        enabled = true,
        font = "16", -- font size
      },
    },
    -- callback where you can add custom code when the Zen window opens
    on_open = function()
      --vim.notify = function(_, _, _) end

      vim.opt["conceallevel"] = 3
      vim.opt["concealcursor"] = "nc"
    end,
    -- callback where you can add custom code when the Zen window closes
    on_close = function()
      --vim.notify = require("notify")

      vim.opt["conceallevel"] = 0
      vim.opt["concealcursor"] = ""
    end,
  },
}
