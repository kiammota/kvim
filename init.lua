vim.g.mapleader      = ' '

vim.api.nvim_create_user_command("Edit", function()
  local config_path = vim.fn.stdpath("config")
  vim.cmd("cd " .. config_path)
end, {})

require("autopairs").setup()
require("lsp")          -- lsp que depende de mason/lspconfig
require("keymaps")      -- keymaps que podem depender de plugins
require("editor")       -- configurações gerais do editor
require("abbrev")
require("load-nvim").setup()
require("plugins.load") -- PRIMEIRO: instala e carrega tudo
