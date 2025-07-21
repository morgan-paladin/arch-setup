return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.formatting.black,
      },
      debug = true,
    })
    -- Change the keymapping to be more explicit
    vim.keymap.set("n", "F", function()
      vim.lsp.buf.format({ timeout_ms = 2000 })
    end, { noremap = true })
  end,
}
