local M = {}

local lsp_group = vim.api.nvim_create_augroup("UserLsp", { clear = true })
local format_group = vim.api.nvim_create_augroup("UserLspFormatOnSave", { clear = true })

local function make_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local ok, blink = pcall(require, "blink.cmp")

  if ok then
    capabilities = blink.get_lsp_capabilities(capabilities)
  end

  return capabilities
end

local function get_formatter(bufnr)
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  -- Use a deterministic client when more than one LSP can format the buffer.
  table.sort(clients, function(a, b)
    if a.name == b.name then
      return a.id < b.id
    end
    return a.name < b.name
  end)

  for _, client in ipairs(clients) do
    if client:supports_method("textDocument/formatting", bufnr) then
      return client
    end
  end
end

local function format_buffer(bufnr, async)
  local client = get_formatter(bufnr)
  if not client then
    return false
  end

  local ok, err = pcall(vim.lsp.buf.format, {
    bufnr = bufnr,
    id = client.id,
    async = async == true,
    timeout_ms = 2000,
  })

  if not ok then
    vim.notify_once(
      ("LSP formatting failed (%s): %s"):format(client.name, err),
      vim.log.levels.WARN
    )
    return false
  end

  return true
end

local function setup_diagnostics()
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = {
      current_line = true,
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
end

local function setup_format_on_save(bufnr)
  -- One buffer-local handler, created only when an attached client supports formatting.
  vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = format_group,
    buffer = bufnr,
    desc = "LSP: format before saving",
    callback = function(event)
      format_buffer(event.buf, false)
    end,
  })
end

local function setup_keymaps(client, bufnr)
  if client:supports_method("textDocument/definition", bufnr) then
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
      buffer = bufnr,
      desc = "LSP: Ir para definição",
    })
  end

  if client:supports_method("textDocument/hover", bufnr) then
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {
      buffer = bufnr,
      desc = "LSP: Documentação",
    })
  end

  if client:supports_method("textDocument/rename", bufnr) then
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {
      buffer = bufnr,
      desc = "LSP: Renomear",
    })
  end

  if client:supports_method("textDocument/formatting", bufnr) then
    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
      format_buffer(bufnr, true)
    end, {
      buffer = bufnr,
      desc = "LSP: Formatar",
    })
    setup_format_on_save(bufnr)
  end

  if client:supports_method("textDocument/inlayHint", bufnr) then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    vim.keymap.set("n", "<leader>lh", function()
      local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
      vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
      print("Inlay hints: " .. (enabled and "desativados" or "ativados"))
    end, {
      buffer = bufnr,
      desc = "LSP: Alternar inlay hints",
    })
  end
end

function M.setup()
  -- Global defaults are merged into every server config, including nvim-lspconfig's.
  vim.lsp.config("*", {
    capabilities = make_capabilities(),
  })

  setup_diagnostics()

  vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_group,
    callback = function(event)
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if not client then
        return
      end

      setup_keymaps(client, event.buf)
    end,
  })
end

return M
