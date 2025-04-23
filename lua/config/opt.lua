function set_tabstop(tabstop)
  local ts = tabstop or 2
  vim.opt.tabstop = ts

  -- Optional: Set related options
  vim.opt.shiftwidth = ts
  vim.opt.expandtab = true
  vim.opt.softtabstop = ts
end

-- Set tabstop to defalult_tabstop spaces
set_tabstop(2)

-- Other useful settings
vim.opt.number = true            -- Show line numbers
vim.opt.relativenumber = true    -- Show up and down line numbers relatively to the current
vim.opt.autoindent = true        -- Enable auto-indentation
vim.opt.wrap = true

-- vim.cmd.colorscheme "gruvbox"

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript", "python", "lua" },
	callback = function()
    set_tabstop(2)
		vim.opt_local.wrap = false
	end,
})
