-- Shortcuts
local o = vim.opt
local a = vim.api
local g = vim.g

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
map("n", "<leader>n", "<cmd>set number!<CR>")                          -- toggle line numbers with -n
map("n", "<leader>p", "<cmd>set paste!<CR>")                           -- toggle paste mode with -p
map("n", "<leader>r", "<cmd>so $MYVIMRC<CR>")                          -- reload nvim with -r
map("n", "<leader>P", "<cmd>PackerSync<CR>")                           -- update plugins
map("n", "<leader>s", '<cmd>lua vim.lsp.buf.format()<CR>')             -- apply lsp formatting to current file
map("n", "<leader>fg", "<cmd>Telescope git_files<cr>")                 -- Find git files using Telescope command-line sugar.
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")                -- Find files using Telescope command-line sugar.
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")                 -- Grep through repo
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")                 -- Find HELP, finally :')
map("n", "<leader>x", "<cmd>TroubleToggle<cr>")                        -- Trouble
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>") -- Diagnose workspace
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")  -- Diagnose single file
map("n", "<leader>?", "<cmd>WhichKey <leader><cr>")                    -- show what shortcuts are defined
map("n", "<leader>b", "<c-^><cr>")                                     -- switch back to former file


-- Buffers (with barbar)
map("n", "<leader>1", "<Cmd>BufferGoto 1<CR>")
map("n", "<leader>2", "<Cmd>BufferGoto 2<CR>")
map("n", "<leader>3", "<Cmd>BufferGoto 3<CR>")
map("n", "<leader>4", "<Cmd>BufferGoto 4<CR>")
map("n", "<leader>5", "<Cmd>BufferGoto 5<CR>")
map("n", "<leader>6", "<Cmd>BufferGoto 6<CR>")
map("n", "<leader>7", "<Cmd>BufferGoto 7<CR>")
map("n", "<leader>8", "<Cmd>BufferGoto 8<CR>")
map("n", "<leader>9", "<Cmd>BufferGoto 9<CR>")
map("n", "<leader>0", "<Cmd>BufferLast<CR>")
map("n", "<leader>,", "<Cmd>BufferPrevious<CR>")     -- Buffer move to previous/next
map("n", "<leader>.", "<Cmd>BufferNext<CR>")         -- Buffer move to previous/next
map("n", "<leader><", "<Cmd>BufferMovePrevious<CR>") -- Buffer move prev
map("n", "<leader>>", "<Cmd>BufferMoveNext<CR>")     -- buffer move prev

-- Terminal integration using toggleterm
local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true, auto_scroll = false })
local fish     = Terminal:new({ cmd = "fish", direction = "float", hidden = true, auto_scroll = false })

function _lazygit_toggle()
  lazygit:toggle()
end

function _fish_toggle()
  fish:toggle()
end

map("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>") -- open git
map("n", "<leader>t", "<cmd>lua _fish_toggle()<CR>")    -- open a terminal
map("t", "<leader><Esc>", "<C-\\><C-N>")                -- Make escape work in terminal to switch between insert (i) and normal (n) to scroll up
map("t", "<leader>t", "<cmd>lua _fish_toggle()<CR>")    -- quick way to close the terminal

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
