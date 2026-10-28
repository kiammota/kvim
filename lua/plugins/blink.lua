vim.pack.add({
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
})

local ok, cmp = pcall(require, "blink.cmp")
if not ok then
  vim.notify("blink.cmp não encontrado. Reinicie o Neovim.", vim.log.levels.WARN)
  return
end

cmp.setup({
  keymap = {
    preset = "default",
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" }, -- Ctrl+Espaço
    ["<C-e>"] = { "hide", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
  },

  appearance = {
    nerd_font_variant = "mono",
  },

  completion = {
    menu = {
      border = "single", -- borda quadrada
      scrollbar = false,
      draw = {
        columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 150,
      window = {
        border = "single",
        max_width = 60,
      },
    },
    list = {
      selection = { preselect = true, auto_insert = false },
    },
    ghost_text = { enabled = true },
    accept = {
      auto_brackets = { enabled = true },
    },
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    providers = {
      lsp = {
        async = true,
        score_offset = 100,
      },
    },
  },

  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },

  signature = {
    enabled = true,
    window = { border = "single" },
  },
})
