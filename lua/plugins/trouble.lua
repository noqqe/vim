-- Nice Interface looking at lsp errors
return {
    'folke/trouble.nvim',
    cmd = "Trouble",
    event = "VeryLazy",
    config = function ()
      require('trouble').setup()
    end,
    keys = {
      {
        "<leader>x",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
    },
}
