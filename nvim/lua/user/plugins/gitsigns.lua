local gitsigns = require("gitsigns")

gitsigns.setup({
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 500,
  },
  update_debounce = 100,
  on_attach = function(bufnr)
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "gj", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gitsigns.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    map("n", "gk", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gitsigns.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true })

    -- Actions
    map("n", "<leader>gs", gitsigns.stage_hunk)
    map("n", "<leader>gr", gitsigns.reset_hunk)
    map("v", "<leader>gs", function()
      gitsigns.stage_hunk({
        vim.fn.line("."),
        vim.fn.line("v"),
      })
    end)
    map("v", "<leader>gr", function()
      gitsigns.reset_hunk({
        vim.fn.line("."),
        vim.fn.line("v"),
      })
    end)
    map("n", "<leader>gS", gitsigns.stage_buffer)
    map("n", "<leader>gu", gitsigns.undo_stage_hunk)
    map("n", "<leader>gR", gitsigns.reset_buffer)
    map("n", "<leader>gp", gitsigns.preview_hunk)
    map("n", "<leader>gb", function()
      gitsigns.blame_line({ full = true })
    end)
    map("n", "<leader>gb", gitsigns.toggle_current_line_blame)
    map("n", "<leader>gd", gitsigns.diffthis)
    map("n", "<leader>gD", function()
      gitsigns.diffthis("~")
    end)
    map("n", "<leader>gd", gitsigns.toggle_deleted)

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end,
})
