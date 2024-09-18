local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("user/options")
require("user/keymaps")

require("lazy").setup({
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      vim.opt.background = "dark"
      vim.cmd("colorscheme oxocarbon")
    end,
  },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-tree.lua" },
  },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  { "windwp/nvim-ts-autotag" },
  { "moll/vim-bbye" },
  {
    "romgrk/barbar.nvim",
    dependencies = { "lewis6991/gitsigns.nvim", "nvim-tree/nvim-web-devicons" },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
  },
  { "numToStr/Comment.nvim", "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "lewis6991/gitsigns.nvim",
  },
  {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "https://codeberg.org/FelipeLema/cmp-async-path.git",
    "hrsh7th/nvim-cmp",
    "lukas-reineke/cmp-under-comparator",
    "hrsh7th/cmp-nvim-lsp-signature-help",
  },
  { "neovim/nvim-lspconfig", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  { "shellRaining/hlchunk.nvim", event = { "BufReadPre", "BufNewFile" } },
  { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
  { "RRethy/vim-illuminate" },
  { "Wansmer/treesj" },
})

require("user/lsp")
require("user/plugins/cmp")
require("user/plugins/gitsigns")
require("user/plugins/comment")
require("user/plugins/barbar")
require("user/plugins/autopairs")
require("user/plugins/treesitter")
require("user/plugins/lualine")
require("user/plugins/nvim-tree")
require("user/plugins/telescope")
require("user/plugins/hlchunk")
require("user/plugins/lsp_lines")
require("user/plugins/illuminate")
require("user/plugins/treesj")
