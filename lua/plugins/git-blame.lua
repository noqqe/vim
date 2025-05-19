return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>b", "<cmd>GitBlameToggle<CR>", desc = "Toggle git blame" },
  },
  opts = {
    enabled = false,
    message_template = " <summary> • <date> • <author> • <<sha>>",
    date_format = "%r",
  },
}
