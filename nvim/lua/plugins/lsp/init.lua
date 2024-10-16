return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
			local servers = {
				"cssls",
				"denols",
				"denols",
				"dprint",
				"html",
				"jsonls",
				"sourcekit",
				"ts_ls",
			}

			for _, server in pairs(servers) do
				opts = { capabilities }
				server = vim.split(server, "@")[1]
				local conf_opts = require("plugins.lsp.config." .. server)
				opts = vim.tbl_deep_extend("force", conf_opts, opts)
				lspconfig[server].setup(opts)
			end

			local signs = {
				{ name = "DiagnosticSignError", text = "" },
				{ name = "DiagnosticSignWarn", text = "" },
				{ name = "DiagnosticSignHint", text = "" },
				{ name = "DiagnosticSignInfo", text = "" },
			}

			for _, sign in ipairs(signs) do
				vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
			end

			local config = {
				virtual_text = false, -- disable virtual text
				signs = {
					active = signs, -- show signs
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			}

			vim.diagnostic.config(config)

			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

			local opts = { noremap = true, silent = true }
			local keymap = vim.api.nvim_set_keymap
			keymap("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
			keymap("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
			keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
			keymap("n", "<leader>lI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
			keymap("n", "<leader>lR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
			keymap("n", "<leader>ll", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
			keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

			keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
      
			-- turn floating off, show lsp_lines instead
			keymap("n", "<C-j>", "<cmd>lua vim.diagnostic.goto_next({buffer=0,float=false})<cr>", opts)
			keymap("n", "<C-k>", "<cmd>lua vim.diagnostic.goto_prev({buffer=0,float=false})<cr>", opts)

			keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
			keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
			keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
		end,
	},
}
