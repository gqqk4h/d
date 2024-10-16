return {
	{
		"shellRaining/hlchunk.nvim",
		config = function()
			local hlchunk = require("hlchunk")
			local opts = {

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
			}

			hlchunk.setup(opts)
		end,
	},
}
