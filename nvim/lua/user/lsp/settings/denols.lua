local lspconfig = require("lspconfig")

vim.g.markdown_fenced_languages = { "ts=typescript" }

return { root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc") }
