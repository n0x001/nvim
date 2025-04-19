local default_tabstop = 2
-- Set tabstop to defalult_tabstop spaces
vim.opt.tabstop = default_tabstop

-- Optional: Set related options
vim.opt.shiftwidth = default_tabstop
vim.opt.expandtab = true
vim.opt.softtabstop = default_tabstop

-- Other useful settings
vim.opt.number = true            -- Show line numbers
vim.opt.relativenumber = true    -- Show up and down line numbers relatively to the current
vim.opt.autoindent = true        -- Enable auto-indentation
vim.opt.wrap = true

-- vim.cmd.colorscheme "gruvbox"

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript", "python", "lua" },
	callback = function()
		vim.opt_local.wrap = false
	end,
})
