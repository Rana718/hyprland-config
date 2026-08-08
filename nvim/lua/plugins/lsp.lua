return {
   -- LSP config (native vim.lsp.config style like tonybanters)
   {
      "neovim/nvim-lspconfig",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = { "hrsh7th/cmp-nvim-lsp" },
      config = function()
         -- Global LSP config
         vim.lsp.config('*', {
            root_markers = { '.git' },
         })

         -- Diagnostics (tonybanters style signs)
         vim.diagnostic.config({
            virtual_text = true,
            severity_sort = true,
            float = {
               style = 'minimal',
               border = 'rounded',
               source = 'if_many',
               header = '',
               prefix = '',
            },
            signs = {
               text = {
                  [vim.diagnostic.severity.ERROR] = '✘',
                  [vim.diagnostic.severity.WARN] = '▲',
                  [vim.diagnostic.severity.HINT] = '⚑',
                  [vim.diagnostic.severity.INFO] = '»',
               },
            },
         })

         -- Rounded borders on hover/signature
         local orig = vim.lsp.util.open_floating_preview
         ---@diagnostic disable-next-line: duplicate-set-field
         function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or 'rounded'
            opts.max_width = opts.max_width or 80
            opts.max_height = opts.max_height or 24
            opts.wrap = opts.wrap ~= false
            return orig(contents, syntax, opts, ...)
         end

         -- On attach keymaps + formatting
         vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('my.lsp', {}),
            callback = function(args)
               local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
               local buf = args.buf
               local m = function(mode, lhs, rhs, desc)
                  vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = "LSP: " .. desc })
               end

               m('n', 'K', vim.lsp.buf.hover, "Hover")
               m('n', 'gd', vim.lsp.buf.definition, "Definition")
               m('n', 'gD', vim.lsp.buf.declaration, "Declaration")
               m('n', 'gi', vim.lsp.buf.implementation, "Implementation")
               m('n', 'go', vim.lsp.buf.type_definition, "Type definition")
               m('n', 'gr', vim.lsp.buf.references, "References")
               m('n', 'gs', vim.lsp.buf.signature_help, "Signature help")
               m('n', 'gl', vim.diagnostic.open_float, "Diagnostic float")
               m('n', '<F2>', vim.lsp.buf.rename, "Rename")
               m({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, "Format")
               m('n', '<F4>', vim.lsp.buf.code_action, "Code action")

               -- Document highlight
               if client:supports_method('textDocument/documentHighlight') then
                  local hl_group = vim.api.nvim_create_augroup('my.lsp.highlight', { clear = false })
                  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                     buffer = buf, group = hl_group,
                     callback = vim.lsp.buf.document_highlight,
                  })
                  vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                     buffer = buf, group = hl_group,
                     callback = vim.lsp.buf.clear_references,
                  })
               end

               -- Auto-format on save (skip some filetypes)
               local excluded = { php = true, c = true, cpp = true }
               if not client:supports_method('textDocument/willSaveWaitUntil')
                  and client:supports_method('textDocument/formatting')
                  and not excluded[vim.bo[buf].filetype]
               then
                  vim.api.nvim_create_autocmd('BufWritePre', {
                     group = vim.api.nvim_create_augroup('my.lsp.format', { clear = false }),
                     buffer = buf,
                     callback = function()
                        vim.lsp.buf.format({ bufnr = buf, id = client.id, timeout_ms = 1000 })
                     end,
                  })
               end
            end,
         })

         -- LSP server configs
         local caps = require("cmp_nvim_lsp").default_capabilities()

         vim.lsp.config['lua_ls'] = {
            cmd = { 'lua-language-server' },
            filetypes = { 'lua' },
            root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
            capabilities = caps,
            settings = {
               Lua = {
                  runtime = { version = 'LuaJIT' },
                  diagnostics = { globals = { 'vim' } },
                  workspace = {
                     checkThirdParty = false,
                     library = vim.api.nvim_get_runtime_file('', true),
                  },
                  telemetry = { enable = false },
               },
            },
         }

         vim.lsp.config['ts_ls'] = {
            cmd = { 'typescript-language-server', '--stdio' },
            filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
            root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
            capabilities = caps,
            settings = { completions = { completeFunctionCalls = true } },
         }

         vim.lsp.config['pyright'] = {
            cmd = { 'pyright-langserver', '--stdio' },
            filetypes = { 'python' },
            root_markers = { 'pyproject.toml', 'setup.py', 'requirements.txt', '.git' },
            capabilities = caps,
         }

         vim.lsp.config['rust_analyzer'] = {
            cmd = { 'rust-analyzer' },
            filetypes = { 'rust' },
            root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
            capabilities = caps,
            settings = {
               ['rust-analyzer'] = {
                  cargo = { allFeatures = true },
               },
            },
         }

         vim.lsp.config['gopls'] = {
            cmd = { 'gopls' },
            filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
            root_markers = { 'go.mod', 'go.work', '.git' },
            capabilities = caps,
            settings = {
               gopls = {
                  analyses = { unusedparams = false },
                  staticcheck = true,
               },
            },
         }

         vim.lsp.config['clangd'] = {
            cmd = { 'clangd' },
            filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
            root_markers = { 'compile_commands.json', '.clangd', 'Makefile', '.git' },
            capabilities = caps,
         }

         vim.lsp.config['cssls'] = {
            cmd = { 'vscode-css-language-server', '--stdio' },
            filetypes = { 'css', 'scss', 'less' },
            root_markers = { 'package.json', '.git' },
            capabilities = caps,
         }

         vim.lsp.config['jsonls'] = {
            cmd = { 'vscode-json-languageserver', '--stdio' },
            filetypes = { 'json', 'jsonc' },
            root_markers = { 'package.json', '.git' },
            capabilities = caps,
         }

         vim.lsp.config['html'] = {
            cmd = { 'vscode-html-language-server', '--stdio' },
            filetypes = { 'html' },
            root_markers = { 'package.json', '.git' },
            capabilities = caps,
         }

         vim.lsp.config['bashls'] = {
            cmd = { 'bash-language-server', 'start' },
            filetypes = { 'sh', 'bash' },
            root_markers = { '.git' },
            capabilities = caps,
         }

         -- Enable all configured LSP servers
         ---@diagnostic disable-next-line: invisible
         for name, _ in pairs(vim.lsp.config._configs or {}) do
            if name ~= '*' then
               pcall(vim.lsp.enable, name)
            end
         end
      end,
   },

   -- Mason (for easy LSP server installation)
   {
      "mason-org/mason.nvim",
      cmd = "Mason",
      opts = {},
   },

   {
      "mason-org/mason-lspconfig.nvim",
      dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
      opts = {
         ensure_installed = {
            "lua_ls", "ts_ls", "pyright", "rust_analyzer",
            "gopls", "clangd", "cssls", "jsonls", "html", "bashls",
         },
         automatic_enable = true,
      },
   },
}
