vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, 'blink.cmp')
if ok then
  capabilities = blink.get_lsp_capabilities(capabilities)
end

vim.lsp.config('*', {
  capabilities = capabilities,
})

vim.lsp.config('rust_analyzer', {
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      cargo = { allFeatures = true },
      checkOnSave = true,
      procMacro = { enable = true },
    },
  },
})

vim.lsp.enable({
  'lua_ls',
  'gopls',
  'rust_analyzer',
  'clangd',
})
