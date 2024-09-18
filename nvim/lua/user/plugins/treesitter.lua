local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = {
    "astro",
    "bash",
    "css",
    "html",
    "json",
    "jsonc",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "sql",
    "tmux",
    "toml",
    "tsx",
    "typescript",
    "vim",
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true },
})
