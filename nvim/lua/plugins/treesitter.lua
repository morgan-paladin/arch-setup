-- Text highlighting plugin
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "bash", "lua", "python", "javascript", "yaml", "json" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
