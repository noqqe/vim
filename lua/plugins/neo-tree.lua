vim.api.nvim_create_augroup("neotree", {})
vim.api.nvim_create_autocmd("UiEnter", {
  desc = "Open Neotree automatically",
  group = "neotree",
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd "Neotree toggle"
    end
  end,
})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = { "Neotree" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false, -- neo-tree will lazily load itself
  keys = {
    { mode = { "n" }, "<leader>n", "<cmd>Neotree<CR>", desc = "Open" },
  },
  opts = {
    filesystem = {
      window = {
        mapping_options = {
          noremap = true,
          nowait = false,
        },
        mappings = {
          ["o"] = {
            command = "open",
            nowait = true
          }, -- fill any relevant options here
          ["O"] = {
            "open",
            nowait = true
          },
        },
      },
    },
  },
}
