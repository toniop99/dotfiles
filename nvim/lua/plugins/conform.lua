return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>gf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	config = function()
		local conform = require("conform")
		conform.setup({
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end

				return { timeout_ms = 500, lsp_format = "fallback", lsp_fallbak = true, async = false }
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				php = { "php-cs-fixer" },
				javascript = { { "prettierd", "prettier" } },
			},
			notify_on_error = true,
			formatters = {
				["php-cs-fixer"] = {
					command = "php-cs-fixer",
					args = {
						"fix",
						"$FILENAME",
						--"--allow-risky=yes", -- if you have risky stuff in config, if not you dont need it.
					},
					stdin = false,
				},
			},
		})

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
