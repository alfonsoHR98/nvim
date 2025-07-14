-- lua/config/alpha.lua - Dashboard personalizado para Neovim

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- ASCII Art personalizado (puedes cambiarlo por tu nombre o logo favorito)
dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
  "        🚀 Bienvenido Alfonso - Coding Time! 🚀      ",
  "                                                     ",
}

-- Botones de acciones rápidas
dashboard.section.buttons.val = {
  dashboard.button("f", "  Buscar Archivos", ":Telescope find_files <CR>"),
  dashboard.button("n", "  Nuevo Archivo", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", "  Archivos Recientes", ":Telescope oldfiles <CR>"),
  dashboard.button("g", "  Buscar Texto", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuración", ":e $MYVIMRC <CR>"),
  dashboard.button("p", "  Plugins", ":Lazy <CR>"),
  dashboard.button("m", "  Mason (LSP)", ":Mason <CR>"),
  dashboard.button("h", "  Ayuda", ":Telescope help_tags <CR>"),
  dashboard.button("q", "  Salir", ":qa <CR>"),
}

-- Función para mostrar información del proyecto actual
local function get_project_info()
  local cwd = vim.fn.getcwd()
  local project_name = vim.fn.fnamemodify(cwd, ":t")
  return "📁 Proyecto: " .. project_name
end

-- Función para mostrar estadísticas de plugins
local function get_plugin_count()
  local lazy_stats = require("lazy").stats()
  return "🔌 Plugins: " .. lazy_stats.count .. " cargados"
end

-- Función para mostrar la hora actual
local function get_time()
  return "🕐 " .. os.date("%H:%M:%S")
end

-- Función para mostrar la fecha actual
local function get_date()
  return "📅 " .. os.date("%A, %d de %B del %Y")
end

-- Footer con información útil
dashboard.section.footer.val = {
  "",
  get_date(),
  get_time(),
  get_project_info(),
  get_plugin_count(),
  "",
  "💡 Tip: Usa <Space>ff para buscar archivos rápidamente",
  "",
  "⌨️  Keymaps principales:",
  "   <Space>e  → Explorador de archivos",
  "   <Space>ff → Buscar archivos",
  "   <Space>fg → Buscar texto",
  "   <Space>w  → Guardar archivo",
  "",
}

-- Configuración de colores y estilo
dashboard.section.header.opts.hl = "Type"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.opts.hl = "Comment"

-- Configuración final
dashboard.config.opts.noautocmd = true

-- Configurar alpha
alpha.setup(dashboard.config)

-- Autocomando para actualizar la hora en el dashboard
vim.api.nvim_create_autocmd("User", {
  pattern = "AlphaReady",
  callback = function()
    -- Actualizar footer cada vez que se muestra el dashboard
    dashboard.section.footer.val = {
      "",
      get_date(),
      get_time(),
      get_project_info(),
      get_plugin_count(),
      "",
      "💡 Tip: Usa <Space>ff para buscar archivos rápidamente",
      "",
      "⌨️  Keymaps principales:",
      "   <Space>e  → Explorador de archivos",
      "   <Space>ff → Buscar archivos",
      "   <Space>fg → Buscar texto",
      "   <Space>w  → Guardar archivo",
      "",
    }
  end,
})

-- Keymap para volver al dashboard
vim.keymap.set("n", "<leader>a", ":Alpha<CR>", { desc = "Abrir Dashboard" })
