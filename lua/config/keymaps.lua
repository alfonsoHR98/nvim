-- Configuración de teclas y atajos de teclado

-- Modo normal
-- Navegación entre ventanas
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Ir a la ventana izquierda" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Ir a la ventana inferior" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Ir a la ventana superior" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Ir a la ventana derecha" })

-- Redimensionar ventanas
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { silent = true, desc = "Reducir altura de la ventana" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { silent = true, desc = "Aumentar altura de la ventana" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true, desc = "Reducir ancho de la ventana" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true, desc = "Aumentar ancho de la ventana" })

-- Navegación entre buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { silent = true, desc = "Siguiente buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { silent = true, desc = "Buffer anterior" })

-- Manipulación de texto
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Eliminar sin copiar" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "Eliminar sin copiar" })

-- Modo visual
-- Mover texto arriba y abajo
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover línea hacia abajo" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover línea hacia arriba" })

-- Mantener la selección al indentar
vim.keymap.set("v", "<", "<gv", { desc = "Reducir indentación" })
vim.keymap.set("v", ">", ">gv", { desc = "Aumentar indentación" })

-- No sobrescribir el registro al pegar sobre la selección
vim.keymap.set("v", "p", "\"_dP", { desc = "Pegar sin sobrescribir registro" })

-- Otros atajos útiles
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Dividir ventana verticalmente" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Dividir ventana horizontalmente" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Guardar archivo" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Cerrar ventana" })
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Desactivar resaltado de búsqueda" })
