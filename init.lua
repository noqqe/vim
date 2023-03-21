-- Lua Configuration

local o = vim.opt
local a = vim.api
local g = vim.g

-- General
o.history = 1000         -- lots of command line history
o.encoding = "utf8"      -- be nice, by default
o.cf = true              -- error files / jumping
o.ffs = "unix,dos,mac"   -- support these files
o.modeline = true        -- make sure modeline support is enabled
o.autoread = true        -- reload files (no local changes only)
o.tabpagemax = 50        -- open 50 tabs max
o.shortmess = "filtIoOA" -- shorten messages
o.visualbell = false     -- Disable visual bell
o.showmode = false       -- Disable Showmode since its in airline

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
o.whichwrap = "<,>,h,l,[,]"      -- Wrap movement between lines in edit mode with arrows

-- Text Formatting
o.autoindent = true                            -- automatic indent new lines
o.smartindent = true                           -- be smart about it
o.wrap = false                                 -- do not wrap lines
o.expandtab = true                             -- expand tabs to spaces
o.smarttab = false                             -- fuck tabs
o.formatoptions:append("n")                    -- support for numbered/bullet lists
o.virtualedit = "block"                        -- allow virtual edit in visual block ..
o.scrolloff = 4                                -- scroll down and let 4 lines be at the end

o.isk:append({ "_", "$", "@", "%", "#", "-" }) -- word splitter chars
vim.cmd("filetype plugin indent on")           -- load filetype plugin
vim.cmd("au Filetype * setl nospell tw=0 wm=0 wrap sw=2 ts=2 sts=2")

-- Backups
o.backup = true                                                -- store backups
o.writebackup = true                                           -- keep backup
o.backupcopy = "yes"                                           -- keep attributes of original file
o.backupdir = os.getenv("HOME") .. "/.local/share/nvim/backup" -- configure location
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

-- Key mappings
local M = {}
function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local map = M.map

g.mapleader = "-"

-- User Commands to correct my mistypings
a.nvim_create_user_command('W', 'w', {})
a.nvim_create_user_command('Wq', 'wq', {})
a.nvim_create_user_command('Q', 'q', {})
a.nvim_create_user_command('X', 'x', {})

-- Leader Key Mappings
map("n", "<leader>n", ":set number!<CR>")                       -- toggle line numbers with -n
map("n", "<leader>p", ":set paste!<CR>")                        -- toggle paste mode with -p
map("n", "<leader>r", ":so $MYVIMRC<CR>")                       -- reload nvim with -r
map("n", "<leader>P", ":PackerSync<CR>")                        -- update plugins
map("n", "<leader>t", '<CMD>lua require("FTerm").toggle()<CR>') -- startup terminal
map("n", "<leader>g", '<CMD>lua vim.lsp.buf.format()<CR>')      -- apply lsp formatting to current file
map("n", "<leader>fg", "<cmd>Telescope git_files<cr>")          -- Find git files using Telescope command-line sugar.
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")         -- Find files using Telescope command-line sugar.
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
map("n", "<leader>d", ':luado os.time(os.date("!*t"))<CR>') -- shortcut for jrnl date timestamps
map("n", "<leader>x", "<cmd>TroubleToggle<cr>")             -- Trouble
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
map("n", "<leader>?", "<cmd>WhichKey <leader><cr>")

-- Disable Arrow keys
map("n", "<up>", "<nop>")
map("n", "<down>", "<nop>")
map("n", "<left>", "<nop>")
map("n", "<right>", "<nop>")
map("i", "<up>", "<nop>")
map("i", "<down>", "<nop>")
map("i", "<left>", "<nop>")
map("i", "<right>", "<nop>")

-- Correct end and home keys
map("n", "<esc>OH", "<home>")
map("i", "<esc>OH", "<home>")
map("c", "<esc>OH", "<home>")
map("n", "<esc>OF", "<end>")
map("i", "<esc>OF", "<end>")
map("c", "<esc>OF", "<end>")

-- Convienience key behaviour
map("n", "J", "mzJ`z") -- Cursor jumps around while joining lines
map("n", "n", "nzz")   -- Jumping lands on top or bottom of screen
map("n", "}", "}zz")   -- Jumping lands on top or bottom of screen
map("n", "Q", "<nop>") -- Dont start EX Mode
map("n", "Y", "y$")    -- Yanking a single line to the end with Y. Acts like D
