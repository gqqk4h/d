return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local autopairs = require("nvim-autopairs")
			local opts = {

				check_ts = true,
				ts_config = {
					lua = { "string", "source" },
					javascript = { "string", "template_string" },
				},
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
					offset = 0, -- Offset from pattern match
					check_comma = true,
					highlight = "PmenuSel",
					highlight_grey = "LineNr",
				},
			}

			local cmp = require("cmp")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

			autopairs.setup(opts)
		end,
	},
	{

		"windwp/nvim-ts-autotag",
		config = function()
			local ts = require("nvim-ts-autotag")

			ts.setup()
		end,
	},
}
