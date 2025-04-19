return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- vim.lsp.enable('pyright')
      -- vim.lsp.enable('ts_ls')
      local servers = { "ts_ls", "pyright" }
      for _, server in pairs(servers) do
        lspconfig[server].setup({
          enable = true,
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            -- Optional: Add keymaps for navigation
            local opts = { buffer = bufnr, noremap = true, silent = true }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)         -- Go to definition
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)   -- Go to type definition
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)        -- Find references
          end,
        })
      end
      require("config.completion")
    end
  },
}
