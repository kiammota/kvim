-- Blink v1 is the stable line; blink.lib is kept available for compatibility
-- with the V2 development revision already present in the vim.pack lockfile.
vim.pack.add({
  "https://github.com/saghen/blink.lib",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1.*"),
  },
})

local ok, cmp = pcall(require, "blink.cmp")
if not ok then
  vim.notify("blink.cmp não encontrado. Reinicie o Neovim.", vim.log.levels.WARN)
  return
end

cmp.setup({
  keymap = {
    preset = "default",
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
  },

  completion = {
    menu = {
      border = "none",
      scrollbar = false,
      draw = {
        columns = {
          { "kind_icon" },
          { "label", "label_description", gap = 1 },
          { "kind" },
          { "source_name" },
        },
      },
    },

    list = {
      selection = {
        preselect = true,
        auto_insert = false,
      },
    },

    ghost_text = {
      enabled = true,
    },

    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
  },

  sources = {
    default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },
})
