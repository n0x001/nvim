return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local servers = { "ts_ls", "pyright" }
      for _,server in pairs(servers) do
        lspconfig[server].setup({
          enable = true, -- an alternative is: vim.lsp.enable(server)
          -- capabilities = capabilities,
          on_attach = function(client, bufnr)
            -- Optional: Add keymaps for navigation
            local opts = { buffer = bufnr, noremap = true, silent = true }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)        -- Go to definition
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)   -- Go to type definition
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)        -- Find references
          end,
        })
      end
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path"
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        -- snippet = {
        --   expand = function(args)
        --     require("luasnip").lsp_expand(args.body)
        --   end,
        -- },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
