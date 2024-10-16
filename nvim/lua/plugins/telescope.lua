return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

      -- git picker
			vim.keymap.set("n", "<leader>fgc", builtin.git_commits, { desc = "Telescope git commit" })
			vim.keymap.set("n", "<leader>fgs", builtin.git_status, { desc = "Telescope git status" })

      -- spell suggest
			vim.keymap.set("n", "<leader>fz", builtin.spell_suggest, { desc = "Telescope show spelling suggestions" })


		end,
	},
}
