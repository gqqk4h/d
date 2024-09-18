local hlchunk = require("hlchunk")

hlchunk.setup({
  chunk = {
    enable = true,
    chars = {
      horizontal_line = "─",
      vertical_line = "│",
      left_top = "┌",
      left_bottom = "└",
      right_arrow = "─",
    },
    style = "#ffab91",
  },
  line_num = { style = "#ffab91" },
})
