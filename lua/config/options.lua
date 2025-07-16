-- Opciones de configuración generales para Neovim

-- Indentación y tabulaciones
vim.opt.tabstop = 2 -- 2 espacios por tabulación
vim.opt.shiftwidth = 2 -- Cambiar 2 espacios cuando se indenta
vim.opt.expandtab = true -- Convertir tabulaciones a espacios
vim.opt.smartindent = true -- Indentación inteligente

-- Apariencia
vim.opt.termguicolors = true -- Habilitar colores de 24 bits
vim.opt.signcolumn = "yes" -- Mostrar siempre la columna de signos
vim.opt.scrolloff = 8 -- Mantener al menos 8 líneas visibles por encima/debajo del cursor
vim.opt.wrap = false -- No envolver líneas largas

-- Búsqueda
vim.opt.hlsearch = true -- Resaltar coincidencias de búsqueda
vim.opt.ignorecase = true -- Ignorar mayúsculas y minúsculas en búsquedas
vim.opt.smartcase = true -- Ignorar mayúsculas y minúsculas a menos que incluya una mayúscula

-- Rendimiento y UI
vim.opt.updatetime = 250 -- Actualización más rápida del archivo de intercambio (ms)
vim.opt.timeoutlen = 300 -- Tiempo para completar una secuencia de teclas (ms)
vim.opt.clipboard = "unnamedplus" -- Usar el portapapeles del sistema
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Opciones para el autocompletado

-- Otras opciones
vim.opt.backup = false -- No crear archivos de copia de seguridad
vim.opt.swapfile = false -- No crear archivos de intercambio
vim.opt.undofile = true -- Activar persistencia de deshacer
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir" -- Directorio para archivos de deshacer

-- Opciones específicas para desarrollo
vim.opt.cursorline = true -- Resaltar la línea actual
vim.opt.showmatch = true -- Mostrar paréntesis/llaves/corchetes coincidentes
