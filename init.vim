" Set nice formatting for this file
" vim ft=vim ts=2

" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------
" Maybe switch to lua: https://github.com/n3wborn/nvim/blob/main/init.lua

set nocompatible                        " essential
set history=1000                        " lots of command line history
set encoding=utf8                       " be nice, by default
set cf                                  " error files / jumping
set ffs=unix,dos,mac                    " support these files
set isk+=_,$,@,%,#,-                    " none word dividers
set modeline                            " make sure modeline support is enabled
set autoread                            " reload files (no local changes only)
set tabpagemax=50                       " open 50 tabs max
set viminfo='1000,f1,:100,@100,/20
filetype plugin indent on               " load filetype plugin
set shortmess+=I                        " Startup message is irritating
set visualbell t_vb=                    " Disable visual bell
set noshowmode                          " Disable Showmode since its in airline
set laststatus=2                        " Set statusline height to 2 for lualine

" --------------------------------------------------------------------------
" Plugins (with Plug)
" --------------------------------------------------------------------------

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'lewis6991/gitsigns.nvim'                          " git diff line next to line numbers
Plug 'dracula/vim', { 'as': 'dracula' }                 " Dracula Theme
Plug 'editorconfig/editorconfig-vim'                    " fetch codingstyle from repos
Plug 'machakann/vim-sandwich'                           " surroundings for words
Plug 'reedes/vim-pencil'                                " Soft-, Hard-Wrapping
Plug 'romainl/vim-cool'                                 " Disables HL after search automatically
Plug 'tpope/vim-commentary'                             " auto commenting with keybinding gc
Plug 'tpope/vim-fugitive'                               " Git Wrapper
Plug 'unblevable/quick-scope'                           " scope for motion
Plug 'nvim-lualine/lualine.nvim'                        " statusline in native lua that replaces crystalline
Plug 'kyazdani42/nvim-web-devicons'                     " yeah im really doing this... it even though it sucsk.

" Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" LSP + LSP Installers
Plug 'neovim/nvim-lspconfig'                            " lsp nvim binding
Plug 'williamboman/mason.nvim'                          " installs lsps locally
Plug 'williamboman/mason-lspconfig.nvim'                " lsp bindings for nvim lspconfig
Plug 'folke/trouble.nvim'

" Snippets Universe
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp' "
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

" Syntax Highlighting Plugins
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlightning
Plug 'LnL7/vim-nix', { 'for': 'nix' }                       " nixos syntax highlighting
Plug 'cespare/vim-toml', { 'for': 'toml' }                  " toml language
Plug 'chrisbra/csv.vim',   { 'for': 'csv' }                 " csv highlighting
Plug 'cmhamill/vim-jrnl'                                    " jrnl
Plug 'dag/vim-fish', { 'for': 'fish' }                      " fish shell language
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }       " terraform syntax highlightning
Plug 'godlygeek/tabular', { 'for': 'puppet' }               " auto ident dep for vim-puppet
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }       " my own markdown
Plug 'ntpeters/vim-better-whitespace'                       " highlighting for whitespace
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }               " puppet syntax
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }          " golang
Plug 'chrisbra/Colorizer'                                   " highlight colors hex codes

call plug#end()

" --------------------------------------------------------------------------
" Load Lua Settings for Plugins
" --------------------------------------------------------------------------

" Replace with https://github.com/rayfaddis/dotfiles/blob/main/config/nvim/init.lua#L16
lua require('settings.treesitter')
lua require('settings.lsp')
lua require('settings.trouble')
lua require('settings.cmp')
lua require('settings.gitsigns')
lua require('settings.lualine')


" ----------------------------------------------------------------------------
" UI
" ----------------------------------------------------------------------------

set ruler                               " show the cursor position all the time
set noshowcmd                           " don't display incomplete commands
set nolazyredraw                        " turn off lazy redraw
set wildmenu                            " turn on wild menu
set ch=1                                " command line height
set backspace=2                         " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,]              " backspace and cursor keys wrap to
set shortmess=filtIoOA                  " shorten messages
set report=0                            " tell us about changes
set nostartofline                       " don't jump to the start of line when scrolling
set wildmode=list:longest,full          " nice completion for wildcards
set number                              " enable line numbers by default
set hlsearch                            " highlight searches
set mouse=r                             " turn off mouse
set clipboard+=unnamed                  " persistent cut buffer across files (dd + p works everywhere)
set noincsearch                         " don't jump during searching for a string
set autochdir                           " automatically switch to dir of file editing

" open file at last position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
\| exe "normal! g'\"" | endif

" ----------------------------------------------------------------------------
" Text Formatting
" ----------------------------------------------------------------------------

set autoindent                          " automatic indent new lines
set smartindent                         " be smart about it
set nowrap                              " do not wrap lines
set expandtab                           " expand tabs to spaces
set nosmarttab                          " fuck tabs
set formatoptions+=n                    " support for numbered/bullet lists
set virtualedit=block                   " allow virtual edit in visual block ..
set scrolloff=4                         " scroll down and let 4 lines be at the end

" automatically remove trail. whitespace at write
au BufWritePre <buffer> StripWhitespace

" Language Indent Settings
" These are my own perferations, however needs to be set _before_ editorconfig
" because I want to respect repo owner settings
"
" Shortcuts explained
" tw = textwidth
" wrap = when lines are longer then display, break lines visually
"
" ts = tabstop, should always be 8
" sts = softtabstop, modify to your needs
" sw = shiftwidth
" et = expandtab, replace tab char with X spaces

