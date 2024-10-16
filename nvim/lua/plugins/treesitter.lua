return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			local opts = {
				ensure_installed = {
					"astro",
					"bash",
					"css",
					"html",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"r",
					"sql",
					"tmux",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"yaml",
				},
				autopairs = {
					enable = true,
				},
				indent = { enable = true },
			}

			treesitter.setup(opts)
		end,
	},
}
