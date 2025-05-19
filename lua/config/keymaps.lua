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
map("n", "<leader>p", "<cmd>set paste!<CR>")                 -- toggle paste mode with -p
map("n", "<leader>l", "<cmd>Lazy<CR>")                 -- update plugins
map("n", "<leader>m", "<cmd>Mason<CR>")                 -- update plugins
map("n", "<leader>w", "<cmd>v/\\S/,//-j<cr>/asdf<cr>")

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

-- Disable recordings via q. I always mistype this
map("n", "q", "<nop>")

-- Convienience key behaviour
map("n", "J", "mzJ`z") -- Cursor jumps around while joining lines
map("n", "n", "nzz")   -- Jumping lands on top or bottom of screen
map("n", "}", "}zz")   -- Jumping lands on top or bottom of screen
map("n", "Q", "<nop>") -- Dont start EX Mode
map("n", "Y", "y$")    -- Yanking a single line to the end with Y. Acts like D
