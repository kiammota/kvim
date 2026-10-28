vim.pack.add({
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/saghen/blink.lib',
  { src = 'https://github.com/saghen/blink.cmp' },
})

require('blink.cmp').setup({
  keymap = {
    preset = 'enter',
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-e>'] = { 'hide', 'fallback' },
    ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
  },

  appearance = {
    nerd_font_variant = 'mono',
  },

  fuzzy = {
    implementation = 'lua', -- Mantém funcionando sem precisar compilar; mude para 'prefer_rust' após rodar :BlinkCmp build
    sorts = {
      'exact',
      'score',
      'sort_text',
    },
  },

  completion = {
    accept = {
      auto_brackets = { enabled = true },
    },

    trigger = {
      show_on_keyword = true,
      show_on_trigger_character = true,
      show_on_insert_on_trigger_character = true,
      show_on_blocked_trigger_characters = { ' ', '\n', '\t' },
    },

    list = {
      max_items = 40,
      selection = {
        preselect = true,
        auto_insert = false,
      },
    },

    menu = {
      border = 'none',
      scrollbar = false,
      draw = {
        padding = { 0, 1 },
        columns = {
          { 'kind_icon' },
          { 'label',    gap = 1 },
        },
      },
    },

    documentation = {
      auto_show = false,
      window = {
        border = 'none',
        scrollbar = false,
      },
    },

    ghost_text = {
      enabled = false,
    },
  },

  signature = {
    enabled = true,
    window = {
      border = 'none',
      scrollbar = false,
    },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
    providers = {
      lsp = {
        name = 'LSP',
        module = 'blink.cmp.sources.lsp',
        score_offset = 100, -- Prioridade máxima para sugestões do LSP (igual ao VS Code)
        async = false,      -- Garante que o menu espere a resposta do rust-analyzer em `fs::`
        timeout_ms = 2000,
      },
      snippets = {
        score_offset = -10, -- Evita que `println~` ou `format_args~` fiquem no topo sem necessidade
        should_show_items = function(ctx)
          -- Não mostra snippets quando você acabou de digitar `:` ou `.` (ex: `fs::` ou `io.`)
          return ctx.trigger.initial_kind ~= 'trigger_character'
        end,
      },
      buffer = {
        score_offset = -50, -- Palavras do arquivo ficam sempre por último
        min_keyword_length = 4,
        should_show_items = function(ctx)
          -- NUNCA sugere palavras soltas do texto (`hello`, `world`, `let`) após `::` ou `.`
          return ctx.trigger.initial_kind ~= 'trigger_character'
        end,
      },
    },
  },
})
