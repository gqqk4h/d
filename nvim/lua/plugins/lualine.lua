return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")

			local hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end

			local branch = {
				"branch",
				icons_enabled = true,
				icon = "",
			}

			local diagnostics = {
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn" },
				symbols = { error = " ", warn = " " },
				colored = false,
				always_visible = true,
				update_in_insert = false,
			}

			local diff = {
				"diff",
				colored = false,
				symbols = { added = " ", modified = " ", removed = " " },
				cond = hide_in_width,
			}

			local filetype = {
				"filetype",
				icons_enabled = false,
				icon = nil,
			}

			local location = {
				"location",
				padding = 0,
			}

			local opts = {

				options = {
					globalstatus = true,
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = { "alpha", "dashboard", "Outline" },
					always_divide_middle = true,
				},
				sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = { "mode" },
					lualine_y = { branch, diagnostics, diff, "encoding", filetype, location },
					lualine_z = {},
				},

				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
			}
			lualine.setup(opts)
		end,
	},
}
