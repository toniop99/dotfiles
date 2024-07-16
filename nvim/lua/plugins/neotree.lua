return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
		  vim.keymap.set("n", "<leader>ee", ":Neotree filesystem reveal right toggle<CR>", {})
		  vim.keymap.set("n", "<leader>eb", ":Neotree buffers reveal float toggle<CR>", {})
	  end,
  }
}
