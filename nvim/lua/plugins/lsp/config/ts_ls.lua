local lspconfig = require("lspconfig")

return {
	root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json"),
	-- https://docs.deno.com/runtime/manual/getting_started/setup_your_environment#neovim-06-using-the-built-in-language-server
	single_file_support = false,
}
