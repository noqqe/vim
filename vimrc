" Set nice formatting for this file
" vim ft=vim ts=2

" ---------------------------------------------------------------------------
" General
" ---------------------------------------------------------------------------

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
set clipboard+=unnamedplus              " persistent cut buffer across files (dd + p works everywhere)

if has('nvim')
  set mouse=r                           " turn off mouse
  set noincsearch                       " don't jump during searching for a string
endif


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

" convince shell syntax highlight to use bash, not ksh or sh
let g:is_bash = 1

" automatically remove trail. whitespace at write
au BufWritePre <buffer> StripWhitespace

" open file at last position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
\| exe "normal! g'\"" | endif

" ----------------------------------------------------------------------------
" Backups
" ----------------------------------------------------------------------------

set backup                                      " do not keep backups after close
set writebackup                                 " do not keep a backup while working
set swapfile                                    " don't keep swp files either
set backupdir=$HOME/.vim/backup                 " store backups under ~/.vim/backup
set backupcopy=yes                              " keep attributes of original file
set directory=~/.vim/swap,~/tmp,.               " keep swp files under ~/.vim/swap
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*  " dont backup files in these dirs

" Create backup and swap dir, if the do not exist
if !isdirectory($HOME . "/.vim/backup")
  call mkdir($HOME . "/.vim/backup", "p")
endif

if !isdirectory($HOME . "/.vim/swap")
  call mkdir($HOME . "/.vim/swap", "p")
endif

if !isdirectory($HOME . "/.vim/spell")
  call mkdir($HOME . "/.vim/spell", "p")
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
  if !isdirectory($HOME . "/.vim/undo")
    call mkdir($HOME . "/.vim/undo", "p")
  endif
  set undofile
  set undodir=$HOME/.vim/undo
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

" Git Gutter toggle
nmap <silent> <leader>g :GitGutterToggle<CR>

" reload vimrc with -r
nmap <silent> <leader>r :so $MYVIMRC<CR>:AirlineRefresh<CR>

" update plugins
nmap <silent> <leader>P :PlugClean<CR>:PlugInstall<CR>:PlugUpdate<CR>

" check for errors with syntastic
nmap <silent> <leader>e :SyntasticCheck<CR>:Errors<CR>

" shortcut for jrnl date timestamps
nmap <silent> <leader>d :print=strftime('%F %H:%M')<CR>A

" fix underlying spell error automatically
nmap <silent> <leader>f z=1<CR><CR>


" correct end and home keys
map  <esc>OH <home>
cmap <esc>OH <home>
imap <esc>OH <home>
map  <esc>OF <end>
cmap <esc>OF <end>
imap <esc>OF <end>

" snippet completions
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsNoPythonWarning = 1

" include my custom snippets dir for ultisnips
set runtimepath+=~/.vim/snippets/

" Get rid of some annoyances.
" https://sanctum.geek.nz/arabesque/vim-annoyances/

