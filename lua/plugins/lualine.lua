vim.opt.termguicolors = true

-- Mude para false em máquinas sem Nerd Font
local has_nerd_font = true

vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
})

local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

local mode_map = {
  ["NORMAL"]    = "N",
  ["INSERT"]    = "I",
  ["VISUAL"]    = "V",
  ["V-LINE"]    = "VL",
  ["V-BLOCK"]   = "VB",
  ["REPLACE"]   = "R",
  ["COMMAND"]   = "C",
  ["TERMINAL"]  = "T",
  ["SELECT"]    = "S",
  ["O-PENDING"] = "O",
}



lualine.setup({
  options = {
    theme = "auto",
    globalstatus = true,
    icons_enabled = has_nerd_font,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(str) return mode_map[str] or str:sub(1, 1) end,
        separator = { left = round_l, right = round_r },
        right_padding = 2,
      },
    },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = {
      {
        "filename",
        path = 1,
        symbols = { modified = "[+]", readonly = "[RO]", unnamed = "[No Name]" },
      },
    },
    lualine_x = {
      {
        "encoding",
        cond = function() return vim.bo.fileencoding ~= "" and vim.bo.fileencoding ~= "utf-8" end,
      },
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = {
      {
        "location",
        separator = { left = round_l, right = round_r },
        left_padding = 2,
      },
    },
  },
})
