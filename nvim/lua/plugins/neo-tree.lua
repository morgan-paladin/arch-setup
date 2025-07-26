-- plug-in to have file explorer to the left of the screen
-- cycle through neotree and file window press Ctrl + w + w
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set(
			"n",
			"<C-t>",
			":Neotree toggle=true source=filesystem reveal=true position=left<CR>",
			{ silent = true }
		)
	end,
}
