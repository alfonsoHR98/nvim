# GitHub Copilot en Neovim - Guía de Uso

## 🚀 Configuración Instalada

- **copilot.lua** - Plugin principal de Copilot (versión moderna)
- **copilot-cmp** - Integración con autocompletado nvim-cmp
- **CopilotChat** - Chat con IA para explicar, revisar y generar código

## ⌨️ Keymaps Principales

### 🤖 Sugerencias de Código (Insert Mode)

- `Alt + l` - Aceptar sugerencia de Copilot
- `Alt + ]` - Siguiente sugerencia
- `Alt + [` - Anterior sugerencia
- `Ctrl + ]` - Descartar sugerencia
- `Tab` - Navegar en autocompletado (nvim-cmp)

### 💬 CopilotChat (Normal Mode)

- `<leader>cc` - Abrir chat con Copilot
- `<leader>ct` - Toggle chat
- `<leader>cm` - Generar mensaje de commit

### 📝 CopilotChat (Visual Mode - selecciona código primero)

- `<leader>cx` - Explicar código seleccionado
- `<leader>cr` - Revisar código seleccionado
- `<leader>cf` - Arreglar código seleccionado
- `<leader>co` - Optimizar código seleccionado
- `<leader>cd` - Agregar documentación
- `<leader>cts` - Generar tests

### 🛠️ Comandos de Control

- `<leader>cp` - Abrir panel de Copilot
- `<leader>cs` - Ver status de Copilot
- `<leader>ce` - Activar Copilot
- `<leader>cD` - Desactivar Copilot

## 📋 Comandos Útiles

```vim
:Copilot setup        " Configurar autenticación
:Copilot status       " Ver estado de conexión
:Copilot enable       " Activar Copilot
:Copilot disable      " Desactivar Copilot
:Copilot panel        " Abrir panel de sugerencias
```

## 🔐 Primer Uso

1. **Autenticar con GitHub:**

   ```bash
   :Copilot setup
   ```

2. **Verificar estado:**

   ```bash
   :Copilot status
   ```

3. **Empezar a escribir código** - Copilot sugerirá automáticamente

## 💡 Tips de Uso

- **Comentarios descriptivos** ayudan a Copilot a entender tu intención
- **Nombres de función claros** generan mejores sugerencias
- **Copilot funciona mejor** con archivos que tienen contexto
- **Usa CopilotChat** para explicaciones detalladas de código complejo

## 🎯 Ejemplos de Uso

### Generar función:

```javascript
// Función para validar email con regex
function validateEmail
```

_Copilot completará automáticamente_

### Usar CopilotChat:

1. Selecciona código complejo
2. Presiona `<leader>cx`
3. Copilot te explicará línea por línea

## 🔧 Troubleshooting

- Si no aparecen sugerencias: `:Copilot status`
- Si hay conflictos con Tab: La configuración está optimizada para nvim-cmp
- Para deshabilitar temporalmente: `<leader>cD`
