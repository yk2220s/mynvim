return {
  {
    'EdenEast/nightfox.nvim',
    config = function()
      local C = require("nightfox.lib.color")
      -- https://github.com/EdenEast/nightfox.nvim/blob/main/lua/nightfox/palette/carbonfox.lua
      local bg = C("#161616")

      require("nightfox").setup({ palettes = {
          carbonfox = {
            bg3 = bg:brighten(8):to_css(),
            bg4 = bg:brighten(28):to_css(),
            whitespace = bg:brighten(18):to_css(),
          },
        },
        specs = {
          all = {
            syntax = {
              builtin0 = 'pink',
            },
          },
          carbonfox = {
            variable = 'pal.white.bright'
          }
        },
        groups = {
          carbonfox = {
            Whitespace = { fg = "palette.whitespace" },
          },
        },
      })

      vim.cmd([[colorscheme carbonfox]])
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'go', 'lua', 'vim', 'sql' },
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<Space>f', ':NvimTreeOpen<CR>', opts)

      local function on_attach(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        -- use all default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- remove a default
        vim.keymap.del('n', 's', { buffer = bufnr })

        -- override a default
        vim.keymap.set('n', '<CR>', api.node.open.vertical, opts('Open: Vertical Split'))

        -- add your mappings
        vim.keymap.set('n', 'l', api.node.open.vertical, opts('Open: Vertical Split'))
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
      end

      require("nvim-tree").setup({
        view = {
          width = 40,
        },
        filters = {
          git_ignored = false,
        },
        on_attach = on_attach,
      })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('lualine').setup({
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {
            {'filename', path = 1}
          },
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        }
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim' },
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
      'nvimtools/none-ls.nvim',
      'jay-babu/mason-null-ls.nvim',
    },
    config = function()
      require('mason').setup()

      local nvim_lsp = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { noremap = true, buffer = bufnr, desc = desc })
        end

        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        nmap('<leader>d', function()
          vim.cmd([[vsplit]])
          vim.lsp.buf.definition()
        end, '[G]oto [D]efinition')
        nmap('<leader>i', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
        nmap('<leader>R', vim.lsp.buf.references, '[R]efercence')

        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<leader>f', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')
        nmap('<leader>qf', function()
            vim.lsp.buf.code_action({
              filter = function(a) return a.isPreferred end,
              apply = true
            })
        end, 'QuickFix')

        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
              vim.lsp.buf.format { async = false }
              vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
          end
        })
      end

      -- managed by mason
      local servers = {
        golangci_lint_ls = {
          init_options = {
            -- v1のオプション, デフォルトがv2のためオーバーライド
            command = { "golangci-lint", "run", "--out-format", "json", "--issues-exit-code=1" } 
          },
        },
      }

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      mason_lspconfig.setup_handlers({ function(server_name)
        local cnf = {
          capabilities = capabilities,
          on_attach = on_attach,
        }
        for key, value in pairs(servers[server_name]) do
          cnf[key] = value
        end

        nvim_lsp[server_name].setup(cnf)
        end
      })

      -- managed manually installed LSP
      local manual_servers = {
        gopls = {},
      }

      for k, v in pairs(manual_servers) do
        local cnf = {
          capabilities = capabilities,
          on_attach = on_attach,
        }
        for key, value in pairs(v) do
          cnf[key] = value
        end
        nvim_lsp[k].setup(cnf)
      end

      -- none-ls
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      require("null-ls").setup({
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format()
              end,
            })
          end
        end,
      })

      --[[
      require("mason-null-ls").setup({
        ensure_installed = { "gofumpt" },
        automatic_setup = true,
        automatic_installation = false,
        handlers = {},
      })
      ]]
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      })
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() 
      local builtin = require('telescope.builtin')
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<C-g>', builtin.find_files, opt)
      vim.keymap.set('n', '<C-f>', builtin.live_grep, opt)
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
      current_line_blame_formatter = ' <abbrev_sha> <author_time:%Y-%m-%d> <author> - <summary>',
    },
  },
}
