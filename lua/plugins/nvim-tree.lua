-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup#opening-nvim-tree-at-neovim-startup
-- this automatically starts it
local function open_nvim_tree(data)
  -- do not open when not git repo
  local gitrepocmd = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
  local gitrepo = gitrepocmd:read("*a")
  if not string.match(gitrepo, "true") then
    return
  end
  gitrepocmd:close()

  -- not open when filetype is a gitcommit
  local gitcommit = vim.bo[data.buf].ft == "gitcommit"
  if gitcommit then
    return
  end

  require("nvim-tree.api").tree.toggle({ focus = false })
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- nvim tree
return {
  'nvim-tree/nvim-tree.lua',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
  keys = {
    { mode = { "n"} , "<leader>n", "<cmd>NvimTreeToggle<CR>", desc = "toggle line numbers with -n"},
  },
  version = "*",
  config = function()
    require("nvim-tree").setup {
      sort_by = "case_sensitive",
      view = {
        side = "left",
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
      },
      filters = {
        dotfiles = true,
      },
    }
  end,
}
