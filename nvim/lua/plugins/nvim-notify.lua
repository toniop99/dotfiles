local stages_util = require("notify.stages.util")

return {
  "rcarriga/nvim-notify",
  enabled = true,
  opts = {
    timeout = 2500,
    stages = {
      function(state)
        local next_height = state.message.height + 2
        local next_row = stages_util.available_slot(state.open_windows, next_height, stages_util.DIRECTION.TOP_DOWN)

        --[[
        -- we only want to print from the top left to the middle left of the window
        -- example: if next_row is 30 and math.floor(vim.api.nvim_win_get_height(0) / 2) is 25 we cannont print next message
        --]]
        local can_not_print_next_message = next_row > math.floor(vim.api.nvim_win_get_height(0) / 3)

        if true or not next_row or can_not_print_next_message then
          return nil
        end
        return {
          relative = "editor",
          anchor = "NE",
          width = math.floor(state.message.width / 2),
          height = state.message.height,
          col = vim.opt.columns:get(),
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
