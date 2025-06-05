-- automatically open neo-tree when opening nvim without arguments
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


-- plugin definition
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
    close_if_last_window = true,
    filesystem = {
      use_libuv_file_watcher = false, -- better fs watcher
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
            command = "open",
            nowait = true
          },
          ["oc"] = "noop",
          ["od"] = "noop",
          ["og"] = "noop",
          ["om"] = "noop",
          ["on"] = "noop",
          ["os"] = "noop",
          ["ot"] = "noop",
        },
      },
    },
  },
}
