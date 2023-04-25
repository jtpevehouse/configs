-- TREE SITTER
local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = { "bash", "css", "dockerfile", "fish", "gitignore", "html", "javascript", "json", "lua", "make", "markdown", "python", "yaml" },
  highlight = {
    enable = true,
  }
}
