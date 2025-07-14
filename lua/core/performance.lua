-- lua/core/performance.lua - Optimizaciones de rendimiento

-- Desactivar plugins innecesarios por defecto
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1

-- Configuraciones de rendimiento para terminal
if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
end

-- Optimizar para archivos grandes
vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function()
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
    if ok and stats and stats.size > 100000 then -- 100KB
      vim.opt_local.syntax = "off"
      vim.opt_local.filetype = ""
      vim.opt_local.undolevels = -1
      vim.opt_local.undoreload = 0
      vim.opt_local.list = false
    end
  end,
})

-- Mejorar rendimiento de LSP
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  max_width = 80,
  max_height = 20,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
  max_width = 80,
  max_height = 20,
})

-- Configurar diagnósticos para mejor rendimiento
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = "if_many",
    spacing = 2,
  },
  float = {
    source = "always",
    border = "rounded",
  },
  signs = true,
  underline = true,
  update_in_insert = false, -- CRÍTICO: No actualizar en modo insert
  severity_sort = true,
})

-- Optimizar LSP para mejor rendimiento
vim.lsp.set_log_level("ERROR") -- Reducir logs
-- Deshabilitar semantic tokens si causan lentitud
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      -- Desactivar semantic tokens para mejor rendimiento
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
