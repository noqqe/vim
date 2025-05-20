return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    event = "BufEnter",
    init = function() vim.g.barbar_auto_setup = false end,
    keys = {
      { "<leader>1", "<Cmd>BufferGoto 1<CR>",       desc = "which_key_ignore" },
      { "<leader>2", "<Cmd>BufferGoto 2<CR>",       desc = "which_key_ignore" },
      { "<leader>3", "<Cmd>BufferGoto 3<CR>",       desc = "which_key_ignore" },
      { "<leader>4", "<Cmd>BufferGoto 4<CR>",       desc = "which_key_ignore" },
      { "<leader>5", "<Cmd>BufferGoto 5<CR>",       desc = "which_key_ignore" },
      { "<leader>6", "<Cmd>BufferGoto 6<CR>",       desc = "which_key_ignore" },
      { "<leader>7", "<Cmd>BufferGoto 7<CR>",       desc = "which_key_ignore" },
      { "<leader>8", "<Cmd>BufferGoto 8<CR>",       desc = "which_key_ignore" },
      { "<leader>9", "<Cmd>BufferGoto 9<CR>",       desc = "which_key_ignore" },
      { "<leader>0", "<Cmd>BufferLast<CR>",         desc = "which_key_ignore" },
      { "<leader>,", "<Cmd>BufferPrevious<CR>",     desc = "Buffer move to previous/next" },
      { "<leader>.", "<Cmd>BufferNext<CR>",         desc = "Buffer move to previous/next" },
      { "<leader><", "<Cmd>BufferMovePrevious<CR>", desc = "Buffer move prev" },
      { "<leader>>", "<Cmd>BufferMoveNext<CR>",     desc = "buffer move prev" },
      { "<leader>q", "<cmd>BufferClose<cr>",        desc = "close current buffer" },
    },
    opts = {
      auto_hide = true,
      icons = {
        modified = { button = '●' },
        enabled = true,
        buffer_index = true,
        buffer_number = false,
        gitsigns = {
          added = { enabled = true, icon = '+' },
          changed = { enabled = true, icon = '~' },
          deleted = { enabled = true, icon = '-' },
        },
      },
    },
  },
}
