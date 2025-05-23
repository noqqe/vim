-- Statusline
return {
  'nvim-lualine/lualine.nvim',
  opts = {
    extensions = {
      'toggleterm',
      'trouble',
      'fugitive',
      'man',
      'mason',
      'lazy',
      'neo-tree',
    },
    sections = {
      lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
      lualine_b = { 'filename', 'branch' },
      lualine_c = {
        '%=', --[[ add your center components here in place of this comment ]]
      },
      lualine_x = {},
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    options = {
      theme = 'dracula',
      component_separators = '',
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
  },
}
