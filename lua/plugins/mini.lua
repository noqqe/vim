return {
  -- Visualize scope of idents with |
  -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-indentscope.md
  {
    'echasnovski/mini.indentscope',
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
  },

  -- Highlight and remove trailing space
  -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-trailspace.md
  {
    'echasnovski/mini.trailspace',
  },

  -- Autoformat arrays with gS
  {
    'echasnovski/mini.splitjoin',
  },
}
