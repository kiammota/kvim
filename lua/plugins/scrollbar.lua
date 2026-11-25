vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/petertriho/nvim-scrollbar",
})

require("gitsigns").setup()

require("scrollbar").setup({
  providers = {
    diagnostic = true,
    gitsigns = true,
    search = true,
  },

  scrollbar = {
    preset = "zed",
    autohide = false,
  },
})
