return {
    { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {  -- Install Python and Lua parsers
          "python",
          "lua",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "html",
          "javascript",
          "json",
          "luadoc",
          "luap",
          "luau",
          "make",
          "nginx",
          "regex",
          "sql",
          "ssh_config",
          "toml",
          "typescript",
          "yaml",
        },         sync_install = false,
        highlight = {
          enable = true, -- Enable syntax highlighting
          additional_vim_regex_highlighting = false, -- Disable regex highlighting
        },
        indent = {
          enable = true, -- Enable Tree-sitter-based indentation
        },
      })
    end
  },
}
