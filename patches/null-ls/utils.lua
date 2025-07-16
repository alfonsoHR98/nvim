-- Parche para reemplazar vim.tbl_flatten en null-ls.nvim

local M = {}

-- Reemplazo para vim.tbl_flatten
M.flatten = function(tbl)
  return vim.iter(tbl):flatten():totable()
end

-- Función para validar, sustituyendo vim.validate
M.validate = function(...)
  return vim.validate(...)
end

return M
