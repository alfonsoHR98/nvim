-- lua/core/cmdline-backup.lua - Configuración de respaldo para autocompletado de comandos

-- Si wilder.nvim da problemas, usa este archivo como respaldo
-- Para activarlo, agrega require("core.cmdline-backup") a tu init.lua

-- Configuración solo con cmp-cmdline (más estable)
local function setup_cmdline_completion()
  local ok, cmp = pcall(require, 'cmp')
  if not ok then
    return
  end

  -- Autocompletado para búsqueda con `/` y `?`
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Autocompletado para comandos con `:`
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })
end

-- Ejecutar después de que nvim-cmp esté cargado
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    vim.schedule(setup_cmdline_completion)
  end,
})
