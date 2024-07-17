return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>bt",
      function()
        local bufferline = require("bufferline")
        local groups = bufferline.groups
        --vim.notify("Retrieved groups: " .. vim.inspect(groups.get_all()), vim.log.levels.INFO)

        for _, group in pairs(groups.get_all()) do
          if group.name ~= "pinned" and group.name ~= "ungrouped" then
            groups.action(group.name, "toggle")
          end
        end
      end,
      desc = "Toogle all buffers groups",
    },
  },
  opts = {
    options = {
      groups = {
        options = {
          toggle_hidden_on_enter = true,
        },
        items = {
          {
            name = "Tests",
            highlight = { underline = false, sp = "purple" },
            priority = 2,
            icon = "",
            matcher = function(buf)
              return buf.name:match("%_test") or buf.name:match("%_spec") or buf.name:match("%test")
            end,
          },
          {
            name = "Docs",
            --icon = "🗎",
            highlight = { undercurl = false, sp = "green" },
            auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
            matcher = function(buf)
              return buf.name:match("%.md") or buf.name:match("%.txt")
            end,
          },
        },
      },
    },
  },
}