" Cursor jumps around while joining lines
nnoremap J mzJ`z

" Jumping lands on top or bottom of screen
nnoremap n nzz
nnoremap } }zz

" Dont start EX Mode
nnoremap Q <nop>

" Startup message is irritating
set shortmess+=I

" Disable visual bell..
set visualbell t_vb=

" Since there is airline which shows mode already
" We dont need the normal mode anymore.
set noshowmode

" Yanking lines is inconsistent
" yanking a single line to the end with Y. Acts like D
nnoremap Y y$

" This is an experiment if i can get rid of pressing extra shift
" only works on US layouts...
nnoremap ; :


" --------------------------------------------------------------------------
" Plugins (with Plug)
" --------------------------------------------------------------------------

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'                          " Nice Bar
Plug 'vim-airline/vim-airline-themes'                   " Themes
Plug 'vim-syntastic/syntastic'                          " Syntax checking for files
Plug 'xolox/vim-misc'                                   " dep for syntastic
Plug 'tpope/vim-fugitive'                               " Git Wrapper
Plug 'rking/ag.vim'                                     " grepping through repos
Plug 'SirVer/ultisnips'                                 " snippet embedding
Plug 'honza/vim-snippets'                               " snippets with tab completion
Plug 'tpope/vim-commentary'                             " auto commenting with keybinding gc
Plug 'airblade/vim-gitgutter'                           " git diff line next to line numbers
Plug 'reedes/vim-pencil'                                " Soft-, Hard-Wrapping
Plug 'noqqe/n0q-vim'                                    " my very own color scheme
Plug 'ConradIrwin/vim-bracketed-paste'                  " auto set-paste plugin
Plug 'editorconfig/editorconfig-vim'                    " fetch codingstyle from repos
Plug 'machakann/vim-sandwich'                           " surroundings for words

" Syntax Highlighting Plugins
Plug 'LnL7/vim-nix', { 'for': 'nix' }                   " nixos syntax highlighting
Plug 'chrisbra/csv.vim',   { 'for': 'csv' }             " csv highlighting
Plug 'voxpupuli/vim-puppet', { 'for': 'puppet' }        " puppet syntax
Plug 'ntpeters/vim-better-whitespace'                   " highlighting for whitespace
Plug 'noqqe/vim-markdown', { 'for': 'markdown' }        " my own markdown
Plug 'cespare/vim-toml', { 'for': 'toml' }              " toml language
Plug 'godlygeek/tabular', { 'for': 'puppet' }           " auto ident dep for vim-puppet

call plug#end()

" ---------------------------------------------------------------------------
" Colors / Theme
" ---------------------------------------------------------------------------

colors n0q
syntax on

" --------------------------------------------------------------------------
" Syntastic Configuration
" --------------------------------------------------------------------------

let b:syntastic_mode = "passive"
let g:syntastic_always_populate_loc_list = 1 " populate, needed
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0
let g:syntastic_enable_signs = 0 " dont show crazy signs at left border
let g:syntastic_auto_loc_list = 2 " dont open list automatically
let g:syntastic_loc_list_height = 5 "windows size
let g:syntastic_aggregate_errors = 1

" --------------------------------------------------------------------------
" Airline Configuration
" --------------------------------------------------------------------------

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.paste = 'PASTE'
let g:airline_symbols.linenr = 'L'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme='luna'
let g:airline#extensions#syntastic#enabled = 1

set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%*

" ---------------------------------------------------------------------------
" File Types
" ---------------------------------------------------------------------------
augroup manual
autocmd!
au Filetype *            call pencil#init({'wrap': 'soft', 'textwidth': 75})
\ | setl textwidth=0 wm=0 wrap
\ | setl sw=2 ts=2 sts=2
augroup end

augroup mail
autocmd!
au Filetype mail         call pencil#init({'wrap': 'soft', 'textwidth': 75})
\ | setl sw=2 ts=2 tw=75
augroup end

augroup markdown
autocmd!
au FileType markdown     call pencil#init({'wrap': 'soft', 'textwidth': 80})
\ | setl spell spelllang=de,en
\ | setl sw=2 ts=2 sts=2 tw=75
augroup end

augroup text
autocmd!
au FileType text         call pencil#init({'wrap': 'soft', 'textwidth': 75})
\ | setl spell spelllang=de,en
\ | setl sw=2 ts=2 sts=2 tw=75
augroup end

augroup vim
autocmd!
au Filetype vim          call pencil#init({'wrap': 'soft', 'textwidth': 75})
\ | setl wm=0 wrap
\ | setl sw=2 ts=2 sts=2
augroup end

augroup python
autocmd!
au Filetype python       call pencil#init({'wrap': 'soft', 'textwidth': 75})
\ | setl tw=0 wm=0 wrap
\ | setl sw=4 ts=4 sts=4
augroup end

augroup gitcommit
autocmd!
au Filetype gitcommit    setl tw=50 spell spelllang=de,en
augroup end

augroup shell
autocmd!
au Filetype sh,bash      setl ts=2 sts=2 sw=2 tw=0
\ | call pencil#init({'wrap': 'soft', 'textwidth': 80})
augroup end

augroup help
autocmd!
au FileType help        setlocal nospell
augroup end

