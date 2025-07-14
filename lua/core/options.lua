-- lua/core/options.lua - Configuraciones básicas de Neovim

local opt = vim.opt

-- Números de línea
opt.number = true
opt.relativenumber = true

-- Indentación
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Búsqueda
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Apariencia
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.wrap = false
opt.cursorline = true

-- Comportamiento
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Mouse
opt.mouse:append("a")

-- Completado
opt.completeopt = "menuone,noselect"

-- Terminal y colores
opt.termguicolors = true
opt.timeoutlen = 300 -- Tiempo para secuencias de teclas
opt.updatetime = 100 -- Reducir para mejor respuesta (antes 250)
opt.redrawtime = 1500 -- Tiempo máximo para redibuja
opt.synmaxcol = 240 -- Limitar syntax highlighting en líneas largas
opt.lazyredraw = true -- No redibujar durante macros

-- Configuraciones específicas para terminales
if vim.fn.exists('$TMUX') == 1 then
  opt.background = "dark"
end

-- Mejorar experiencia en terminal
vim.g.terminal_color_0 = "#45475a"  -- Catppuccin colors
vim.g.terminal_color_1 = "#f38ba8"
vim.g.terminal_color_2 = "#a6e3a1"
vim.g.terminal_color_3 = "#f9e2af"
vim.g.terminal_color_4 = "#89b4fa"
vim.g.terminal_color_5 = "#f5c2e7"
vim.g.terminal_color_6 = "#94e2d5"
vim.g.terminal_color_7 = "#bac2de"
vim.g.terminal_color_8 = "#585b70"
vim.g.terminal_color_9 = "#f38ba8"
vim.g.terminal_color_10 = "#a6e3a1"
vim.g.terminal_color_11 = "#f9e2af"
vim.g.terminal_color_12 = "#89b4fa"
vim.g.terminal_color_13 = "#f5c2e7"
vim.g.terminal_color_14 = "#94e2d5"
vim.g.terminal_color_15 = "#a6adc8"
