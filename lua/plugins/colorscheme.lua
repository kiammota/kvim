vim.pack.add({
  -- Existentes
  "https://github.com/shaunsingh/nord.nvim",
  "https://github.com/nyoom-engineering/nyoom.nvim",
  "https://github.com/mofiqul/vscode.nvim",
  {
    src = "https://github.com/rose-pine/neovim",
    name = "rose-pine",
  },

  -- Populares
  "https://github.com/catppuccin/nvim",
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/EdenEast/nightfox.nvim",
  "https://github.com/ellisonleao/gruvbox.nvim",

  -- Naturais e suaves
  "https://github.com/sainnhe/everforest",
  "https://github.com/sainnhe/gruvbox-material",
  "https://github.com/sainnhe/sonokai",
  "https://github.com/ribru17/bamboo.nvim",
  "https://github.com/savq/melange-nvim",

  -- Modernos e contrastantes
  "https://github.com/scottmckendry/cyberdream.nvim",
  "https://github.com/Mofiqul/dracula.nvim",
  "https://github.com/projekt0n/github-nvim-theme",
  "https://github.com/marko-cerovac/material.nvim",
  "https://github.com/craftzdog/solarized-osaka.nvim",

  -- Outros
  "https://github.com/AlexvZyl/nordic.nvim",
  "https://github.com/olimorris/onedarkpro.nvim",
  "https://github.com/bluz71/vim-moonfly-colors",
  "https://github.com/vague-theme/vague.nvim",
  "https://github.com/zenbones-theme/zenbones.nvim",
})

-- bamboo-light and bamboo-multiplex call set_options() directly. Initialize
-- the plugin's global configuration before those colorschemes are selected.
require("bamboo").setup({})
