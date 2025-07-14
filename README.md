# 🚀 Neovim Configuration

<a href="https://dotfyle.com/alfonsoHR98/nvim"><img src="https://dotfyle.com/alfonsoHR98/nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/alfonsoHR98/nvim"><img src="https://dotfyle.com/alfonsoHR98/nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/alfonsoHR98/nvim"><img src="https://dotfyle.com/alfonsoHR98/nvim/badges/plugin-manager?style=flat" /></a>

Una configuración moderna y modular de Neovim usando Lua con lazy.nvim como gestor de plugins.

## 📋 Tabla de Contenidos

- [Instalación](#-instalación)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Plugins Incluidos](#-plugins-incluidos)
- [Keymaps (Atajos de Teclado)](#-keymaps-atajos-de-teclado)
- [Configuraciones](#-configuraciones)
- [Language Servers](#-language-servers)

## 🛠️ Instalación

> **Requisitos**: Neovim 0.9+. Siempre revisa el código antes de instalar una configuración.

### Opción 1: Instalación Estándar

```bash
git clone git@github.com:alfonsoHR98/nvim ~/.config/nvim
```

### Opción 2: Instalación como Configuración Alternativa

```bash
git clone git@github.com:alfonsoHR98/nvim ~/.config/alfonsoHR98/nvim
```

Luego abre Neovim con:

```bash
NVIM_APPNAME=alfonsoHR98/nvim/ nvim
```

## 📁 Estructura del Proyecto

```bash
~/.config/nvim/
├── init.lua                    # Punto de entrada principal
├── lua/
│   ├── core/                   # Configuraciones básicas de Neovim
│   │   ├── options.lua         # Opciones y configuraciones (set commands)
│   │   ├── keymaps.lua         # Mapeos de teclas globales
│   │   └── autocmds.lua        # Autocomandos
│   └── plugins/                # Gestión de plugins
│       ├── init.lua            # Configuración de lazy.nvim y plugins básicos
│       ├── lsp.lua             # Configuración de LSP y autocompletado
│       └── treesitter.lua      # Configuración de Treesitter
```

## 🔌 Plugins Incluidos

### Plugin Manager

- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Gestor de plugins moderno con lazy loading

### Esenciales

- **[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)** - Biblioteca de utilidades para Lua
- **[catppuccin](https://github.com/catppuccin/nvim)** - Tema de colores elegante (variante Mocha)

### Navegación y Exploración

- **[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)** - Explorador de archivos
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder para archivos, buffers y más
- **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - Iconos para archivos

### UI y Estética

- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Statusline moderna y configurable
- **[alpha-nvim](https://github.com/goolord/alpha-nvim)** - Dashboard personalizado de inicio
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Cierre automático de paréntesis, llaves, etc.
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** - Plugin para comentar código fácilmente

### LSP y Autocompletado

- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - Configuraciones para Language Server Protocol
- **[mason.nvim](https://github.com/williamboman/mason.nvim)** - Instalador de LSP servers, DAPs, linters
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Motor de autocompletado
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Motor de snippets

### Sintaxis y Resaltado

- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Resaltado de sintaxis avanzado

## ⌨️ Keymaps (Atajos de Teclado)

### 🚀 Leader Key

- **Leader**: `<Space>` (barra espaciadora)

### 📁 Gestión de Archivos y Buffers

| Keymap       | Acción                  | Descripción      |
| ------------ | ----------------------- | ---------------- |
| `<leader>w`  | Guardar archivo         | `:w<CR>`         |
| `<leader>q`  | Cerrar ventana/salir    | `:q<CR>`         |
| `<leader>wq` | Guardar y salir         | `:wq<CR>`        |
| `<leader>e`  | Abrir/cerrar explorador | `NvimTreeToggle` |
| `<leader>pv` | Explorador nativo       | `vim.cmd.Ex`     |
| `<leader>a`  | Abrir Dashboard         | `Alpha`          |

### 🔍 Telescope (Búsqueda)

| Keymap       | Acción                   | Descripción            |
| ------------ | ------------------------ | ---------------------- |
| `<leader>ff` | Buscar archivos          | `Telescope find_files` |
| `<leader>fg` | Buscar texto en archivos | `Telescope live_grep`  |
| `<leader>fb` | Buscar en buffers        | `Telescope buffers`    |
| `<leader>fh` | Buscar en ayuda          | `Telescope help_tags`  |

### 🪟 Navegación entre Ventanas

| Keymap  | Acción            | Descripción |
| ------- | ----------------- | ----------- |
| `<C-h>` | Ventana izquierda | `<C-w>h`    |
| `<C-j>` | Ventana inferior  | `<C-w>j`    |
| `<C-k>` | Ventana superior  | `<C-w>k`    |
| `<C-l>` | Ventana derecha   | `<C-w>l`    |

### 📏 Redimensionar Ventanas

| Keymap      | Acción          | Descripción           |
| ----------- | --------------- | --------------------- |
| `<C-Up>`    | Reducir altura  | `:resize -2`          |
| `<C-Down>`  | Aumentar altura | `:resize +2`          |
| `<C-Left>`  | Reducir ancho   | `:vertical resize -2` |
| `<C-Right>` | Aumentar ancho  | `:vertical resize +2` |

### 📄 Navegación entre Buffers

| Keymap  | Acción           | Descripción  |
| ------- | ---------------- | ------------ |
| `<S-l>` | Siguiente buffer | `:bnext`     |
| `<S-h>` | Buffer anterior  | `:bprevious` |

### ✂️ Edición de Texto (Modo Visual)

| Keymap  | Acción                     | Descripción    |
| ------- | -------------------------- | -------------- |
| `<A-j>` | Mover línea abajo          | `:m .+1<CR>==` |
| `<A-k>` | Mover línea arriba         | `:m .-2<CR>==` |
| `p`     | Pegar sin afectar registro | `"_dP`         |
| `<`     | Indentar izquierda         | `<gv`          |
| `>`     | Indentar derecha           | `>gv`          |

### 🔍 Búsqueda y Navegación

| Keymap       | Acción                        | Descripción    |
| ------------ | ----------------------------- | -------------- |
| `<leader>nh` | Limpiar highlights            | `:nohighlight` |
| `<C-d>`      | Media página abajo + centrar  | `<C-d>zz`      |
| `<C-u>`      | Media página arriba + centrar | `<C-u>zz`      |

### 💬 Comentarios

| Keymap | Acción                        | Descripción                 |
| ------ | ----------------------------- | --------------------------- |
| `gcc`  | Comentar línea actual         | Toggle comentario línea     |
| `gc`   | Comentar líneas (modo visual) | Toggle comentario linewise  |
| `gbc`  | Comentar bloque actual        | Toggle comentario bloque    |
| `gb`   | Comentar bloque (modo visual) | Toggle comentario blockwise |

### 🔧 LSP (Language Server Protocol)

| Keymap       | Acción                | Descripción                  |
| ------------ | --------------------- | ---------------------------- |
| `gD`         | Ir a declaración      | `vim.lsp.buf.declaration`    |
| `gd`         | Ir a definición       | `vim.lsp.buf.definition`     |
| `K`          | Mostrar documentación | `vim.lsp.buf.hover`          |
| `gi`         | Ir a implementación   | `vim.lsp.buf.implementation` |
| `<C-k>`      | Ayuda de firma        | `vim.lsp.buf.signature_help` |
| `<leader>rn` | Renombrar símbolo     | `vim.lsp.buf.rename`         |
| `<leader>ca` | Acciones de código    | `vim.lsp.buf.code_action`    |
| `gr`         | Mostrar referencias   | `vim.lsp.buf.references`     |
| `<leader>d`  | Diagnóstico flotante  | `vim.diagnostic.open_float`  |
| `[d`         | Diagnóstico anterior  | `vim.diagnostic.goto_prev`   |
| `]d`         | Siguiente diagnóstico | `vim.diagnostic.goto_next`   |
| `<leader>q`  | Lista de diagnósticos | `vim.diagnostic.setloclist`  |

### 💬 Autocompletado (nvim-cmp)

| Keymap      | Acción              | Descripción             |
| ----------- | ------------------- | ----------------------- |
| `<C-k>`     | Item anterior       | Navegar hacia arriba    |
| `<C-j>`     | Item siguiente      | Navegar hacia abajo     |
| `<C-b>`     | Scroll docs arriba  | Desplazar documentación |
| `<C-f>`     | Scroll docs abajo   | Desplazar documentación |
| `<C-Space>` | Activar completado  | Mostrar sugerencias     |
| `<C-e>`     | Cancelar completado | Cerrar menú             |
| `<CR>`      | Confirmar selección | Aceptar sugerencia      |

### 🌲 Treesitter

| Keymap      | Acción                | Descripción                    |
| ----------- | --------------------- | ------------------------------ |
| `<C-space>` | Selección incremental | Expandir selección inteligente |
| `<bs>`      | Reducir selección     | Reducir nodo seleccionado      |

### 📋 Objetos de Texto (Treesitter)

| Keymap | Acción            | Descripción         |
| ------ | ----------------- | ------------------- |
| `af`   | Función completa  | Incluye declaración |
| `if`   | Dentro de función | Solo contenido      |
| `ac`   | Clase completa    | Incluye declaración |
| `ic`   | Dentro de clase   | Solo contenido      |

## ⚙️ Configuraciones

### Opciones Principales

- **Números de línea**: Relativos y absolutos
- **Indentación**: 2 espacios, expandir tabs
- **Búsqueda**: Case-insensitive inteligente
- **Clipboard**: Integrado con sistema
- **Tema**: Catppuccin Mocha con colores verdaderos
- **Archivos**: Sin swap, con undo persistente
- **Autopairs**: Cierre automático de paréntesis y llaves
- **Comentarios**: Fácil toggle de comentarios con `gcc`

### Autocomandos

- ✨ Resaltar texto al copiar
- 🧹 Eliminar espacios en blanco al guardar
- 📍 Recordar posición del cursor
- ❌ Cerrar ventanas especiales con `q`

## 🛠️ Language Servers

### Instalados por Defecto

- **lua_ls** - Lua Language Server
- **ts_ls** - TypeScript/JavaScript Language Server (anteriormente tsserver)
- **cssls** - CSS Language Server
- **html** - HTML Language Server
- **jsonls** - JSON Language Server
- **eslint** - ESLint para linting de JavaScript/TypeScript

### Agregar Nuevos LSP

Para agregar soporte para más lenguajes, edita `lua/plugins/lsp.lua` y agrega en `ensure_installed`:

```lua
ensure_installed = {
  "lua_ls",
  "ts_ls",       -- TypeScript/JavaScript (nuevo nombre)
  "pyright",     -- Python
  "rust_analyzer", -- Rust
  -- Más servidores...
}
```

## 🚀 Primeros Pasos

1. **Instala la configuración** siguiendo las instrucciones de instalación
2. **Abre Neovim** - Los plugins se instalarán automáticamente
3. **Dashboard de bienvenida** - Verás un dashboard personalizado con tu nombre y accesos rápidos
4. **Prueba los keymaps básicos**:
   - `<Space>ff` para buscar archivos
   - `<Space>e` para abrir el explorador
   - `<Space>w` para guardar
   - `<Space>a` para volver al dashboard
5. **Instala LSP servers** con `:Mason` para tu lenguaje favorito

## 🎨 Dashboard Personalizado

El dashboard incluye:

### ✨ Características principales

- **Saludo personalizado** con ASCII art de "NEOVIM"
- **Fecha y hora actual** actualizadas dinámicamente
- **Información del proyecto** actual
- **Contador de plugins** cargados
- **Accesos rápidos** a funciones importantes
- **Tips útiles** y keymaps principales

### 🎯 Acciones rápidas del dashboard:

- **f** - Buscar archivos (`Telescope find_files`)
- **n** - Nuevo archivo
- **r** - Archivos recientes (`Telescope oldfiles`)
- **g** - Buscar texto (`Telescope live_grep`)
- **c** - Abrir configuración
- **p** - Gestionar plugins (`Lazy`)
- **m** - Mason (LSP servers)
- **h** - Ayuda (`Telescope help_tags`)
- **q** - Salir

### 📱 Personalización

Puedes modificar el dashboard editando `/lua/config/alpha.lua`:

- Cambiar el ASCII art del header
- Personalizar los botones y acciones
- Modificar los colores y el footer
- Agregar información adicional

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Siéntete libre de abrir issues o pull requests.

---

_Esta configuración está optimizada para un flujo de trabajo moderno de desarrollo con Neovim._
