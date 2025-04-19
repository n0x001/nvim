require("config.opt")
require("config.remap")
require("lazy-init")

function lspservers()
  vim.keymap.set('n', '<leader>la', function()
    local lspconfig = require('lspconfig')
    local servers = {}
    local servers_s = "Servers: "
    local lsp_servers = lspconfig.util.available_servers() or { "ts_ls1", "pyright1" }
    for _, server_name in ipairs(lsp_servers) do
      servers_s = servers_s .. server_name .. " "
      if type(lspconfig[server_name]) == "table" and lspconfig[server_name].setup then
        table.insert(servers, server_name)
      end
    end

    for _, server in ipairs(servers) do
      vim.notify("- " .. server, vim.log.levels.INFO)
    end

    vim.notify(servers_s, vim.log.levels.INFO)
  end, { desc = "List all nvim-lspconfig servers" })
end

lspservers()
