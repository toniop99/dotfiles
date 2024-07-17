-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

if not vim.g.vscode then
  --  vim.api.nvim_set_keymap("n", "<leader><S-F5>", ":DapRestartFrame<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader><F5>", ":DapContinue<CR>", { noremap = true, silent = true })

  vim.keymap.set("n", "<leader>da", function()
    require("dap").set_exception_breakpoints({ "Warning", "Error", "Exception" })
  end, { desc = "Stop on exceptions" }) -- TODO this one doesn't show on which-key

  vim.keymap.set("n", "<leader>dA", function()
    require("dap").set_exception_breakpoints({ "Notice", "Warning", "Error", "Exception" })
  end, { desc = "Stop on all" })

  vim.keymap.set("n", "<leader>d0", function()
    require("dap").set_exception_breakpoints({})
  end, { desc = "Stop on nothing" })

  --  vim.api.nvim_set_keymap("n", "<leader><C-S-F5>", ":DapTerminate<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<F10>", ":DapStepOver<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<F11>", ":DapStepInto<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<s-F11>", ":DapStepOut<CR>", { noremap = true, silent = true })
  --  vim.api.nvim_set_keymap("n", "<leader><F5>", ":DapContinue<CR>", { noremap = true })
  --  vim.api.nvim_set_keymap("n", "<F10>", ":DapUiToggle<CR>", { noremap = true })
end
