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
- [Dashboard Personalizado](#-dashboard-personalizado)
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

### Git Integration

- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Señales Git en el gutter, navegación de hunks
- **[vim-fugitive](https://github.com/tpope/vim-fugitive)** - Comandos Git avanzados desde Neovim
- **[vim-rhubarb](https://github.com/tpope/vim-rhubarb)** - Integración con GitHub para vim-fugitive
- **[telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)** - Mejorar performance de Telescope

### Gestión de Archivos

- **[oil.nvim](https://github.com/stevearc/oil.nvim)** - Editor de directorios como si fuera un buffer
- **[nvim-genghis](https://github.com/chrisgrieser/nvim-genghis)** - Operaciones avanzadas de archivos
- **[dressing.nvim](https://github.com/stevearc/dressing.nvim)** - Mejores interfaces para inputs y selecciones

### Terminal

- **[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)** - Terminal mejorado con múltiples modos

### AI y Autocompletado Inteligente

- **[copilot.lua](https://github.com/zbirenbaum/copilot.lua)** - GitHub Copilot oficial para Neovim
- **[copilot-cmp](https://github.com/zbirenbaum/copilot-cmp)** - Integración de Copilot con nvim-cmp
- **[CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim)** - Chat con IA para explicar y generar código

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

### 📂 Gestión de Archivos

| Keymap       | Acción                  | Descripción                   |
| ------------ | ----------------------- | ----------------------------- |
| `<leader>o`  | Abrir Oil               | Editor de directorios         |
| `<leader>O`  | Oil flotante            | Oil en ventana flotante       |
| `<leader>fc` | Crear archivo           | Crear nuevo archivo           |
| `<leader>fr` | Renombrar archivo       | Renombrar archivo actual      |
| `<leader>fm` | Mover/renombrar archivo | Mover y renombrar archivo     |
| `<leader>fd` | Duplicar archivo        | Duplicar archivo actual       |
| `<leader>fD` | Eliminar archivo        | Eliminar archivo (papelera)   |
| `<leader>fp` | Copiar ruta             | Copiar ruta completa          |
| `<leader>fn` | Copiar nombre           | Copiar nombre del archivo     |
| `<leader>fx` | Hacer ejecutable        | Cambiar permisos a ejecutable |

### 🔍 Telescope (Búsqueda)

| Keymap       | Acción                   | Descripción            |
| ------------ | ------------------------ | ---------------------- |
| `<leader>ff` | Buscar archivos          | `Telescope find_files` |
| `<leader>fg` | Buscar texto en archivos | `Telescope live_grep`  |
| `<leader>fb` | Buscar en buffers        | `Telescope buffers`    |
| `<leader>fh` | Buscar en ayuda          | `Telescope help_tags`  |

### 🔧 Git (Control de Versiones)

#### Git con Telescope

| Keymap       | Acción               | Descripción              |
| ------------ | -------------------- | ------------------------ |
| `<leader>gf` | Archivos Git         | `Telescope git_files`    |
| `<leader>gc` | Historial de commits | `Telescope git_commits`  |
| `<leader>gb` | Ramas Git            | `Telescope git_branches` |
| `<leader>gt` | Estado Git           | `Telescope git_status`   |

#### Git con Fugitive

| Keymap       | Acción     | Descripción    |
| ------------ | ---------- | -------------- |
| `<leader>gs` | Git status | `:Git`         |
| `<leader>gc` | Git commit | `:Git commit`  |
| `<leader>gp` | Git push   | `:Git push`    |
| `<leader>gl` | Git pull   | `:Git pull`    |
| `<leader>gb` | Git blame  | `:Git blame`   |
| `<leader>gd` | Git diff   | `:Gvdiffsplit` |

#### Git Hunks (Gitsigns)

| Keymap       | Acción          | Descripción                 |
| ------------ | --------------- | --------------------------- |
| `]c`         | Siguiente hunk  | Navegar al siguiente cambio |
| `[c`         | Hunk anterior   | Navegar al cambio anterior  |
| `<leader>hs` | Stage hunk      | Agregar cambio al stage     |
| `<leader>hr` | Reset hunk      | Deshacer cambio             |
| `<leader>hS` | Stage buffer    | Agregar archivo completo    |
| `<leader>hu` | Undo stage hunk | Deshacer stage del hunk     |
| `<leader>hR` | Reset buffer    | Resetear archivo completo   |
| `<leader>hp` | Preview hunk    | Vista previa del cambio     |
| `<leader>hb` | Blame line      | Ver quién cambió la línea   |
| `<leader>tb` | Toggle blame    | Activar/desactivar blame    |
| `<leader>hd` | Diff this       | Ver diferencias             |
| `<leader>td` | Toggle deleted  | Mostrar líneas eliminadas   |

### 🖥️ Terminal

| Keymap       | Acción                   | Descripción                        |
| ------------ | ------------------------ | ---------------------------------- |
| `<C-\>`      | Toggle terminal flotante | Abrir/cerrar terminal principal    |
| `<leader>tt` | Terminal integrado       | Abrir terminal en buffer           |
| `<leader>tv` | Terminal vertical        | Abrir terminal en split vertical   |
| `<leader>th` | Terminal horizontal      | Abrir terminal en split horizontal |
| `<leader>lg` | LazyGit                  | Abrir LazyGit (Git UI)             |
| `<leader>ht` | Htop                     | Abrir monitor de sistema           |
| `<leader>nd` | Node REPL                | Abrir Node.js interactivo          |

#### En modo terminal:

| Keymap  | Acción                  | Descripción            |
| ------- | ----------------------- | ---------------------- |
| `<Esc>` | Salir del modo terminal | Volver a modo normal   |
| `<C-h>` | Ventana izquierda       | Navegar desde terminal |
| `<C-j>` | Ventana inferior        | Navegar desde terminal |
| `<C-k>` | Ventana superior        | Navegar desde terminal |
| `<C-l>` | Ventana derecha         | Navegar desde terminal |

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

## 📁 Creación de Archivos y Gestión de Proyectos

### 🚀 Formas de crear archivos:

#### 1. **Con Oil.nvim (Recomendado)**

```
<leader>o  →  Abre Oil (editor de directorios)
```

- Navega como si editaras un buffer normal
- Usa `o` para crear archivos/carpetas
- Edita los nombres directamente en el buffer
- Guarda con `:w` para aplicar cambios

#### 2. **Con NvimTree**

```
<leader>e  →  Abre NvimTree
```

- Navega a la carpeta deseada
- Presiona `a` para crear archivo/carpeta
- Escribe el nombre (ej: `services/userService.js`)

#### 3. **Con Genghis (Operaciones avanzadas)**

```
<leader>fc  →  Crear nuevo archivo
<leader>fd  →  Duplicar archivo actual
<leader>fm  →  Mover/renombrar archivo
```

#### 4. **Con comandos vim directos**

```vim
:e src/services/userService.js
:edit components/UserCard.tsx
```

#### 5. **Con Telescope**

```
<leader>ff  →  Buscar archivos
```

- Escribe la ruta completa del archivo
- Si no existe, se creará automáticamente

### 🎯 Ejemplos prácticos para proyectos:

#### **Crear un servicio:**

```
<leader>fc  →  src/services/userService.js
<leader>fc  →  src/services/authService.ts
```

#### **Crear un componente:**

```
<leader>fc  →  src/components/UserCard.tsx
<leader>fc  →  src/components/Button/index.tsx
```

#### **Crear archivos de configuración:**

```
<leader>fc  →  config/database.js
<leader>fc  →  .env.example
```

#### **Estructurar un módulo completo:**

```
<leader>o  →  Abrir Oil
# Crear estructura:
src/
  modules/
    user/
      controller.js
      service.js
      model.js
      routes.js
```

### 💡 Tips para gestión eficiente:

1. **Usa Oil** (`<leader>o`) para crear múltiples archivos/carpetas rápidamente
2. **Duplica archivos similares** con `<leader>fd` para mantener estructura
3. **Usa plantillas** duplicando archivos existentes como base
4. **Navega rápido** con `<leader>ff` para encontrar archivos
5. **Organiza por características** en lugar de por tipo de archivo

## 🤝 Contribuciones

¡Las contribuciones son bienvenidas! Siéntete libre de abrir issues o pull requests.

---

_Esta configuración está optimizada para un flujo de trabajo moderno de desarrollo con Neovim._

### 🤖 GitHub Copilot (AI Assistant)

#### Sugerencias de Código (Insert Mode)

| Keymap     | Acción                 | Descripción                         |
| ---------- | ---------------------- | ----------------------------------- |
| `Alt + l`  | Aceptar sugerencia     | Acepta sugerencia de Copilot        |
| `Alt + ]`  | Siguiente sugerencia   | Navega a la siguiente sugerencia    |
| `Alt + [`  | Anterior sugerencia    | Navega a la anterior sugerencia     |
| `Ctrl + ]` | Descartar sugerencia   | Descarta la sugerencia actual       |
| `Tab`      | Navegar autocompletado | Navega en el menú de autocompletado |

#### CopilotChat (Normal Mode)

| Keymap       | Acción                 | Descripción              |
| ------------ | ---------------------- | ------------------------ |
| `<leader>cc` | Abrir chat             | Abre chat con Copilot    |
| `<leader>ct` | Toggle chat            | Activa/desactiva chat    |
| `<leader>cm` | Generar commit message | Genera mensaje de commit |

#### CopilotChat (Visual Mode - selecciona código primero)

| Keymap        | Acción           | Descripción                     |
| ------------- | ---------------- | ------------------------------- |
| `<leader>cx`  | Explicar código  | Explica el código seleccionado  |
| `<leader>cr`  | Revisar código   | Revisa el código seleccionado   |
| `<leader>cf`  | Arreglar código  | Sugiere arreglos para el código |
| `<leader>co`  | Optimizar código | Sugiere optimizaciones          |
| `<leader>cd`  | Agregar docs     | Genera documentación            |
| `<leader>cts` | Generar tests    | Genera tests para el código     |

#### Comandos de Control

| Keymap       | Acción             | Descripción                     |
| ------------ | ------------------ | ------------------------------- |
| `<leader>cp` | Panel Copilot      | Abre panel de sugerencias       |
| `<leader>cs` | Status Copilot     | Muestra estado de conexión      |
| `<leader>ce` | Activar Copilot    | Activa Copilot                  |
| `<leader>cD` | Desactivar Copilot | Desactiva Copilot temporalmente |
