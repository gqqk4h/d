local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<leader>,", "<Cmd>BufferPrevious<CR>", opts)
keymap("n", "<leader>.", "<Cmd>BufferNext<CR>", opts)
keymap("n", "<leader>1", "<Cmd>BufferGoto 1<CR>", opts)
keymap("n", "<leader>2", "<Cmd>BufferGoto 2<CR>", opts)
keymap("n", "<leader>3", "<Cmd>BufferGoto 3<CR>", opts)
keymap("n", "<leader>4", "<Cmd>BufferGoto 4<CR>", opts)
keymap("n", "<leader>5", "<Cmd>BufferGoto 5<CR>", opts)
keymap("n", "<leader>6", "<Cmd>BufferGoto 6<CR>", opts)
keymap("n", "<leader>7", "<Cmd>BufferGoto 7<CR>", opts)
keymap("n", "<leader>8", "<Cmd>BufferGoto 8<CR>", opts)
keymap("n", "<leader>9", "<Cmd>BufferGoto 9<CR>", opts)
keymap("n", "<leader>0", "<Cmd>BufferLast<CR>", opts)

local barbar = require("barbar")

barbar.setup({
  animation = false,
  auto_hide = false,
  tabpages = true,
  clickable = true,
})
