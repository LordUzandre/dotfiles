-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--

local map = vim.keymap.set

-- F2 to rename symbol
map("n", "<F2>", vim.lsp.buf.rename, { desc = "LSP Rename" })

-- Switch between 0 and ^ (safely)
map({ "n", "v", "o" }, "0", function()
  return vim.v.count == 0 and "^" or "0"
end, { expr = true, desc = "Go to first non-blank character (respects count)" })
map({ "n", "v", "o" }, "^", "0", { desc = "go to absolute start of line" })

map("n", "gg", "gg^", { desc = "jump to beginning of file" })
map("n", "G", "G$", { desc = "jump to end of file" })

map({ "n", "v" }, "d", '"_d', { desc = "delete rather than copy" })
map({ "n", "v" }, "D", '"_D', { desc = "delete to end of line" })
map("n", "x", '"_x', { desc = "use X to remove rather than cut" })
map("n", "y", '"+y', { desc = "copy to clipboard" })

vim.opt.clipboard = "unnamedplus"
-- visual mode
-- map("v", "y", "+y")
-- map("n", "Y", "+Y")