au Filetype * setl nospell tw=0 wm=0 wrap sw=2 ts=2 sts=2
au Filetype gitcommit setl tw=50 spell spelllang=de,en
au Filetype vim setl wrap tw=80 sw=2 ts=2 sts=2
au Filetype python setl wrap sw=4 ts=4 sts=4

" ----------------------------------------------------------------------------
" Backups
" ----------------------------------------------------------------------------

set backup                                                    " do not keep backups after close
set writebackup                                               " do not keep a backup while working
set backupdir=$HOME/.config/nvim/backup                       " store backups under ~/.vim/backup
set backupcopy=yes                                            " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,/var/folders   " dont backup files in these dirs

" Create backup and swap dir, if the do not exist
if !isdirectory($HOME . "/.config/nvim/backup")
  call mkdir($HOME . "/.config/nvim/backup", "p")
endif

" ----------------------------------------------------------------------------
" Swap
" ----------------------------------------------------------------------------

set swapfile                                    " don't keep swp files either
set directory=~/.config/nvim/swap,~/tmp,.       " keep swp files under ~/.vim/swap

if !isdirectory($HOME . "/.config/nvim/swap")
  call mkdir($HOME . "/.config/nvim/swap", "p")
endif

" ----------------------------------------------------------------------------
" Spell Checking
" ----------------------------------------------------------------------------

if !isdirectory($HOME . "/.config/nvim/spell")
  call mkdir($HOME . "/.config/nvim/spell", "p")
endif

" ----------------------------------------------------------------------------
" Compatibilities
" ----------------------------------------------------------------------------

" use crypto better filecrypto if available
if has('cryptv')
  set cryptmethod=blowfish
end

" use persistent undo dir if available
if has('persistent_undo')
  if !isdirectory($HOME . "/.config/nvim/undo")
    call mkdir($HOME . "/.config/nvim/undo", "p")
  endif
  set undofile
  set undodir=$HOME/.config/nvim/undo
endif

" --------------------------------------------------------------------------
" Custom Keyboard Shortcuts
" --------------------------------------------------------------------------

" define leader key
let mapleader = "-"

" correct my common mistypings
command! W w
command! Wq wq
command! Wqa wqa
command! Qa qa
command! Q q

" toggle line numbers with -n
nmap <silent> <leader>n :set number!<CR>

" toggle paste mode with -p
nmap <silent> <leader>p :set paste!<CR>

" toggle spellchecking with -s
nmap <silent> <leader>s :set spell!<CR>

" strip all trail. whitespace with -w
nmap <silent> <leader>w :StripWhitespace<CR>

" reload vimrc with -r
nmap <silent> <leader>r :so $MYVIMRC<CR>

" update plugins
nmap <silent> <leader>P :PlugClean<CR>:PlugInstall<CR>:so $MYVIMRC<CR>:PlugUpdate<CR>

" shortcut for jrnl date timestamps
nmap <silent> <leader>d i<C-R>=strftime("%Y-%m-%dT%H:%M:%S")<CR><Esc>

" fix underlying spell error automatically
nmap <silent> <leader>f z=1<CR><CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" identify highlight used for word under cursor
" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" correct end and home keys
map  <esc>OH <home>
cmap <esc>OH <home>
imap <esc>OH <home>
map  <esc>OF <end>
cmap <esc>OF <end>
imap <esc>OF <end>

" Brave me, disabling arrow keys
" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Cursor jumps around while joining lines
nnoremap J mzJ`z

" Jumping lands on top or bottom of screen
nnoremap n nzz
nnoremap } }zz

" Dont start EX Mode
nnoremap Q <nop>

" Yanking lines is inconsistent
" yanking a single line to the end with Y. Acts like D
nnoremap Y y$

" ---------------------------------------------------------------------------
" Colors / Theme
" ---------------------------------------------------------------------------

if !empty(glob('~/.config/nvim/plugged/dracula/colors/dracula.vim'))
  colors dracula
  syntax on
endif


" --------------------------------------------------------------------------
" EditorConfig Configuration
" --------------------------------------------------------------------------

let g:EditorConfig_max_line_indicator = "none"

" --------------------------------------------------------------------------
" Pencil Configuration
" --------------------------------------------------------------------------

augroup pencil
  autocmd!
  au FileType jrnl,text,mail,markdown call pencil#init({'wrap': 'soft', 'textwidth': 78}) | setl spell spelllang=de,en sw=2 ts=2 sts=2 tw=77 wrap
augroup end

" --------------------------------------------------------------------------
" Terraform
" --------------------------------------------------------------------------

let g:terraform_align=1
let g:terraform_fold_sections=0
let g:terraform_fmt_on_save=1

" --------------------------------------------------------------------------
" markdown
" --------------------------------------------------------------------------

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_frontmatter = 1

" --------------------------------------------------------------------------
" Dracula Theme Changes
" --------------------------------------------------------------------------

" Jekyll Headers are not readable with the dark gray
hi def link markdownJekyllFrontMatter         DraculaGreen
hi def link markdownJekyllLiquidTag           DraculaGreen
hi def link markdownJekyllLiquidOutputTag     DraculaGreen
hi def link markdownJekyllLiquidBlockTag      DraculaGreen

" Shell is a bit too pinky for me...
hi def link shStatement		  DraculaGreen
hi def link shConditional		DraculaGreen


" --------------------------------------------------------------------------
" Colorizer
" --------------------------------------------------------------------------
let g:colorizer_auto_filetype='css,html'

" --------------------------------------------------------------------------
" Custom Snippets
" --------------------------------------------------------------------------
let g:vsnip_snippet_dir='~/.config/nvim/snippets/'
