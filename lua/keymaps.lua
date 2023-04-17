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
map("n", "<leader>n", ":set number!<CR>")                                                               -- toggle line numbers with -n
map("n", "<leader>p", ":set paste!<CR>")                                                                -- toggle paste mode with -p
map("n", "<leader>r", ":so $MYVIMRC<CR>")                                                               -- reload nvim with -r
map("n", "<leader>P", ":PackerSync<CR>")                                                                -- update plugins
map("n", "<leader>t", '<CMD>lua require("FTerm").toggle()<CR>')                                         -- startup terminal
map("n", "<leader>g", '<CMD>lua require("FTerm").scratch({ cmd = {"lazygit"}, auto_close = true})<CR>') -- git from nvim
map("n", "<leader>s", '<CMD>lua vim.lsp.buf.format()<CR>')                                              -- apply lsp formatting to current file
map("n", "<leader>fg", "<cmd>Telescope git_files<cr>")                                                  -- Find git files using Telescope command-line sugar.
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")                                                 -- Find files using Telescope command-line sugar.
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")                                                  -- Grep through repo
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")                                                  -- Find HELP, finally :')
map("n", "<leader>x", "<cmd>TroubleToggle<cr>")                                                         -- Trouble
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")                                  -- Diagnose workspace
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")                                   -- Diagnose single file
map("n", "<leader>?", "<cmd>WhichKey <leader><cr>")                                                     -- show what shortcuts are defined

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
