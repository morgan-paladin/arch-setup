return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("dashboard").setup({
        theme = "hyper", -- or "doom" or "classic"
        config = {
          week_header = {
            enable = true, -- Show current week info
          },
          shortcut = {
            { desc = "  Find File", group = "@function", action = "Telescope find_files", key = "f" },
            { desc = "  Files", group = "@function", action = "Telescope oldfiles", key = "o" },
            { desc = "  Home", group = "@function", action = "ene | startinsert", key = "n" },
            { desc = "  Grep", group = "@function", action = "Telescope live_grep", key = "g" },
          },
        },
      })
    end,
  },
}
