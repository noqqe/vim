  -- Terminal integration using toggleterm
return {
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    opts = {
      auto_scroll = false
    },
    config = function ()
      Terminal = require('toggleterm.terminal').Terminal
      Lazygit  = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true, auto_scroll = false })
      Fish     = Terminal:new({ cmd = "fish", direction = "float", hidden = true, auto_scroll = false })

      function _lazygit_toggle()
        Lazygit:toggle()
      end

      function _fish_toggle()
        Fish:toggle()
      end
    end, 
    keys = {
      { "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", mode = { "n"}, desc = "open git" },
      { "<leader>t", "<cmd>lua _fish_toggle()<CR>", mode = { "n"}, desc = "open a terminal"},
      { "<leader><Esc>", "<C-\\><C-N>", mode = { "t"},desc = "Make escape work in terminal to switch between insert (i) and normal (n) to scroll up"},
      { "<leader>t", "<cmd>lua _fish_toggle()<CR>", mode = { "t"},desc = "quick way to close the terminal"},
  },
},
}
