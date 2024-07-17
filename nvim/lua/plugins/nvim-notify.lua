local stages_util = require("notify.stages.util")

return {
  "rcarriga/nvim-notify",
  enabled = true,
  opts = {
    timeout = 4000,
    stages = {
      function(state)
        local next_height = state.message.height + 2
        local next_row = stages_util.available_slot(state.open_windows, next_height, stages_util.DIRECTION.BOTTOM_UP)
        if not next_row then
          return nil
        end
        return {
          relative = "editor",
          anchor = "NE",
          width = state.message.width,
          height = state.message.height,
          col = 0, --vim.opt.columns:get(),
          row = next_row,
          border = "rounded",
          style = "minimal",
        }
      end,
      function()
        return {
          col = 0, --vim.opt.columns:get(),
          time = true,
        }
      end,
    },
  },
}
