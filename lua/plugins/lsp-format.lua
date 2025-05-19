-- LSP Formatter to automatically format files on save
return {
  {
    'lukas-reineke/lsp-format.nvim',
    keys = {
      {"<leader>s", '<cmd>lua vim.lsp.buf.format()<CR>', mode = { "n" }, desc = "apply lsp formatting to current file"},
    },
  },
}
