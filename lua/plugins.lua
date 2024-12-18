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

  -- git blame inline
  use { 'f-person/git-blame.nvim',
    config = function()
      require('gitblame').setup {
        enabled = false,
        date_format = '%r',
      }
    end
  }

  -- Statusline
  use { 'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        extensions = {
          'toggleterm',
          'trouble',
          'fugitive',
          'man',
          'nvim-tree',
        },
        options = {
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
            NvimTree = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        }
      })
    end
  }

  -- quickly move in same lines with highlighted chars
  use 'unblevable/quick-scope'

  -- terraform
  use 'hashivim/vim-terraform'

  -- load vim file at last cursor position opened
  use 'farmergreg/vim-lastplace'

  -- Custom font:
  -- brew tap homebrew/cask-fonts && brew install --cask font-hack-nerd-font
  -- yeah im really doing this... it even though it sucsk.
  use 'nvim-tree/nvim-web-devicons'

  -- Lua version of todo highlighting
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

  -- direnv / envrc
  use { 'direnv/direnv.vim' }

  -- Terminal Popup
  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require("toggleterm").setup {
        auto_scroll = false
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
      require("trouble").setup {}
    end
  }

  -- Visualize scope of idents with |
  -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-indentscope.md
  use { 'echasnovski/mini.indentscope',
    branch = 'stable',
    config = function()
      require('mini.indentscope').setup({
        draw = {
          -- Delay (in ms) between event and start of drawing scope indicator
          delay = 50,
        }
      })
    end,
  }

  -- Auto comment function
  use { 'echasnovski/mini.comment',
    branch = 'stable',
    config = function()
      require('mini.comment').setup({
        options = {
          -- Whether to ignore blank lines
          ignore_blank_line = true,
          -- Whether to recognize as comment only lines without indent
          start_of_line = false,
          -- Whether to ensure single space pad for comment parts
          pad_comment_parts = true,
        },
      })
    end
  }

  -- Surroundings with sr
  -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md
  use { 'echasnovski/mini.surround',
    branch = 'stable',
    config = function()
      require('mini.surround').setup()
    end,
  }

  -- Highlight and remove trailing space
  -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-trailspace.md
  use { 'echasnovski/mini.trailspace',
    branch = 'stable',
    config = function()
      require('mini.trailspace').setup()
    end,
  }

  -- Autoformat arrays with gS
  use { 'echasnovski/mini.splitjoin',
    branch = 'stable',
    config = function()
      require('mini.splitjoin').setup()
    end,
  }

  -- Fuzzy Finder
  use { 'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Syntax Highlighting Plugins
  use { 'nvim-treesitter/nvim-treesitter',
    config = function()
      require 'nvim-treesitter.configs'.setup {
        sync_install = true,
        auto_install = false,
        highlight = {
          enable = true
        },
        ignore_install = { "all" },
        ensure_installed = {
          "bash",
          "diff",
          "dockerfile",
          "dot",
          "fish",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "go",
          "gomod",
          "gosum",
          "html",
          "http",
          "ini",
          "java",
          "javascript",
          "jq",
          "json",
          "json5",
          "lua",
          "make",
          "markdown",
          "nix",
          "perl",
          "php",
          "python",
          "r",
          "regex",
          "regex",
          "rst",
          "rst",
          "ruby",
          "rust",
          "scss",
          "sql",
          "terraform",
          "toml",
          "vim",
          "yaml",
        },
      }
    end
  }

  -- golang instead of lsp+treesitter
  use { 'fatih/vim-go', ft = 'go',
    run = ':GoUpdateBinaries'
  }

  use { 'pedrohdz/vim-yaml-folds' }

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

  use { 'romgrk/barbar.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
      'lewis6991/gitsigns.nvim',
    },
    config = function()
      require("barbar").setup({
        auto_hide = true,
        icons = {
          modified = { button = '●' },
          enabled = true,
          buffer_index = true,
          buffer_number = false,
          gitsigns = {
            added = { enabled = true, icon = '+' },
            changed = { enabled = true, icon = '~' },
            deleted = { enabled = true, icon = '-' },
          },
        },
      })
    end,
  }

  -- nvim tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    }
  }


  -- Show Keymappings
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  }

  -- Better Popup menues with devicons
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

  --- Enable copilot
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
