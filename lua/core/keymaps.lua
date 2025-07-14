-- lua/core/keymaps.lua - Mapeos de teclas

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Guardar y salir
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)
keymap("n", "<leader>wq", ":wq<CR>", opts)

-- Navegación entre ventanas
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Redimensionar ventanas
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navegación entre buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Mover texto arriba y abajo
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Indentación en modo visual
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Limpiar highlights de búsqueda
keymap("n", "<leader>nh", ":nohighlight<CR>", opts)

-- Navegación rápida
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Explorador de archivos (si usas netrw)
keymap("n", "<leader>pv", vim.cmd.Ex, opts)

-- Terminal integrado
keymap("n", "<leader>tt", ":terminal<CR>", opts)
keymap("n", "<leader>tv", ":vsplit | terminal<CR>", opts)
keymap("n", "<leader>th", ":split | terminal<CR>", opts)

-- Terminal mode mappings
keymap("t", "<Esc>", "<C-\\><C-n>", opts) -- Salir del modo terminal
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)

-- GitHub Copilot keymaps
keymap("n", "<leader>cp", ":Copilot panel<CR>", { desc = "Copilot panel" })
keymap("n", "<leader>cs", ":Copilot status<CR>", { desc = "Copilot status" })
keymap("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Copilot enable" })
keymap("n", "<leader>cD", ":Copilot disable<CR>", { desc = "Copilot disable" })

-- CopilotChat keymaps
keymap("n", "<leader>cc", ":CopilotChat<CR>", { desc = "Open Copilot Chat" })
keymap("n", "<leader>ct", ":CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
keymap("v", "<leader>cx", ":CopilotChatExplain<CR>", { desc = "Explain selected code" })
keymap("v", "<leader>cr", ":CopilotChatReview<CR>", { desc = "Review selected code" })
keymap("v", "<leader>cf", ":CopilotChatFix<CR>", { desc = "Fix selected code" })
keymap("v", "<leader>co", ":CopilotChatOptimize<CR>", { desc = "Optimize selected code" })
keymap("v", "<leader>cd", ":CopilotChatDocs<CR>", { desc = "Add docs to selected code" })
keymap("v", "<leader>cts", ":CopilotChatTests<CR>", { desc = "Generate tests for selected code" })
keymap("n", "<leader>cm", ":CopilotChatCommit<CR>", { desc = "Generate commit message" })
