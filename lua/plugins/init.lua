-- lua/plugins/init.lua - Gestión de plugins con lazy.nvim

-- Instalar lazy.nvim automáticamente si no está instalado
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- última versión estable
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configurar lazy.nvim
require("lazy").setup({
  -- Aquí puedes especificar plugins directamente o importar desde otros archivos
  
  -- Plugins básicos
  {
    "nvim-lua/plenary.nvim", -- Biblioteca de utilidades para otros plugins
  },
  
  -- Tema de colores
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = false, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          telescope = {
            enabled = true,
          },
          lsp_trouble = false,
          which_key = false,
        },
      })
      
      -- setup must be called before loading
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
    end,
  },
  
  -- Telescope (fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim", -- Mejorar performance
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = "move_selection_previous",
              ["<C-j>"] = "move_selection_next",
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      })
      
      -- Cargar extensiones
      pcall(telescope.load_extension, 'fzf')
      
      -- Keymaps para telescope
      vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Find text" })
      vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
      vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find help" })
      
      -- Git keymaps con Telescope
      vim.keymap.set("n", "<leader>gf", ":Telescope git_files<CR>", { desc = "Git files" })
      vim.keymap.set("n", "<leader>gc", ":Telescope git_commits<CR>", { desc = "Git commits" })
      vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { desc = "Git branches" })
      vim.keymap.set("n", "<leader>gt", ":Telescope git_status<CR>", { desc = "Git status" })
    end,
  },

  -- Telescope FZF extension for better performance
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  
  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },

  -- Dashboard personalizado
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require("config.alpha")
    end,
  },

  -- Autopairs - cerrar automáticamente paréntesis, llaves, etc.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- enable treesitter
        ts_config = {
          lua = { "string" }, -- don't add pairs in lua string treesitter nodes
          javascript = { "template_string" }, -- don't add pairs in javascript template_string
          java = false, -- don't check treesitter on java
        },
      })
      
      -- Integration with nvim-cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- Comment plugin
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gcc", mode = "n", desc = "Comment toggle current line" },
      { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n", desc = "Comment toggle current block" },
      { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
    },
    config = function()
      require("Comment").setup()
    end,
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          follow_files = true
        },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
        preview_config = {
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          -- Actions
          map('n', '<leader>hs', gs.stage_hunk, { desc = "Stage hunk" })
          map('n', '<leader>hr', gs.reset_hunk, { desc = "Reset hunk" })
          map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage hunk" })
          map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset hunk" })
          map('n', '<leader>hS', gs.stage_buffer, { desc = "Stage buffer" })
          map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Undo stage hunk" })
          map('n', '<leader>hR', gs.reset_buffer, { desc = "Reset buffer" })
          map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview hunk" })
          map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "Blame line" })
          map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "Toggle blame" })
          map('n', '<leader>hd', gs.diffthis, { desc = "Diff this" })
          map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Diff this ~" })
          map('n', '<leader>td', gs.toggle_deleted, { desc = "Toggle deleted" })

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      })
    end,
  },

  -- Advanced Git commands
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gwrite", "Gread", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove" },
    keys = {
      { "<leader>gs", ":Git<CR>", desc = "Git status" },
      { "<leader>gc", ":Git commit<CR>", desc = "Git commit" },
      { "<leader>gp", ":Git push<CR>", desc = "Git push" },
      { "<leader>gl", ":Git pull<CR>", desc = "Git pull" },
      { "<leader>gb", ":Git blame<CR>", desc = "Git blame" },
      { "<leader>gd", ":Gvdiffsplit<CR>", desc = "Git diff" },
    },
  },

  -- GitHub integration
  {
    "tpope/vim-rhubarb",
    dependencies = { "tpope/vim-fugitive" },
    cmd = { "GBrowse" },
  },

  -- File management and creation
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        default_file_explorer = false, -- No reemplazar netrw por defecto
        columns = {
          "icon",
          "permissions",
          "size",
          "mtime",
        },
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = false,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,
        lsp_file_operations = {
          enabled = true,
          autosave_changes = false,
        },
        constrain_cursor = "editable",
        experimental_watch_for_changes = false,
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        use_default_keymaps = true,
        view_options = {
          show_hidden = false,
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          is_always_hidden = function(name, bufnr)
            return false
          end,
          sort = {
            { "type", "asc" },
            { "name", "asc" },
          },
        },
        float = {
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          override = function(conf)
            return conf
          end,
        },
        preview = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = 0.9,
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          update_on_cursor_moved = true,
        },
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
      })
      
      -- Keymap para abrir oil
      vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open Oil file manager" })
      vim.keymap.set("n", "<leader>O", "<CMD>Oil --float<CR>", { desc = "Open Oil floating window" })
    end,
  },

  -- Advanced file operations
  {
    "chrisgrieser/nvim-genghis",
    dependencies = "stevearc/dressing.nvim",
    config = function()
      local genghis = require("genghis")
      
      -- Keymaps para operaciones de archivos
      vim.keymap.set("n", "<leader>fp", genghis.copyFilepath, { desc = "Copy file path" })
      vim.keymap.set("n", "<leader>fn", genghis.copyFilename, { desc = "Copy filename" })
      vim.keymap.set("n", "<leader>fx", genghis.chmodx, { desc = "Make file executable" })
      vim.keymap.set("n", "<leader>fr", genghis.renameFile, { desc = "Rename file" })
      vim.keymap.set("n", "<leader>fm", genghis.moveAndRenameFile, { desc = "Move/rename file" })
      vim.keymap.set("n", "<leader>fc", genghis.createNewFile, { desc = "Create new file" })
      vim.keymap.set("n", "<leader>fd", genghis.duplicateFile, { desc = "Duplicate file" })
      vim.keymap.set("n", "<leader>fD", function() genghis.trashFile{trashLocation = "your_trash"} end, { desc = "Delete file to trash" })
    end,
  },

  -- Better UI for inputs
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = {
          enabled = true,
          default_prompt = "Input:",
          title_pos = "left",
          insert_only = true,
          start_in_insert = true,
          anchor = "SW",
          border = "rounded",
          relative = "cursor",
          prefer_width = 40,
          width = nil,
          max_width = { 140, 0.9 },
          min_width = { 20, 0.2 },
          buf_options = {},
          win_options = {
            winblend = 10,
            wrap = false,
          },
          mappings = {
            n = {
              ["<Esc>"] = "Close",
              ["<CR>"] = "Confirm",
            },
            i = {
              ["<C-c>"] = "Close",
              ["<CR>"] = "Confirm",
              ["<Up>"] = "HistoryPrev",
              ["<Down>"] = "HistoryNext",
            },
          },
          override = function(conf)
            return conf
          end,
          get_config = nil,
        },
        select = {
          enabled = true,
          backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
          trim_prompt = true,
          telescope = nil,
          fzf = {
            window = {
              width = 0.5,
              height = 0.4,
            },
          },
          fzf_lua = {
            winopts = {
              height = 0.5,
              width = 0.5,
            },
          },
          nui = {
            position = "50%",
            size = nil,
            relative = "editor",
            border = {
              style = "rounded",
            },
            buf_options = {
              swapfile = false,
              filetype = "DressingSelect",
            },
            win_options = {
              winblend = 10,
            },
            max_width = 80,
            max_height = 40,
            min_width = 40,
            min_height = 10,
          },
          builtin = {
            anchor = "NW",
            border = "rounded",
            relative = "editor",
            buf_options = {},
            win_options = {
              winblend = 10,
            },
            width = nil,
            max_width = { 140, 0.8 },
            min_width = { 40, 0.2 },
            height = nil,
            max_height = 0.9,
            min_height = { 10, 0.2 },
            mappings = {
              ["<Esc>"] = "Close",
              ["<C-c>"] = "Close",
              ["<CR>"] = "Confirm",
            },
            override = function(conf)
              return conf
            end,
          },
          format_item_override = {},
          get_config = nil,
        },
      })
    end,
  },

  -- Terminal mejorado
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
        close_on_exit = true,
        shell = vim.o.shell,
        auto_scroll = true,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      -- Configurar terminales específicos
      local Terminal = require('toggleterm.terminal').Terminal

      -- Terminal flotante para comandos rápidos
      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "double",
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })

      -- Keymap para lazygit
      vim.keymap.set("n", "<leader>lg", function() lazygit:toggle() end, { desc = "LazyGit" })

      -- Terminal horizontal
      local htop = Terminal:new({ cmd = "htop", direction = "horizontal" })
      vim.keymap.set("n", "<leader>ht", function() htop:toggle() end, { desc = "Htop" })

      -- Terminal específico para node
      local node = Terminal:new({ cmd = "node", direction = "horizontal" })
      vim.keymap.set("n", "<leader>nd", function() node:toggle() end, { desc = "Node REPL" })
    end,
  },
  
  -- GitHub Copilot (versión moderna)
  {
    "zbirenbaum/copilot.lua",
    cmd = { "Copilot", "CopilotAuth", "CopilotDetach", "CopilotPanel", "CopilotStatus" },
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",      -- Alt+l para aceptar
            accept_word = false,
            accept_line = false,
            next = "<M-]>",        -- Alt+] siguiente sugerencia
            prev = "<M-[>",        -- Alt+[ anterior sugerencia  
            dismiss = "<C-]>",     -- Ctrl+] descartar
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },

  -- Copilot-cmp integration
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- GitHub Copilot Chat
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main", -- Cambiar de 'canary' a 'main'
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("CopilotChat").setup({
        debug = false,
        window = {
          layout = "float",
          width = 0.8,
          height = 0.8,
          border = "rounded",
        },
        mappings = {
          complete = {
            detail = "Use @<Tab> or /<Tab> for options.",
            insert = "<Tab>",
          },
          close = {
            normal = "q",
            insert = "<C-c>",
          },
          reset = {
            normal = "<C-r>",
            insert = "<C-r>",
          },
          submit_prompt = {
            normal = "<CR>",
            insert = "<C-s>",
          },
          accept_diff = {
            normal = "<C-y>",
            insert = "<C-y>",
          },
          yank_diff = {
            normal = "gy",
          },
          show_diff = {
            normal = "gd",
          },
          -- Configuraciones actualizadas (sin las deprecadas)
          show_context = {
            normal = "gc",
          },
          show_info = {
            normal = "gi",
          },
        },
      })
      
      -- Keymaps para CopilotChat
      vim.keymap.set("n", "<leader>cc", ":CopilotChat<CR>", { desc = "CopilotChat - Open chat" })
      vim.keymap.set("n", "<leader>ct", ":CopilotChatToggle<CR>", { desc = "CopilotChat - Toggle" })
      vim.keymap.set("v", "<leader>cx", ":CopilotChatExplain<CR>", { desc = "CopilotChat - Explain code" })
      vim.keymap.set("v", "<leader>cr", ":CopilotChatReview<CR>", { desc = "CopilotChat - Review code" })
      vim.keymap.set("v", "<leader>cf", ":CopilotChatFix<CR>", { desc = "CopilotChat - Fix code" })
      vim.keymap.set("v", "<leader>co", ":CopilotChatOptimize<CR>", { desc = "CopilotChat - Optimize code" })
      vim.keymap.set("v", "<leader>cd", ":CopilotChatDocs<CR>", { desc = "CopilotChat - Add documentation" })
      vim.keymap.set("v", "<leader>ctst", ":CopilotChatTests<CR>", { desc = "CopilotChat - Generate tests" })
      vim.keymap.set("n", "<leader>cm", ":CopilotChatCommit<CR>", { desc = "CopilotChat - Generate commit message" })
    end,
  },

  -- Mejorar autocompletado en línea de comandos
  -- TEMPORALMENTE DESHABILITADO: Si hay problemas, descomenta el bloque de abajo
  {
    "gelguy/wilder.nvim",
    enabled = true, -- Reactivado con configuración más simple
    build = ":UpdateRemotePlugins",
    event = "CmdlineEnter",
    config = function()
      local wilder = require('wilder')
      
      -- Configuración más simple y estable para evitar conflictos
      wilder.setup({
        modes = {':', '/', '?'}
      })

      -- Pipeline muy básico sin filtros problemáticos
      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.cmdline_pipeline(),
          wilder.vim_search_pipeline()
        )
      })

      -- Renderizador básico sin elementos complejos
      wilder.set_option('renderer', wilder.renderer_mux({
        [':'] = wilder.wildmenu_renderer({
          highlighter = wilder.basic_highlighter(),
        }),
        ['/'] = wilder.wildmenu_renderer({
          highlighter = wilder.basic_highlighter(),
        }),
        ['?'] = wilder.wildmenu_renderer({
          highlighter = wilder.basic_highlighter(),
        }),
      }))
    end,
  },

  -- Puedes importar configuraciones desde otros archivos
  { import = "plugins.lsp" },         -- lua/plugins/lsp.lua
  { import = "plugins.treesitter" },  -- lua/plugins/treesitter.lua
  
}, {
  -- Configuración de lazy.nvim
  ui = {
    border = "rounded",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})