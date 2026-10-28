vim.diagnostic.config({
  virtual_text = {
    severity = { min = vim.diagnostic.severity.WARN },
    spacing = 4,
    prefix = "●",
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

-- Atalhos universais
vim.keymap.set({ "n", "v" }, "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "LSP: Formatar" })

vim.keymap.set("n", "<leader>lr", function()
  vim.lsp.buf.rename()
end, { desc = "LSP: Renomear" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Ir para Definição" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Documentação" })

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
-- Habilita os inlay hints ao anexar o LSP no arquivo
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      -- Ativa os hints de tipo e parâmetros embutidos
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

-- Atalho para alternar (ligar/desligar) os Inlay Hints apertando <leader>lh
vim.keymap.set('n', '<leader>lh', function()
  local current = vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(not current)
  print("Inlay Hints: " .. (not current and "Ligados" or "Desligados"))
end, { desc = "Alternar Inlay Hints" })
