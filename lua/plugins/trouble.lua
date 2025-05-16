-- Nice Interface looking at lsp errors
return {
  {
    'folke/trouble.nvim',
    keys = {
      { "<leader>x", "<cmd>Trouble diagnostics toggle<cr>", mode = {"n"}, desc = "Open Trouble diagnostics"},
    },
  },
}
