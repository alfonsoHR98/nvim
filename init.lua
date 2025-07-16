-- init.lua - Punto de entrada principal de la configuración de Neovim

-- Configuración inicial de Neovim

-- Configuración básica
vim.g.mapleader = " " -- Establecer la tecla líder como espacio
vim.g.maplocalleader = " " -- Establecer la tecla líder local como espacio

-- Habilitar números de línea relativos
vim.wo.number = true
vim.wo.relativenumber = true

-- Cargar optimizaciones de rendimiento primero
require("core.performance") -- Optimizaciones de rendimiento

-- Cargar configuraciones básicas
require("core.options")   -- Opciones básicas de Neovim
require("core.keymaps")   -- Mapeos de teclas
require("core.autocmds")  -- Autocomandos

-- Lazy.nvim (gestor de plugins)
require("plugins")

-- Cargar configuraciones específicas (solo si existen)
local function load_if_exists(module)
  local ok, _ = pcall(require, module)
  if not ok then
    -- El módulo no existe o hay un error, lo ignoramos silenciosamente
    vim.notify("Módulo " .. module .. " no encontrado. Creando estructura...", vim.log.levels.WARN)
  end
end

-- Intentar cargar los módulos de configuración
load_if_exists("config.options")
load_if_exists("config.keymaps")
load_if_exists("config.autocmds")