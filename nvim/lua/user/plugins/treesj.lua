local treesj = require("treesj")

vim.keymap.set("n", "<leader>m", treesj.toggle)
vim.keymap.set("n", "<leader>j", treesj.join)
vim.keymap.set("n", "<leader>s", treesj.split)
