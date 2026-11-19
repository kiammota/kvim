vim.pack.add({
  {
    src = "https://github.com/nvim-tree/nvim-tree.lua",
    version = vim.version.range("1"),
  },
  "https://github.com/nvim-tree/nvim-web-devicons",
})

require("nvim-tree").setup({
  view = {
    width = 32,
    side = "left",
  },

  renderer = {
    group_empty = true,
  },

  filters = {
    dotfiles = false,
    git_ignored = false,
  },

  git = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },

  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },

  update_focused_file = {
    enable = true,
    update_root = false,
  },
})

vim.keymap.set("n", "-", "<Cmd>NvimTreeToggle<CR>", {
  desc = "Alternar explorador de arquivos",
})
