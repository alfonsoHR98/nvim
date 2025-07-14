-- init.lua - Punto de entrada principal de la configuración de Neovim

-- Cargar optimizaciones de rendimiento primero
require("core.performance") -- Optimizaciones de rendimiento

-- Cargar configuraciones básicas
require("core.options")   -- Opciones básicas de Neovim
require("core.keymaps")   -- Mapeos de teclas
require("core.autocmds")  -- Autocomandos

-- Cargar plugins
require("plugins")        -- Esto carga lua/plugins/init.lua