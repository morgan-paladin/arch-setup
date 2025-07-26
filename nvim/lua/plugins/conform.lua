return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters = {
				reformat_gherkin_multiline_tag = {
					command = "reformat-gherkin",
					args = { "--multi-line-tags", "$FILENAME" },
					stdin = false,
				},
				ruff_format = {
					command = "ruff",
					args = { "format", "--line-length", "120", "$FILENAME" },
					stdin = false,
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				javascript = { "prettier", stop_after_first = true },
				cucumber = { "reformat_gherkin_multiline_tag" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			-- Set the log level. Use `:ConformInfo` to see the location of the log file.
			log_level = vim.log.levels.ERROR,
			-- Conform will notify you when a formatter errors
			notify_on_error = true,
			-- Conform will notify you when no formatters are available for the buffer
			notify_no_formatters = true,
		})

		-- Manual formatting with "F"
		vim.keymap.set("n", "F", function()
			conform.format({ timeout_ms = 2000 })
		end, { noremap = true, desc = "Format with conform.nvim" })
	end,
}
