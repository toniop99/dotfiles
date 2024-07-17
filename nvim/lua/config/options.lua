-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.opt.winbar = "%=%m %f"
vim.opt.clipboard = "unnamedplus" -- xclip must be installed on the system

vim.g.lazyvim_php_lsp = "intelephense"
