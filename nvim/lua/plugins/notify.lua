return {
  {
    "rcarriga/nvim-notify",
    name = "notify",
    lazy = false,
    priority = 1000,
    config = function()
      local notify = require("notify")

      notify.setup({
        -- You can customize animations, background colour, stages etc.
        stages = "fade",           -- other options: slide, fade_in_slide_out, static
        timeout = 3000,            -- time in ms before disappearing
        background_colour = "#000000", -- for transparent backgrounds
        render = "default",        -- also try "minimal", "simple"
      })

      -- Set it as the default notification handler
      vim.notify = notify
    end,
  },
}
