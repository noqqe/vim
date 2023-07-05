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
map("n", "<leader>b", "<c-^><cr>")                                     -- switch back to former file
map("n", "<leader>s", '<cmd>lua vim.lsp.buf.format()<CR>')             -- apply lsp formatting to current file
map("n", "<leader>fg", "<cmd>Telescope git_files<cr>")                 -- Find git files using Telescope command-line sugar.
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")                -- Find files using Telescope command-line sugar.
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")                 -- Grep through repo
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")                 -- Find HELP, finally :')
map("n", "<leader>x", "<cmd>TroubleToggle<cr>")                        -- Trouble
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>") -- Diagnose workspace
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")  -- Diagnose single file
map("n", "<leader>?", "<cmd>WhichKey <leader><cr>")                    -- show what shortcuts are defined

-- Terminal integration using toggleterm
local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })
local fish     = Terminal:new({ cmd = "fish", direction = "float", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

function _fish_toggle()
  fish:toggle()
end

map("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>") -- open git
map("n", "<leader>t", "<cmd>lua _fish_toggle()<CR>")    -- open a terminal

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
