vim.pack.add({
  {
    src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
    version = vim.version.range("3"),
  },
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
})

require("neo-tree").setup({
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },

  window = {
    width = 32,
  },
})

vim.keymap.set("n", "-", "<Cmd>Neotree toggle<CR>", {
  desc = "Alternar explorador de arquivos",
})
