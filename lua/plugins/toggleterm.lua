-- Terminal integration using toggleterm
return {
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    opts = {
      auto_scroll = false
    },
    config = function()
      Terminal = require('toggleterm.terminal').Terminal
      Jjui     = Terminal:new({ cmd = "jjui", direction = "float", hidden = true, auto_scroll = false })
      Fish     = Terminal:new({ cmd = "fish", direction = "float", hidden = true, auto_scroll = false })

      function _jjui_toggle()
        Jjui:toggle()
      end

      function _fish_toggle()
        Fish:toggle()
      end
    end,
    keys = {
      { "<leader>j",     "<cmd>lua _jjui_toggle()<CR>",    mode = { "n" }, desc = "open jjui" },
      { "<leader>t",     "<cmd>lua _fish_toggle()<CR>",    mode = { "n" }, desc = "open a terminal" },
      { "<leader><Esc>", "<C-\\><C-N>",                    mode = { "t" }, desc = "Make escape work in terminal to switch between insert (i) and normal (n) to scroll up" },
      { "<leader>t",     "<cmd>lua _fish_toggle()<CR>",    mode = { "t" }, desc = "quick way to close the terminal" },
    },
  },
}
