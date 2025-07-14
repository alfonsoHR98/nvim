-- lua/plugins/lsp.lua - Configuración de LSP

return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      -- Import lspconfig plugin
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Configurar keymaps para LSP
      local opts = { noremap = true, silent = true }
      local on_attach = function(client, bufnr)
        opts.buffer = bufnr

        -- Keybindings para LSP
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
      end

      -- Capabilities para autocompletado
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Configurar diagnósticos optimizados para mejor rendimiento
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          source = "if_many",
          spacing = 2,
        },
        signs = true,
        underline = true,
        update_in_insert = false, -- CRÍTICO: No actualizar durante escritura
        severity_sort = true,
        float = {
          source = "always",
          border = "rounded",
        },
      })

      -- Configurar servidores LSP específicos
      
      -- Lua LSP
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      -- Agrega más servidores LSP aquí según los lenguajes que uses
      
      -- TypeScript/JavaScript LSP optimizado
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "literal",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = false,
              includeInlayVariableTypeHints = false,
              includeInlayPropertyDeclarationTypeHints = false,
              includeInlayFunctionLikeReturnTypeHints = false,
              includeInlayEnumMemberValueHints = false,
            },
            preferences = {
              disableSuggestions = false,
              quotePreference = "auto",
              includeCompletionsForModuleExports = true,
              includeCompletionsForImportStatements = true,
              includeCompletionsWithSnippetText = true,
              includeAutomaticOptionalChainCompletions = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "literal",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = false,
              includeInlayVariableTypeHints = false,
              includeInlayPropertyDeclarationTypeHints = false,
              includeInlayFunctionLikeReturnTypeHints = false,
              includeInlayEnumMemberValueHints = false,
            },
            preferences = {
              disableSuggestions = false,
              quotePreference = "auto",
              includeCompletionsForModuleExports = true,
              includeCompletionsForImportStatements = true,
              includeCompletionsWithSnippetText = true,
              includeAutomaticOptionalChainCompletions = true,
            },
          },
        },
      })

      -- CSS LSP
      lspconfig.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- HTML LSP
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- JSON LSP
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- ESLint LSP con configuración optimizada
      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          -- Desactivar si no hay archivo de configuración
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
        settings = {
          workingDirectory = { mode = "auto" },
          format = { enable = true },
          lint = { enable = true },
          run = "onType", -- Cambiar a "onSave" para mejor rendimiento
        },
        -- Solo activar ESLint si hay archivo de configuración
        root_dir = function(fname)
          local util = require("lspconfig.util")
          return util.root_pattern(
            ".eslintrc",
            ".eslintrc.js",
            ".eslintrc.cjs",
            ".eslintrc.yaml",
            ".eslintrc.yml",
            ".eslintrc.json",
            "eslint.config.js",
            "package.json"
          )(fname)
        end,
      })
    end,
  },

  -- Autocompletado con integración de Copilot
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline", -- Autocompletado para línea de comandos (respaldo si wilder falla)
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "zbirenbaum/copilot-cmp", -- Integración de Copilot con cmp
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Configurar copilot-cmp
      require("copilot_cmp").setup()

      -- Cargar snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          -- Configuración especial para Tab con Copilot
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = "copilot", group_index = 2 },  -- Copilot con prioridad alta
          { name = "nvim_lsp", group_index = 2 },
          { name = "luasnip", group_index = 2 },
          { name = "buffer", group_index = 2 },
          { name = "path" },
        }),
      })

      -- Configuración para autocompletado en línea de comandos como respaldo
      -- Solo se activará si wilder.nvim está deshabilitado o falla
      local ok, _ = pcall(require, 'wilder')
      if not ok then
        -- Autocompletado para búsqueda con `/` y `?`
        cmp.setup.cmdline({ '/', '?' }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' }
          }
        })

        -- Autocompletado para comandos con `:`
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          }),
          matching = { disallow_symbol_nonprefix_matching = false }
        })
      end
    end,
  },

  -- Mason para instalar LSP servers
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",        -- Lua
          "ts_ls",         -- TypeScript/JavaScript (antes era tsserver)
          "cssls",         -- CSS
          "html",          -- HTML
          "jsonls",        -- JSON
          "eslint",        -- ESLint (para linting de JS/TS)
          -- Agrega otros servidores LSP que quieras instalar automáticamente
        },
        automatic_installation = true,
      })
    end,
  },
}
