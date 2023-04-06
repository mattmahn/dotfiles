local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'               -- Have packer manage itself
  -- An implementation of vim's Popup API in Neovim
  use {
    'nvim-lua/popup.nvim',
    requires = {{ 'nvim-lua/plenary.nvim' }},
  }

  -- colorschemes
  use 'savq/melange-nvim'
  vim.cmd 'colorscheme melange'

  use { 'editorconfig/editorconfig-vim' }

  -- Tree-sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function ()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true})
      ts_update()
    end,
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    config = function ()
      require('nvim-treesitter.configs').setup {
        textobjects = {
          move = { enable = true },
          select = { enable = true, lookahead = true, },
          swap = { enable = true },
        }
      }
    end
  }
  use {
    'RRethy/nvim-treesitter-endwise',
    config = function ()
      require('nvim-treesitter.configs').setup {
        endwise = { enable = true }
      }
    end
  }
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function ()
      require('nvim-treesitter.configs').setup {
        context_commentstring = { enable = true }
      }
    end,
  }

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
    },
    config = function ()
      local lsp = require('lsp-zero').preset({})
      lsp.on_attach(function (client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)
      -- Valid server list is found here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#configurations
      lsp.ensure_installed({
        'awk_ls',
        'bashls',
        'cucumber_language_server',
        'dockerls',
        'eslint',
        'gopls',
        'graphql',
        'html',
        'marksman',
        'lua_ls',
        'rust_analyzer',
        'terraformls',
        'tsserver',
        'yamlls',
      })
      lsp.setup()
    end
  }
  use { -- show what LSP is doing
    'j-hui/fidget.nvim',
    config = function ()
      require('fidget').setup()
    end,
  }

  -- Searching
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} },
  }

  use {
    'folke/trouble.nvim',
    requires = "nvim-tree/nvim-web-devicons",
    config = function ()
      require('trouble').setup()
    end
  }

  use {
    'm4xshen/autoclose.nvim',
    config = function ()
      require('autoclose').setup()
    end,
  }
  use {
    'terrortylor/nvim-comment',
    config = function ()
      require('nvim_comment').setup()
    end,
  }
  use {
    'kylechui/nvim-surround', tag = '*',
    config = function ()
      require('nvim-surround').setup()
    end,
  }

  -- Get some nice Git decorations
  use {
    'lewis6991/gitsigns.nvim', commit = 'f412f51d0eaf0905a2759c8087090071689bb8fb',
    config = function()
      require('gitsigns').setup()
    end,
  }

  -- prettier statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function ()
      require('lualine').setup()
    end,
  }

  -- File tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = "nvim-tree/nvim-web-devicons"
  }


  use {
    'folke/which-key.nvim',
    config = function ()
      require('which-key').setup()
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
