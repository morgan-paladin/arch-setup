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
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff" },
				javascript = { "prettier", stop_after_first = true },
				cucumber = { "reformat_gherkin_multiline_tag" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})

		-- Manual formatting with "F"
		vim.keymap.set("n", "F", function()
			conform.format({ timeout_ms = 2000 })
		end, { noremap = true, desc = "Format with conform.nvim" })
	end,
}
