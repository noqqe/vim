vim.cmd [[packadd packer.nvim]]

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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'  -- Plugin manager itself

  -- Look and feel
  use 'lewis6991/gitsigns.nvim'          -- git diff line next to line numbers
  use 'editorconfig/editorconfig-vim'    -- fetch codingstyle from repos
  use 'machakann/vim-sandwich'           -- surroundings for words
  use 'reedes/vim-pencil'                -- Soft-, Hard-Wrapping
  use 'romainl/vim-cool'                 -- Disables HL after search automatically
  use 'tpope/vim-commentary'             -- auto commenting with keybinding gc
  use 'tpope/vim-fugitive'               -- Git Wrapper
  use 'unblevable/quick-scope'           -- scope for motion
  use 'kyazdani42/nvim-web-devicons'     -- yeah im really doing this... it even though it sucsk.
  use 'farmergreg/vim-lastplace'         -- load vim file at last cursor position opened
  use 'nvim-lualine/lualine.nvim'        -- statusline in native lua that replaces crystalline
  use 'ntpeters/vim-better-whitespace'   -- highlighting for whitespace

  -- Dracula Theme
  use {
    'Mofiqul/dracula.nvim',
    run = vim.cmd[[colorscheme dracula]]
  }

  -- " LSP + LSP Installers
  use 'neovim/nvim-lspconfig'               -- lsp nvim binding
  use 'williamboman/mason.nvim'             -- installs lsps locally
  use 'williamboman/mason-lspconfig.nvim'   -- lsp bindings for nvim lspconfig
  use 'folke/trouble.nvim'                  -- nice Interface looking at lsp errors

  -- Fuzzy Finder
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- Syntax Highlighting Plugins
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} -- Better syntax highlightning
  use { 'LnL7/vim-nix', ft = 'nix' }                       -- nixos syntax highlighting
  use { 'cespare/vim-toml', ft =  'toml' }                  -- toml language
  use { 'chrisbra/csv.vim', ft = 'csv' }                 -- csv highlighting
  use { 'dag/vim-fish', ft = 'fish' }                      -- fish shell language
  use { 'hashivim/vim-terraform', ft = 'terraform' }       -- terraform syntax highlightning
  use { 'godlygeek/tabular', ft = 'puppet' }               -- auto ident dep for vim-puppet
  use {'plasticboy/vim-markdown', ft = 'markdown' }       -- my own markdown
  use { 'rodjek/vim-puppet', ft = 'puppet' }               -- puppet syntax
  use { 'fatih/vim-go', ft = 'go',  run = ':GoUpdateBinaries' }          -- golang

  use { 'chrisbra/Colorizer',
    run = ':ColorHighlight',
    config = function ()
      vim.g.colorizer_auto_filetype = 'css,html'
    end
  }

  -- " Snippets Universe
  use 'hrsh7th/vim-vsnip'
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
