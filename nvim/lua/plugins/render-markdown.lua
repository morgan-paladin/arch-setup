return {
	"MeanderingProgrammer/render-markdown.nvim",
	after = { "nvim-treesitter" },
	requires = { "nvim-tree/nvim-web-devicons", opt = true },
	config = function()
		require("render-markdown").setup({
			code = {
				language_border = " ",
				language_left = "",
				language_right = "",
			},
		})
	end,
}
