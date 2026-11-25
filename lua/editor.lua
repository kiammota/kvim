vim.g.ui2 = true

-- Leader
vim.g.mapleader = " "

-- Editor
vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true
vim.o.expandtab = true
vim.o.title = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- UI
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Cursor: BLOCO em absolutamente todos os modos
vim.opt.guicursor = {
  "n-v-c:block",
  "i:block",
  "r:block",
  "o:block",
  "a:block",
}

-- Cursorline mais bonito
vim.api.nvim_set_hl(0, "CursorLine", {
  bg = "#1e222a",
})

-- Número da linha atual mais destacado
vim.api.nvim_set_hl(0, "CursorLineNr", {
  fg = "#61afef",
  bold = true,
})

-- Neovide
if vim.g.neovide then
  vim.g.neovide_floating_blur_amount_x = 0
  vim.g.neovide_floating_blur_amount_y = 0
  vim.g.neovide_floating_shadow = false

  -- Escala
  vim.keymap.set({ "n", "v" }, "<C-=>", function()
    vim.g.neovide_scale_factor =
      (vim.g.neovide_scale_factor or 1) + 0.1
  end)

  vim.keymap.set({ "n", "v" }, "<C-->", function()
    vim.g.neovide_scale_factor =
      (vim.g.neovide_scale_factor or 1) - 0.1
  end)

  vim.keymap.set({ "n", "v" }, "<C-0>", function()
    vim.g.neovide_scale_factor = 1
  end)
end
