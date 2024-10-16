vim.g.markdown_fenced_languages = {
	"ts=typescript",
}

local lspconfig = require("lspconfig")
return {
	root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}
