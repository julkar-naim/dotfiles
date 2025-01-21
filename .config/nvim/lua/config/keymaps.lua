-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("i", "<C-BS>", "<C-w>", { noremap = true, silent = true, desc = "Ctrl backspace to delete word" })

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle debugger breakpoint" })

map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue the debugger" })

map("n", "<leader>dc", "<cmd>!clang++ --debug -std=c++17 %  <CR>", { desc = "Compile source for debugging" })
