-- Lua Configuration

local o = vim.opt
local fn = vim.fn

-- General
o.history = 1000                        -- lots of command line history
o.encoding = "utf8"                     -- be nice, by default
o.cf = true                             -- error files / jumping
o.ffs = "unix,dos,mac"                  -- support these files
o.modeline = true                       -- make sure modeline support is enabled
o.autoread = true                       -- reload files (no local changes only)
o.tabpagemax = 50                       -- open 50 tabs max
o.shortmess = "filtIoOA"                 -- shorten messages
o.visualbell = false                    -- Disable visual bell
o.showmode = false                      -- Disable Showmode since its in airline

-- UI Changes
o.ruler = true                   -- show the cursor position all the time
o.showcmd = false                -- don't display incomplete commands
o.lazyredraw = false             -- turn off lazy redraw
o.wildmenu = true                -- turn on wild menu
o.ch = 1                         -- command line height
o.report = 0                     -- tell us about changes
o.startofline = false            -- don't jump to the start of line when scrolling
o.wildmode = "list:longest,full" -- nice completion for wildcards
o.number = true                  -- enable line numbers by default
o.hlsearch = true                -- highlight searches
o.mouse = "r"                    -- turn off mouse
o.clipboard:append("unnamed")    -- persistent cut buffer across files (dd + p works everywhere)
o.incsearch = false              -- don't jump during searching for a string
o.autochdir = true               -- automatically switch to dir of file editing

-- Text Formatting
o.autoindent = true         -- automatic indent new lines
o.smartindent = true        -- be smart about it
o.wrap = false              -- do not wrap lines
o.expandtab = true          -- expand tabs to spaces
o.smarttab = false          -- fuck tabs
o.formatoptions:append("n") -- support for numbered/bullet lists
o.virtualedit = "block"     -- allow virtual edit in visual block ..
o.scrolloff = 4             -- scroll down and let 4 lines be at the end

o.isk:append({"_", "$", "@", "%", "#", "-"}) -- word splitter chars
vim.cmd("filetype plugin indent on")    -- load filetype plugin
vim.cmd[[au Filetype * setl nospell tw=0 wm=0 wrap sw=2 ts=2 sts=2]]

-- Backups
o.backup = true       -- store backups
o.writebackup = true  -- keep backup
o.backupcopy = "yes"  -- keep attributes of original file
o.backupdir = os.getenv("HOME") .. "/.local/share/nvim/backup"   -- configure location
o.backupskip = { "/tmp/*", "$TMPDIR/*", "$TMP/*", "$TEMP/*", "/var/folders" }

-- Swap
o.swapfile = true
o.directory = os.getenv("HOME") .. "/.local/share/nvim/swap"

-- Undo
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.local/share/nvim/undo"


-- Plugins

require("plugins")

-- Load configuration files
local function source_files_from_dir(directory)
  for _, file in pairs(vim.fn.readdir(directory)) do
    local file = directory .. '/' .. file
    if vim.fn.filereadable(file) then
      vim.fn.execute('source ' .. file)
    end
  end
end

-- load all additional configs
local lua_config_dir = vim.fn.stdpath('config') .. '/lua'
local config_dirs = { 'settings' }
for _, dir in pairs(config_dirs) do
  source_files_from_dir(lua_config_dir .. '/' .. dir)
end

vim.cmd([[

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

" reload vimrc with -r
nmap <silent> <leader>r :so $MYVIMRC<CR>

" update plugins
nmap <silent> <leader>P :PackerSync<CR>

" shortcut for jrnl date timestamps
nmap <silent> <leader>d i<C-R>=strftime("%Y-%m-%dT%H:%M:%S")<CR><Esc>

" fix underlying spell error automatically
nmap <silent> <leader>f z=1<CR><CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Trouble
nnoremap <leader>x <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>

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

]])
