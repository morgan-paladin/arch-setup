return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ruff", "pyright" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local border = "rounded" -- You can change this to "single", "double", etc.
      local function show_documentation()
        local winnr = vim.api.nvim_get_current_win()
        vim.lsp.buf.hover({
          border = border,
          callback = function(result, ctx)
            if not result or vim.tbl_isempty(result) then
              return
            end
            vim.lsp.util.open_floating_preview(result, "markdown", {
              border = border,
              focusable = false,
              winblend = 0,
              source = ctx.method,
            })
            vim.api.nvim_set_current_win(winnr)
          end,
        })
      end
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })
      vim.keymap.set("n", "K", show_documentation, { desc = "Show Documentation" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
