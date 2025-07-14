-- lua/core/autocmds.lua - Autocomandos

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Grupo general para autocomandos
local general = augroup("General", { clear = true })

-- Resaltar al copiar texto
autocmd("TextYankPost", {
  group = general,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Quitar espacios en blanco al final al guardar
autocmd("BufWritePre", {
  group = general,
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

-- Recordar posición del cursor
autocmd("BufReadPost", {
  group = general,
  pattern = "*",
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line("$") then
      vim.api.nvim_win_set_cursor(0, { line, 0 })
    end
  end,
})

-- Auto cerrar algunos tipos de ventanas con 'q'
autocmd("FileType", {
  group = general,
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
  end,
})
