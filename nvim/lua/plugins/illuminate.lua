vim.api.nvim_set_keymap(
	"n",
	"<leader>[",
	'<cmd>lua require"illuminate".goto_next_reference{wrap=true}<cr>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>]",
	'<cmd>lua require"illuminate".goto_next_reference{reverse=true,wrap=true}<cr>',
	{ noremap = true }
)

return {
	{
		"RRethy/vim-illuminate",
		config = function()
			local illuminate = require("illuminate")
			local opts = {
				delay = 200,
				filetypes_denylist = {
					"dirvish",
					"fugitive",
					"NvimTree",
					"TelescopePrompt",
					"lazy",
				},
			}

			illuminate.configure(opts)
		end,
	},
}
