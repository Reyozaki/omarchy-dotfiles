-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>uI", function()
  vim.treesitter.inspect_tree({ command = "40vnew" })
  vim.wo.winfixwidth = true -- keep this width when other splits open/close
  vim.api.nvim_input("I") -- optional: toggle injections
end, { desc = "Inspect Tree" })
