-- Snippets Universe
return {
  {
    'hrsh7th/vim-vsnip',
    config = function()
      vim.g.vsnip_snippet_dir = os.getenv("HOME") .. '/.config/nvim/snippets/'
    end,
    dependencies = {
      'hrsh7th/cmp-vsnip',
      'rafamadriz/friendly-snippets'
    },
  },
}
