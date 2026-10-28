vim.pack.add({
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason-lspconfig.nvim',
})

require('mason').setup({
  ui = {
    border = 'none',
  }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, 'blink.cmp')
if ok then
  capabilities = blink.get_lsp_capabilities(capabilities)
end

require('mason-lspconfig').setup({
  automatic_installation = true,
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = capabilities,
      })
    end,
  },
})
