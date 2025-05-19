return {
  -- Visualize scope of idents with |
  -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-indentscope.md
  {
    'echasnovski/mini.indentscope',
    config = function(_, opts)
      -- Disable default behavior
      opts.draw = { delay = 0 }
      -- Enable custom behavior
      vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { fg = '#ff0000' })
      vim.api.nvim_set_hl(0, 'MiniIndentscopePrefix', { fg = '#00ff00' })
    end,
    opts = {
      draw = {
        -- Delay (in ms) between event and start of drawing scope indicator
        delay = 50,
      },
    },
  },

  -- Auto comment function
  {
    'echasnovski/mini.comment',
    opts = {
      options = {
        -- Whether to ignore blank lines
        ignore_blank_line = true,
        -- Whether to recognize as comment only lines without indent
        start_of_line = false,
        -- Whether to ensure single space pad for comment parts
        pad_comment_parts = true,
      },
    },
  },

  -- Surroundings with sr
  -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md
  {
    'echasnovski/mini.surround',
    config = function()
      require('mini.surround').setup({
        mappings = {
          add = 'sa',
          delete = 'sd',
          find = 'sf',
          highlight = 'sh',
          replace = 'sr',
          update_n_lines = 'sn',
        },
      })
    end,
  },

  -- Highlight and remove trailing space
  -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-trailspace.md
  {
    'echasnovski/mini.trailspace',
    config = function()
      require('mini.trailspace').setup()
    end,
  },

  -- Autoformat arrays with gS
  {
    'echasnovski/mini.splitjoin',
    config = function()
      require('mini.splitjoin').setup()
    end,
  },
}
