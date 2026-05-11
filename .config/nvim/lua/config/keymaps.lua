-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--

local map = vim.keymap.set

-- F2 to rename symbol
map("n", "<F2>", vim.lsp.buf.rename, { desc = "LSP Rename" })
-- Switch between 0 and ^
map({ "n", "v", "o" }, "0", "^")
map({ "n", "v", "o" }, "^", "0")
-- mark entire row
map("n", "vv", "^vg_", { desc = "Mark entire row" })

map("n", "gg", "gg^", { desc = "jump to beginning of file" })
map("n", "G", "G$", { desc = "jump to end of file" })

map("n", "d", "_d", { desc = "delete rather than copy" })
map("n", "D", "_D")
map("n", "x", "_x", { desc = "use X to remove rather than cut" })
map("n", "y", '"+y', { desc = "copy to clipboard" })
-- visual mode
map("v", "y", "+y")
map("n", "Y", "+Y")
