-- LSP ecosystem bootstrap.
-- Mason, nvim-lspconfig and mason-lspconfig must be available before setup.
vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

-- Mason must be configured before mason-lspconfig.
require("mason").setup({
  PATH = "prepend",
  ui = {
    border = "none",
  },
})

-- Configure Neovim's native LSP layer before mason-lspconfig enables servers.
require("lsp").setup()

local servers = require("lsp.servers")
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_enable = vim.deepcopy(servers),
})
