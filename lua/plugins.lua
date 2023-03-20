-- Packer Bootstrapping Function
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Execution of Packer with packages defined below
vim.cmd [[packadd packer.nvim]]

-- Define Plugins
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Plugin manager itself

  -- git diff line next to line numbers
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Look and feel
  use 'nvim-lualine/lualine.nvim'      -- statusline in native lua that replaces crystalline
  use 'tpope/vim-fugitive'             -- Git Wrapper
  use 'unblevable/quick-scope'         -- scope for motion
  use 'farmergreg/vim-lastplace'       -- load vim file at last cursor position opened
  use 'thirtythreeforty/lessspace.vim' -- highlighting for whitespace


  -- Custom font:
  -- brew tap homebrew/cask-fonts && brew install --cask font-hack-nerd-font
  use 'nvim-tree/nvim-web-devicons' -- yeah im really doing this... it even though it sucsk.

  -- Auto comment function
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Lua
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- fetch codingstyle from repos
  use { 'editorconfig/editorconfig-vim',
    config = function()
      vim.g.EditorConfig_max_line_indicator = "none"
    end
  }

  -- Soft-, Hard-Wrapping
  use { 'reedes/vim-pencil',
    config = function()
      vim.cmd [[
        augroup pencil
          autocmd!
          au FileType jrnl,text,mail,markdown call pencil#init({'wrap': 'soft', 'textwidth': 78}) | setl spell spelllang=de,en sw=2 ts=2 sts=2 tw=77 wrap
        augroup end
      ]]
    end
  }

  -- Terminal Popup
  use {
    'numToStr/FTerm.nvim',
    config = function()
      require("FTerm").setup {
        cmd = "fish",
      }
    end
  }

  -- Dracula Theme
  use {
    'Mofiqul/dracula.nvim',
    config = function()
      vim.cmd [[colorscheme dracula]]
    end
  }

  -- LSP + LSP Installers
  use 'neovim/nvim-lspconfig'             -- lsp nvim binding
  use 'williamboman/mason.nvim'           -- installs lsps locally
  use 'williamboman/mason-lspconfig.nvim' -- lsp bindings for nvim lspconfig

  -- LSP Formatter to automatically format files on save
  use {
    'lukas-reineke/lsp-format.nvim',
    config = function()
      require("lsp-format").setup {}
    end
  }

  -- Nice Interface looking at lsp errors
  use { 'folke/trouble.nvim',
    config = function()
      require("trouble").setup {
        icons = true,
      }
    end
  }

  -- Visualize scope of idents with |
  -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-identscope.md
  use { 'echasnovski/mini.indentscope',
    branch = 'stable',
    config = function()
      require('mini.indentscope').setup()
    end,
  }

  -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md
  use { 'echasnovski/mini.surround',
    branch = 'stable',
    config = function()
      require('mini.surround').setup()
    end,
  }

  -- Fuzzy Finder
  use { 'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Syntax Highlighting Plugins
  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = {
          "python", "bash",
          "diff", "help",
          "dot", "fish",
          "git_rebase", "gitattributes",
          "gitcommit", "gitignore",
          "go", "gomod",
          "gosum", "html",
          "http", "ini",
          "java", "javascript",
          "jq", "json",
          "json5", "lua",
          "make", "markdown",
          "nix", "perl",
          "php", "r",
          "regex", "rst",
          "ruby", "rust",
          "scss", "sql",
          "regex", "rst",
          "terraform", "toml",
          "vim", "yaml",
          "dockerfile"
        },
        highlight = {
          enable = true,
        },
      }
    end
  }

  -- golang instead of lsp+treesitter
  use { 'fatih/vim-go', ft = 'go',
    run = ':GoUpdateBinaries'
  }

  use { 'chrisbra/Colorizer',
    start = ':ColorHighlight',
    config = function()
      vim.g.colorizer_auto_filetype = 'css,html'
    end
  }

  -- Snippets Universe
  use { 'hrsh7th/vim-vsnip',
    config = function()
      vim.g.vsnip_snippet_dir = os.getenv("HOME") .. '/.config/nvim/snippets/'
    end,
    requires = {
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      'onsails/lspkind.nvim',
      'rafamadriz/friendly-snippets'
    }

  }

  -- nvim tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })

      local function open_nvim_tree()
        require("nvim-tree.api").tree.open()
      end
    end,
  }

  -- Show Keymappings
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  }

  use {
    'gelguy/wilder.nvim',
    config = function()
      local wilder = require('wilder')
      wilder.setup({ modes = { ':', '/', '?' } })
      wilder.set_option('pipeline', {
        wilder.branch(
          wilder.cmdline_pipeline(),
          wilder.search_pipeline()
        ),
      })
      wilder.set_option('renderer', wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
          highlighter = wilder.basic_highlighter(),
          left = { ' ', wilder.popupmenu_devicons() },
          right = { ' ', wilder.popupmenu_scrollbar() },
          highlights = {
            border = 'Normal', -- highlight to use for the border
          },
          border = 'rounded',
        })
      ))
    end,
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
