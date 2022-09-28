vim.cmd [[packadd packer.nvim]]

-- Packer Bootstrapping Function
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Automatically Update Packer if plugins.lua was changes
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Define Plugins
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'  -- Plugin manager itself

  -- git diff line next to line numbers
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function () require('gitsigns').setup() end
  }

  -- Look and feel
  use 'machakann/vim-sandwich'           -- surroundings for words
  use 'romainl/vim-cool'                 -- Disables HL after search automatically
  use 'tpope/vim-commentary'             -- auto commenting with keybinding gc
  use 'tpope/vim-fugitive'               -- Git Wrapper
  use 'unblevable/quick-scope'           -- scope for motion
  use 'kyazdani42/nvim-web-devicons'     -- yeah im really doing this... it even though it sucsk.
  use 'farmergreg/vim-lastplace'         -- load vim file at last cursor position opened
  use 'nvim-lualine/lualine.nvim'        -- statusline in native lua that replaces crystalline
  use 'thirtythreeforty/lessspace.vim'   -- highlighting for whitespace

  -- fetch codingstyle from repos
  use { 'editorconfig/editorconfig-vim',
    config = function ()
      vim.g.EditorConfig_max_line_indicator = "none"
    end
  }

  -- Soft-, Hard-Wrapping
  use { 'reedes/vim-pencil',
    config = function ()
      vim.cmd[[
        augroup pencil
          autocmd!
          au FileType jrnl,text,mail,markdown call pencil#init({'wrap': 'soft', 'textwidth': 78}) | setl spell spelllang=de,en sw=2 ts=2 sts=2 tw=77 wrap
        augroup end
      ]]
    end
  }

  -- Dracula Theme
  use {
    'Mofiqul/dracula.nvim',
    run = vim.cmd[[colorscheme dracula]]
  }

  -- LSP + LSP Installers
  use 'neovim/nvim-lspconfig'               -- lsp nvim binding
  use 'williamboman/mason.nvim'             -- installs lsps locally
  use 'williamboman/mason-lspconfig.nvim'   -- lsp bindings for nvim lspconfig

  -- Nice Interface looking at lsp errors
  use { 'folke/trouble.nvim',
    config = function ()
    require("trouble").setup {
      icons = true,
    }
    end
  }

  -- Fuzzy Finder
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- Syntax Highlighting Plugins
  use { 'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function ()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "all",
        ignore_install = { "javascript" }, -- List of parsers to ignore installing
        highlight = {
          enable = true,
        },
      }
    end
  }

  -- Better syntax highlightning
  use { 'LnL7/vim-nix', ft = 'nix' }              -- nixos syntax highlighting
  use { 'cespare/vim-toml', ft =  'toml' }        -- toml language
  use { 'chrisbra/csv.vim', ft = 'csv' }          -- csv highlighting
  use { 'dag/vim-fish', ft = 'fish' }             -- fish shell language

  -- terraform
  use { 'hashivim/vim-terraform',
    ft = 'terraform',
    config = function ()
      vim.g.terraform_align=1
      vim.g.terraform_fold_sections=0
      vim.g.terraform_fmt_on_save=1
    end
  }

  use { 'godlygeek/tabular', ft = 'puppet' }               -- auto ident dep for vim-puppet
  use { 'rodjek/vim-puppet', ft = 'puppet' }               -- puppet syntax

  -- golang
  use { 'fatih/vim-go', ft = 'go',
    run = ':GoUpdateBinaries'
  }

  -- markdown
  use {'plasticboy/vim-markdown',
    ft = 'markdown',
    config = function ()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_conceal = 1
      vim.g.vim_markdown_conceal_code_blocks = 1
      vim.g.vim_markdown_frontmatter = 1
    end
  }

  use { 'chrisbra/Colorizer',
    run = ':ColorHighlight',
    config = function ()
      vim.g.colorizer_auto_filetype = 'css,html'
    end
  }

  -- Snippets Universe
  use { 'hrsh7th/vim-vsnip',
    config = function ()
      vim.g.vsnip_snippet_dir= os.getenv("HOME") .. '/.config/nvim/snippets/'
    end
  }

  -- Show Keymappings
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end
  }

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'rafamadriz/friendly-snippets'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
