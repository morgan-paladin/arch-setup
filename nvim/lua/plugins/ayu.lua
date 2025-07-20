return {
  {
    "Shatur/neovim-ayu",
    name = "ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({
        mirage = false, -- Set to true to use the mirage variant
        overrides = {
          Normal = { bg = "None" },
          NormalFloat = { bg = "none" },
          ColorColumn = { bg = "None" },
          SignColumn = { bg = "None" },
          Folded = { bg = "None" },
          FoldColumn = { bg = "None" },
          CursorLine = { bg = "None" },
          CursorColumn = { bg = "None" },
          VertSplit = { bg = "None" },
        }, -- Add any highlight overrides here
      })
      vim.cmd.colorscheme("ayu")
    end,
  },
}
