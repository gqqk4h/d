local lsp_lines = require("lsp_lines")

vim.diagnostic.config({ virtual_text = false })
vim.keymap.set("", "<Leader>l", lsp_lines.toggle, { desc = "Toggle lsp_lines" })
lsp_lines.setup({})
