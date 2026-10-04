vim.pack.add({ "https://github.com/akinsho/toggleterm.nvim" })
require("toggleterm").setup()

local function toggle_or_focus_term()
  -- Se já estou no terminal, fecha
  if vim.bo.buftype == "terminal" then
    vim.cmd("ToggleTerm")
    return
  end

  -- Procura uma janela de terminal aberta e foca nela
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_set_current_win(win)
      vim.schedule(function()
        vim.cmd("startinsert")
      end)
      return
    end
  end

  -- Nenhum terminal aberto: abre
  vim.cmd("ToggleTerm")
end

vim.keymap.set("n", "<leader>t", toggle_or_focus_term, { desc = "Abrir/focar terminal" })

-- Esc no terminal: volta para a janela anterior (terminal continua aberto)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n><C-w>p]], { desc = "Voltar à janela anterior" })

-- Sempre que entrar numa janela de terminal, vai pro modo insert
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.schedule(function()
        if vim.bo.buftype == "terminal" then
          vim.cmd("startinsert")
        end
      end)
    end
  end,
})
