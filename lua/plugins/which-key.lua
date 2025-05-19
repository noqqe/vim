-- interactively show what leader keys are defined
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>?", "<cmd>WhichKey <leader><cr>", desc = "show what shortcuts are defined" },
    },
  },
}
