-- Autocomandos de Neovim

local augroup = vim.api.nvim_create_augroup("CustomAutocommands", { clear = true })

-- Resaltar al copiar
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
  end,
  desc = "Resaltar texto copiado",
})

-- Recordar la última posición al abrir un archivo
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, "\"")
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Recordar última posición al abrir un archivo",
})

-- Eliminar espacios en blanco al final de las líneas al guardar
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
  desc = "Eliminar espacios en blanco al final de las líneas",
})

-- Detectar cuando se escriben variables con ${} dentro de strings y convertir a backticks
vim.api.nvim_create_autocmd("InsertLeave", {
  group = augroup,
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function()
    local line = vim.api.nvim_get_current_line()
    if line:match('["\'](.*%${.*}.*)["\']') then
      -- Encontramos una potencial interpolación en una string con comillas
      local new_line = line:gsub('(["\'])(.*%${.*}.*)["\']', '`%2`')
      vim.api.nvim_set_current_line(new_line)
    end
  end,
  desc = "Convertir strings con ${} a template strings (backticks)",
})

-- Establecer tipos de archivo específicos
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup,
  pattern = "*.md",
  command = "setlocal wrap",
  desc = "Activar ajuste de líneas en archivos Markdown",
})

-- Recargar archivo cuando cambia en disco
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = augroup,
  pattern = "*",
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
  desc = "Recargar archivo cuando cambia en disco",
})
