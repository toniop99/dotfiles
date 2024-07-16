return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        -- Automatically install parser for needed language
        auto_install = true,

        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
