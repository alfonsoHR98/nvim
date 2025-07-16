-- Parche para reemplazar vim.tbl_add_reverse_lookup en null-ls.nvim

local M = {}

-- Reemplazo manual para vim.tbl_add_reverse_lookup
local function add_reverse_lookup(tbl)
  for k, v in pairs(tbl) do
    tbl[v] = k
  end
  return tbl
end

M.methods = {
  FORMATTING = "textDocument/formatting",
  RANGE_FORMATTING = "textDocument/rangeFormatting",
  DIAGNOSTICS = "textDocument/publishDiagnostics",
  CODE_ACTION = "textDocument/codeAction",
  COMPLETION = "textDocument/completion",
  HOVER = "textDocument/hover",
}

-- Aplicar reverse lookup manualmente
add_reverse_lookup(M.methods)

return M
