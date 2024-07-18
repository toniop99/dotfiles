return {
  "mg979/vim-visual-multi",
  init = function()
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>",
      ["Find Subword Under"] = "<C-d>",
      ["Select Cursor Down"] = "<M-C-Down>",
      ["Select Cursor Up"] = "<M-C-Up>",
    }
  end,
}
