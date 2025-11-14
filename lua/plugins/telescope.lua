-- Fuzzy Finder
return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { mode = { "n" }, "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find git files using Telescope command-line sugar." },
      { mode = { "n" }, "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files using Telescope command-line sugar." },
      { mode = { "n" }, "<leader>g", "<cmd>Telescope live_grep<cr>", desc = "Grep through repo" },
      { mode = { "n" }, "<leader>fb", "<cmd>Telescope buffers<cr>",   desc = "go through buffers" },
      { mode = { "n" }, "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find HELP, finally :')" },
    },
  }
}
