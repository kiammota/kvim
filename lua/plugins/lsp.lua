vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, blink = pcall(require, 'blink.cmp')
if ok then
  capabilities = blink.get_lsp_capabilities(capabilities)
end

-- Configuração universal para qualquer LSP
vim.lsp.config('*', {
  capabilities = capabilities,
})

-- Diagnósticos limpos: mensagem completa embaixo da linha (só na linha do cursor)
vim.diagnostic.config({
  virtual_text = false,  -- desliga o texto inline antigo
  virtual_lines = {
    current_line = true, -- só mostra na linha do cursor
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "none",
    source = true,
    header = "",
    prefix = "",
  },
})

-- Ativa Inlay Hints automaticamente
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

-- Atalhos universais
vim.keymap.set({ "n", "v" }, "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "LSP: Formatar" })

vim.keymap.set("n", "<leader>lr", function()
  vim.lsp.buf.rename()
end, { desc = "LSP: Renomear" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Ir para Definição" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Documentação" })

-- Alternar Inlay Hints
vim.keymap.set("n", "<leader>lh", function()
  local current = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not current)
  print("Inlay Hints: " .. (not current and "Ligados" or "Desligados"))
end, { desc = "Alternar Inlay Hints" })

-- Formatação automática ao salvar
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
